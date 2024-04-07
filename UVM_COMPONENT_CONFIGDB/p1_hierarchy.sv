import uvm_pkg::*;
import router_env_pkg::*;

module tb;
	initial begin
		run_test("my_test1");
	end
endmodule

/////////////////////////////////////
// do typedef for environment class
class my_test1 extends uvm_test;
	environment env;
	virtual router_if vif;			//DUT interface 
	
	`uvm_component_utils(my_test1)
	
	function new(string name="my_test1",uvm_component parent =null);
		super.new(name,parent);
	endfunction
	
	virtual function void build_phase(uvm_phase phase);
		`uvm_info("my_test1","build phase start of my_test1",UVM_MEDIUM);
	endfunction
	 
endclass

///////////////////////

class environment extends uvm_env;
	master_agent m_agent;
	slave_agent s_agent;
	scoreboard scb;
	coverage cov;
	
	`uvm_component_utils(environment)
	
	function new(string name="environment",uvm_component parent =null);
		super.new(name,parent);
	endfunction
endclass

///////////////////////////////
class scoreboard extends uvm_scoreboard;
	
	uvm_analysis_port #(packet) mon_in;

	uvm_analysis_port #(packet) mon_out;
	
	`uvm_component_utils(scoreboard)

	function new (string name="scoreboard",uvm_component parent);
		super.new(name,parent);
	endfunction
endclass

/////////////////////////////

class coverage extends uvm_subscriber#(packet);
	real coverage_score;
	
	/*
	covergroup fcov with function sample (packet pkt);
	;
	endgroup
	*/
	
	`uvm_component_utils(coverage)
	
	function new (string name="coverage",uvm_component parent);
		super.new(name,parent);
		//fcov=new;
	endfunction
	
	
endclass

///////////////////////////////

class slave_agent extends uvm_agent;
	oMonitor omon;
	
	uvm_analysis_port #(packet) pass_through_ap_port;

	`uvm_component_utils(slave_agent)
	
	function new(string name="slave_agent",uvm_component parent =null);
		super.new(name,parent);
	endfunction
endclass

/////////////////////////////////

class oMonitor extends uvm_monitor;
	virtual router_if.tb_mon vif;
	
	uvm_analysis_port #(packet) analysis_port;

	`uvm_component_utils(oMonitor)

	function new (string name="iMonitor",uvm_component parent);
		super.new(name,parent);
	endfunction
endclass
	
///////////////////////////////////////////////

class master_agent extends uvm_agent;
	driver drv;
	iMonitor imon;
	sequencer seq;
	
	uvm_analysis_port#(packet) pass_through_ap_port;
	
	`uvm_component_utils(master_agent)
	
	function new(string name="master_agent",uvm_component parent =null);
		super.new(name,parent);
	endfunction
endclass

//////////////////////////////

class driver extends uvm_driver#(packet);
	virtual router_if.tb_mod_port vif;		//DUT interface to drive stimulus
	
	`uvm_component_utils(driver)

	function new(string name="driver",uvm_component parent);
		super.new(name,parent);
	endfunction
endclass

//////////////////////////////

class iMonitor extends uvm_monitor;
	virtual router_if.tb_mon vif;
	
	`uvm_component_utils(iMonitor)

	uvm_analysis_port #(packet) analysis_port;

	function new (string name="iMonitor",uvm_component parent);
		super.new(name,parent);
	endfunction
endclass

//////////////////////////////

class sequencer extends uvm_sequencer#(packet);

	`uvm_component_utils(sequencer)

	function new (string name="sequencer",uvm_component parent);
		super.new(name,parent);
	endfunction
endclass

//////////////////////////////////////

class packet extends uvm_sequence_item;
	`uvm_object_utils(packet)
	
	function new ( string name="packet");
		super.new(name);
	endfunction
endclass
