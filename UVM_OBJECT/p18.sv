//pack
/*
	// Function: pack_bytes
	
	extern function int pack (ref bit bitstream[], input uvm_packer packer=null);

	extern function int pack_bytes (ref byte unsigned bytestream[],input uvm_packer packer=null);
	
	extern function int pack_ints (ref int unsigned intstream[], input uvm_packer packer=null);
*/
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

class pack_test extends uvm_test;
	`uvm_component_utils(pack_test)
	
	function new(string name = "pack_test", uvm_component parent = null);
		super.new(name, parent);
	endfunction
	
	// Declare some arrays to store packed data out
	bit m_bits[];
	byte unsigned m_bytes[];
	int unsigned m_ints[];
	
	virtual function void build_phase(uvm_phase phase);
		
		// First create an object of class "Packet",randomize and print its contents
		Packet m_pkt = Packet::type_id::create("Packet");
		m_pkt.randomize();
		m_pkt.print();
		
		// Now, call "pack", "pack_bytes", and "pack_ints" and pass appropriate arrays
		m_pkt.pack(m_bits);						//m_bits={<<{m_addr,m_wdata,m_rdata,m_wr}};
		m_pkt.pack_bytes(m_bytes);
		m_pkt.pack_ints(m_ints);
		
		// Print the array contents
		`uvm_info(get_type_name(), $sformatf("m_bits=%p",m_bits),UVM_LOW)				
		`uvm_info(get_type_name(), $sformatf("m_bytes=%p",m_bytes),UVM_LOW)
		`uvm_info(get_type_name(), $sformatf("m_ints=%p",m_ints),UVM_LOW)
	endfunction
endclass

module tb;
	initial begin
		run_test("pack_test");
	end
endmodule

/*	
	bit [3:0] m_addr;	//0111		//7
	bit [3:0] m_wdata;	//0011		//3
	bit [3:0] m_rdata;	//1111		//f
	bit m_wr;			//1			//1
	
	bit m_bits[];				{0111 0011 1111 1}	
	byte unsigned m_bytes[];
	int unsigned m_ints[];
	
	

output
UVM_INFO @ 0: reporter [RNTST] Running test pack_test...
--------------------------------
Name       Type      Size  Value
--------------------------------
Packet     Packet    -     @349 
  m_addr   integral  4     'h7  
  m_wdata  integral  4     'h3  
  m_rdata  integral  4     'hf  
  m_wr     integral  1     'h1  
--------------------------------
UVM_INFO p18.sv(54) @ 0: uvm_test_top [pack_test] m_bits='{'h0, 'h1, 'h1, 'h1, 'h0, 'h0, 'h1, 'h1, 'h1, 'h1, 'h1, 'h1, 'h1} 
UVM_INFO p18.sv(55) @ 0: uvm_test_top [pack_test] m_bytes='{'h73, 'hf8} 
UVM_INFO p18.sv(56) @ 0: uvm_test_top [pack_test] m_ints='{'h73f80000} 


*/
