/*
Comparing two objects of the class.

1) Create a class "my_object" by extending the UVM_OBJECT class. 
Add three logic datatype datamembers "a", "b", and "c" with sizes of 2, 4, and 8 respectively.

2) Create two objects of my_object class in TB Top. 
Generate random data for data members of one of the object and then 
copy the data to other object by using clone method.

3) Compare both objects and send the status of comparison to Console using Standard UVM reporting macro.
 Add User defined implementation for the copy method.

*/

class my_object extends uvm_object;
	rand logic [1:0] a;
	rand logic [3:0] b;
	rand logic [7:0] c;
	
	function new(string name="my_object");
		super.new(name);
	endfunction
	
	virtual function void do_copy (uvm_object rhs);
		my_object temp_cast;
		if(!$cast(temp_cast,rhs))
			`uvm_error("CAST FAIL","in copy function the cast failed from rhs [uvm_object] to temp[present class object]");
		
		super.do_copy(temp_cast);
		
		this.a=temp_cast.a;
		this.b=temp_cast.b;
		this.c=temp_cast.c;
		`uvm_info("OBJ_DO_COPY","ended",UVM_DEBUG);
	endfunction
	
	virtual function bit do_compare (uvm_object rhs,uvm_comparer comparer);
		my_object temp_cast;
		if(!$cast(temp_cast,rhs))
			`uvm_error("CAST FAIL","in copy function the cast failed from rhs [uvm_object] to temp[present class object]");
		
		do_compare=super.do_compare(temp_cast,comparer);
		`uvm_info("OBJ_DO_COPY","started",UVM_DEBUG);
		case(0)
			this.a==temp_cast.a	:	return 0;
			this.b==temp_cast.b	:	return 0;
			this.c==temp_cast.c	:	return 0;
			//default	:	return do_compare;
		endcase
		
	 endfunction
	
	virtual function string convert2string();
		string str;
		
		str=$sformatf("a=%0d \t b=%0d \t c=%0d",a,b,c);
		
		return str;
	endfunction
	
	 `uvm_object_utils_begin(my_object)
		`uvm_field_int(a,UVM_DEFAULT)
		`uvm_field_int(b,UVM_DEFAULT)
		`uvm_field_int(c,UVM_DEFAULT)
	`uvm_object_utils_end
endclass

program tb;
	my_object o1,o2,o3;
	
	initial begin
		o1=new("obj1");
		o1.randomize();
		o1.print();
		
		$cast(o2,o1.clone());	//this o1.clone() will call do_copy()
		o2.print();
		`uvm_info("O1 CMP",$sformatf("o1 comparison o2 status =%0d",o1.compare(o2)),UVM_NONE);
		
		o3=my_object::type_id::create("obj3");
		o3.copy(o1);
		o3.print();
		`uvm_info("O1 CMP",$sformatf("o1 comparison o3 status =%0d",o1.compare(o3)),UVM_NONE);
	end
	
	
	
endprogram


/*
initial begin
		o1=my_object::type_id::create("obj1");
		o1.randomize();
		o1.print();
      `uvm_info("DATA",$sformatf("%0s \n",o1.convert2string()),UVM_MEDIUM);
		
      #2;
      `uvm_info("CLONE","o1 is cloned to O2",UVM_NONE);
		$cast(o2,o1.clone());
		o2.print();
      `uvm_info("DATA",$sformatf("%0s \n",o2.convert2string()),UVM_MEDIUM);
      `uvm_info("O2 CMP",$sformatf("o1 comparison o2 status =%0d\n\n",o1.compare(o2)),UVM_NONE);
		
      #2;
      `uvm_info("COPY","o1 COPY to O3",UVM_NONE);
		o3=my_object::type_id::create("obj3");
		o3.copy(o1);
		o3.print();
      `uvm_info("DATA",$sformatf("%0s \n",o3.convert2string()),UVM_MEDIUM);
		`uvm_info("O1 CMP",$sformatf("o1 comparison o3 status =%0d",o1.compare(o3)),UVM_NONE);
	end
	*/
	