class master_agent extends uvm_agent;
	driver drv;
	iMonitor imon;
	sequencer seqr;
	
	//uvm_analysis_port#(packet) pass_through_ap_port;
	
	`uvm_component_utils(master_agent)
	
	function new(string name="master_agent",uvm_component parent =null);
		super.new(name,parent);
	endfunction
endclass