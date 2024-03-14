//default actions of uvm_info, uvm_warning, uvn_fatal, uvm_error
// the actions are as follows
//1] UVM_NO_ACTION		2] UVM_DISPLAY		3]UVM_LOG		4]UVM_COUNT
//5]UVM_EXIT			6] UVM_CALL_HOOK	7]UVM_STOP		8] UVM_RM_RECORD
`include "uvm_macros.svh"
import uvm_pkg::*;
 
//////////////////////////////////////////////////
class driver extends uvm_driver;
	`uvm_component_utils(driver)
  
	function new(string path , uvm_component parent);
		super.new(path, parent);
	endfunction
  
	task run();
		$display("start of run");
		`uvm_info("DRV", "Informational Message", UVM_NONE);
		$display("after 1st uvm_info");
		`uvm_warning("DRV", "Potential Error");
		`uvm_error("DRV", "Real Error"); ///uvm_count
		`uvm_error("DRV", "Second Real Error");
		/*
		 #10;
		`uvm_fatal("DRV", "Simulation cannot continue DRV1"); /// uvm_exit
		#10;
		`uvm_fatal("DRV1", "Simulation Cannot Continue DRV1");
	   */
	endtask

endclass
 
/////////////////////////////////////////////
 
 
module tb;
	driver d;
  
	initial begin
		d = new("DRV", null);
		
		d.set_report_severity_action(UVM_INFO,UVM_NO_ACTION);
		
		d.set_report_severity_action(UVM_INFO,UVM_DISPLAY | UVM_EXIT);
		//d.set_report_max_quit_count(3);
   
		d.run();
	end
  
endmodule