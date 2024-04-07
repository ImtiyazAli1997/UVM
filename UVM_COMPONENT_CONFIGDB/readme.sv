

1] extends from uvm_component
2] fixed constructor format 

	function new(string name="class_name",uvm_component parent = null);
		super.new(name,parent);
	endfunction

3] register into factory using 
	`uvm_component_utils(class_name)
	
4] we have phases in component category
but no phases in object category

5]some phase functions are
 virtual function void build_phase(uvm_phase phase);					//super.build_phase(phase);		endfunction
 virtual function void connect_phase(uvm_phase phase);
 virtual function void end_of_elaboration_phase(uvm_phase phase);
 virtual function void start_of_simulation_phase(uvm_phase phase);
 
 virtual task pre_reset_phase(uvm_phase phase);
 virtual task reset_phase(uvm_phase phase);
 virtual task post_reset_phase(uvm_phase phase);
 
 virtual task pre_configure_phase(uvm_phase phase);
 virtual task configure_phase(uvm_phase phase);
 virtual task post_configure_phase(uvm_phase phase);
 
 virtual task pre_main_phase(uvm_phase phase);
 virtual task main_phase(uvm_phase phase);
 virtual task post_main_phase(uvm_phase phase);

 virtual task pre_shutdown_phase(uvm_phase phase);
 virtual task shutdown_phase(uvm_phase phase);
 virtual task post_shutdown_phase(uvm_phase phase);
 
 virtual function void extract_phase(uvm_phase phase);
 virtual function void check_phase(uvm_phase phase);
 virtual function void report_phase(uvm_phase phase);
 virtual function void final_phase(uvm_phase phase);
 
 
 6] all the phases which are functions must call their base class respective phase [line 60 of this doc]
	virtual function void build_phase(uvm_phase phase);
			super.build_phase(phase);
			.
			.;
	endfunction
		
 example : inside our class

	class agent extends uvm_agent;
		`uvm_component_utils(agent)
		
		driver drv;
		sequencer seqr;
		monitor imon;
		
		function new (string name ="agent", uvm_component parent =null);
			super.new(name,parent);
		endfunction
		
		virtual function void build_phase(uvm_phase phase);
			super.build_phase(phase);						//as the phase is a function  we have to call base class phase too
			
			drv=driver::type_id::create("drv",this);
			imon=monitor::type_id::create("imon",this);
			seqr=sequencer::type_id::create("seqr",this);
		endfunction
	
	endclass
			
7] when the parent value is null then it that that the component is child to uvm_top	
8] in end of elobration phase call uvm_top.print_topolohy() to print uvm_tree
9]refer p1_hierarchy.sv