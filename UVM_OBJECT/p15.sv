//compare();

typedef enum {FALSE, TRUE} e_bool;
class Packet extends uvm_object;
	rand bit[15:0] m_addr;
	
	virtual function string convert2string();
		string contents;
		contents = $sformatf("m_addr=0x%0h", m_addr);
		return contents;
	endfunction
	
	`uvm_object_utils_begin(Packet)
		`uvm_field_int(m_addr, UVM_DEFAULT)
	`uvm_object_utils_end
	
	function new(string name = "Packet");
		super.new(name);
	endfunction
endclass


class Object extends uvm_object;
	rand e_bool m_bool;
	rand bit[3:0] m_mode;
	string m_name;
	rand Packet m_pkt;
	
	function new(string name = "Object");
		super.new(name);
		m_name = name;
		m_pkt = Packet::type_id::create("m_pkt");
		m_pkt.randomize();
	endfunction
	
	`uvm_object_utils_begin(Object)
		`uvm_field_enum(e_bool, m_bool, UVM_DEFAULT)
		`uvm_field_int (m_mode, UVM_DEFAULT)
		`uvm_field_string(m_name, UVM_DEFAULT)
		`uvm_field_object(m_pkt, UVM_DEFAULT)
	`uvm_object_utils_end
	
	virtual function string convert2string();
		string contents;
		contents = $sformatf("m_bool = %s m_mode=%0h m_name= %s m_addr=0x%0h",m_bool,m_mode,m_name,m_pkt.m_addr);
		return contents;
	endfunction
endclass

class base_test extends uvm_test;

	`uvm_component_utils(base_test)
	
	function new(string name = "base_test", uvm_component parent);
		super.new(name, parent);
	endfunction
	
	function void _compare(Object obj1, obj2);
		if (obj2.compare(obj1))
			`uvm_info("TEST", "obj1 and obj2 are same",UVM_LOW)
		else
			`uvm_info("TEST", "obj1 and obj2 are differ",UVM_LOW)
	endfunction

	function void build_phase(uvm_phase phase);
		// Create two objects, randomize them and print the contents
		Object obj1 = Object::type_id::create("obj1");
		Object obj2 = Object::type_id::create("obj2");
		
		obj1.randomize();
		obj1.print();
		obj2.randomize();
		obj2.print();
		
		_compare(obj1, obj2);
		
		`uvm_info("TEST", "Copy m_bool", UVM_LOW);
		obj2.m_bool = obj1.m_bool;
		
		`uvm_info("TEST", $sformatf("Obj2.print:%s",obj2.convert2string()),UVM_LOW)
		_compare(obj1, obj2);
		
		`uvm_info("TEST", "Copy m_mode", UVM_LOW);
		obj2.m_mode = obj1.m_mode;
		`uvm_info("TEST", $sformatf("Obj2.print:%s",obj2.convert2string()),UVM_LOW)
		
		_compare(obj1, obj2);
		`uvm_info("TEST", "Copy m_name", UVM_LOW)
		obj2.m_name = obj1.m_name;
		`uvm_info("TEST", $sformatf("Obj2.print:%s",obj2.convert2string()),UVM_LOW)
		
		_compare(obj1, obj2);
		`uvm_info("TEST", "Copy m_pkt.m_addr", UVM_LOW)
		obj2.m_pkt.m_addr = obj1.m_pkt.m_addr;
		`uvm_info("TEST", $sformatf("Obj2.print:%s",obj2.convert2string()),UVM_LOW)
		
		_compare(obj1, obj2);
	endfunction
endclass

module tb;
	initial begin
		run_test("base_test");
	end
endmodule