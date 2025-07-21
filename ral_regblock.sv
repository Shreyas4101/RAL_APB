class reg_block extends uvm_reg_block;
  `uvm_object_utils(reg_block)

  ctrl c1;
  reg1 r1;
  reg2 r2;
  reg3 r3;
  reg4 r4;

  function new(string name = "reg_block");
    super.new(name, UVM_NO_COVERAGE);
  endfunction

  function void build;
    c1 = ctrl::type_id::create("c1");
    c1.build();
    c1.configure(this);

    r1 = reg1::type_id::create("r1");
    r1.build();
    r1.configure(this);

    r2 = reg2::type_id::create("r2");
    r2.build();
    r2.configure(this);

    r3 = reg3::type_id::create("r3");
    r3.build();
    r3.configure(this);

    r4 = reg4::type_id::create("r4");
    r4.build();
    r4.configure(this);
    
    default_map = create_map("default_map", 0, 4, UVM_LITTLE_ENDIAN);
    default_map.add_reg(c1, 'h0, "RW");
    default_map.add_reg(r1, 'h4, "RW");
    default_map.add_reg(r2, 'h8, "RW");
    default_map.add_reg(r3, 'hc, "RW");
    default_map.add_reg(r4, 'h10, "RW");
    default_map.set_auto_predict(0);
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
