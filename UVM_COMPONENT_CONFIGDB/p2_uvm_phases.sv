`include "uvm_macros.svh"
import uvm_pkg::*;

class my_test1 extends uvm_test;
	environment env;
	//virtual router_if vif;			//DUT interface 
	string str= "test_class";
	`uvm_component_utils(my_test1)
	
	function new(string name="my_test1",uvm_component parent =null);
		super.new(name,parent);
	endfunction
  	
  	virtual function void build_phase(uvm_phase phase);
       `uvm_info(str1,$sformatf("build phase start of %s",get_type_name()),UVM_MEDIUM);
    endfunction
	
	virtual function void connect_phase(uvm_phase phase);
		`uvm_info(str1,$sformatf("connect phase start of %s",get_type_name()),UVM_MEDIUM);
	endfunction
	
	virtual function void end_of_elaboration_phase(uvm_phase phase);
		`uvm_info(str1,$sformatf("end_of_elaboration_phase phase start of %s",get_type_name()),UVM_MEDIUM);
	endfunction
	
	virtual function void start_of_simulation_phase(uvm_phase phase);
		`uvm_info(str1,$sformatf("start_of_simulation_phase phase start of %s",get_type_name()),UVM_MEDIUM);
	endfunction
	
	virtual task pre_reset_phase(uvm_phase phase);
		`uvm_info(str1,$sformatf("pre_reset_phase phase start of %s",get_type_name()),UVM_MEDIUM);
	endfunction
	
	virtual task pre_reset_phase(uvm_phase phase);
		`uvm_info(str1,$sformatf("pre_reset_phase phase start of %s",get_type_name()),UVM_MEDIUM);
    endtask
  
	
	virtual task reset_phase(uvm_phase phase);
		`uvm_info(str1,$sformatf("reset_phase phase start of %s",get_type_name()),UVM_MEDIUM);
    endtask
	
	virtual task post_reset_phase(uvm_phase phase);
		`uvm_info(str1,$sformatf("post_reset_phase phase start of %s",get_type_name()),UVM_MEDIUM);
    endtask
 
	virtual task pre_configure_phase(uvm_phase phase);
		`uvm_info(str1,$sformatf("pre_configure_phase phase start of %s",get_type_name()),UVM_MEDIUM);
    endtask
	
	virtual task configure_phase(uvm_phase phase);
		`uvm_info(str1,$sformatf("configure_phase phase start of %s",get_type_name()),UVM_MEDIUM);
    endtask
	
	virtual task post_configure_phase(uvm_phase phase);
		`uvm_info(str1,$sformatf("post_configure_phase phase start of %s",get_type_name()),UVM_MEDIUM);
    endtask
 
	virtual task pre_main_phase(uvm_phase phase);
		`uvm_info(str1,$sformatf("pre_main_phase phase start of %s",get_type_name()),UVM_MEDIUM);
    endtask
	
	virtual task main_phase(uvm_phase phase);
		`uvm_info(str1,$sformatf("main_phase phase start of %s",get_type_name()),UVM_MEDIUM);
    endtask
  	
	virtual task post_main_phase(uvm_phase phase);
		`uvm_info(str1,$sformatf("post_main_phase phase start of %s",get_type_name()),UVM_MEDIUM);
    endtask
	
	virtual task pre_shutdown_phase(uvm_phase phase);
		`uvm_info(str1,$sformatf("pre_shutdown_phase phase start of %s",get_type_name()),UVM_MEDIUM);
    endtask
	
	virtual task shutdown_phase(uvm_phase phase);
		`uvm_info(str1,$sformatf("shutdown_phase phase start of %s",get_type_name()),UVM_MEDIUM);
	endtask
	
	virtual task post_shutdown_phase(uvm_phase phase);
		`uvm_info(str1,$sformatf("post_shutdown_phase phase start of %s",get_type_name()),UVM_MEDIUM);
	endtask
	
	
 
	virtual function void extract_phase(uvm_phase phase);
		`uvm_info(str1,$sformatf("extract_phase phase start of %s",get_type_name()),UVM_MEDIUM);
	endfunction
	
	virtual function void check_phase(uvm_phase phase);
		`uvm_info(str1,$sformatf("check_phase phase start of %s",get_type_name()),UVM_MEDIUM);
	endfunction
	
	virtual function void report_phase(uvm_phase phase);
		`uvm_info(str1,$sformatf("report_phase phase start of %s",get_type_name()),UVM_MEDIUM);
	endfunction
	
	virtual function void final_phase(uvm_phase phase);
		`uvm_info(str1,$sformatf("final_phase phase start of %s",get_type_name()),UVM_MEDIUM);
	endfunction
	
endclass

module tb;
	
initial begin
  run_test("my_test1");
end
endmodule