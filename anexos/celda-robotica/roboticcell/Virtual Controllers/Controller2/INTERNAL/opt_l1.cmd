
# Setup the killer task
task -slotname peventts_low		-slotid 90  -pri 92 -vwopt 0x1c -stcks 25000 -entp peventts -auto
task -slotname peventts_pump 	-slotid 115 -pri 97 -vwopt 0x1c -stcks 25000 -entp peventts -auto

# Initialize the pick and place application framework

# Create a uplink pipe
pipe_create -name /pipe/uplink1 -nMessages 40 -nBytes 10000
pipe_create -name /pipe/uplink2 -nMessages 40 -nBytes 10000
# Create a downlink pipe
pipe_create -name /pipe/downlink1 -nMessages 30 -nBytes 10000
pipe_create -name /pipe/downlink2 -nMessages 30 -nBytes 10000

# Add pmrc pgraph dump to system dump service
sysdmp_add -name 3P_PMRC -source pmrc -save pmmgr_save_pgraph_status -fileext log

invoke -entry ppadat_init -nomode -arg 3145728
invoke -entry downlink_init

# Create uplink tasks 
task -slotname uplinkts1		-slotid 98	-pri 97	-vwopt 0x1c -stcks 15000 -entp uplinkts_main	-auto -ipcname /pipe/uplink1
task -slotname uplinkts2		-slotid 99	-pri 97	-vwopt 0x1c -stcks 15000 -entp uplinkts_main	-auto -ipcname /pipe/uplink2
# Create downlink tasks 
task -slotname downlinkts1		-slotid 101	-pri 97	-vwopt 0x1c -stcks 15000 -entp downlinkts_main	-auto -ipcname /pipe/downlink1
task -slotname downlinkts2		-slotid 102	-pri 97	-vwopt 0x1c -stcks 15000 -entp downlinkts_main	-auto -ipcname /pipe/downlink2


# Create config reader task 
task -slotname pmconfigts 		-slotid 114 -pri 131 -vwopt 0x1c -stcks 30000 -entp pmconfigts_main -auto

invoke -entry pmcontsched_init

invoke -entry pmmgr_init
