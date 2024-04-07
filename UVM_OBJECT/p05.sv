//registering static array, dynamic array, associative array, queue of integer type using field macros

`include "uvm_macros.svh"
import uvm_pkg::*;
 
 
class array extends uvm_object;
  
	////////static array
	int arr1[3] = {1,2,3};
  
	///////Dynamic array
	int arr2[];
  
	///////Queue
	int arr3[$];
  
	////////Associative array
	int arr4[int];
  
  
  
	function new(string path = "array");
		super.new(path);
	endfunction 
  
	`uvm_object_utils_begin(array)
		`uvm_field_sarray_int(arr1, UVM_DEFAULT);
		`uvm_field_array_int(arr2, UVM_DEFAULT);
		`uvm_field_queue_int(arr3, UVM_DEFAULT);
		`uvm_field_aa_int_int(arr4, UVM_DEFAULT);
	`uvm_object_utils_end
  
	task run();
    
		///////////////////Dynamic array value update
		arr2 = new[3];
		arr2[0] = 26;
		arr2[1] = 29;
		arr2[2] = 27;
		
		///////////////////Queue
		arr3.push_front(38);
		arr3.push_front(31);
    
		////////////////////Associative arrays
		arr4[100] = 46;
		arr4[20] = 42;
		arr4[34] = 47;
		arr4[45] = 41;
	endtask
endclass
 
////////////////////////////////////////////
 
module tb;
	array a;
  
	initial begin
		a = new("array");
		a.run();
		a.print();
	end
  
endmodule