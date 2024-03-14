/*
Send the name of the first RTL that you designed in Verilog with the help of reporting Macro.
Do not override the default verbosity. Expected Output : "First RTL : Your_System_Name"
*/
`include "uvm_macros.svh"
import uvm_pkg::*;
class driver extends uvm_driver;
	`uvm_component_utils(driver)
  
	function new(string path , uvm_component parent);
		super.new(path, parent);
	endfunction
	task run();
		`uvm_info("FIRST_RTL","First RTL : full adder",UVM_MEDIUM);
	endtask
endclass

module tb;
	driver r;
	
	initial begin
		r=new("drv",null);
		//r.set_report_verbosity_level(UVM_FULL);
      
		r.run();
	end
	
endmodule