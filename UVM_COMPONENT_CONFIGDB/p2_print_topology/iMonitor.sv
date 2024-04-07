class iMonitor extends uvm_monitor;
	//virtual router_if.tb_mon vif;
	
	`uvm_component_utils(iMonitor)

	//uvm_analysis_port #(packet) analysis_port;

	function new (string name="iMonitor",uvm_component parent);
		super.new(name,parent);
	endfunction
endclass