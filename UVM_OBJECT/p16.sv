/*Create a class "my_object" by extending the UVM_OBJECT class.
 Add three logic datatype datamembers "a", "b", and "c" with sizes of 2, 4, and 8 respectively. 
 Generate a random value for all the data members and send the values of the variables
 to the console by using the print method.
*/

class my_object extends uvm_object;
	rand logic [1:0] a;
	rand logic [3:0] b;
	rand logic [7:0] c;
	
	function new(string name);
		super.new(name);
	endfunction
	
	`uvm_object_utils_begin(my_object)
		`uvm_field_int(a,UVM_DEFAULT)
		`uvm_field_int(b,UVM_DEFAULT)
		`uvm_field_int(c,UVM_DEFAULT)
	`uvm_object_utils_end
endclass

program tb;
	my_object o1;
	
	initial begin
		o1=new("obj1");
		o1.randomize();
		o1.print();
	end
endprogram
	