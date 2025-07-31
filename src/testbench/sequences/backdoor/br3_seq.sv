///////////////////REGISTER 3/////////////////////

class br3_seq extends uvm_sequence;
  `uvm_object_utils(br3_seq)
  reg_block regmodel;

  function new (string name = "br3_seq"); 
    super.new(name); 
  endfunction

  virtual task body; 
    uvm_status_e status;
    bit [7:0] dv,mv,dout;
    ////////////////////////initial value
    dv = regmodel.r3.get();
    mv = regmodel.r3.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Initial Value -> Desired Value: %0h, Mirrored Value: %0h", dv, mv),UVM_NONE);

    ///////////////////////Poke and peek
    regmodel.r3.poke(status,8'h33);
    dv = regmodel.r3.get();
    mv = regmodel.r3.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After poke to REG3 -> Desired Value: %0h, Mirrored Value: %0h", dv, mv), UVM_NONE);

    regmodel.r3.peek(status,dout);
    dv = regmodel.r3.get();
    mv = regmodel.r3.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After peek from REG3 -> Desired: %0h, Mirrored Value: %0h, peek: %0h", dv, mv, dout), UVM_NONE);
  endtask
endclass
