class oMonitor extends uvm_monitor;
	//virtual router_if.tb_mon vif;
	
	//uvm_analysis_port #(packet) analysis_port;

	`uvm_component_utils(oMonitor)

	function new (string name="iMonitor",uvm_component parent);
		super.new(name,parent);
	endfunction
endclass