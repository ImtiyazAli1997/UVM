//do_copy()
`include "uvm_macros.svh"
import uvm_pkg::*;
 
class obj extends uvm_object;
	`uvm_object_utils(obj)
  
	function new(string path = "obj");
		super.new(path);
	endfunction
  
	rand bit [3:0] a;
	rand bit [4:0] b,d;
   
	virtual function void do_print(uvm_printer printer);
		super.do_print(printer);
		printer.print_field_int("a :", a, $bits(a), UVM_DEC);
		printer.print_field_int("b :", b, $bits(b), UVM_DEC);
	endfunction
  
  
	virtual function void do_copy(uvm_object rhs);
		//next 3 lines are deafault for every do_copy()
		obj temp;							//PRESENT_CLASS_NAME  handle_name;
		$cast(temp, rhs);					//$case(handle_name,rhs);		//rhs is of type uvm_object [base]
		super.do_copy(rhs);					//super.do_copy(rhs) 	copies the extra properties which are in uvm_object [base class]
    
		//her we copy the variables which we declared in present derived class
		this.a = temp.a;
		this.b = temp.b;
		//not copying d as the user doen't want it.
	endfunction
endclass  
 
 
module tb;
	obj o1,o2;
  
	initial begin
		o1 = obj::type_id::create("o1");
		o2 = obj::type_id::create("o2");
    
		
		o1.randomize();
		o1.print();
		o2.copy(o1);
		o2.print();
	end
endmodule