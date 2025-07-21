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

