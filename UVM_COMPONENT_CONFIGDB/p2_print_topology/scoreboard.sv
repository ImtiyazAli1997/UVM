class scoreboard extends uvm_scoreboard;
	
	//uvm_analysis_port #(packet) mon_in;

	//uvm_analysis_port #(packet) mon_out;
	
	`uvm_component_utils(scoreboard)

	function new (string name="scoreboard",uvm_component parent);
		super.new(name,parent);
	endfunction
	
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info(get_name(),$sformatf("build phase start of %s",get_type_name()),UVM_MEDIUM);
    endfunction
	
endclass