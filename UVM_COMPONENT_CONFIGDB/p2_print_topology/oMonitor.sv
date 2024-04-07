class oMonitor extends uvm_monitor;
	//virtual router_if.tb_mon vif;
	
	//uvm_analysis_port #(packet) analysis_port;

	`uvm_component_utils(oMonitor)

	function new (string name="iMonitor",uvm_component parent);
		super.new(name,parent);
	endfunction
	
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		
		`uvm_info(get_name(),$sformatf("build phase start of %s",get_type_name()),UVM_MEDIUM);
    endfunction
endclass