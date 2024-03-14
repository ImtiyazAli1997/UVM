
//1] verbosity information none,low,medium, hign,full, debug
//2] default verbosity is medium
//3] changing verbosity of a particular component
//4]uvm_top.set_report_verbosity_level(UVM_HIGH);
//handle_name.set_report_verbosity_level(DESIRED_VEBOSITY_LEVEL);
//the following are verbosities type
//1]UVM_NONE		2] UVM_LOW		3]UVM_MEDIUM	4]UVM_HIGH
//5]UVM_FULL		6]UVM_DEBUG
`include "uvm_macros.svh"
import uvm_pkg::*;
 
module tb;
  
	initial begin
		$display("Default Verbosity level : %0d ", uvm_top.get_report_verbosity_level);//2
		`uvm_info("TB_TEST1", "String 1", UVM_NONE);	//1
		`uvm_info("TB_TEST1", "String 2", UVM_LOW);
		`uvm_info("TB_TEST1", "String 3", UVM_MEDIUM);
		`uvm_info("TB_TEST1", "String 4", UVM_HIGH);
		`uvm_info("TB_TEST1", "String 5", UVM_FULL);
		`uvm_info("TB_TEST1", "String 6", UVM_DEBUG);
		
		
		
		uvm_top.set_report_verbosity_level(UVM_HIGH);//3
		$display("new Verbosity level : %0d ", uvm_top.get_report_verbosity_level);
		`uvm_info("TB_TEST2", "String 1", UVM_NONE);
		`uvm_info("TB_TEST2", "String 2", UVM_LOW);
		`uvm_info("TB_TEST2", "String 3", UVM_MEDIUM);
		`uvm_info("TB_TEST2", "String 4", UVM_HIGH);
		`uvm_info("TB_TEST2", "String 5", UVM_FULL);
		`uvm_info("TB_TEST2", "String 6", UVM_DEBUG);
  
	end
  
  
endmodule