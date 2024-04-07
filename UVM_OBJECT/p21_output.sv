UVM_INFO @ 0: reporter [RNTST] Running test my_test...
UVM_INFO testbench.sv(100) @ 0: uvm_test_top [uvm_test_top] obj = 
------------------------------------------
Name          Type        Size  Value     
------------------------------------------
obj           my_object   -     @349      
  value       integral    32    'h1f135537
  colors      string      5     GREEN     
  data[0]     integral    8     'h9f      
  data[1]     integral    8     'h33      
  data[2]     integral    8     'h12      
  data[3]     integral    8     'h9c      
  addr        integral    8     'h2f      
  tmp         temp_class  -     @350      
    tmp_addr  integral    8     'h39      
    tmp_data  integral    8     'hbd      
------------------------------------------
'{'h1f135537, 'h1, 'h9f33129c, 'h2f39bd00} 
'{'h1f, 'h13, 'h55, 'h37, 'h0, 'h0, 'h0, 'h1, 'h9f, 'h33, 'h12, 'h9c, 'h2f, 'h39, 'hbd}

'{
 'h0, 'h0, 'h0, 'h1,'h1, 'h1, 'h1, 'h1,	//1f
 'h0, 'h0, 'h0, 'h1,'h0, 'h0, 'h1, 'h1, //13
 'h0, 'h1, 'h0, 'h1,'h0, 'h1, 'h0, 'h1, //55
 'h0, 'h0, 'h1, 'h1,'h0, 'h1, 'h1, 'h1, //37

 'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 
 'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 
 'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 
 'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 'h1, //1 green
 
 'h1, 'h0, 'h0, 'h1, 'h1, 'h1, 'h1, 'h1, //9f
 
 'h0, 'h0, 'h1, 'h1, 'h0, 'h0, 'h1, 'h1, //33

 'h0, 'h0, 'h0, 'h1, 'h0, 'h0, 'h1, 'h0, //12
  
 'h1, 'h0, 'h0, 'h1, 'h1, 'h1, 'h0, 'h0, //9c
 
 'h0, 'h0, 'h1, 'h0, 'h1, 'h1, 'h1, 'h1, //2f
 
 'h0, 'h0, 'h1, 'h1, 'h1, 'h0, 'h0, 'h1, //39
 
 'h1, 'h0, 'h1, 'h1, 'h1, 'h1, 'h0, 'h1 //bd
}



UVM_INFO testbench.sv(106) @ 0: uvm_test_top [uvm_test_top] packed_data_bits = '{'h0, 'h0, 'h0, 'h1, 'h1, 'h1, 'h1, 'h1, 'h0, 'h0, 'h0, 'h1, 'h0, 'h0, 'h1, 'h1, 'h0, 'h1, 'h0, 'h1, 'h0, 'h1, 'h0, 'h1, 'h0, 'h0, 'h1, 'h1, 'h0, 'h1, 'h1, 'h1, 'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 'h0, 'h1, 'h1, 'h0, 'h0, 'h1, 'h1, 'h1, 'h1, 'h1, 'h0, 'h0, 'h1, 'h1, 'h0, 'h0, 'h1, 'h1, 'h0, 'h0, 'h0, 'h1, 'h0, 'h0, 'h1, 'h0, 'h1, 'h0, 'h0, 'h1, 'h1, 'h1, 'h0, 'h0, 'h0, 'h0, 'h1, 'h0, 'h1, 'h1, 'h1, 'h1, 'h0, 'h0, 'h1, 'h1, 'h1, 'h0, 'h0, 'h1, 'h1, 'h0, 'h1, 'h1, 'h1, 'h1, 'h0, 'h1} 
UVM_INFO testbench.sv(107) @ 0: uvm_test_top [uvm_test_top] packed_data_bytes = '{'h1f, 'h13, 'h55, 'h37, 'h0, 'h0, 'h0, 'h1, 'h9f, 'h33, 'h12, 'h9c, 'h2f, 'h39, 'hbd} 
UVM_INFO testbench.sv(108) @ 0: uvm_test_top [uvm_test_top] packed_data_ints = '{'h1f135537, 'h1, 'h9f33129c, 'h2f39bd00} 
UVM_INFO testbench.sv(109) @ 0: uvm_test_top [uvm_test_top] pack_values[BITS] = 120, pack_values[BYTES] = 120, pack_values[INTS] = 120


UVM_INFO testbench.sv(113) @ 0: uvm_test_top [uvm_test_top] bits: unpack_obj = 
------------------------------------------
Name          Type        Size  Value     
------------------------------------------
unpack_obj    my_object   -     @361      
  value       integral    32    'h1f135537
  colors      string      5     GREEN     
  data[0]     integral    8     'h9f      
  data[1]     integral    8     'h33      
  data[2]     integral    8     'h12      
  data[3]     integral    8     'h9c      
  addr        integral    8     'h2f      
  tmp         temp_class  -     @362      
    tmp_addr  integral    8     'h39      
    tmp_data  integral    8     'hbd      
------------------------------------------

UVM_INFO testbench.sv(115) @ 0: uvm_test_top [uvm_test_top] bytes: unpack_obj = 
------------------------------------------
Name          Type        Size  Value     
------------------------------------------
unpack_obj    my_object   -     @361      
  value       integral    32    'h1f135537
  colors      string      5     GREEN     
  data[0]     integral    8     'h9f      
  data[1]     integral    8     'h33      
  data[2]     integral    8     'h12      
  data[3]     integral    8     'h9c      
  addr        integral    8     'h2f      
  tmp         temp_class  -     @362      
    tmp_addr  integral    8     'h39      
    tmp_data  integral    8     'hbd      
------------------------------------------

UVM_INFO testbench.sv(117) @ 0: uvm_test_top [uvm_test_top] ints: unpack_obj = 
------------------------------------------
Name          Type        Size  Value     
------------------------------------------
unpack_obj    my_object   -     @361      
  value       integral    32    'h1f135537
  colors      string      5     GREEN     
  data[0]     integral    8     'h9f      
  data[1]     integral    8     'h33      
  data[2]     integral    8     'h12      
  data[3]     integral    8     'h9c      
  addr        integral    8     'h2f      
  tmp         temp_class  -     @362      
    tmp_addr  integral    8     'h39      
    tmp_data  integral    8     'hbd      
------------------------------------------

UVM_INFO testbench.sv(118) @ 0: uvm_test_top [uvm_test_top] unpack_values[BITS] = 120, unpack_values[BYTES] = 120, unpack_values[INTS] = 120