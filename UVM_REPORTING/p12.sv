/*
Write a code to change the verbosity of the entire verification environment to UVM_DEBUG. 
To demonstrate successful configuration, print the value of the verbosity level on the console.

Use GET and SET method with UVM_ROOT to configure Verbosity.
*/

`include "uvm_macros.svh"
import uvm_pkg::*;
 
//////////////////////////////////////////////////
class driver extends uvm_driver;
	`uvm_component_utils(driver)
  
	function new(string path , uvm_component parent);
		super.new(path, parent);
	endfunction
 
  
	task run();
		`uvm_info("DRV", "Executed Driver Code", UVM_HIGH);
		`uvm_info("DRV1_a", "DRV1_A String 1", UVM_NONE);
		`uvm_info("DRV1_a", "DRV1_A String 2", UVM_LOW);
		`uvm_info("DRV1_a", "DRV1_A String 3", UVM_MEDIUM);
		`uvm_info("DRV1_a", "DRV1_A String 4", UVM_HIGH);
		`uvm_info("DRV1_a", "DRV1_A String 5", UVM_FULL);
		`uvm_info("DRV1_a", "DRV1_A String 6", UVM_DEBUG);
		$display();
	endtask
  
endclass
///////////////////////////////////////////////////
 
class monitor extends uvm_monitor;
	`uvm_component_utils(monitor)
  
	function new(string path , uvm_component parent);
		super.new(path, parent);
	endfunction
 
  
	task run();
		`uvm_info("MON", "Executed Monitor Code", UVM_HIGH);
		`uvm_info("MON1_a", "MON1_A String 1", UVM_NONE);
		`uvm_info("MON1_a", "MON1_A String 2", UVM_LOW);
		`uvm_info("MON1_a", "MON1_A String 3", UVM_MEDIUM);
		`uvm_info("MON1_a", "MON1_A String 4", UVM_HIGH);
		`uvm_info("MON1_a", "MON1_A String 5", UVM_FULL);
		`uvm_info("MON1_a", "MON1_A String 6", UVM_DEBUG);
	endtask
  
endclass
 
//////////////////////////////////////////////////
 
class env extends uvm_env;
	`uvm_component_utils(env)
  
	driver drv;
	monitor mon;
  
	function new(string path , uvm_component parent);
		super.new(path, parent);
		drv = new("DRV", this);
		mon = new("MON", this);
	endfunction
  
  
  
	task run();
		`uvm_info("ENV", "Executed Driver Code", UVM_HIGH);
		`uvm_info("ENV1_a", "ENV1_A String 1", UVM_NONE);
		`uvm_info("ENV1_a", "ENV1_A String 2", UVM_LOW);
		`uvm_info("ENV1_a", "ENV1_A String 3", UVM_MEDIUM);
		`uvm_info("ENV1_a", "ENV1_A String 4", UVM_HIGH);
		`uvm_info("ENV1_a", "ENV1_A String 5", UVM_FULL);
		`uvm_info("ENV1_a", "ENV1_A String 6", UVM_DEBUG);
		$display();
    
		drv.run();
		mon.run();
	endtask
  
endclass
////////////////////
 
 
module tb;
  
 
	env e;
  
  
	initial begin
		e  = new("ENV", null);
		
		`uvm_info("DEF_VERBOSITY",$sformatf("default verbosity = %0d",e.get_report_verbosity_level()),UVM_MEDIUM);
		e.run();
		$display("\n\n\n");
		e.set_report_verbosity_level_hier(UVM_DEBUG);
		`uvm_info("NEW_VERBOSITY",$sformatf("new verbosity = %0d",e.get_report_verbosity_level()),UVM_MEDIUM);
		e.run(); 
	  end
  
  
endmodule