/*class ctrl extends uvm_reg;
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
    //default_map.set_auto_predict(0);
    lock_model();
  endfunction
endclass*/

//================= ctrl Register =================//
class ctrl extends uvm_reg;
  `uvm_object_utils(ctrl)
  rand uvm_reg_field ctrl_field;

  covergroup ctrl_cov;
    option.per_instance = 1;
    coverpoint ctrl_field.value[3:0] {
      bins low  = {[0:5]};
      bins mid  = {[6:10]};
      bins high = {[11:15]};
    }
  endgroup

  function new(string name = "ctrl");
    super.new(name, 4, UVM_CVR_FIELD_VALS);
    if (has_coverage(UVM_CVR_FIELD_VALS))
      ctrl_cov = new();
  endfunction

  function void build;
    ctrl_field = uvm_reg_field::type_id::create("ctrl_field");
    ctrl_field.configure(this, 4, 0, "RW", 0, 0, 1, 1, 1);
  endfunction

  virtual function void sample(uvm_reg_data_t data,
                               uvm_reg_data_t byte_en,
                               bit is_read,
                               uvm_reg_map map);
    ctrl_cov.sample();
  endfunction

  virtual function void sample_values();
    super.sample_values();
    ctrl_cov.sample();
  endfunction
endclass

//================= reg1 =================//
class reg1 extends uvm_reg;
  `uvm_object_utils(reg1)
  rand uvm_reg_field reg1_field;

  covergroup reg1_cov;
    option.per_instance = 1;
    coverpoint reg1_field.value {
      bins low  = {[0:32'h1FFF_FFFF]};
      bins mid  = {[32'h2000_0000:32'h7FFF_FFFF]};
      bins high = {[32'h8000_0000:32'hFFFF_FFFF]};
    }
  endgroup

  function new(string name = "reg1");
    super.new(name, 32, UVM_CVR_FIELD_VALS);
    if (has_coverage(UVM_CVR_FIELD_VALS))
      reg1_cov = new();
  endfunction

  function void build;
    reg1_field = uvm_reg_field::type_id::create("reg1_field");
    reg1_field.configure(this, 32, 0, "RW", 0, 32'hA5A5_0000, 1, 1, 1);
  endfunction

  virtual function void sample(uvm_reg_data_t data,
                               uvm_reg_data_t byte_en,
                               bit is_read,
                               uvm_reg_map map);
    reg1_cov.sample();
  endfunction

  virtual function void sample_values();
    super.sample_values();
    reg1_cov.sample();
  endfunction
endclass

//================= reg2 =================//
class reg2 extends uvm_reg;
  `uvm_object_utils(reg2)
  rand uvm_reg_field reg2_field;

  covergroup reg2_cov;
    option.per_instance = 1;
    coverpoint reg2_field.value {
      bins low  = {[0:32'h1FFF_FFFF]};
      bins mid  = {[32'h2000_0000:32'h7FFF_FFFF]};
      bins high = {[32'h8000_0000:32'hFFFF_FFFF]};
    }
  endgroup

  function new(string name = "reg2");
    super.new(name, 32, UVM_CVR_FIELD_VALS);
    if (has_coverage(UVM_CVR_FIELD_VALS))
      reg2_cov = new();
  endfunction

  function void build;
    reg2_field = uvm_reg_field::type_id::create("reg2_field");
    reg2_field.configure(this, 32, 0, "RW", 0, 32'h1234_9876, 1, 1, 1);
  endfunction

  virtual function void sample(uvm_reg_data_t data,
                               uvm_reg_data_t byte_en,
                               bit is_read,
                               uvm_reg_map map);
    reg2_cov.sample();
  endfunction

  virtual function void sample_values();
    super.sample_values();
    reg2_cov.sample();
  endfunction
endclass

//================= reg3 =================//
class reg3 extends uvm_reg;
  `uvm_object_utils(reg3)
  rand uvm_reg_field reg3_field;

  covergroup reg3_cov;
    option.per_instance = 1;
    coverpoint reg3_field.value {
      bins low  = {[0:32'h1FFF_FFFF]};
      bins mid  = {[32'h2000_0000:32'h7FFF_FFFF]};
      bins high = {[32'h8000_0000:32'hFFFF_FFFF]};
    }
  endgroup

  function new(string name = "reg3");
    super.new(name, 32, UVM_CVR_FIELD_VALS);
    if (has_coverage(UVM_CVR_FIELD_VALS))
      reg3_cov = new();
  endfunction

  function void build;
    reg3_field = uvm_reg_field::type_id::create("reg3_field");
    reg3_field.configure(this, 32, 0, "RW", 0, 32'h5A5A_5555, 1, 1, 1);
  endfunction

  virtual function void sample(uvm_reg_data_t data,
                               uvm_reg_data_t byte_en,
                               bit is_read,
                               uvm_reg_map map);
    reg3_cov.sample();
  endfunction

  virtual function void sample_values();
    super.sample_values();
    reg3_cov.sample();
  endfunction
endclass

//================= reg4 =================//
class reg4 extends uvm_reg;
  `uvm_object_utils(reg4)
  rand uvm_reg_field reg4_field;

  covergroup reg4_cov;
    option.per_instance = 1;
    coverpoint reg4_field.value {
      bins low  = {[0:32'h1FFF_FFFF]};
      bins mid  = {[32'h2000_0000:32'h7FFF_FFFF]};
      bins high = {[32'h8000_0000:32'hFFFF_FFFF]};
    }
  endgroup

  function new(string name = "reg4");
    super.new(name, 32, UVM_CVR_FIELD_VALS);
    if (has_coverage(UVM_CVR_FIELD_VALS))
      reg4_cov = new();
  endfunction

  function void build;
    reg4_field = uvm_reg_field::type_id::create("reg4_field");
    reg4_field.configure(this, 32, 0, "RW", 0, 32'h0000_FFFF, 1, 1, 1);
  endfunction

  virtual function void sample(uvm_reg_data_t data,
                               uvm_reg_data_t byte_en,
                               bit is_read,
                               uvm_reg_map map);
    reg4_cov.sample();
  endfunction

  virtual function void sample_values();
    super.sample_values();
    reg4_cov.sample();
  endfunction
endclass

////REGBLOCK///

class reg_block extends uvm_reg_block;
  `uvm_object_utils(reg_block)

  rand ctrl c1;
  rand reg1 r1;
  rand reg2 r2;
  rand reg3 r3;
  rand reg4 r4;

  function new(string name = "reg_block");
    super.new(name, build_coverage(UVM_NO_COVERAGE));
  endfunction

  function void build;
    // Enable coverage for all fields
    uvm_reg::include_coverage("*", UVM_CVR_ALL);

    c1 = ctrl::type_id::create("c1");
    c1.build();
    c1.configure(this);
    c1.set_coverage(UVM_CVR_FIELD_VALS);
   // c1.add_hdl_path_slice("cntrl", 0, 4);

    r1 = reg1::type_id::create("r1");
    r1.build();
    r1.configure(this);
    r1.set_coverage(UVM_CVR_FIELD_VALS);
   // r1.add_hdl_path_slice("reg1", 0, 32);

    r2 = reg2::type_id::create("r2");
    r2.build();
    r2.configure(this);
    r2.set_coverage(UVM_CVR_FIELD_VALS);
  //  r2.add_hdl_path_slice("reg2", 0, 32);

    r3 = reg3::type_id::create("r3");
    r3.build();
    r3.configure(this);
    r3.set_coverage(UVM_CVR_FIELD_VALS);
 //   r3.add_hdl_path_slice("reg3", 0, 32);

    r4 = reg4::type_id::create("r4");
    r4.build();
    r4.configure(this);
    r4.set_coverage(UVM_CVR_FIELD_VALS);
  //  r4.add_hdl_path_slice("reg4", 0, 32);

    default_map = create_map("default_map", 0, 4, UVM_LITTLE_ENDIAN);
    default_map.add_reg(c1, 'h0, "RW");
    default_map.add_reg(r1, 'h4, "RW");
    default_map.add_reg(r2, 'h8, "RW");
    default_map.add_reg(r3, 'hc, "RW");
    default_map.add_reg(r4, 'h10, "RW");

  //  add_hdl_path("tb.DUT", "RTL");
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
