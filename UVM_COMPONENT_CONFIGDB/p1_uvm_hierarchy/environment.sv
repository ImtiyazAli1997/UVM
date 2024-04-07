class environment extends uvm_env;
	master_agent m_agent;
	slave_agent s_agent;
	scoreboard scb;
	//coverage cov;
	
	`uvm_component_utils(environment)
	
	function new(string name="environment",uvm_component parent =null);
		super.new(name,parent);
	endfunction
endclass