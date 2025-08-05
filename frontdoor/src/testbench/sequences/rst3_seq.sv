/////////////////REGISTER 3//////////////////
/*
class rst3_seq extends uvm_sequence;
  `uvm_object_utils(rst3_seq)
  reg_block regmodel;

  function new (string name = "rst3_seq");
    super.new(name);
  endfunction

  task body;
    uvm_status_e status;
    bit [31:0] dv, mv, dout, rst_reg;
    bit rst_status;

    rst_status = regmodel.r3.has_reset();
    `uvm_info("SEQ", $sformatf("Reset Value is present: %0h ", rst_status), UVM_NONE);
    rst_reg   = regmodel.r3.get_reset();
    `uvm_info("SEQ", $sformatf(" Reset for REG3: %0h", rst_reg), UVM_NONE);

    dv = regmodel.r3.get();
    mv = regmodel.r3.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Before reset REG3 -> Desired: %0h, Mirrored: %0h", dv, mv), UVM_NONE);

    $display("---------- Applying reset to REG3------------"); 
    regmodel.r3.reset();
    dv   = regmodel.r3.get();
    mv = regmodel.r3.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After reset REG3 -> Desired: %0h, Mirrored: %0h, Read: %0h", dv, mv,dout), UVM_NONE)

  endtask
endclass

class rst3_seq extends uvm_sequence;
  `uvm_object_utils(rst3_seq)
  reg_block regmodel;

  function new (string name = "rst3_seq");
    super.new(name);
  endfunction

  task body;
    uvm_status_e status;
    uvm_reg_data_t dv, mv, dout, rst_reg;
    bit rst_status;

    // 1. Check for configured reset value
    rst_status = regmodel.r3.has_reset();
    `uvm_info("SEQ", $sformatf("Reset value present: %0b", rst_status), UVM_LOW);

    // 2. Get configured reset value
    rst_reg = regmodel.r3.get_reset();
    `uvm_info("SEQ", $sformatf("Configured reset value: 0x%08h", rst_reg), UVM_LOW);

    // 3. Get desired & mirrored values before reset
    dv = regmodel.r3.get();
    mv = regmodel.r3.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Before reset - Desired: 0x%08h, Mirrored: 0x%08h", dv, mv), UVM_LOW);

    // 4. Apply reset to model
    $display("---------- Applying reset to REG3 ------------");
    regmodel.r3.reset();

    // 5. Use .mirror() to update mirror with DUT value
    regmodel.r3.mirror(status, UVM_CHECK, UVM_FRONTDOOR);

    // 6. Capture new values
    dv = regmodel.r3.get();                 // Desired value from model
    mv = regmodel.r3.get_mirrored_value();  // Updated mirrored value
    dout = mv;                              // Can also log separately if needed

    `uvm_info("SEQ", $sformatf("After reset - Desired: 0x%08h, Mirrored (DUT): 0x%08h", dv, mv), UVM_LOW);

    // Optional check
    if (mv !== rst_reg) begin
      `uvm_error("SEQ", $sformatf("Reset mismatch: DUT = 0x%08h, Expected = 0x%08h", mv, rst_reg));
    end
  endtask
endclass */

class rst3_seq extends uvm_sequence;
  `uvm_object_utils(rst3_seq)
  reg_block regmodel;

  function new (string name = "rst3_seq");
    super.new(name);
  endfunction

  task body;
    uvm_status_e status;
    uvm_reg_data_t dv, mv, dout, rst_reg;
    bit rst_status;

    // 1. Check if reset value is defined in the RAL
    rst_status = regmodel.r3.has_reset();
    `uvm_info("SEQ", $sformatf("Reset value present in RAL model: %0b", rst_status), UVM_LOW);

    // 2. Get reset value from RAL model
    rst_reg = regmodel.r3.get_reset();
    `uvm_info("SEQ", $sformatf("Configured RAL reset value for reg3: 0x%08h", rst_reg), UVM_LOW);

    // 3. Print values before reset
    dv = regmodel.r3.get();
    mv = regmodel.r3.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Before reset -> Desired: 0x%08h, Mirrored: 0x%08h", dv, mv), UVM_LOW);

    // 4. Apply reset in the RAL model
    $display("---------- Applying reset to REG3 (RAL model) ------------");
    regmodel.r3.reset();  // updates desired value in RAL to reset

    // 5. Read the value from the DUT and update mirror
    regmodel.r3.mirror(status, UVM_CHECK, UVM_FRONTDOOR);

    if (status != UVM_IS_OK) begin
      `uvm_error("SEQ", "Frontdoor mirror failed — check bus transaction or address mapping.");
    end

    // 6. Fetch values after reset and DUT read
    dv = regmodel.r3.get();                 // Desired (reset) value from RAL model
    mv = regmodel.r3.get_mirrored_value();  // Value read from DUT via mirror
    dout = mv;                              // Alias for clarity

    `uvm_info("SEQ", $sformatf("After reset -> Desired: 0x%08h, Mirrored (DUT): 0x%08h", dv, dout), UVM_LOW);

    // 7. Compare actual DUT value with expected reset value
    if (dout !== rst_reg) begin
      `uvm_error("SEQ", $sformatf("Reset mismatch: DUT read = 0x%08h, Expected (RAL) = 0x%08h", dout, rst_reg));
    end else begin
      `uvm_info("SEQ", "Reset verification for REG3 passed!", UVM_LOW);
    end
  endtask
endclass
