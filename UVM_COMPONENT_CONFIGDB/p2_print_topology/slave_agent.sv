class slave_agent extends uvm_agent;
	oMonitor omon;
	
	//uvm_analysis_port #(packet) pass_through_ap_port;

	`uvm_component_utils(slave_agent)
	
	function new(string name="slave_agent",uvm_component parent =null);
		super.new(name,parent);
	endfunction
	
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		
		`uvm_info(get_name(),$sformatf("build phase start of %s",get_type_name()),UVM_MEDIUM);
		
		omon=oMonitor::type_id::create("omon1",this);
    endfunction
endclass