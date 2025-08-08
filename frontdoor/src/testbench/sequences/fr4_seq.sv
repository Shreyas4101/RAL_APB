///////////////////REGISTER 4/////////////////////

class fr4_seq extends uvm_sequence;
  `uvm_object_utils(fr4_seq)
  reg_block regmodel;

  function new (string name = "fr4_seq"); 
    super.new(name); 
  endfunction

  virtual task body; 
    uvm_status_e status;
    bit [31:0] dv,mv,dout;
    ////////////////////////initial value
    dv = regmodel.r4.get();
    mv = regmodel.r4.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Initial Value -> Desired Value: %0h, Mirrored Value: %0h", dv, mv),UVM_NONE);

    ////////////////// update desire value
    regmodel.r4.set(32'h4AA44AA4);

    ///////////////// get desired and mirrored value
    dv = regmodel.r4.get();
    mv = regmodel.r4.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After Set -> Desired Value: %0h, Mirrored Value: %0h", dv, mv), UVM_NONE);

    ///////////////// update and call write, read methods
    regmodel.r4.update(status);
    dv = regmodel.r4.get();
    mv = regmodel.r4.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After Update -> Desired Value: %0h, Mirrored Value: %0h", dv, mv),UVM_NONE);

    regmodel.r4.write(status,32'h4AA44AA4);
    dv   = regmodel.r4.get();
    mv = regmodel.r4.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After write to REG4 -> Desired Value: %0h, Mirrored Value: %0h", dv, mv), UVM_NONE);

    regmodel.r4.read(status,dout);
    dv = regmodel.r4.get();
    mv = regmodel.r4.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After read from REG4 -> Desired Value: %0h, Mirrored Value: %0h", dv, mv),UVM_NONE);
  endtask
endclass
