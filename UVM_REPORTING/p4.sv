//changing verbosity of a particular message ID of a component
//example2
`include "uvm_macros.svh"
import uvm_pkg::*;
 
//////////////////////////////////////////////////
class driver1 extends uvm_driver;
	`uvm_component_utils(driver1)
  
	function new(string path , uvm_component parent);
		super.new(path, parent);
	endfunction
 
  
	task run();
		`uvm_info("DRV1_a", "String 3", UVM_HIGH);
      
      	`uvm_info("DRV1_b", "String 4", UVM_HIGH);
	endtask
  
endclass
 
////////////////////
 
class driver2 extends uvm_driver;
  `uvm_component_utils(driver2)
  
	function new(string path , uvm_component parent);
		super.new(path, parent);
	endfunction
 
  
	task run();
		`uvm_info("DRV2_a", "String 1", UVM_HIGH);
		`uvm_info("DRV2_b", "String 2", UVM_HIGH);
	endtask
  
endclass

module tb;
  
	driver1 drv1;
	driver2 drv2;
  
  
	initial begin
		drv1 = new("DRV1", null);
		drv2 = new("DRV2",null);
		
		//the default verbosity is UVM_MEDIUM -> none of the UVM_HIGH are printed
		drv1.run();
		drv2.run();
		
		//setting the verbosity of the particular ID of that component
		drv1.set_report_id_verbosity("DRV1_a",UVM_HIGH);
		drv1.run();
		drv2.run();
		
		
    
	end
  
  
endmodule