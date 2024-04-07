//object construction with create method instead of new() function constructor
`include "uvm_macros.svh"
import uvm_pkg::*;
 
 
class first extends uvm_object; 
  
	rand bit [3:0] data;
  
	function new(string path = "first");
		super.new(path);
	endfunction 
  
	`uvm_object_utils_begin(first)
		`uvm_field_int(data, UVM_DEFAULT);
	`uvm_object_utils_end
endclass
 
 
////////////////////////////////////////////
 
module tb;
 
	first f1,f2;
 
	initial begin
		f1 = first::type_id::create("f1");		//handle_name = class_name::type_id::create(STRING_ARGUMENT,[PARENT_ARGUMENT]);
		f2 = first::type_id::create("f2");
     
		f1.randomize();
		f2.randomize();
     
		f1.print();
		f2.print();
	end
endmodule