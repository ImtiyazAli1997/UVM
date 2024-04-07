class environment extends uvm_env;
	master_agent m_agent;
	slave_agent s_agent;
	scoreboard scb;
	//coverage cov;
	
	`uvm_component_utils(environment)
	
	function new(string name="environment",uvm_component parent =null);
		super.new(name,parent);
	endfunction
	
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info(get_name(),$sformatf("build phase start of %s",get_type_name()),UVM_MEDIUM);
		
		m_agent=master_agent::type_id::create("m_agent1",this);
		s_agent=slave_agent::type_id::create("s_agent1",this);
		scb=scoreboard::type_id::create("scb1",this);
    endfunction
	
endclass