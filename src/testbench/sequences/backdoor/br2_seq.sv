///////////////////REGISTER 2/////////////////////

class br2_seq extends uvm_sequence;
  `uvm_object_utils(br2_seq)
  reg_block regmodel;

  function new (string name = "br2_seq"); 
    super.new(name); 
  endfunction

  virtual task body; 
    uvm_status_e status;
    bit [7:0] dv,mv,dout;
    ////////////////////////initial value
    dv = regmodel.r2.get();
    mv = regmodel.r2.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Initial Value -> Desired Value: %0h, Mirrored Value: %0h", dv, mv),UVM_NONE);

    ///////////////////////Poke and peek
    regmodel.r2.poke(status,8'h22);
    dv = regmodel.r2.get();
    mv = regmodel.r2.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After poke to REG2 -> Desired Value: %0h, Mirrored Value: %0h", dv, mv), UVM_NONE);

    regmodel.r2.peek(status,dout);
    dv = regmodel.r2.get();
    mv = regmodel.r2.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After peek from REG2 -> Desired: %0h, Mirrored Value: %0h, peek: %0h", dv, mv, dout), UVM_NONE);
  endtask
endclass
