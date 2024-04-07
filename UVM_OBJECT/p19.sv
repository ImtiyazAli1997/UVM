class Packet extends uvm_object;
	rand bit [3:0] m_addr;
	rand bit [3:0] m_wdata;
	rand bit [3:0] m_rdata;
	rand bit m_wr;
	
	
	//NOTE: the order of variables as listed within the `uvm_object_utils_* will be used for both packing and unpacking
	`uvm_object_utils_begin(Packet)
		`uvm_field_int(m_addr, UVM_DEFAULT)
		`uvm_field_int(m_wdata, UVM_DEFAULT)
		`uvm_field_int(m_rdata, UVM_DEFAULT)
		`uvm_field_int(m_wr, UVM_DEFAULT)
	`uvm_object_utils_end
	
	function new(string name = "Packet");
		super.new(name);
	endfunction
endclass

class unpack_test extends uvm_test;
	`uvm_component_utils(unpack_test)
	
	function new(string name = "unpack_test", uvm_component parent);
		super.new(name, parent);
	endfunction

	// Declare a few arrays to hold packed data for
	bit m_bits[];
	byte unsigned m_bytes[];
	int unsigned m_ints[];

	// Variables to hold return value from pack fun
	int m_val1, m_val2, m_val3;

	virtual function void build_phase(uvm_phase phase);
		Packet m_pkt = Packet::type_id::create("Packet");
		Packet m_pkt2 = Packet::type_id::create("Packet");
		
		`uvm_info(get_type_name(), $sformatf("Start p pack"),UVM_MEDIUM)
		
		// Randomize the first object, print and pack into bit array then display
		m_pkt.randomize();
		m_pkt.print();
		m_pkt.pack(m_bits);
		
		`uvm_info(get_type_name(), $sformatf("packed m_bits =%0p",m_bits),UVM_MEDIUM)
		
		// Randomize the first object, print and pack into byte array then display
		m_pkt.randomize();
		m_pkt.print();
		m_pkt.pack_bytes(m_bytes);
		`uvm_info(get_type_name(), $sformatf("packed m_bytes=%p",m_bytes),UVM_MEDIUM)
		
		// Randomize the first object, print and pack into int array then display
		m_pkt.randomize();
		m_pkt.print();
		m_pkt.pack_ints(m_ints);
		`uvm_info(get_type_name(), $sformatf("packed m_ints=%p",m_ints),UVM_MEDIUM)
		
		
		`uvm_info(get_type_name(), $sformatf("Start unpack"),UVM_MEDIUM)
		
		// Now unpack the packed bit array into the second object
		m_val1 = m_pkt2.unpack(m_bits);		//the value of val1 will have the status of unpack for each variable
		`uvm_info(get_type_name(), $sformatf("unpacked m_val1=%0h",m_val1),UVM_MEDIUM)
		m_pkt2.print();		//this will have unpack values
		
		// Now unpack the packed byte array into the
		m_val2 = m_pkt2.unpack_bytes(m_bytes);
		`uvm_info(get_type_name(), $sformatf("unpacked m_val2=%0h",m_val2),UVM_MEDIUM)
		m_pkt2.print();
		
		// Now unpack the packed int array into the s
		m_val3 = m_pkt2.unpack_ints(m_ints);
		`uvm_info(get_type_name(), $sformatf("unpacked m_val3=%0h",m_val3),UVM_MEDIUM)
		m_pkt2.print();
	endfunction
endclass

module tb;
	initial begin
		run_test("unpack_test");
	end
endmodule
