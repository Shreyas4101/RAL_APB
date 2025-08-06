class bctrl_seq extends uvm_sequence;
  `uvm_object_utils(bctrl_seq)
  reg_block regmodel;

  function new (string name = "bctrl_seq"); 
    super.new(name); 
  endfunction

  virtual task body; 
    uvm_status_e status;
    bit [3:0] dv,mv,dout;
    ////////////////////////initial value
    dv = regmodel.c1.get();
    mv = regmodel.c1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Initial Value -> Desired Value: %0h, Mirrored Value: %0h", dv, mv),UVM_NONE);

    ///////////////////////Poke and peek
    regmodel.c1.poke(status,8'h44);
    dv = regmodel.c1.get();
    mv = regmodel.c1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After poke to REG4 -> Desired Value: %0h, Mirrored Value: %0h", dv, mv), UVM_NONE);

    regmodel.c1.peek(status,dout);
    dv = regmodel.c1.get();
    mv = regmodel.c1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After peek from REG4 -> Desired: %0h, Mirrored Value: %0h, peek: %0h", dv, mv, dout), UVM_NONE);
  endtask
endclass
