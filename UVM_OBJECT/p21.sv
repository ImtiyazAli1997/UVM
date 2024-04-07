`include "uvm_macros.svh"
import uvm_pkg::*;

typedef enum{RED, GREEN, BLUE} color_type;

class temp_class extends uvm_object;
	rand bit [7:0] tmp_addr;
	rand bit [7:0] tmp_data;
	
	function new(string name = "temp_class");
		super.new(name);
	endfunction
  
	`uvm_object_utils(temp_class)
    
	function void do_print(uvm_printer printer);
		super.do_print(printer);
		printer.print_field_int("tmp_addr", tmp_addr, $bits(tmp_addr), UVM_HEX);
		printer.print_field_int("tmp_data", tmp_data, $bits(tmp_data), UVM_HEX);
	endfunction
  
	function void do_pack(uvm_packer packer);
		super.do_pack(packer);
		packer.pack_field_int(tmp_addr, $bits(tmp_addr));
		packer.pack_field_int(tmp_data, $bits(tmp_data));
	endfunction
  
	function void do_unpack(uvm_packer packer);
		super.do_unpack(packer);
		tmp_addr = packer.unpack_field_int($bits(tmp_addr));
		tmp_data = packer.unpack_field_int($bits(tmp_data));
	endfunction
endclass

class my_object extends uvm_object;
	rand int        value;
	rand color_type colors;
	rand byte       data[4];
	rand bit [7:0]  addr;
	rand temp_class tmp;
  
	`uvm_object_utils(my_object)
  
	function new(string name = "my_object");
		super.new(name);
		tmp = new();
	endfunction
  
	function void do_print(uvm_printer printer);
		super.do_print(printer);
		printer.print_field_int("value", value, $bits(value), UVM_HEX);
		printer.print_string("colors", colors.name);
    
		foreach(data[i])
			printer.print_field_int($sformatf("data[%0d]", i), data[i], $bits(data[i]), UVM_HEX);
    
		printer.print_field_int("addr", addr, $bits(addr), UVM_HEX);
		printer.print_object("tmp", tmp);
	endfunction
  
	function void do_pack(uvm_packer packer);
		super.do_pack(packer);
		packer.pack_field_int(value, $bits(value));
		packer.pack_field_int(colors, $bits(colors));
		
		foreach(data[i])
			packer.pack_field_int(data[i], $bits(data[i]));
		
		packer.pack_field_int(addr, $bits(addr));
		packer.pack_object(tmp);
	endfunction
  
	function void do_unpack(uvm_packer packer);
		super.do_unpack(packer);
		value = packer.unpack_field_int($bits(value));
		colors = packer.unpack_field_int($bits(colors));
    
		foreach(data[i])
			data[i] = packer.unpack_field_int($bits(data[i]));
		
		addr = packer.unpack_field_int($bits(addr));
		packer.unpack_object(tmp);
	endfunction
endclass

class my_test extends uvm_test;
	`uvm_component_utils(my_test)
	my_object obj;
	bit packed_data_bits[];
	byte unsigned packed_data_bytes[];
	int unsigned packed_data_ints[];
  
	my_object unpack_obj;
  
	int pack_values[3];
	int unpack_values[3];
  
	function new(string name = "my_test", uvm_component parent = null);
		super.new(name, parent);
	endfunction
  
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		
		obj = my_object::type_id::create("obj", this);
		assert(obj.randomize());
		
		`uvm_info(get_full_name(), $sformatf("obj = \n%s", obj.sprint()), UVM_LOW);
    
		// pack methods
		pack_values[0] = obj.pack(packed_data_bits);
		pack_values[1] = obj.pack_bytes(packed_data_bytes);
		pack_values[2] = obj.pack_ints(packed_data_ints);
		
		`uvm_info(get_full_name(), $sformatf("packed_data_bits = %p", packed_data_bits), UVM_LOW);
		`uvm_info(get_full_name(), $sformatf("packed_data_bytes = %p", packed_data_bytes), UVM_LOW);
		`uvm_info(get_full_name(), $sformatf("packed_data_ints = %p", packed_data_ints), UVM_LOW);
		`uvm_info(get_full_name(), $sformatf("pack_values[BITS] = %0d, pack_values[BYTES] = %0d, pack_values[INTS] = %0d", pack_values[0], pack_values[1], pack_values[2]), UVM_LOW);
    
		// unpack methods
		unpack_obj = my_object::type_id::create("unpack_obj", this);
		unpack_values[0] = unpack_obj.unpack(packed_data_bits);
		`uvm_info(get_full_name(), $sformatf("bits: unpack_obj = \n%s", unpack_obj.sprint()), UVM_LOW);
		
		unpack_values[1] = unpack_obj.unpack_bytes(packed_data_bytes);
		`uvm_info(get_full_name(), $sformatf("bytes: unpack_obj = \n%s", unpack_obj.sprint()), UVM_LOW);
		
		unpack_values[2] = unpack_obj.unpack_ints(packed_data_ints);
		`uvm_info(get_full_name(), $sformatf("ints: unpack_obj = \n%s", unpack_obj.sprint()), UVM_LOW);
		
		`uvm_info(get_full_name(), $sformatf("unpack_values[BITS] = %0d, unpack_values[BYTES] = %0d, unpack_values[INTS] = %0d", unpack_values[0], unpack_values[1], unpack_values[2]), UVM_LOW);
	endfunction
endclass

module tb_top;
	initial begin
		run_test("my_test");
	end
endmodule