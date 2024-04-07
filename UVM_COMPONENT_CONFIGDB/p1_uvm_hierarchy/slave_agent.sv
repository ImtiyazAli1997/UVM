class slave_agent extends uvm_agent;
	oMonitor omon;
	
	//uvm_analysis_port #(packet) pass_through_ap_port;

	`uvm_component_utils(slave_agent)
	
	function new(string name="slave_agent",uvm_component parent =null);
		super.new(name,parent);
	endfunction
endclass