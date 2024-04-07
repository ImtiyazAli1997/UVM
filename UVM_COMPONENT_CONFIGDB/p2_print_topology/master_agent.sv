class master_agent extends uvm_agent;
	driver drv;
	iMonitor imon;
	sequencer seqr;
	
	//uvm_analysis_port#(packet) pass_through_ap_port;
	
	`uvm_component_utils(master_agent)
	
	function new(string name="master_agent",uvm_component parent =null);
		super.new(name,parent);
	endfunction
	
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		
		`uvm_info(get_name(),$sformatf("build phase start of %s",get_type_name()),UVM_MEDIUM);
		
		drv=driver::type_id::create("drv1",this);
		imon=iMonitor::type_id::create("imon1",this);
		seqr=sequencer::type_id::create("seqr1",this);
    endfunction
endclass