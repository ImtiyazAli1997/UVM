// UVM Reporting
// observe the colors and how it is different from $display
//line number, simulation time message id are printed

`include "uvm_macros.svh"
import uvm_pkg::*;

module tb;
	
	initial begin
		`uvm_info("TB_INFO","hello world with uvm",UVM_LOW);
		
		$display(" hello world with $display");
		
		`uvm_warning("TB_WARNING","this is a warning");
		
		`uvm_error("TB_ERROR","this is a error");
		
		$display("hi");
		`uvm_fatal("TB_FATAL","Fatal stopes the simulation");
		$display(" hello 'this will not be displayed as fatal stops further execution");
	end
endmodule