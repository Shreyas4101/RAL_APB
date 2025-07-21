class ral_seq_item extends uvm_sequence_item;
  rand bit [31:0] paddr;
  rand bit pwrite;
  rand bit psel;
  rand bit penable;
  rand bit [31:0] pwdata;
  bit [31:0] prdata;
 
  `uvm_object_utils(ral_seq_item)
  
  function new(string name = "ral_seq_item");
    super.new(name);
  endfunction

//  constraint addr_range {paddr inside {[0:3]};}
//  constraint psel_value {soft psel==1;}
 
endclass
