//changing verbosity of a particular message ID of a component
//example1
//1]changing verbosity of a particular message ID of a component
//handle_name.set_report_id_verbosity("MESSAGE_ID",DESIRED_VERBOSITY);
//drv.set_report_id_verbosity("DRV1",UVM_HIGH);
`include "uvm_macros.svh"
import uvm_pkg::*;
 
//////////////////////////////////////////////////
class driver extends uvm_driver;
	`uvm_component_utils(driver)
  
	function new(string path , uvm_component parent);
		super.new(path, parent);
	endfunction
 
  
	task run();
		`uvm_info("DRV1", "Executed Driver1 Code", UVM_HIGH);
		`uvm_info("DRV2", "Executed Driver2 Code", UVM_HIGH);
	endtask
  
endclass
 
////////////////////
 
 
module tb;
  
	driver drv;
	initial begin
		drv = new("DRV", null);
		//1 
		drv.set_report_id_verbosity("DRV1",UVM_HIGH);
		drv.run();
	end
  
  
endmodule