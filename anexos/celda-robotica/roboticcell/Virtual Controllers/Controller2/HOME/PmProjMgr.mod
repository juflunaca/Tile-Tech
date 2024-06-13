MODULE PmProjMgr
  !***********************************************************
  !
  ! File: PmProjMgr.mod
  !
  !
  ! Description
  !   This is a main module template for basic palletizing 
  !   with PickMaster. It is used with an IO interface to load
  !   the module and start RAPID.
  !   The template loads modules that belong to a project and
  !   then calls the main routine for the pick and place sequence.
  !
  ! Copyright (c) ABB Automation Technology Products 2008.
  ! All rights reserved
  !
  !***********************************************************
  
  PERS pm_projectinfo ProjectInfo;
  LOCAL VAR num ProjectSelection;
  LOCAL CONST string PmProjHome:="HOME:/PickMaster/RC-Mode/";
  LOCAL VAR bool StartLoadRun;

  VAR intnum pmIntProjectStopping;

  VAR bool FirstProjMgrLoop:=TRUE;

  !***********************************************************
  !
  ! Procedure main
  !
  !   This is the PickMaster MAIN routine for the IO interface.
  !   The project is loaded and started from here.
  !   First the program waits for a start signal.
  !   Then get information about the selected project.
  !   The projects modules are loaded and the main routine is called.
  !
  !***********************************************************
  PROC main()
    VAR pm_projectinfo ProjInfo;
    
    IF FirstProjMgrLoop THEN
      FirstProjMgrLoop:=FALSE;
      ! Project is stopping
      IDelete pmIntProjectStopping;
      CONNECT pmIntProjectStopping WITH TrapProjectStopped;
      ISignalDI\SingleSafe,pmProject_diStop,1,pmIntProjectStopping;
    ENDIF

    ! Activate the main loop
    StartLoadRun:=TRUE;

    IF PM_PROJECT_STATUS=PM_PROJECT_STOPPED OR PM_PROJECT_STATUS=PM_PROJECT_STOPPING OR PM_PROJECT_STATUS=PM_PROJECT_ERROR THEN
     IF PM_PROJECT_STATUS=PM_PROJECT_STOPPING THEN
       WaitUntil PM_PROJECT_STATUS=PM_PROJECT_STOPPED OR PM_PROJECT_STATUS=PM_PROJECT_ERROR;
     ENDIF
      
      ! Wait for start project order from PLC
      WaitDI pmProject_diStart,1;
      ! Check which project to be started
      ProjectSelection:=pmProject_giSelection;
      ! Get info from select project
      PmGetProjectInfo ProjectSelection,ProjInfo;
      ProjectInfo:=ProjInfo;
      ! Start the selected project
      IF StartLoadRun THEN
        WaitTestAndSet ProjectStart;
        IF PM_PROJECT_STATUS<>PM_PROJECT_RUNNING THEN
          PmStartProj ProjectInfo.Name\Signal:=pmProject_goStatus;
        ENDIF
        ProjectStart:=FALSE;        
        SetGO pmProject_goCurrent, ProjectSelection;
      ENDIF
    ELSE ! STARTING OR RUNNING
      ! Wait for project to be running.
      PmWaitProjStart;
    ENDIF
        
    ! Load all program modules for the task
    IF StartLoadRun THEN
      LoadAllModulesInTask ProjectInfo;
    ENDIF
      
    WHILE StartLoadRun DO
      ! Execute the main routine in the selected project.
      %"PmMain:Main"%;
      IF PM_PROJECT_STATUS=PM_PROJECT_STOPPED OR PM_PROJECT_STATUS=PM_PROJECT_STOPPING OR PM_PROJECT_STATUS=PM_PROJECT_ERROR THEN
        StartLoadRun:=FALSE;
      ENDIF
    ENDWHILE
    ERROR
      IF ERRNO=PM_ERR_NO_TASK THEN
        ! ProjectInfo has no task configured for current task
        StartLoadRun:=FALSE;
      ELSEIF ERRNO=PM_ERR_PROJ_NOT_FOUND THEN
        ! There is no project mapped to the selection value
        StartLoadRun:=FALSE;
        WaitDI pmProject_diStart,0;
        TRYNEXT;
      ELSEIF ERRNO=ERR_REFUNKPRC THEN
        ! There is no main routine in the loaded modules
        StartLoadRun:=FALSE;
      ENDIF
  ENDPROC
  
  !***********************************************************
  !
  ! Procedure LoadAllModulesInTask
  !
  !   This routine findes the modules for this task.
  !   The project must have LoadRapid set to TRUE if the modules should be laded.
  !   It raises PM_ERR_NO_TASK if no task is configured for current task.
  !
  !***********************************************************
  PROC LoadAllModulesInTask(pm_projectinfo projInfo)
    VAR string TaskName;
    
    TaskName:=GetTaskName();
    TEST TaskName
    CASE projInfo.Robot1.TaskName:
      IF projInfo.Robot1.LoadRapid THEN
        LoadAllModules projInfo.Robot1.ModuleNames, projectInfo.Name, TaskName;
      ENDIF
    CASE projInfo.Robot2.TaskName:
      IF projInfo.Robot2.LoadRapid THEN
        LoadAllModules projInfo.Robot2.ModuleNames, projectInfo.Name, TaskName;
      ENDIF
    CASE projInfo.Robot3.TaskName:
      IF projInfo.Robot3.LoadRapid THEN
        LoadAllModules projInfo.Robot3.ModuleNames, projectInfo.Name, TaskName;
      ENDIF
    CASE projInfo.Robot4.TaskName:
      IF projInfo.Robot4.LoadRapid THEN
        LoadAllModules projInfo.Robot4.ModuleNames, projectInfo.Name, TaskName;
      ENDIF
    CASE projInfo.Robot5.TaskName:
      IF projInfo.Robot5.LoadRapid THEN
        LoadAllModules projInfo.Robot5.ModuleNames, projectInfo.Name, TaskName;
      ENDIF
    CASE projInfo.Robot6.TaskName:
      IF projInfo.Robot6.LoadRapid THEN
        LoadAllModules projInfo.Robot6.ModuleNames, projectInfo.Name, TaskName;
      ENDIF
    DEFAULT:
      RAISE PM_ERR_NO_TASK;
    ENDTEST
    ERROR
      IF ERRNO=PM_ERR_NO_TASK THEN
        PmErrorLog 2382,ERRSTR_TASK,ERRSTR_CONTEXT,ERRSTR_UNUSED,ERRSTR_UNUSED,ERRSTR_UNUSED\ErrorHandler:=TRUE;
        RAISE;
      ENDIF
  ENDPROC
 
  !***********************************************************
  !
  ! Procedure LoadAllModules
  !
  !   This routine loads the modules for this task.
  !   Already loaded modules will not be unloaded.
  !
  !***********************************************************
  PROC LoadAllModules(pm_moduleinfo moduleInfo,string projectName,string taskName)
    VAR string modulePath;

    modulePath:=pmProjHome+projectName+"/"+taskName+"/";
    
    IF moduleInfo.ModName1 <> "" THEN
      LoadModule moduleInfo.ModName1, modulePath;
    ENDIF
    
    IF moduleInfo.ModName2 <> "" THEN
      LoadModule moduleInfo.ModName2, modulePath;
    ENDIF
    
    IF moduleInfo.ModName3 <> "" THEN
      LoadModule moduleInfo.ModName3, modulePath;
    ENDIF
    
    IF moduleInfo.ModName4 <> "" THEN
      LoadModule moduleInfo.ModName4, modulePath;
    ENDIF
    
    IF moduleInfo.ModName5 <> "" THEN
      LoadModule moduleInfo.ModName5, modulePath;
    ENDIF
    
    IF moduleInfo.ModName6 <> "" THEN
      LoadModule moduleInfo.ModName6, modulePath;
    ENDIF
    
    IF moduleInfo.ModName7 <> "" THEN
      LoadModule moduleInfo.ModName7, modulePath;
    ENDIF
    
    IF moduleInfo.ModName8 <> "" THEN
      LoadModule moduleInfo.ModName8, modulePath;
    ENDIF
    
    IF moduleInfo.ModName9 <> "" THEN
      LoadModule moduleInfo.ModName9, modulePath;
    ENDIF
    
    IF moduleInfo.ModName10 <> "" THEN
      LoadModule moduleInfo.ModName10, modulePath;
    ENDIF
  ERROR
    IF ERRNO=ERR_LOADED THEN
      TRYNEXT;
    ENDIF
  ENDPROC

  !***********************************************************
  !
  ! Procedure LoadModule
  !
  !   This routine loads a module if it does not already exist.
  !
  !***********************************************************
  PROC LoadModule(string moduleName, string modulePath)
    VAR num found;
    VAR string part;
    VAR bool loaded;
    
    ! Get module name from file name
    loaded:=FALSE;
    found := StrFind(moduleName,1,".");
    IF found > 2 THEN
      part:=StrPart(moduleName,1,found-1);
      IF part <> "" THEN
        loaded:=ModExist(part);
      ENDIF
    ENDIF

    IF NOT loaded THEN
      Load \Dynamic,modulePath\File:=moduleName;
    ENDIF
  ERROR
    IF ERRNO=ERR_LOADED THEN
      RAISE;
    ENDIF
  ENDPROC

  !***********************************************************
  !
  ! Trap TrapProjectStopped
  !
  !   The project is stopping. Force the execution to start from main.
  !
  !***********************************************************
  TRAP TrapProjectStopped
    StopMove\Quick;
    ClearPath;
    StartMove;
    FirstProjMgrLoop:=TRUE;
    WaitTime 1;
    ExitCycle;
  ENDTRAP
ENDMODULE
