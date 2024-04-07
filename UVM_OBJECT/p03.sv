// registering a child object to factory from a parent class

`include "uvm_macros.svh"
import uvm_pkg::*;
 
class child extends uvm_object;
  
	function new(string path = "child");
		super.new(path);
	endfunction 
  
	rand bit [3:0] data;
  
	`uvm_object_utils_begin(child)
		`uvm_field_int(data,UVM_DEFAULT);
	`uvm_object_utils_end
endclass
 
class parent extends uvm_object;
  
	child c;
  
	function new(string path = "child");
		super.new(path);
		c = new("child_1");		// this will be done in the build phase for components
	endfunction 
  
	`uvm_object_utils_begin(parent)
		`uvm_field_object(c,UVM_DEFAULT);
	`uvm_object_utils_end
endclass
 
module tb;
	parent p;
  
	initial begin
		p = new("Father");
		p.c.randomize();		//if we use only p.randomise only then it will only randomize member of parent class not the child
		p.print();
	end
endmodule
