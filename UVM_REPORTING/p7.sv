//chagnge the verbosity of the entire hierarchy of the component
//environment class handle e is having 2 child classes mon and drv
// e.set_report_verbosity_level_hier(UVM_HIGH);
// handle_name.set_report_verbosity_level_hier(DESIRED_VERBOSITY);
//This will set the verbosity of the entire component along with its child to DESIRED_VERBOSITY


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
   
    drv.run();
    mon.run();
  endtask
  
endclass
////////////////////
 
 
module tb;
  
 
 env e;
  
  
 initial begin
   e  = new("ENV", null);
   
   e.set_report_verbosity_level_hier(UVM_HIGH);
   e.run(); 
  end
  
  
endmodule