class reg_seq extends uvm_sequence;
  `uvm_object_utils(reg_seq)
  reg_block regmodel;

  function new (string name = "reg_seq"); 
    super.new(name); 
  endfunction

  virtual task body; 
    uvm_status_e status;
    bit [7:0] rdata,rdata_m;

    ////////////////////////initial value
    rdata = regmodel.r1.get();
    rdata_m = regmodel.r1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Initial Value -> Desired Value : %0d and Mirrored Value : %0d", rdata, rdata_m),UVM_NONE);

    ////////////////// update desire value
    regmodel.r1.set(8'h11);


    ///////////////// get desire value
    rdata = regmodel.r1.get();
    rdata_m = regmodel.r1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After Set -> Desired Value : %0d and Mirrored Value : %0d", rdata, rdata_m), UVM_NONE);

    ///////////////// call write method 
    regmodel.r1.update(status);
    rdata = regmodel.r1.get();
    rdata_m = regmodel.r1.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("After Tx to DUT -> Desired Value : %0d and Mirrored Value : %0d", rdata, rdata_m),UVM_NONE);
  endtask
endclass
