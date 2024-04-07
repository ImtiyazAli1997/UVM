//BAsic transaction class using uvm_object extension
// registering int variables using field macros

`include "uvm_macros.svh"
import uvm_pkg::*;
 
class obj extends uvm_object;						// extending from base uvm_object
//  `uvm_object_utils(obj)							//registering out class to factory
													
	function new(string name = "obj");				//fixed constructor format
		super.new(name);
	endfunction
  
	rand bit [3:0] a;
	rand bit [7:0] b;
	rand int data;
														//8]
	`uvm_object_utils_begin(obj)						//registering class to factory with field macros
		`uvm_field_int(a, UVM_NOPRINT | UVM_BIN);			//only one registration is enough out of the 2 shown above
		`uvm_field_int(b, UVM_DEFAULT | UVM_DEC);			//registering variable to the factory with the help of field macros
	`uvm_object_utils_end
endclass
 
module tb;
	obj o1;
  
	initial begin
		o1 = new("obj");
		o1.randomize();	
		
		o1.print();		// this print by default in table format
		//o1.print(uvm_default_table_printer);				// the argument here is the format in which we want to print  
															//by default table format is selected if o1.print(); was used												
		
		/*
		 $display("************1**************");
		o.print();
		$display("*************2*************");
		o.print(uvm_default_table_printer);
		$display("********3******");
		o.print(uvm_default_tree_printer);
		$display("********4******");
		o.print(uvm_default_line_printer);
		*/
	
	end
  
endmodule

/*
Registering class will provide us the ability for factory override

we use field macros inorder to register data members to factory.
8] we can use field macros between 
		`uvm_object_utils_begin(class_name)
				//... field macros here
		`uvm_object_utils_end
9] syntax for field macros
	`uvm_field_[variable_type](VARIABLE_NAME, FLAG);
	
	refer picture "pic01_field_macro_types"
	NOTE : this is only for 2 state and 4 state varibles but for arrays refer the page 454 of reference_manual
	section: 21.2 Utility and Field Macros for Components and Objects

10] the 2nd argument of the field macro is FLAG which can have following values
	[refer page 462 for other flag options]
	
			UVM_ALL_ON				All operations are turned on
			UVM_DEFAULT				Enables all operations and equivalent to UVM_ALL_ON
			UVM_NOCOPY				Do not copy the given variable
			UVM_NOCOMPARE			Do not compare the given variable
			UVM_NOPRINT				Do not print the given variable
			UVM_NOPACK				Do not pack or unpack the given variable
			UVM_REFERENCE			Operate only on handles, i.e. for object types, do not do deep copy, etc
		
		All possible values for FLAG are listed and described above. Multiple flag values can be bitwise OR’ed together
		
*/
/*
we need to provide the format in which we want to print as argument to print method
		1] uvm_default_table_printer		2] uvm_default_tree_printer			3] uvm_default_line_printer

		the first one table format is selected by default if no argument is passed to print method
		example: o1.print(uvm_default_tree_printer);
	*/

/*
the variables which are not registered with factory or registered but have a UVM_NOPRINT FLAG will not be a part of print method

in the above example variable named data will not be displayed in print as its not registered.

*/ 