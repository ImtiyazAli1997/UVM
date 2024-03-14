/*
Override the UVM_WARNING action to make quit_count equal to the number of times UVM_WARNING executes.
 Write an SV code to send four random messages to a terminal with potential error severity, Simulation must stop as soon as we reach to quit_count of four. 
 Do not use UVM_INFO, UVM_ERROR, UVM_FATAL,
 */
 
`include "uvm_macros.svh"
import uvm_pkg::*;

class driver extends uvm_driver;
	`uvm_component_utils(driver)
  
	function new(string path , uvm_component parent);
		super.new(path, parent);
	endfunction
 
  
	task run();
		
		$display();
		`uvm_warning("WRN","warning 1");
		`uvm_warning("WRN","warning 2");
		`uvm_warning("WRN","warning 3");
		`uvm_warning("WRN","warning 4");
		`uvm_warning("WRN","warning 5");
		`uvm_warning("WRN","warning 6");
		`uvm_warning("WRN","warning 7");
		`uvm_warning("WRN","warning 8");
	endtask
  
endclass

module tb;
	driver drv;
	
	initial begin
		drv=new("drv",null);
		
		drv.set_report_severity_action(UVM_WARNING,UVM_DISPLAY|UVM_COUNT);
		drv.set_report_max_quit_count(4);
		
		drv.run();
	end
endmodule