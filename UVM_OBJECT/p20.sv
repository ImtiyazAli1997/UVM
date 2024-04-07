class Packet extends uvm_object;
	rand bit [3:0] m_addr;
	rand bit [3:0] m_wdata;
	rand bit [3:0] m_rdata;
	rand bit m_wr;
	
	`uvm_object_utils(Packet)

	// Define do_print, so that print method displa
	
	virtual function void do_print(uvm_printer printer);
		super.do_print(printer);
		printer.print_field_int("m_addr", m_addr, $bits(m_addr),UVM_HEX);
		printer.print_field_int("m_wdata", m_wdata, $bits(m_wdata),UVM_HEX);
		printer.print_field_int("m_rdata", m_rdata, $bits(m_rdata),UVM_HEX);
		printer.print_field_int("m_wr", m_wr, $bits(m_wr),UVM_HEX);
	endfunction
	
	virtual function void do_pack(uvm_packer packer);
		super.do_pack(packer);
		packer.pack_field_int(m_addr, $bits(m_addr));
		packer.pack_field_int(m_wdata, $bits(m_wdata));
		packer.pack_field_int(m_rdata, $bits(m_rdata));
		packer.pack_field_int(m_wr,$bits(m_wr));
	endfunction
	
	virtual function void do_unpack(uvm_packer packer);
		super.do_pack(packer);
		m_addr = packer.unpack_field_int($bits(m_addr));
		m_wdata = packer.unpack_field_int($bits(m_wdata));
		m_rdata = packer.unpack_field_int($bits(m_rdata));
		m_wr = packer.unpack_field_int($bits(m_wr));
	endfunction
	
	function new(string name = "Packet");
		super.new(name);
	endfunction	
	
endclass
