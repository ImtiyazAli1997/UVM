class new_test extends uvm_test;
    `uvm_component_utils(new_test)

bit [31:0] new_test_data=40;
    
function new(string name="new_test1",uvm_component parent=null);
super.new(name,parent);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
`uvm_info("new_test","Started build_pase",UVM_HIGH);
endfunction

virtual function void connect_phase(uvm_phase phase);
`uvm_info("new_test","Started connect_phase",UVM_HIGH);
endfunction

virtual function void end_of_elaboration_phase(uvm_phase phase);
`uvm_info("new_test","Started end_of_elaboration_phase ",UVM_HIGH);
endfunction

virtual function void start_of_simulation_phase (uvm_phase phase);
`uvm_info("new_test","Started start_of_simulation_phase ",UVM_HIGH);
endfunction


virtual task run_phase(uvm_phase phase);
phase.raise_objection(this);
`uvm_info("new_test","Start of run_phase",UVM_MEDIUM);
`uvm_delay(50);
`uvm_info("new_test","End of run_phase",UVM_MEDIUM);
phase.drop_objection(this);
endtask

virtual task pre_reset_phase(uvm_phase phase);
`uvm_info("new_test","Started pre_reset_phase",UVM_HIGH);
endtask

virtual task reset_phase(uvm_phase phase);
`uvm_info("new_test","Started reset_phase",UVM_MEDIUM);
phase.raise_objection(this);
#5;
`uvm_info("new_test","Ended reset_phase",UVM_MEDIUM);
phase.drop_objection(this);
endtask

virtual task post_reset_phase(uvm_phase phase);
`uvm_info("new_test","Started post_reset_phase",UVM_HIGH);
endtask

virtual task pre_configure_phase(uvm_phase phase);
`uvm_info("new_test","Started pre_configure_phase",UVM_HIGH);
endtask

virtual task configure_phase(uvm_phase phase);
phase.raise_objection(this);
`uvm_info("new_test","Started configure_phase",UVM_MEDIUM);
#5;
`uvm_info("new_test","Ended configure_phase",UVM_MEDIUM);
phase.drop_objection(this);
endtask

virtual task post_configure_phase(uvm_phase phase);
`uvm_info("new_test","Started post_configure_phase",UVM_HIGH);
endtask

virtual task pre_main_phase(uvm_phase phase);
`uvm_info("new_test","Started pre_main_phase",UVM_HIGH);
endtask

virtual task main_phase(uvm_phase phase);
phase.raise_objection(this);
`uvm_info("new_test","Started main_phase",UVM_MEDIUM);
#5;
`uvm_info("new_test","Ended main_phase",UVM_MEDIUM);
phase.drop_objection(this);
endtask

virtual task post_main_phase(uvm_phase phase);
`uvm_info("new_test","Started post_main_phase",UVM_HIGH);
endtask


virtual task pre_shutdown_phase(uvm_phase phase);
`uvm_info("new_test","Started pre_shutdown_phase",UVM_HIGH);
endtask

virtual task shutdown_phase(uvm_phase phase);
phase.raise_objection(this);
`uvm_info("new_test","Started shutdown_phase",UVM_MEDIUM);
#5;
`uvm_info("new_test","Ended shutdown_phase",UVM_MEDIUM);
phase.drop_objection(this);
endtask

virtual task post_shutdown_phase(uvm_phase phase);
`uvm_info("new_test","Started post_shutdown_phase",UVM_HIGH);
endtask

virtual function void extract_phase (uvm_phase phase);
`uvm_info("new_test","Started extract_phase ",UVM_HIGH);
endfunction

virtual function void check_phase (uvm_phase phase);
`uvm_info("new_test","Started check_phase ",UVM_HIGH);
endfunction

virtual function void report_phase (uvm_phase phase);
`uvm_info("new_test","Started report_phase ",UVM_HIGH);
endfunction

virtual function void final_phase (uvm_phase phase);
`uvm_info("new_test","Started final_phase ",UVM_HIGH);
endfunction


endclass
