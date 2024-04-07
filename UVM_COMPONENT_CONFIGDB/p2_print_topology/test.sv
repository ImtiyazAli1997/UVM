class my_test1 extends uvm_test;
	environment env;
	//virtual router_if vif;			//DUT interface 
	
	`uvm_component_utils(my_test1)
	
	function new(string name="my_test1",uvm_component parent =null);
		super.new(name,parent);
	endfunction
  	
  	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		
       `uvm_info("my_test1","build phase start of my_test1",UVM_MEDIUM);
	   
        env=environment::type_id::create("env1",this);
    endfunction
  
	virtual function void start_of_simulation_phase(uvm_phase phase);
		super.start_of_simulation_phase(phase);
		
		uvm_root::get().print_topology();
		uvm_factory::get().print();
  endfunction
endclass