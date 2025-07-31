///////////////////REGISTER 4/////////////////////

class br4_seq extends uvm_sequence;
  `uvm_object_utils(br4_seq)
  reg_block regmodel;

  function new (string name = "br4_seq"); 
    super.new(name); 
  endfunction

  virtual task body; 
    uvm_status_e status;
    bit [7:0] dv,mv,dout;
    ////////////////////////initial value
    dv = regmodel.r4.get();
    mv = regmodel.r4.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Initial Value -> Desired Value: %0h, Mirrored Value: %0h", dv, mv),UVM_NONE);

    ///////////////////////Poke and peek
    regmodel.r4.poke(status,8'h44);
    dv = regmodel.r4.get();
    mv = regmodel.r4.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After poke to REG4 -> Desired Value: %0h, Mirrored Value: %0h", dv, mv), UVM_NONE);

    regmodel.r4.peek(status,dout);
    dv = regmodel.r4.get();
    mv = regmodel.r4.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After peek from REG4 -> Desired: %0h, Mirrored Value: %0h, peek: %0h", dv, mv, dout), UVM_NONE);
  endtask
endclass
