//changing verbosity level of a particular component
//e.set_report_verbosity_level(UVM_HIGH);
//handle_name.set_report_verbosity_level(DESIRED_VERBOSTY);
// this will set the verbosity of that particular component to DESIRED_VERBOSTY
//NOTE if there are child classes declared inside the component whose verbosity we are changing
//set_report_verbosity_level() will not effect their verbosity

`include "uvm_macros.svh"
import uvm_pkg::*;
 
//////////////////////////////////////////////////
class driver extends uvm_driver;
	`uvm_component_utils(driver)
	  
	function new(string path , uvm_component parent);
		super.new(path, parent);
	endfunction
	 
	  
	task run();
		`uvm_info("DRV1_a", "DRV1_A String 1", UVM_NONE);
		`uvm_info("DRV1_a", "DRV1_A String 2", UVM_LOW);
		`uvm_info("DRV1_a", "DRV1_A String 3", UVM_MEDIUM);
		`uvm_info("DRV1_a", "DRV1_A String 4", UVM_HIGH);
		`uvm_info("DRV1_a", "DRV1_A String 5", UVM_FULL);
		`uvm_info("DRV1_a", "DRV1_A String 6", UVM_DEBUG);
	endtask
  
endclass
 
//////////////////////////////////////////////////
 
class env extends uvm_env;
	`uvm_component_utils(env)
  
	function new(string path , uvm_component parent);
		super.new(path, parent);
	endfunction
  
  
	task run();
		`uvm_info("ENV1_a", "DRV1_A String 1", UVM_NONE);
		`uvm_info("ENV1_a", "DRV1_A String 2", UVM_LOW);
		`uvm_info("ENV1_a", "DRV1_A String 3", UVM_MEDIUM);
		`uvm_info("ENV1_a", "DRV1_A String 4", UVM_HIGH);
		`uvm_info("ENV1_a", "DRV1_A String 5", UVM_FULL);
		`uvm_info("ENV1_a", "DRV1_A String 6", UVM_DEBUG);
	endtask
  
endclass
////////////////////
 
 
module tb;
  
	driver drv;
	env e;
  
	initial begin
		drv = new("DRV", null);
		e   = new("ENV", null);
		drv.run();
		e.run();
   
		$display("**********************\n\n");
		e.set_report_verbosity_level(UVM_HIGH);
		drv.run();
		e.run();
    
	end  
endmodule