1] syntax of uvm info , warning, messaging,fatal,error refer pic "uvm_reporting_syntaxes"
2] verbosity levels of uvm info refer picture "uvm_verbosity"
	the following are verbosities type
		1]UVM_NONE		2] UVM_LOW		3]UVM_MEDIUM	
		4]UVM_HIGH		5]UVM_FULL		6]UVM_DEBUG
3] default verbosity of a component is medium 
4]changing verbosity of a particular component [class]
	handle_name.set_report_id_verbosity("MESSAGE_ID",DESIRED_VERBOSITY);
5] changing verbosity of a particular message ID of a component [class]
	handle_name.set_report_id_verbosity("MESSAGE_ID",DESIRED_VERBOSITY);
	this sets the verbosity of the particular components message id to the DESIRED_VERBOSITY 
	for the remaining we can set it seperately according to message id 
	or else
	the default verbosity will be applied
6] if there are child classes declared inside the component whose verbosity we are changing
	set_report_verbosity_level() will not effect their verbosity
7]changing the verbosity of the entire hierarchy of the component
	environment class handle env is having 2 child classes mon and drv
	env.set_report_verbosity_level_hier(UVM_HIGH);
	handle_name.set_report_verbosity_level_hier(DESIRED_VERBOSITY);
	This will set the verbosity of the entire component along with its child to DESIRED_VERBOSITY
	in this case parent class env along with its child mon and drv will have DESIRED_VERBOSITY
8]there are 4 severities
	1]uvm_info		2]uvm_warning		3]uvm_error		4]uvm_fatal
9]changing the severity level of a uvm reporting 
	handle_name.set_report_severity_override(CURRENT_SEVERITY,DESIRED_SEVERITY)
		example:
		d.set_report_severity_override(UVM_WARNING, UVM_ERROR);
		
10]the actions which a severity can do are as follows
		1]UVM_NO_ACTION		2] UVM_DISPLAY		3]UVM_LOG		4]UVM_COUNT
		5]UVM_EXIT			6] UVM_CALL_HOOK	7]UVM_STOP		8] UVM_RM_RECORD
11]there are default actions see the picture attached "uvm_reporting_severity_default_actions"
12]changing the actions of particular severity
	handle_name.set_report_severity_action(UVM_SEVERITY, UVM_ACTION1 | UVM_ACTION2 |...);
	example:-
		d.set_report_severity_action(UVM_INFO,UVM_NO_ACTION);
		d.set_report_severity_action(UVM_INFO,UVM_DISPLAY | UVM_EXIT);
13] the action UVM_COUNT when added to a severity will increment the quit count whenever that severity message is executed
	as by default this counts the `uvm_error messages count 
	whenever this count variable reaches a certain value it exits the simulation
	in order to set this certain value to the count variable we use 
	handle_name.set_report_max_quit_count(DESIRED_COUNT_NUMBER_VALUE);
	
	example:
		d.set_report_max_quit_count(3);