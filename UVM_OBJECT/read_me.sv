1] driver,scoreboard, monitor remains during the whole simulation are referred to as static components
whereas when we consider a transaction for each stimulus we create a new transaction and will exists in simulation until we
apply it to DUT collect its response and compare with the golden result.
after comparison the transaction is deallocated.
So Transaction are referred as dynamic component

In UVM we build the dynamic component by extending from uvm_object whereas
static component we extend from uvm_component

but in actual we also have predefined set of classes with extra features which are required for that particular component

we have uvm_sequence_item for transaction

these seperately constructed classes (uvm_driver, uvm_monitor) are actually extending from these base classes uvm_object and uvm_component itself.
 
 
uvm_component is also extended form uvm_object

uvm_component has uvm_tree whereas object won't have tree
uvm_component also have uvm_phases which are not available in uvm_object


for working with the dynamic components in uvm verification enironment we use

	1] uvm_transaction
	2] uvm_sequence_item
	3] uvm_sequence
	
for static component we use
	1] uvm_sequencer 			2] uvm_driver
	3] uvm_monitor			 
	4] uvm_agent				5] uvm_env
	6] uvm_scoreboard			7] uvm_test

from these existing classes we extend our own classes for uvm_verification environment

uvm provides automation 
as we know Transaction object span independent of time we send a deep copy of the transaction

other common operations with transaction object includes print,compare,create object

for these we have a set of methods which provide us automation and these are referred to as core method 

the following methods are referred to as core methods	
		1] print			2] record			3] copy			4]compare
		5] create			6]clone				7] pack			8]unpack

as these are the frequent operations we do with the transaction class

Two ways of implemenatation of core methods	
	1] field macros  [data members -> use field macros -> call the core method]
				we need not specify the definition of the function
				just need to register the variables which we need in the function using the field macros
	2] do_methods or do hooks [specify user implementation for core method -> call the core method]
				we have to give the definition[body of function] of all the methods 
				use the appropriate prototype of the method
				need not register the variables using field macros
				when we call the print function autmatically do_print will be called by the uvm [we need not call do_print specifically]
			check prototypes here for do_ methods [pic03_do_method ]
			https://github.com/edaplayground/eda-playground/blob/master/docs/_static/uvm-1.2/src/base/uvm_object.svh
	
[page:461]
The `uvm_field_* macros are invoked inside of the `uvm_*_utils_begin and
`uvm_*_utils_end macro blocks to form “automatic” implementations of the core data
methods: copy, compare, pack, unpack, record, print, and sprint.

By using the macros, you do not have to implement any of the do_* methods inherited
from uvm_object. However, be aware that the field macros expand into general inline
code that is not as run-time efficient nor as flexible as direct implementations of the
do_* methods.



refer p01.sv 
2] it extends from uvm_object
	class my_obj extends uvm_object
	
	As we know object class is used to implement all the dynamic components of test bench example Transaction class
	
3] register the class to a factory using maccro
	`uvm_object_utils(class_name) 			is the macro to register class to factory derived from UVM_OBJECT
	
4] as our class is created by extending UVM_OBJECT class hence constructor format need to exactly as defined in uvm library
	
	therefore fixed contructor format as its skeleton[prototype] is present in the base class
	// STANDARD FORMMAT OF THE CONSTRUCTOR for object category 
	//the default value of argument is the same as  class name and its mandatory to give default argument
	
	function (string name="our_class_name");
		super.new(name);
	endfunction

5] Registering class will provide us the ability for factory override
6] using field macros for data members provide us the capability to use methods such as print, copy, compare
7] we use field macros inorder to register data members to factory.
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
	refer picture "pic02_uvm_field_macro_flags"
	
			UVM_ALL_ON				All operations are turned on
			UVM_DEFAULT				Enables all operations and equivalent to UVM_ALL_ON
			UVM_NOCOPY				Do not copy the given variable
			UVM_NOCOMPARE			Do not compare the given variable
			UVM_NOPRINT				Do not print the given variable
			UVM_NOPACK				Do not pack or unpack the given variable
			UVM_REFERENCE			Operate only on handles, i.e. for object types, do not do deep copy, etc
		
		All possible values for FLAG are listed and described above. Multiple flag values can be bitwise OR’ed together
		
11] for calling the uvm implemented method is same as how we used to do in system verilog
	handle_name.method_name(arguments_if_any);
	
		example: o1.print();			//displays by default in table format

	reference_manual page 501 uvm_printer provides different formats
	we need to provide the format in which we want to print as argument to print method
		1] uvm_default_table_printer		2] uvm_default_tree_printer			3] uvm_default_line_printer

		the first one table format is selected by default if no argument is passed to print method
		example: o1.print(uvm_default_tree_printer);
	
12]the variables which are not registered with factory or registered but have a UVM_NOPRINT FLAG will not be a part of print method

if we don't want to use the available methods by UVM we can implement out own methods but we have to follow certain rules
 
do_* methods require implementation of the methods by user

13] example [refer p02.sv]to register a enum, real and string variable we

		`uvm_field_enum(ENUM_DATA_TYPE, ENUM_VARIABLE, FLAG);		//the first argument is the enum data type, 2nd is the enum variable and 3rd is the FLAG
		`uvm_field_string(STRING_VARIABLE,FLAG);
		`uvm_field_real(REAL_VARIABLE, FLAG);
		
14] example [refer p03.sv and p04.sv]
		class A;
			int data;
		endclass
		
		class B;
			int address;
			A a1,a2;
			
			function new();
				a1=new();
				a2=new();
			endfunction
		endclass
		
		here B is called parent class for objects refered by handles a1 and a2
		remember to construct them when constructor of B class is called


		registering a child object [a1,a2] to factory from a parent class [B]
		we use the below field macros to do so
		
		`uvm_field_object(child_handle_name,FLAG);
		
		get_type_name() function return a string which is the name of the class
		get_name() will return the string which is in the name variable of the constructor
		get_full_name() will return the Returns the full hierarchical name of this object.
		
15] example [refer p05.sv]
	registering static array, dynamic array, associative array, queue of integer type using field macros.
	////////static array
	int arr1[3] = {1,2,3};
  
	///////Dynamic array
	int arr2[];
  
	///////Queue
	int arr3[$];
  
	////////Associative array
	int arr4[int];
  
  
	`uvm_object_utils_begin(array)
		`uvm_field_sarray_int(arr1, UVM_DEFAULT);
		`uvm_field_array_int(arr2, UVM_DEFAULT);
		`uvm_field_queue_int(arr3, UVM_DEFAULT);
		`uvm_field_aa_int_int(arr4, UVM_DEFAULT);
	`uvm_object_utils_end
	
	refer page 455 of reference manual for different field macros of arrays
	
16] copy() and clone() functions
	->constructor has to be called for the destination_handle =new();
	->destination_handle.copy(source_handle);
	
	clone
	->$cast(destination_handle,source_handle.clone());
	->source_handle.clone() will return an object of type base class [uvm_object].
		instead of our derived class  handle it will return the base class handle
		if we use destination_handle=source_handle.clone()
		
			error:
			 Expression 'f.clone()' on rhs is not a class or a compatible class and hence cannot be assigned to a class handle on lhs.
	
	refer p07.sv 

17] shallow copy vs deep copy
18] handle1.compare(handle2);
19] create()
when using uvm its recommended to construct objects using create() method instead of new() method


syntax for creating object is
class_name handle_name;		//handle declaration
handle_name = class_name::type_id::create(STRING_ARGUMENT,[PARENT_ARGUMENT]);		//object construction inside function or initial block

difference between new() and create()

The create method allocates a new object of the same type
as this object and returns it via the base uvm_object handle.
The difference between new and create is that the former
allocates memory for the current object whereas the latter
returns the handle for a different object allocated elsewhere.



20] Factory over rides:
with the help of factory override we can replace the creation of an object of a particular class type to other class type.

syntax
handle_name.set_type_override_by_type(PRESENT_CLASS_NAME::get_type, DESIRED_CLASS_NAME::get_type); 

we need not change the code 
//the only condition is that the DESIRED_CLASS need to be an extendion of PRESENT_CLASS			//validate this 

class DESIRED_CLASS_NAME extends PRESENT_CLASS_NAME;
....
endclass

21] If we plan to use do methods, field macros are not required but registering class to factory is mandatory 
to get capabilities of factory override

If you plan to use inbuilt implementation of the core methods then registering class to factory as well as 
adding field macros to the data members is mandatory


22] do_print() method

refer page 26 for prototype format

virtual function void do_print ( uvm_printer printer );

<print> and  <sprint> function internally calls do_print()
// Function: do_print
  //
  // The ~do_print~ method is the user-definable hook called by <print> and
  // <sprint> that allows users to customize what gets printed or sprinted 
  // beyond the field information provided by the `uvm_field_* macros,
  // <Utility and Field Macros for Components and Objects>.
  //
  // The ~printer~ argument is the policy object that governs the format and
  // content of the output. To ensure correct <print> and <sprint> operation,
  // and to ensure a consistent output format, the ~printer~ must be used
  // by all <do_print> implementations. That is, instead of using ~$display~ or
  // string concatenations directly, a ~do_print~ implementation must call
  // through the ~printer's~ API to add information to be printed or sprinted.
  //
  // An example implementation of ~do_print~ is as follows:
  //
  //| class mytype extends uvm_object;
  //|   data_obj data;
  //|   int f1;
  //|   virtual function void do_print (uvm_printer printer);
  //|     super.do_print(printer);
  //|     printer.print_field_int("f1", f1, $bits(f1), UVM_DEC);
  //|     printer.print_object("data", data);
  //|   endfunction
  //
  // Then, to print and sprint the object, you could write:
  //
  //| mytype t = new;
  //| t.print();
  //| uvm_report_info("Received",t.sprint());
  //
  // See <uvm_printer> for information about the printer API. [page 501]

	refer p12.sv
	
23]convert2string();
	prototype
	virtual function string convert2string();
	
	// Function: convert2string
  //
  // This virtual function is a user-definable hook, called directly by the
  // user, that allows users to provide object information in the form of
  // a string. Unlike <sprint>, there is no requirement to use a <uvm_printer>
  // policy object. As such, the format and content of the output is fully
  // customizable, which may be suitable for applications not requiring the
  // consistent formatting offered by the <print>/<sprint>/<do_print>
  // API.
  //
  // Fields declared in <Utility Macros> macros (`uvm_field_*), if used, will
  // not automatically appear in calls to convert2string.
  //
  // An example implementation of convert2string follows.
  // 
  //| class base extends uvm_object;
  //|   string field = "foo";
  //|   virtual function string convert2string();
  //|     convert2string = {"base_field=",field};
  //|   endfunction
  //| endclass
  //| 
  //| class obj2 extends uvm_object;
  //|   string field = "bar";
  //|   virtual function string convert2string();
  //|     convert2string = {"child_field=",field};
  //|   endfunction
  //| endclass
  //| 
  //| class obj extends base;
  //|   int addr = 'h123;
  //|   int data = 'h456;
  //|   bit write = 1;
  //|   obj2 child = new;
  //|   virtual function string convert2string();
  //|      convert2string = {super.convert2string(),
  //|        $sformatf(" write=%0d addr=%8h data=%8h ",write,addr,data),
  //|        child.convert2string()};
  //|   endfunction
  //| endclass
  //
  // Then, to display an object, you could write:
  //
  //| obj o = new;
  //| uvm_report_info("BusMaster",{"Sending:\n ",o.convert2string()});
  //
  // The output will look similar to:
  //
  //| UVM_INFO @ 0: reporter [BusMaster] Sending:
  //|    base_field=foo write=1 addr=00000123 data=00000456 child_field=bar

refer p13.sv
24]do_copy()
prototype:
	extern function void copy (uvm_object rhs);
	
	<copy> and  <clone> function internally calls do_copy()

  // Function: do_copy
  //
  // The ~do_copy~ method is the user-definable hook called by the <copy> method.
  // A derived class should override this method to include its fields in a <copy>
  // operation.
  //
  // A typical implementation is as follows:
  //
  //|  class mytype extends uvm_object;
  //|    ...
  //|    int f1;
  //|    function void do_copy (uvm_object rhs);
  //|      mytype rhs_;						//here we are cating argument rhs into present class
  //|      super.do_copy(rhs);
  //|      $cast(rhs_,rhs);
  //|      field_1 = rhs_.field_1;			//here we copy the fields which we want 
  //|    endfunction
  //
  // The implementation must call ~super.do_copy~, and it must $cast the rhs
  // argument to the derived type before copying. 

  extern virtual function void do_copy (uvm_object rhs);


25]do_compare;

	// Group: Comparing

  // Function: compare
  //
  // Deep compares members of this data object with those of the object provided
  // in the ~rhs~ (right-hand side) argument, returning 1 on a match, 0 otherwise.
  //
  // The ~compare~ method is not virtual and should not be overloaded in derived
  // classes. To compare the fields of a derived class, that class should
  // override the <do_compare> method.
  //
  // The optional ~comparer~ argument specifies the comparison policy. It allows
  // you to control some aspects of the comparison operation. It also stores the
  // results of the comparison, such as field-by-field miscompare information
  // and the total number of miscompares. If a compare policy is not provided,
  // then the global ~uvm_default_comparer~ policy is used. See <uvm_comparer> 
  // for more information.

  extern function bit compare (uvm_object rhs, uvm_comparer comparer=null);


  // Function: do_compare
  //
  // The ~do_compare~ method is the user-definable hook called by the <compare>
  // method. A derived class should override this method to include its fields
  // in a compare operation. It should return 1 if the comparison succeeds, 0
  // otherwise.
  //
  // A typical implementation is as follows:
  //
  //|  class mytype extends uvm_object;
  //|    ...
  //|    int f1;
  //|    virtual function bit do_compare (uvm_object rhs,uvm_comparer comparer);
  //|      mytype rhs_;
  //|      do_compare = super.do_compare(rhs,comparer);
  //|      $cast(rhs_,rhs);								//this.f1
  //|      do_compare &= comparer.compare_field_int("f1", f1, rhs_.f1);
  //|    endfunction
  //
  // A derived class implementation must call ~super.do_compare()~ to ensure its
  // base class' properties, if any, are included in the comparison. Also, the
  // rhs argument is provided as a generic uvm_object. Thus, you must ~$cast~ it
  // to the type of this object before comparing. 
  //
  // The actual comparison should be implemented using the uvm_comparer object
  // rather than direct field-by-field comparison. This enables users of your
  // class to customize how comparisons are performed and how much miscompare
  // information is collected. See uvm_comparer for more details.
  
  extern virtual function bit do_compare (uvm_object  rhs, uvm_comparer comparer);

 //do_compare() example is not implemented [try it out later]
 
 
 
 
 
 26] pack and do_pack();
 
 extern function int pack (ref bit bitstream[], input uvm_packer packer=null);

  // Function: pack_bytes

  extern function int pack_bytes (ref byte unsigned bytestream[],input uvm_packer packer=null);

  // Function: pack_ints
  //
  // The pack methods bitwise-concatenate this object's properties into an array
  // of bits, bytes, or ints. The methods are not virtual and must not be
  // overloaded. To include additional fields in the pack operation, derived
  // classes should override the <do_pack> method.
  //
  // The optional ~packer~ argument specifies the packing policy, which governs
  // the packing operation. If a packer policy is not provided, the global
  // <uvm_default_packer> policy is used. See <uvm_packer> for more information.
  //
  // The return value is the total number of bits packed into the given array.
  // Use the array's built-in ~size~ method to get the number of bytes or ints
  // consumed during the packing process.

  extern function int pack_ints (ref int unsigned intstream[], input uvm_packer packer=null);
  
  
  // Function: do_pack
  //
  // The ~do_pack~ method is the user-definable hook called by the <pack> methods.
  // A derived class should override this method to include its fields in a pack
  // operation.
  //
  // The ~packer~ argument is the policy object for packing. The policy object
  // should be used to pack objects. 
  //
  // A typical example of an object packing itself is as follows
  //
  //|  class mysubtype extends mysupertype;
  //|    ...
  //|    shortint myshort;
  //|    obj_type myobj;
  //|    byte myarray[];
  //|    ...
  //|    function void do_pack (uvm_packer packer);
  //|      super.do_pack(packer); // pack mysupertype properties
  //|      packer.pack_field_int(myarray.size(), 32);
  //|      foreach (myarray)
  //|        packer.pack_field_int(myarray[index], 8);
  //|      packer.pack_field_int(myshort, $bits(myshort));
  //|      packer.pack_object(myobj);
  //|    endfunction
  //
  // The implementation must call ~super.do_pack~ so that base class properties
  // are packed as well.
  //
  // If your object contains dynamic data (object, string, queue, dynamic array,
  // or associative array), and you intend to unpack into an equivalent data
  // structure when unpacking, you must include meta-information about the
  // dynamic data when packing as follows.
  //
  //  - For queues, dynamic arrays, or associative arrays, pack the number of
  //    elements in the array in the 32 bits immediately before packing
  //    individual elements, as shown above.
  //
  //  - For string data types, append a zero byte after packing the string
  //    contents.
  //
  //  - For objects, pack 4 bits immediately before packing the object. For ~null~
  //    objects, pack 4'b0000. For non-~null~ objects, pack 4'b0001.
  //
  // When the `uvm_field_* macros are used, 
  // <Utility and Field Macros for Components and Objects>,
  // the above meta information is included provided the <uvm_packer::use_metadata> 
  // variable is set for the packer.
  //
  // Packing order does not need to match declaration order. However, unpacking
  // order must match packing order.

  extern virtual function void do_pack (uvm_packer packer);
  
  
  
  
  
 self:
 do_compare() program example is pending
 
 pack_bytes
 do_pack()
 
 do_record()