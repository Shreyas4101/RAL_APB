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
