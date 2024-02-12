program  test;
  
  import uvm_pkg::*;//step 1 
  
  `include "uvm_macros.svh"
  
  `include "test2.sv"
  
  class hello_uvm extends uvm_test;////step 2 , implement test class
    `uvm_component_utils(hello_uvm)
    
    function new (string name="hello_uvm",uvm_component parent=null);
      super.new(name,parent);
    endfunction
    
    virtual task run_phase(uvm_phase phase);
      phase.raise_objection(this,"Obection raised from hello_uvm class");
      #5;
      `uvm_info("Test_ID","Hello UVM world and Welcome to Verification professionals",UVM_MEDIUM)
      phase.drop_objection(this,"Obection dropped from hello_uvm class");
    endtask
    
    virtual function void final_phase(uvm_phase phase);
      super.final_phase(phase);
      uvm_top.print_topology();
    endfunction
      
  endclass
  
  initial run_test();//step 3 call this method
  
endprogram
