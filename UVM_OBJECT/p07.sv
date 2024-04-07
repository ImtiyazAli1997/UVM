//copy and clone functions
`include "uvm_macros.svh"
import uvm_pkg::*;
 
class child extends uvm_object;
  
	function new(string path = "child");
		super.new(path);
	endfunction 
  
	rand bit [3:0] data1,data2;
  
	constraint data { data1!=data2;}
	`uvm_object_utils_begin(child)
		`uvm_field_int(data1,UVM_DEFAULT);
		`uvm_field_int(data2,UVM_DEFAULT|UVM_NOCOPY);		//this will not be copied
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
	parent p1,p1_copy,p1_clone;
  
	initial begin
		p1 = new("Father");
		p1.c.randomize();		//if we use only p.randomise only then it will only randomize member of parent class not the child
		p1.print();
		
		//copying
		p1_copy=new("Father_copy");		//contructor call
		p1_copy.copy(p1);				//copy function is used
		p1_copy.print();
		
		//cloning
		$cast(p1_clone,p1.clone());		//direct clone is casted 
		p1_clone.print();	
	end 
endmodule