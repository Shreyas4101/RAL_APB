class ctrl extends uvm_reg;
  `uvm_object_utils(ctrl)
  rand uvm_reg_field ctrl_field;

  function new(string name = "ctrl");
    super.new(name, 4, UVM_NO_COVERAGE);
  endfunction

  function void build;
    ctrl_field = uvm_reg_field::type_id::create("ctrl_field");
    ctrl_field.configure(this, 4, 0, "RW", 0, 0, 1, 1, 1);
  endfunction
endclass

class reg1 extends uvm_reg;
  `uvm_object_utils(reg1)
  rand uvm_reg_field reg1_field;

  function new(string name = "reg1");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  function void build;
    reg1_field = uvm_reg_field::type_id::create("reg1_field");
    reg1_field.configure(this, 32, 0, "RW", 0, 32'hA5A5_0000, 1, 1, 1);
  endfunction
endclass

class reg2 extends uvm_reg;
  `uvm_object_utils(reg2)
  rand uvm_reg_field reg2_field;

  function new(string name = "reg2");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  function void build;
    reg2_field = uvm_reg_field::type_id::create("reg2_field");
    reg2_field.configure(this, 32, 0, "RW", 0, 32'h1234_9876, 1, 1, 1);
  endfunction
endclass

class reg3 extends uvm_reg;
  `uvm_object_utils(reg3)
  rand uvm_reg_field reg3_field;

  function new(string name = "reg3");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  function void build;
    reg3_field = uvm_reg_field::type_id::create("reg3_field");
    reg3_field.configure(this, 32, 0, "RW", 0, 32'h5A5A_5555, 1, 1, 1);
  endfunction
endclass

class reg4 extends uvm_reg;
  `uvm_object_utils(reg4)
  rand uvm_reg_field reg4_field;

  function new(string name = "reg4");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  function void build;
    reg4_field = uvm_reg_field::type_id::create("reg4_field");
    reg4_field.configure(this, 32, 0, "RW", 0, 32'h0000_FFFF, 1, 1, 1);
  endfunction
endclass


//// REG BLOCK ////

class reg_block extends uvm_reg_block;
  `uvm_object_utils(reg_block)

  rand ctrl c1;
  rand reg1 r1;
  rand reg2 r2;
  rand reg3 r3;
  rand reg4 r4;

  function new(string name = "reg_block");
    super.new(name, UVM_NO_COVERAGE);
  endfunction

  function void build;
    c1 = ctrl::type_id::create("c1");
    c1.build();
    c1.configure(this);
    c1.add_hdl_path_slice("cntrl", 0, 4);

    r1 = reg1::type_id::create("r1");
    r1.build();
    r1.configure(this);
    r1.add_hdl_path_slice("reg1", 0, 32);

    r2 = reg2::type_id::create("r2");
    r2.build();
    r2.configure(this);
    r2.add_hdl_path_slice("reg2", 0, 32);

    r3 = reg3::type_id::create("r3");
    r3.build();
    r3.configure(this);
    r3.add_hdl_path_slice("reg3", 0, 32);

    r4 = reg4::type_id::create("r4");
    r4.build();
    r4.configure(this);
    r4.add_hdl_path_slice("reg4", 0, 32);
    
    default_map = create_map("default_map", 0, 4, UVM_LITTLE_ENDIAN);
    default_map.add_reg(c1, 'h0, "RW");
    default_map.add_reg(r1, 'h4, "RW");
    default_map.add_reg(r2, 'h8, "RW");
    default_map.add_reg(r3, 'hc, "RW");
    default_map.add_reg(r4, 'h10, "RW");
    add_hdl_path("tb.DUT","RTL");	
    default_map.set_auto_predict(1);
    lock_model();
  endfunction
endclass

module tb;
  reg_block t1;
  initial begin
    t1 = new("reg_block");
    t1.build();
  end
endmodule
