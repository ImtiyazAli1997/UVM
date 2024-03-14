`include "uvm_macros.svh"
import uvm_pkg::*;
 
//////////////////////////////////////////////////
class driver extends uvm_driver;
	`uvm_component_utils(driver)
  
	function new(string path , uvm_component parent);
		super.new(path, parent);
	endfunction
  
	task run();
		`uvm_info("DRV", "Informational Message", UVM_NONE);
		`uvm_warning("DRV", "Potential Error");
		`uvm_error("DRV", "Real Error");
		#10;
		`uvm_fatal("DRV", "Simulation cannot continue DRV");
		#10;
		`uvm_fatal("DRV1", "Simulation Cannot Continue DRV1");
	endtask  
	
endclass
 
/////////////////////////////////////////////
 
 
module tb;
	driver d;
  
	initial begin
		d = new("DRV", null);
		// d.set_report_severity_override(UVM_FATAL, UVM_ERROR);
		d.set_report_severity_id_override(UVM_FATAL, "DRV", UVM_ERROR);
		d.run();
	end
	
endmodule
/*

	output without any severity conversion
	UVM_INFO p9.sv(13) @ 0: DRV [DRV] Informational Message
	UVM_WARNING p9.sv(14) @ 0: DRV [DRV] Potential Error
	UVM_ERROR p9.sv(15) @ 0: DRV [DRV] Real Error
	UVM_FATAL p9.sv(17) @ 10: DRV [DRV] Simulation cannot continue DRV
*/

/*
	d.set_report_severity_id_override(UVM_FATAL, "DRV", UVM_ERROR);  			//converts the `uvm_fatal messages with message id "DRV" to uvm_error 
	
	output:
	UVM_INFO p9.sv(13) @ 0: DRV [DRV] Informational Message
	UVM_WARNING p9.sv(14) @ 0: DRV [DRV] Potential Error
	UVM_ERROR p9.sv(15) @ 0: DRV [DRV] Real Error
	UVM_ERROR p9.sv(17) @ 10: DRV [DRV] Simulation cannot continue DRV					//this was uvm_fatal but showing as uvm_error
	UVM_FATAL p9.sv(19) @ 20: DRV [DRV1] Simulation Cannot Continue DRV1
	
*/

/*
	d.set_report_severity_override(UVM_FATAL, UVM_ERROR);					// converts all uvm_fatal to uvmm_error
	
	output:
	UVM_INFO p9.sv(13) @ 0: DRV [DRV] Informational Message
	UVM_WARNING p9.sv(14) @ 0: DRV [DRV] Potential Error			
	UVM_ERROR p9.sv(15) @ 0: DRV [DRV] Real Error
	UVM_ERROR p9.sv(17) @ 10: DRV [DRV] Simulation cannot continue DRV				//this was uvm_fatal but showing as uvm_error
	UVM_ERROR p9.sv(19) @ 20: DRV [DRV1] Simulation Cannot Continue DRV1			//this was uvm_fatal but showing as uvm_error
*/

/*
	incase you want to convert all warnings to erros
	d.set_report_severity_override(UVM_WARNING, UVM_ERROR);

*/