class driver extends uvm_driver#(packet);
	//virtual router_if.tb_mod_port vif;		//DUT interface to drive stimulus
	
	`uvm_component_utils(driver)

	function new(string name="driver",uvm_component parent);
		super.new(name,parent);
	endfunction
endclass