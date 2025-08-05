/////////////////REGISTER 1//////////////////

class rst1_seq extends uvm_sequence;
  `uvm_object_utils(rst1_seq)
  reg_block regmodel;

  function new (string name = "rst1_seq");
    super.new(name);
  endfunction

  task body;
    uvm_status_e status;
    bit [31:0] dv, mv, dout, rst_reg;
    bit rst_status;

    rst_status = regmodel.r1.has_reset();
    `uvm_info("SEQ", $sformatf("Reset Value is present: %0h ", rst_status), UVM_NONE);
    rst_reg   = regmodel.r1.get_reset();
    `uvm_info("SEQ", $sformatf(" Reset for REG1: %0h", rst_reg), UVM_NONE);

    dv = regmodel.r1.get();
    mv = regmodel.r1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Before reset REG1 -> Desired: %0h, Mirrored: %0h", dv, mv), UVM_NONE);

    $display("---------- Applying reset to REG1------------"); 
    regmodel.r1.reset();
    dv   = regmodel.r1.get();
    mv = regmodel.r1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After reset REG1 -> Desired: %0h, Mirrored: %0h, Read: %0h", dv, mv,dout), UVM_NONE)

  endtask
endclass
