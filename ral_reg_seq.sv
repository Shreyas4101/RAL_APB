class reg_seq extends uvm_sequence;
  `uvm_object_utils(reg_seq)
  reg_block regmodel;

  function new (string name = "reg_seq"); 
    super.new(name); 
  endfunction

  virtual task body; 
    uvm_status_e status;
    bit [7:0] dv,mv,dout;

    ///////////////////// REGISTER-1 //////////////////////

    ////////////////////////initial value
    dv = regmodel.r1.get();
    mv = regmodel.r1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Initial Value -> Desired Value: %0h, Mirrored Value: %0h", dv, mv),UVM_NONE);

    ////////////////// update desire value
    regmodel.r1.set(8'h11);

    ///////////////// get desired and mirrored value
    dv = regmodel.r1.get();
    mv = regmodel.r1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After Set -> Desired Value: %0h, Mirrored Value: %0h", dv, mv), UVM_NONE);

    ///////////////// update and call write, read methods
    regmodel.r1.update(status);
    dv = regmodel.r1.get();
    mv = regmodel.r1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After Update -> Desired Value: %0h, Mirrored Value: %0h", dv, mv),UVM_NONE);

    regmodel.r1.write(status,8'h11);
    dv   = regmodel.r1.get();
    mv = regmodel.r1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After write to REG1 -> Desired Value: %0h, Mirrored Value: %0h", dv, mv), UVM_NONE);

    regmodel.r1.read(status,dout);
    dv   = regmodel.r1.get();
    mv = regmodel.r1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After read from REG1 -> Desired: %0h, Mirrored Value: %0h, Read: %0h", dv, mv, dout), UVM_NONE);

    ///////////////////// REGISTER-2 //////////////////////

    ////////////////////////initial value
    dv = regmodel.r2.get();
    mv = regmodel.r2.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Initial Value -> Desired Value: %0h, Mirrored Value: %0h", dv, mv),UVM_NONE);

    ////////////////// update desire value
    regmodel.r2.set(8'h22);

    ///////////////// get desired and mirrored value
    dv = regmodel.r2.get();
    mv = regmodel.r2.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After Set -> Desired Value: %0h, Mirrored Value: %0h", dv, mv), UVM_NONE);

    ///////////////// update and call write, read methods
    regmodel.r2.update(status);
    dv = regmodel.r2.get();
    mv = regmodel.r2.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After Update -> Desired Value: %0h, Mirrored Value: %0h", dv, mv),UVM_NONE);

    regmodel.r2.write(status,8'h22);
    dv = regmodel.r2.get();
    mv = regmodel.r2.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After write to REG2 -> Desired Value: %0h, Mirrored Value: %0h", dv, mv), UVM_NONE);

    regmodel.r2.read(status,dout);
    dv = regmodel.r2.get();
    mv = regmodel.r2.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After read from REG2 -> Desired: %0h, Mirrored Value: %0h, Read: %0h", dv, mv, dout), UVM_NONE);


    ///////////////////// REGISTER-3 //////////////////////

    ////////////////////////initial value
    dv = regmodel.r3.get();
    mv = regmodel.r3.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Initial Value -> Desired Value: %0h, Mirrored Value: %0h", dv, mv),UVM_NONE);

    ////////////////// update desire value
    regmodel.r3.set(8'h33);

    ///////////////// get desired and mirrored value
    dv = regmodel.r3.get();
    mv = regmodel.r3.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After Set -> Desired Value: %0h, Mirrored Value: %0h", dv, mv), UVM_NONE);

    ///////////////// update and call write, read methods
    regmodel.r3.update(status);
    dv = regmodel.r3.get();
    mv = regmodel.r3.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After Update -> Desired Value: %0h, Mirrored Value: %0h", dv, mv),UVM_NONE);

    regmodel.r3.write(status,8'h33);


    ///////////////////// REGISTER-4 //////////////////////

    ////////////////////////initial value
    dv = regmodel.r4.get();
    mv = regmodel.r4.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Initial Value -> Desired Value: %0h, Mirrored Value: %0h", dv, mv),UVM_NONE);

    ////////////////// update desire value
    regmodel.r4.set(8'h44);

    ///////////////// get desired and mirrored value
    dv = regmodel.r4.get();
    mv = regmodel.r4.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After Set -> Desired Value: %0h, Mirrored Value: %0h", dv, mv), UVM_NONE);

    ///////////////// update and call write, read methods
    regmodel.r4.update(status);
    dv = regmodel.r4.get();
    mv = regmodel.r4.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After Update -> Desired Value: %0h, Mirrored Value: %0h", dv, mv),UVM_NONE);

    regmodel.r4.write(status,8'h44);
    dv = regmodel.r4.get();
    mv = regmodel.r4.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After write to REG4 -> Desired Value: %0h, Mirrored Value: %0h", dv, mv), UVM_NONE);

    regmodel.r4.read(status,dout);
    dv = regmodel.r4.get();
    mv = regmodel.r4.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After read from REG4 -> Desired: %0h, Mirrored Value: %0h, Read: %0h", dv, mv, dout), UVM_NONE);

  endtask
endclass
