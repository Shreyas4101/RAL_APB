///////////////////CNTRL/////////////////////

class fctrl_seq extends uvm_sequence;
  `uvm_object_utils(fctrl_seq)
  reg_block regmodel;

  function new (string name = "fctrl_seq"); 
    super.new(name); 
  endfunction

  virtual task body; 
    uvm_status_e status;
    bit [3:0] dv,mv,dout;
    ////////////////////////initial value
    dv = regmodel.c1.get();
    mv = regmodel.c1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Initial Value -> Desired Value: %0h, Mirrored Value: %0h", dv, mv),UVM_NONE);

    ////////////////// update desire value
    regmodel.c1.set(3'h5);

    ///////////////// get desired and mirrored value
    dv = regmodel.c1.get();
    mv = regmodel.c1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After Set -> Desired Value: %0h, Mirrored Value: %0h", dv, mv), UVM_NONE);

    ///////////////// update and call write, read methods
    regmodel.c1.update(status);
    dv = regmodel.c1.get();
    mv = regmodel.c1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After Update -> Desired Value: %0h, Mirrored Value: %0h", dv, mv),UVM_NONE);

    regmodel.c1.write(status,3'h5);
    dv   = regmodel.c1.get();
    mv = regmodel.c1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After write to CTRL -> Desired Value: %0h, Mirrored Value: %0h", dv, mv), UVM_NONE);

    regmodel.c1.read(status,dout);
    dv = regmodel.c1.get();
    mv = regmodel.c1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After read from CTRL -> Desired Value: %0h, Mirrored Value: %0h", dv, mv),UVM_NONE);
  endtask
endclass

