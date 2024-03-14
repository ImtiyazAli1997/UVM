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
   
		/*
		//the order in which these 2 are written matter as hier will effect the verbosity of entire hierarchy
		//whereas level will efferct verbosity of that component
		//here it matters because the hierarchy contains the chils class mon
		
		//order 1
		e.mon.set_report_verbosity_level(UVM_DEBUG);
		e.set_report_verbosity_level_hier(UVM_HIGH);
		
		//order 2
		e.set_report_verbosity_level_hier(UVM_HIGH);
		e.mon.set_report_verbosity_level(UVM_DEBUG);
		
		*/
	   
		//the order of these 2 doesn't matter as its setting only for that component
		e.mon.set_report_verbosity_level(UVM_DEBUG);
		e.set_report_verbosity_level(UVM_HIGH);
	   
	   
		e.run(); 
	  end
  
  
endmodule

/*
	parent e;
	childs inside e are mon and drv


*/
/*
	
	e.mon.set_report_verbosity_level(UVM_DEBUG);		//only sets the verbosity of child mon ->UVM_DEBUG
	e.set_report_verbosity_level(UVM_HIGH);				//only sets the verbosity of parent e->UVM_HIGH and not effect the child verbosity
	//as child drv verbosity is not not it uses default verbosity as UVM_MEDIUM
	
	output:
	UVM_INFO p8.sv(64) @ 0: ENV [ENV] Executed Driver Code
	UVM_INFO p8.sv(65) @ 0: ENV [ENV1_a] ENV1_A String 1
	UVM_INFO p8.sv(66) @ 0: ENV [ENV1_a] ENV1_A String 2
	UVM_INFO p8.sv(67) @ 0: ENV [ENV1_a] ENV1_A String 3
	UVM_INFO p8.sv(68) @ 0: ENV [ENV1_a] ENV1_A String 4
	 
	UVM_INFO p8.sv(15) @ 0: ENV.DRV [DRV1_a] DRV1_A String 1
	UVM_INFO p8.sv(16) @ 0: ENV.DRV [DRV1_a] DRV1_A String 2
	UVM_INFO p8.sv(17) @ 0: ENV.DRV [DRV1_a] DRV1_A String 3
	 
	UVM_INFO p8.sv(36) @ 0: ENV.MON [MON] Executed Monitor Code
	UVM_INFO p8.sv(37) @ 0: ENV.MON [MON1_a] MON1_A String 1
	UVM_INFO p8.sv(38) @ 0: ENV.MON [MON1_a] MON1_A String 2
	UVM_INFO p8.sv(39) @ 0: ENV.MON [MON1_a] MON1_A String 3
	UVM_INFO p8.sv(40) @ 0: ENV.MON [MON1_a] MON1_A String 4
	UVM_INFO p8.sv(41) @ 0: ENV.MON [MON1_a] MON1_A String 5
	UVM_INFO p8.sv(42) @ 0: ENV.MON [MON1_a] MON1_A String 6
	
*/

/*
	e.mon.set_report_verbosity_level(UVM_DEBUG);		//only sets the verbosity of child mon ->UVM_DEBUG
	e.set_report_verbosity_level_hier(UVM_HIGH);		// sets the verbosity of parent e->UVM_HIGH and also the child verbosities too that is child drv,mon->UVM_HIGH
	//as the previous mon verbosity is overwritten by parent hierarchy verbosity
	
	
	output:
	UVM_INFO p8.sv(64) @ 0: ENV [ENV] Executed Driver Code
	UVM_INFO p8.sv(65) @ 0: ENV [ENV1_a] ENV1_A String 1
	UVM_INFO p8.sv(66) @ 0: ENV [ENV1_a] ENV1_A String 2
	UVM_INFO p8.sv(67) @ 0: ENV [ENV1_a] ENV1_A String 3
	UVM_INFO p8.sv(68) @ 0: ENV [ENV1_a] ENV1_A String 4
	 
	UVM_INFO p8.sv(14) @ 0: ENV.DRV [DRV] Executed Driver Code
	UVM_INFO p8.sv(15) @ 0: ENV.DRV [DRV1_a] DRV1_A String 1
	UVM_INFO p8.sv(16) @ 0: ENV.DRV [DRV1_a] DRV1_A String 2
	UVM_INFO p8.sv(17) @ 0: ENV.DRV [DRV1_a] DRV1_A String 3
	UVM_INFO p8.sv(18) @ 0: ENV.DRV [DRV1_a] DRV1_A String 4
	 
	UVM_INFO p8.sv(36) @ 0: ENV.MON [MON] Executed Monitor Code
	UVM_INFO p8.sv(37) @ 0: ENV.MON [MON1_a] MON1_A String 1
	UVM_INFO p8.sv(38) @ 0: ENV.MON [MON1_a] MON1_A String 2
	UVM_INFO p8.sv(39) @ 0: ENV.MON [MON1_a] MON1_A String 3
	UVM_INFO p8.sv(40) @ 0: ENV.MON [MON1_a] MON1_A String 4
*/

/*
	e.set_report_verbosity_level_hier(UVM_HIGH);		// sets the verbosity of parent e->UVM_HIGH and also the child verbosities too that is child drv,mon->UVM_HIGH
	e.mon.set_report_verbosity_level(UVM_DEBUG);		//only sets the verbosity of child mon ->UVM_DEBUG
	
	//here the hierarchyverbosity is over written by component verbosity for mon  mon->UVM_DEBUG
	
	output:
	UVM_INFO p8.sv(64) @ 0: ENV [ENV] Executed Driver Code
	UVM_INFO p8.sv(65) @ 0: ENV [ENV1_a] ENV1_A String 1
	UVM_INFO p8.sv(66) @ 0: ENV [ENV1_a] ENV1_A String 2
	UVM_INFO p8.sv(67) @ 0: ENV [ENV1_a] ENV1_A String 3
	UVM_INFO p8.sv(68) @ 0: ENV [ENV1_a] ENV1_A String 4
	 
	UVM_INFO p8.sv(14) @ 0: ENV.DRV [DRV] Executed Driver Code
	UVM_INFO p8.sv(15) @ 0: ENV.DRV [DRV1_a] DRV1_A String 1
	UVM_INFO p8.sv(16) @ 0: ENV.DRV [DRV1_a] DRV1_A String 2
	UVM_INFO p8.sv(17) @ 0: ENV.DRV [DRV1_a] DRV1_A String 3
	UVM_INFO p8.sv(18) @ 0: ENV.DRV [DRV1_a] DRV1_A String 4
	 
	UVM_INFO p8.sv(36) @ 0: ENV.MON [MON] Executed Monitor Code
	UVM_INFO p8.sv(37) @ 0: ENV.MON [MON1_a] MON1_A String 1
	UVM_INFO p8.sv(38) @ 0: ENV.MON [MON1_a] MON1_A String 2
	UVM_INFO p8.sv(39) @ 0: ENV.MON [MON1_a] MON1_A String 3
	UVM_INFO p8.sv(40) @ 0: ENV.MON [MON1_a] MON1_A String 4
	UVM_INFO p8.sv(41) @ 0: ENV.MON [MON1_a] MON1_A String 5
	UVM_INFO p8.sv(42) @ 0: ENV.MON [MON1_a] MON1_A String 6
	
*/