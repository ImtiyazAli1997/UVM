//registering a enum, string and real using field macro into a factory 

`include "uvm_macros.svh"
import uvm_pkg::*;
 
class obj extends uvm_object;
//  `uvm_object_utils(obj)
  
  typedef enum bit [2:0] {FETCH ,DECODE,EXECUTE,MEMORY,WRITE_BACK} state_t;
  rand state_t state;						//declaring a enum variable which is randomizable, a real variable and a string variable
  
  real temp = 12.34;
  string str = "UVM";
 
  function new(string name = "obj");
    super.new(name);
  endfunction
  
 
  `uvm_object_utils_begin(obj)
	  `uvm_field_enum(state_t, state, UVM_DEFAULT);		//the first argument is the enum data type, 2nd is the enum variable and 3rd is the FLAG
	  `uvm_field_string(str,UVM_DEFAULT);
	  `uvm_field_real(temp, UVM_DEFAULT);
  `uvm_object_utils_end
 
  
endclass
 
module tb;
  obj o;
  
  initial begin
    o = new("obj");
    o.randomize();
    o.print(uvm_default_table_printer);		// uvm_default_table_printer is not mandatory as its available by default
  end
  
endmodule