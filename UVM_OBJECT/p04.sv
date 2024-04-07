//registering child objects using field macros from a parent class
`include "uvm_macros.svh"
import uvm_pkg::*;

class A;
	rand int data1;
	rand int data2;
	
	function new(string name="child");
		super.new(name);
	endfunction
	
	`uvm_object_utils_begin(A)
		`uvm_field_int(data1,UVM_DEFAULT)
	`uvm_object_utils_end
endclass
		
class B;
	rand int address;
	A a1,a2;
			
	function new(string name="parent");
		super.new(name);
		a1=new("child1_karan");
		a2=new("child2_arjun");
	endfunction
	
	`uvm_object_utils_begin(B)
		`uvm_field_int(address,UVM_DEFAULT)
		`uvm_field_object(a1,UVM_DEFAULT)		//object a1 and a2 are registered
		`uvm_field_object(a2,UVM_DEFAULT | UVM_DEC)		//page 453 for UVM_DEC
	`uvm_object_utils_end
endclass

module tb;
	B parent;
	
	initial begin
		parent=new("mother_indra");
		
		$display("*****parent_randomised********");
		parent.randomize();	//this will only randomuze address variable
		parent.print();					//
		
		$display("*****child_a1_randomised********");		
		parent.a1.randomize();	//this will randomize data1 and data2 of a1 object
		parent.print();
		
		$display("*****child_a2_randomised********");
		parent.a2.randomize();	//this will randomize data1 and data2 of a2 object
		parent.print();
	end
endmodule	