/*/////////////////REGISTER 1//////////////////

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
endclass*/


class rst1_seq extends uvm_sequence;
  `uvm_object_utils(rst1_seq)
  reg_block regmodel;

  function new (string name = "rst1_seq");
    super.new(name);
  endfunction

  task body;
    uvm_status_e status;
    uvm_reg_data_t dv, mv, dout, rst_reg;
    bit rst_status;

    // Check if reset value is defined in the RAL
    rst_status = regmodel.r1.has_reset();
    `uvm_info("SEQ", $sformatf("Reset value present in RAL model: %0b", rst_status), UVM_LOW);

    // Get reset value from RAL model
    rst_reg = regmodel.r1.get_reset();
    `uvm_info("SEQ", $sformatf("Configured RAL reset value for reg1: 0x%08h", rst_reg), UVM_LOW);

    // Print values before reset
    dv = regmodel.r1.get();
    mv = regmodel.r1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Before reset -> Desired: 0x%08h, Mirrored: 0x%08h", dv, mv), UVM_LOW);

    // Apply reset in the RAL model
    $display("---------- Applying reset to REG1  ------------");
    regmodel.r1.reset();  // updates desired value in RAL to reset

    // Read the value from the DUT and update mirror
    regmodel.r1.mirror(status, UVM_CHECK, UVM_FRONTDOOR);

    if (status != UVM_IS_OK) begin
      `uvm_error("SEQ", "Frontdoor mirror failed — check bus transaction or address mapping.");
    end

    // Fetch values after reset and DUT read
    dv = regmodel.r1.get();                 // Desired (reset) value from RAL model
    mv = regmodel.r1.get_mirrored_value();  // Value read from DUT via mirror
    dout = mv;                              // Alias for clarity

    `uvm_info("SEQ", $sformatf("After reset -> Desired: 0x%08h, Mirrored (DUT): 0x%08h", dv, dout), UVM_LOW);

    // Compare actual DUT value with expected reset value
    if (dout !== rst_reg) begin
      `uvm_error("SEQ", $sformatf("Reset mismatch: DUT read = 0x%08h, Expected (RAL) = 0x%08h", dout, rst_reg));
    end else begin
      `uvm_info("SEQ", "Reset verification for REG1 passed!", UVM_LOW);
    end
  endtask
endclass
