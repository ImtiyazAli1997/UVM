// do_print() method 
`include "uvm_macros.svh"
import uvm_pkg::*;
 
class obj extends uvm_object;
	`uvm_object_utils(obj)
  
	function new(string path = "OBJ");
		super.new(path);
	endfunction
  
	bit [3:0] a = 4;
	string b = "UVM";
	real c   = 12.34;
  
	virtual function void do_print(uvm_printer printer);			// we need not worry about the argument as we call print(); method not do_print(); this wll automatically be taken care of
		super.do_print(printer);
    
		printer.print_field_int("a", a, $bits(a), UVM_HEX);			//$bits return number of bits in variable passed to it
		printer.print_string("b", b);								// the printer handle is used as per the example in the uvm_object.svh file
		printer.print_real("c", c);
    endfunction
endclass  
 
 
module tb;
	obj o;
  
	initial begin
		o = obj::type_id::create("o");
		o.print();
		`uvm_info("S_print","output os s print \n %s",o.sprint)
	end
endmodule
/*
https://github.com/edaplayground/eda-playground/blob/master/docs/_static/uvm-1.2/src/base/uvm_object.svh

line 286-319
*/