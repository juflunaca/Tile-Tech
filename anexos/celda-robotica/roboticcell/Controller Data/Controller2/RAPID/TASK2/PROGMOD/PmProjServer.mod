MODULE PmProjServer
  !***********************************************************
  !
  ! File: PmProjServer.mod
  !
  !
  ! Description
  !   This is the module that is used with an IO interface to 
  !   supervice signals that manage project and flow actions.
  !   The actions are typical project stop, flow start and flow stop.
  !
  ! Copyright (c) ABB Automation Technology Products 2008.
  ! All rights reserved
  !
  !***********************************************************
  
  PERS pm_projectinfo ProjectInfo:=["","",0,[TRUE,"","",TRUE,["","","","","","","","","",""]],[TRUE,"","",TRUE,["","","","","","","","","",""]],[TRUE,"","",TRUE,["","","","","","","","","",""]],[TRUE,"","",TRUE,["","","","","","","","","",""]],[TRUE,"","",TRUE,["","","","","","","","","",""]],[TRUE,"","",TRUE,["","","","","","","","","",""]],0];
  
  ! Interrupt for start and stop of flow  
  VAR intnum pmIntSetDefaultHeight;
  VAR intnum pmIntSetRecoverAction;
  VAR intnum pmIntStartFlow;
  VAR intnum pmIntStopFlow;
  VAR intnum pmIntProjectStopping;
  VAR intnum pmIntProjectStateChange;

  ! Project and flow management signals
  VAR signaldi alias_diStopProject;
  VAR signalgo alias_goCurrentProject;
  VAR signaldi alias_diRecover;
  VAR signalgi alias_giRecoverAction;
  VAR signalgi alias_giWaRecoverSelection;
  VAR signaldi alias_diStartFlow;
  VAR signaldi alias_diSetDefaultHeight;
  VAR signalgi alias_giDefaultHeight;
  VAR signalgi alias_giDefHeightWaSel;
  VAR signaldi alias_diStopFlow;
  VAR signalgi alias_giSelectionFlow;
  VAR signalgi alias_giStopOptionFlow;
  
  !***********************************************************
  !
  ! Procedure main
  !
  !   This is the PickMaster supervision server MAIN routine for the IO interface.
  !   The project management signals are superviced and proper actions are taken.
  !
  !***********************************************************

  PROC main()
    VAR bool SignalsExist:=TRUE;
    
    ! Connect all alias signals with the configured ones
    SignalsExist:=ConnectAliasSignals();
    WHILE SignalsExist=FALSE DO
      ! Loop forever
      WaitTime 1000;
    ENDWHILE

    WHILE TRUE DO    
      ! Wait for project to be running.
      PmWaitProjStart;
    
      ! Connect all traps with its interrupt
      ConnectTraps;
    
      ! Wait for stop project order
      WaitUntil PM_PROJECT_STATUS=PM_PROJECT_STOPPED;
      SetGO alias_goCurrentProject, 0;

      ! Disconnect all traps from its interrupt
      DeleteTraps;
    ENDWHILE
  ENDPROC
 
  !***********************************************************
  !
  ! Function ConnectAliasSignals
  !
  !   Connect all alias signals with the configured signals.
  !
  !***********************************************************
  FUNC bool ConnectAliasSignals()
    VAR string signalName;

    signalName:="pmProject_diStop";
    AliasIO signalName, alias_diStopProject;

    signalName:="pmProject_goCurrent";
    AliasIO signalName, alias_goCurrentProject;

    signalName:="pmFlow_diRecover";
    AliasIO signalName, alias_diRecover;

    signalName:="pmFlow_giRecoverAction";
    AliasIO signalName, alias_giRecoverAction;

    signalName:="pmFlow_giWaRecoverSelection";
    AliasIO signalName, alias_giWaRecoverSelection;

    signalName:="pmFlow_diStart";
    AliasIO signalName, alias_diStartFlow;

    signalName:="pmFlow_diStop";
    AliasIO signalName, alias_diStopFlow;

    signalName:="pmFlow_giSelection";
    AliasIO signalName, alias_giSelectionFlow;

    signalName:="pmFlow_giStopOption";
    AliasIO signalName, alias_giStopOptionFlow;

    signalName:="pmProject_diSetDefaultHeight";
    AliasIO signalName, alias_diSetDefaultHeight;

    signalName:="pmProject_giDefaultHeight";
    AliasIO signalName, alias_giDefaultHeight;

    signalName:="pmProject_giDefHeightWaSel";
    AliasIO signalName, alias_giDefHeightWaSel;

    RETURN TRUE;
  ERROR
    IF ERRNO=ERR_ALIASIO_DEF OR ERRNO=ERR_ALIASIO_TYPE THEN
      PmErrorLog 2372,ERRSTR_TASK,ERRSTR_CONTEXT,ERRSTR_UNUSED,ERRSTR_UNUSED,ERRSTR_UNUSED\ErrorHandler:=TRUE\EventType:=TYPE_WARN;
      RETURN FALSE;
    ENDIF
  ENDFUNC
 
  !***********************************************************
  !
  ! Procedure ConnectTraps
  !
  !   Connect all interrupts with its trap routine.
  !
  !***********************************************************
  PROC ConnectTraps()
    ! Stop project
    IDelete pmIntProjectStopping;
    CONNECT pmIntProjectStopping WITH TrapProjectStopped;
    ISignalDI alias_diStopProject,1,pmIntProjectStopping;

    ! Set recover action
    IDelete pmIntSetRecoverAction;
    CONNECT pmIntSetRecoverAction WITH TrapSetRecoverAction;
    ISignalDI alias_diRecover,1,pmIntSetRecoverAction;

    ! Set default height
    IDelete pmIntSetDefaultHeight;
    CONNECT pmIntSetDefaultHeight WITH TrapSetDefaultHeight;
    ISignalDI alias_diSetDefaultHeight,1,pmIntSetDefaultHeight;

    ! Start flow
    IDelete pmIntStartFlow;
    CONNECT pmIntStartFlow WITH TrapStartFlow;
    ISignalDI alias_diStartFlow,1,pmIntStartFlow;

    ! Stop flow
    IDelete pmIntStopFlow;
    CONNECT pmIntStopFlow WITH TrapStopFlow;
    ISignalDI alias_diStopFlow,1,pmIntStopFlow;
  ENDPROC

  !***********************************************************
  !
  ! Procedure DeleteTraps
  !
  !   Disconnect all interrupts from its trap routine.
  !
  !***********************************************************
  PROC DeleteTraps()
    IDelete pmIntSetDefaultHeight;
    IDelete pmIntSetRecoverAction;
    IDelete pmIntProjectStopping;
    IDelete pmIntStartFlow;
    IDelete pmIntStopFlow;
  ENDPROC
  
  !***********************************************************
  !
  ! Trap TrapSetDefaultHeight
  !
  !   Set default height for selected work area.
  !
  !***********************************************************
  TRAP TrapSetDefaultHeight
    VAR pm_wainfo WaInfo;
    VAR num WaSelection;
    VAR num DefaultHeight;
    VAR num NewDefaultHight;

    WaSelection:=alias_giDefHeightWaSel;
    DefaultHeight:=alias_giDefaultHeight;
    
    ! Get info from selected Work Area
    PmGetWaInfo WaSelection,WaInfo;
    
    IF DefaultHeight=PM_DEFAULT_HEIGHT_STANDARD THEN
      NewDefaultHight:=PmSetDefaultHeight(WaInfo.Workarea\Standard);
    ELSEIF DefaultHeight=PM_DEFAULT_HEIGHT_EMPTY THEN
      NewDefaultHight:=PmSetDefaultHeight(WaInfo.Workarea \Empty);
    ELSEIF DefaultHeight=PM_DEFAULT_HEIGHT_FULL THEN
      NewDefaultHight:=PmSetDefaultHeight(WaInfo.Workarea\Full);
    ELSEIF DefaultHeight=PM_DEFAULT_HEIGHT_LATEST THEN
      NewDefaultHight:=PmSetDefaultHeight(WaInfo.Workarea\Latest);
    ELSEIF DefaultHeight=PM_DEFAULT_HEIGHT_VALUE THEN
      NewDefaultHight:=PmSetDefaultHeight(WaInfo.Workarea\Value:=0.0);
    ELSE
      PmErrorLog 2384,ERRSTR_TASK,"pmProject_giDefaultHeight",ERRSTR_CONTEXT,"pmProject_diSetDefaultHeight",ERRSTR_UNUSED\EventType:=TYPE_WARN;
    ENDIF
    
  ERROR
    ! Continue supervision on errors
    RETURN;
  ENDTRAP
  
  !***********************************************************
  !
  ! Trap TrapSetRecoverAction
  !
  !   Start selected flow.
  !
  !***********************************************************
  TRAP TrapSetRecoverAction
    VAR pm_flowinfo FlowInfo;
    VAR num FlowSelection;
    VAR pm_wainfo WaInfo;
    VAR num RecoverAction;
    VAR num WaSelection;
    VAR num EvtId;
    VAR errstr Arg1;
    VAR errstr Arg2;
    VAR errstr Arg3;
    VAR errstr Arg4;
    VAR bool UseMasterWa:=FALSE;

    FlowSelection:=alias_giSelectionFlow;
    RecoverAction:=alias_giRecoverAction;
    WaSelection:=alias_giWaRecoverSelection;

    ! Get info from selected flow
    PmGetFlowInfo FlowSelection,FlowInfo;
    
    IF RecoverAction = PM_RECOVER_REDO_LAST_PICK THEN
      ! Set recover action
      PmSetRecoverAction FlowInfo.Name,RecoverAction\EventId:=EvtId\Argument1:=Arg1\Argument2:=Arg2\Argument3:=Arg3\Argument4:=Arg4;
    ELSE
      ! Get info from selected Work Area
      PmGetWaInfo WaSelection,WaInfo;
      
      IF UseMasterWa = TRUE THEN      
        ! Set recover action - If no workarea, use the master workarea for the flow
        PmSetRecoverAction FlowInfo.Name\Workarea:=FlowInfo.MasterWa,RecoverAction\EventId:=EvtId\Argument1:=Arg1\Argument2:=Arg2\Argument3:=Arg3\Argument4:=Arg4;
        UseMasterWa:=FALSE;
      ELSE
        ! Set recover action
        PmSetRecoverAction FlowInfo.Name\Workarea:=WaInfo.Workarea,RecoverAction\EventId:=EvtId\Argument1:=Arg1\Argument2:=Arg2\Argument3:=Arg3\Argument4:=Arg4;
      ENDIF
    ENDIF

    IF (EvtId<2398) AND (EvtId>2392) THEN 
      PmErrorLog EvtId,FlowInfo.Name,Arg1,Arg2,Arg3,Arg4\EventType:=TYPE_WARN;
    ENDIF
    
  ERROR
    ! Continue supervision on recoverable errors
    IF ERRNO=PM_ERR_FLOW_NOT_FOUND THEN
      RETURN;
    ELSEIF ERRNO=PM_ERR_WA_NOT_FOUND THEN
      IF RecoverAction = PM_RECOVER_CONTINUE_OPERATION THEN
        UseMasterWa:=TRUE;
        TRYNEXT;
      ELSE
        RETURN;      
      ENDIF
    ELSEIF ERRNO=PM_ERR_NO_RUNNING_PROJECT THEN
      RETURN;
    ELSEIF ERRNO=PM_ERR_REDO_LAST_PICK_REJECTED THEN
      RETURN;
    ELSEIF ERRNO=PM_ERR_WORKAREA_EXPECTED THEN
      RETURN;
    ELSEIF ERRNO=PM_ERR_NOT_VALID_RECOVER_ACTION THEN
      RETURN;
    ELSE
      RETURN;
    ENDIF
  ENDTRAP
  
  !***********************************************************
  !
  ! Trap TrapStartFlow
  !
  !   Start selected flow.
  !
  !***********************************************************
  TRAP TrapStartFlow
    VAR pm_flowinfo FlowInfo;
    VAR num FlowSelection;

    FlowSelection:=alias_giSelectionFlow;
    ! Get info from selected flow
    PmGetFlowInfo FlowSelection,FlowInfo;
    ! Start the selected flow
    PmStartFlow FlowInfo.Name;
  ERROR
    ! Continue supervision on recoverable errors
    IF ERRNO=PM_ERR_FLOW_NOT_FOUND THEN
      RETURN;
    ELSEIF ERRNO=PM_ERR_NO_RUNNING_PROJECT THEN
      RETURN;
    ELSEIF ERRNO=PM_ERR_WRONG_FLOW_STATE THEN
      RETURN;
    ELSE
      RETURN;
    ENDIF
  ENDTRAP

  !***********************************************************
  !
  ! Trap TrapStopFlow
  !
  !   Stop selected flow with choosen stop option.
  !
  !***********************************************************
  TRAP TrapStopFlow
    VAR pm_flowinfo FlowInfo;
    VAR num FlowSelection;
    VAR num StopOption;

    FlowSelection:=alias_giSelectionFlow;
    StopOption:=alias_giStopOptionFlow;
    ! Get info from selected flow
    PmGetFlowInfo FlowSelection,FlowInfo;
    ! Stop the selected flow
    PmStopFlow FlowInfo.Name,StopOption;
  ERROR
    ! Continue supervision on recoverable errors
    IF ERRNO=PM_ERR_FLOW_NOT_FOUND THEN
      RETURN;
    ELSEIF ERRNO=PM_ERR_NO_RUNNING_PROJECT THEN
      RETURN;
    ELSEIF ERRNO=PM_ERR_INVALID_FLOW_STOP_OPTION THEN
      RETURN;
    ELSE
      RETURN;
    ENDIF
  ENDTRAP

  !***********************************************************
  !
  ! Trap TrapProjectStopped
  !
  !   A project stop command has been triggered.
  !
  !***********************************************************
  TRAP TrapProjectStopped
    PmStopProj;
  ENDTRAP
ENDMODULE
