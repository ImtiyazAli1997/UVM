//using factory override to change the present class object with a new object
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
/////////////////////////////////////
//class DESIRED_CLASS_NAME extends PRESENT_CLASS_NAME;
class first_mod extends first;
	rand bit ack;
  
	function new(string path = "first_mod");
		super.new(path);
	endfunction 
  
	`uvm_object_utils_begin(first_mod)
		`uvm_field_int(ack, UVM_DEFAULT);
	`uvm_object_utils_end
endclass
 
 
 
////////////////////////////////////////////
 
class comp extends uvm_component;		// component having the objects which we want to over ride
	`uvm_component_utils(comp)
  
	first f;
  
	function new(string path = "second", uvm_component parent = null);
		super.new(path, parent);
		f = first::type_id::create("f");
		f.randomize();
		f.print();
	endfunction 
endclass
 
 
/////////////////////////////////////////////
 
module tb;
 
	comp c;
  
	initial begin
		c.set_type_override_by_type(first::get_type, first_mod::get_type); 		//handle_name.set_type_override_by_type(PRESENT_CLASS_NAME::get_type, DESIRED_CLASS_NAME::get_type);
		c = comp::type_id::create("comp", null); 	//instead od class type first object it creates an object of class type first_mod
	end
	
endmodule