/////////////////REGISTER 2//////////////////

class rst2_seq extends uvm_sequence;
  `uvm_object_utils(rst2_seq)
  reg_block regmodel;

  function new (string name = "rst2_seq");
    super.new(name);
  endfunction

  task body;
    uvm_status_e status;
    bit [31:0] dv, mv, dout, rst_reg;
    bit rst_status;

    rst_status = regmodel.r2.has_reset();
    `uvm_info("SEQ", $sformatf("Reset Value is present: %0h ", rst_status), UVM_NONE);
    rst_reg   = regmodel.r2.get_reset();
    `uvm_info("SEQ", $sformatf(" Reset for REG2: %0h", rst_reg), UVM_NONE);

    dv = regmodel.r2.get();
    mv = regmodel.r2.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Before reset REG2 -> Desired: %0h, Mirrored: %0h", dv, mv), UVM_NONE);

    $display("---------- Applying reset to REG2------------"); 
    regmodel.r2.reset();
    dv   = regmodel.r2.get();
    mv = regmodel.r2.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After reset REG2 -> Desired: %0h, Mirrored: %0h, Read: %0h", dv, mv,dout), UVM_NONE)

  endtask
endclass
