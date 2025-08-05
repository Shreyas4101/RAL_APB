
////////////////////BACKDOOR//////////////////////

///////////////////REGISTER 1/////////////////////

class br1_seq extends uvm_sequence;
  `uvm_object_utils(br1_seq)
  reg_block regmodel;

  function new (string name = "br1_seq"); 
    super.new(name); 
  endfunction

  virtual task body; 
    uvm_status_e status;
    bit [7:0] dv,mv,dout;
    ////////////////////////initial value
    dv = regmodel.r1.get();
    mv = regmodel.r1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Initial Value -> Desired Value: %0h, Mirrored Value: %0h", dv, mv),UVM_NONE);

    ///////////////////////Poke and peek
    regmodel.r1.poke(status,8'h11);
    dv = regmodel.r1.get();
    mv = regmodel.r1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After poke to REG1 -> Desired Value: %0h, Mirrored Value: %0h", dv, mv), UVM_NONE);

    regmodel.r1.peek(status,dout);
    dv = regmodel.r1.get();
    mv = regmodel.r1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After peek from REG1 -> Desired: %0h, Mirrored Value: %0h, peek: %0h", dv, mv, dout), UVM_NONE);
  endtask
endclass
