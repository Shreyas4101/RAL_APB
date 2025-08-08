///////////////////REGISTER 1/////////////////////

class fr1_seq extends uvm_sequence;
  `uvm_object_utils(fr1_seq)
  reg_block regmodel;

  function new (string name = "fr1_seq"); 
    super.new(name); 
  endfunction

  virtual task body; 
    uvm_status_e status;
    bit [31:0] dv,mv,dout;
    ////////////////////////initial value
    dv = regmodel.r1.get();
    mv = regmodel.r1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Initial Value -> Desired Value: %0h, Mirrored Value: %0h", dv, mv),UVM_NONE);

    ////////////////// update desire value
    regmodel.r1.set(32'h3434FFFF);

    ///////////////// get desired and mirrored value
    dv = regmodel.r1.get();
    mv = regmodel.r1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After Set -> Desired Value: %0h, Mirrored Value: %0h", dv, mv), UVM_NONE);

    ///////////////// update and call write, read methods
    regmodel.r1.update(status);
    dv = regmodel.r1.get();
    mv = regmodel.r1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After Update -> Desired Value: %0h, Mirrored Value: %0h", dv, mv),UVM_NONE);

    regmodel.r1.write(status,32'h3434FFFF);
    dv   = regmodel.r1.get();
    mv = regmodel.r1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After write to REG1 -> Desired Value: %0h, Mirrored Value: %0h", dv, mv), UVM_NONE);

    regmodel.r1.read(status,dout);
    dv = regmodel.r1.get();
    mv = regmodel.r1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After read from REG1 -> Desired Value: %0h, Mirrored Value: %0h", dv, mv),UVM_NONE);
  endtask
endclass
