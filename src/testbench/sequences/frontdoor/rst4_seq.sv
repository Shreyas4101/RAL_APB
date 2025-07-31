/////////////////REGISTER 4//////////////////

class rst4_seq extends uvm_sequence;
  `uvm_object_utils(rst4_seq)
  reg_block regmodel;

  function new (string name = "rst4_seq");
    super.new(name);
  endfunction

  task body;
    uvm_status_e status;
    bit [31:0] dv, mv, dout, rst_reg;
    bit rst_status;

    rst_status = regmodel.r4.has_reset();
    `uvm_info("SEQ", $sformatf("Reset Value is present: %0h ", rst_status), UVM_NONE);
    rst_reg   = regmodel.r4.get_reset();
    `uvm_info("SEQ", $sformatf(" Reset for REG4: %0h", rst_reg), UVM_NONE);

    dv = regmodel.r4.get();
    mv = regmodel.r4.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Before reset REG4 -> Desired: %0h, Mirrored: %0h", dv, mv), UVM_NONE);

    $display("---------- Applying reset to REG4------------"); 
    regmodel.r4.reset();
    dv = regmodel.r4.get();
    mv = regmodel.r4.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After reset REG4 -> Desired: %0h, Mirrored: %0h, Read: %0h", dv, mv,dout), UVM_NONE)

  endtask
endclass

