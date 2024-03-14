//changing the verbosity of `uvm_info for particular message id
//drv2.set_report_id_verbosity("DRV1_a",UVM_HIGH);
//handle_name.set_report_id_verbosity("MESSAGE_ID",DESIRED_VERBOSITY);
//this sets the verbosity of the particular components message id to the DESIRED_VERBOSITY 
`include "uvm_macros.svh"
import uvm_pkg::*;
 
//////////////////////////////////////////////////
class driver1 extends uvm_driver;
	`uvm_component_utils(driver1)
  
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
		
		`uvm_info("DRV1_b", "DRV1_B String 1", UVM_NONE);
		`uvm_info("DRV1_b", "DRV1_B String 2", UVM_LOW);
		`uvm_info("DRV1_b", "DRV1_B String 3", UVM_MEDIUM);
		`uvm_info("DRV1_b", "DRV1_B String 4", UVM_HIGH);
		`uvm_info("DRV1_b", "DRV1_B String 5", UVM_FULL);
		`uvm_info("DRV1_b", "DRV1_B String 6", UVM_DEBUG);
		
		
	endtask
  
endclass
 
////////////////////
 
class driver2 extends uvm_driver;
	`uvm_component_utils(driver2)
  
	function new(string path , uvm_component parent);
		super.new(path, parent);
	endfunction
 
  
	task run();
      `uvm_info("DRV2_a", "DRV1_A String 1", UVM_NONE);
      `uvm_info("DRV2_a", "DRV1_A String 2", UVM_LOW);
      `uvm_info("DRV2_a", "DRV1_A String 3", UVM_MEDIUM);
      `uvm_info("DRV2_a", "DRV1_A String 4", UVM_HIGH);
      `uvm_info("DRV2_a", "DRV1_A String 5", UVM_FULL);
      `uvm_info("DRV2_a", "DRV1_A String 6", UVM_DEBUG);
		
      `uvm_info("DRV2_b", "DRV2_B String 1", UVM_NONE);
      `uvm_info("DRV2_b", "DRV2_B String 2", UVM_LOW);
      `uvm_info("DRV2_b", "DRV2_B String 3", UVM_MEDIUM);
      `uvm_info("DRV2_b", "DRV2_B String 4", UVM_HIGH);
      `uvm_info("DRV2_b", "DRV2_B String 5", UVM_FULL);
      `uvm_info("DRV2_b", "DRV2_B String 6", UVM_DEBUG);
	endtask
  
endclass

module tb;
  
	driver1 drv1;
	driver2 drv2;
  
	//comment this initial block and uncomment the 2nd initial block
	//uncomment both initial blocks
	//check both scenerio outputs
	initial begin
		drv1 = new("DRV1", null);
		drv2 = new("DRV2",null);
		
		//the default verbosity is UVM_MEDIUM -> none of the UVM_HIGH are printed
		drv1.run();
		drv2.run();
		
		$display("*******************************\n\n");
		#2;
		//setting the verbosity of the particular ID of that component
		drv1.set_report_id_verbosity("DRV1_a",UVM_HIGH);
		drv1.run();
		drv2.run();
		$display("*******************************\n\n");
		
		#10;// here the prvious verbositiy is also active and the one which we are putting below is also active
		drv2.set_report_id_verbosity("DRV2_b",UVM_HIGH);
      	drv1.run();
		drv2.run();
		$display("*******************************\n\n");
		
		// we don't use the set_report_id_verbosity() function when using uvm classes because everytime we change the code we will have to compile the file
		//so instead we set these things in simulation options
		
	end
  	
  /*
  	initial begin
      #1;
      drv2.set_report_id_verbosity("DRV1_a",UVM_HIGH);
      	drv1.run();
		drv2.run();
		$display("*******************************\n\n");
    end
      */
  
endmodule