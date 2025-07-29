///////////////////FRONTDOOR//////////////////////

///////////////////REGISTER 1/////////////////////

class fr1_seq extends uvm_sequence;
  `uvm_object_utils(fr1_seq)
  reg_block regmodel;

  function new (string name = "fr1_seq"); 
    super.new(name); 
  endfunction

  virtual task body; 
    uvm_status_e status;
    bit [7:0] dv,mv,dout;
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
    dv = regmodel.r1.get();
    mv = regmodel.r1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Initial Value -> Desired Value: %0h, Mirrored Value: %0h", dv, mv),UVM_NONE);
  endtask
endclass

///////////////////REGISTER 2/////////////////////

class fr2_seq extends uvm_sequence;
  `uvm_object_utils(fr2_seq)
  reg_block regmodel;

  function new (string name = "fr2_seq"); 
    super.new(name); 
  endfunction

  virtual task body; 
    uvm_status_e status;
    bit [7:0] dv,mv,dout;
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
    dv   = regmodel.r2.get();
    mv = regmodel.r2.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After write to REG2 -> Desired Value: %0h, Mirrored Value: %0h", dv, mv), UVM_NONE);

    regmodel.r2.read(status,dout);
    dv = regmodel.r2.get();
    mv = regmodel.r2.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Initial Value -> Desired Value: %0h, Mirrored Value: %0h", dv, mv),UVM_NONE);
  endtask
endclass

///////////////////REGISTER 3/////////////////////

class fr3_seq extends uvm_sequence;
  `uvm_object_utils(fr3_seq)
  reg_block regmodel;

  function new (string name = "fr3_seq"); 
    super.new(name); 
  endfunction

  virtual task body; 
    uvm_status_e status;
    bit [7:0] dv,mv,dout;
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
    dv   = regmodel.r3.get();
    mv = regmodel.r3.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After write to REG3 -> Desired Value: %0h, Mirrored Value: %0h", dv, mv), UVM_NONE);

    regmodel.r3.read(status,dout);
    dv = regmodel.r3.get();
    mv = regmodel.r3.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Initial Value -> Desired Value: %0h, Mirrored Value: %0h", dv, mv),UVM_NONE);
  endtask
endclass

///////////////////REGISTER 4/////////////////////

class fr4_seq extends uvm_sequence;
  `uvm_object_utils(fr4_seq)
  reg_block regmodel;

  function new (string name = "fr4_seq"); 
    super.new(name); 
  endfunction

  virtual task body; 
    uvm_status_e status;
    bit [7:0] dv,mv,dout;
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
    dv   = regmodel.r4.get();
    mv = regmodel.r4.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After write to REG4 -> Desired Value: %0h, Mirrored Value: %0h", dv, mv), UVM_NONE);

    regmodel.r4.read(status,dout);
    dv = regmodel.r4.get();
    mv = regmodel.r4.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Initial Value -> Desired Value: %0h, Mirrored Value: %0h", dv, mv),UVM_NONE);
  endtask
endclass



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


///////////////////RESET/////////////////////

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

/////////////////REGISTER 3//////////////////

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


/*
class reg_seq extends uvm_sequence;
  `uvm_object_utils(reg_seq)
  reg_block regmodel;

  function new (string name = "reg_seq"); 
    super.new(name); 
  endfunction

  virtual task body; 
    uvm_status_e status;
    bit [7:0] dv,mv,dout;


/*
    ///////////////////// FRONTDOOR  //////////////////////

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
        dv = regmodel.r3.get();
    mv = regmodel.r3.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After write to REG3 -> Desired Value: %0h, Mirrored Value: %0h", dv, mv), UVM_NONE);

    regmodel.r3.read(status,dout);
    dv = regmodel.r3.get();
    mv = regmodel.r3.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After read from REG3 -> Desired: %0h, Mirrored Value: %0h, Read: %0h", dv, mv, dout), UVM_NONE);


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



    ///////////////////// BACKDOOR  //////////////////////

    ///////////////////// REGISTER-1 //////////////////////

    ////////////////////////initial value
    dv = regmodel.r1.get();
    mv = regmodel.r1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Initial Value -> Desired Value: %0h, Mirrored Value: %0h", dv, mv),UVM_NONE);

    regmodel.r1.poke(status,8'h11);
    dv   = regmodel.r1.get();
    mv = regmodel.r1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After poke to REG1 -> Desired Value: %0h, Mirrored Value: %0h", dv, mv), UVM_NONE);

    regmodel.r1.peek(status,dout);
    dv   = regmodel.r1.get();
    mv = regmodel.r1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After peek from REG1 -> Desired: %0h, Mirrored Value: %0h, peek: %0h", dv, mv, dout), UVM_NONE);

///////////////////// REGISTER-2 //////////////////////

////////////////////////initial value
dv = regmodel.r2.get();
mv = regmodel.r2.get_mirrored_value();
`uvm_info("SEQ", $sformatf("Initial Value -> Desired Value: %0h, Mirrored Value: %0h", dv, mv),UVM_NONE);

regmodel.r2.poke(status,8'h22);
dv = regmodel.r2.get();
mv = regmodel.r2.get_mirrored_value();
`uvm_info("SEQ", $sformatf("After poke to REG2 -> Desired Value: %0h, Mirrored Value: %0h", dv, mv), UVM_NONE);

regmodel.r2.peek(status,dout);
dv = regmodel.r2.get();
mv = regmodel.r2.get_mirrored_value();
`uvm_info("SEQ", $sformatf("After peek from REG2 -> Desired: %0h, Mirrored Value: %0h, peek: %0h", dv, mv, dout), UVM_NONE);
/*

    ///////////////////// REGISTER-3 //////////////////////

    ////////////////////////initial value
    dv = regmodel.r3.get();
    mv = regmodel.r3.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Initial Value -> Desired Value: %0h, Mirrored Value: %0h", dv, mv),UVM_NONE);


    regmodel.r3.poke(status,8'h33);
    dv = regmodel.r3.get();
    mv = regmodel.r3.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After poke to REG3 -> Desired Value: %0h, Mirrored Value: %0h", dv, mv), UVM_NONE);

    regmodel.r3.peek(status,dout);
    dv = regmodel.r3.get();
    mv = regmodel.r3.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After peek from REG3 -> Desired: %0h, Mirrored Value: %0h, peek: %0h", dv, mv, dout), UVM_NONE);


    ///////////////////// REGISTER-4 //////////////////////

    ////////////////////////initial value
    dv = regmodel.r4.get();
    mv = regmodel.r4.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Initial Value -> Desired Value: %0h, Mirrored Value: %0h", dv, mv),UVM_NONE);

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
*/
