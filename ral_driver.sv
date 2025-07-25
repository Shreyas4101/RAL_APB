class ral_driver extends uvm_driver#(ral_seq_item);

  `uvm_component_utils(ral_driver)

  virtual ral_interface.mp_drv vif;
  ral_seq_item pkt;

  function new(string name = "ral_driver", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual ral_interface.mp_drv)::get(this, "", "vif", vif))
      `uvm_fatal(get_type_name(), "Unable to get virtual interface");
  endfunction

  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    vif.cb_drv.psel    <= 1'b0;
    vif.cb_drv.penable <= 1'b0;
    vif.cb_drv.pwrite  <= 1'b0;
    vif.cb_drv.paddr   <= 32'h0;
    vif.cb_drv.pwdata  <= 32'h0;

    forever begin
      seq_item_port.get_next_item(pkt); 
      drive();
      seq_item_port.item_done(); 
      `uvm_info("DRV", $sformatf("Transaction completed: %s", pkt.sprint()), UVM_LOW);
    end
  endtask

  task drive();
//    if(vif.presetn == 1'b1)
  //    begin
        if(pkt.pwrite == 1'b1)
          begin 
            @(vif.cb_drv);
            vif.cb_drv.pwrite  <= 1'b1;
            vif.cb_drv.psel    <= 1'b1;
            vif.cb_drv.paddr   <= pkt.paddr;
            vif.cb_drv.pwdata  <= pkt.pwdata;
            @(vif.cb_drv);
            vif.cb_drv.penable <= 1'b1; 
            `uvm_info("DRV", $sformatf("Wdata : %0h, Addr : %0h",vif.cb_drv.pwdata, vif.cb_drv.paddr),UVM_NONE);
            @(vif.cb_drv);
            vif.cb_drv.psel    <= 1'b0;
            vif.cb_drv.penable <= 1'b0;
          end
        else
          begin
            @(vif.cb_drv);
            vif.cb_drv.pwrite  <= 1'b0;
            vif.cb_drv.paddr   <= pkt.paddr;
            vif.cb_drv.psel    <= 1'b1;
            @(vif.cb_drv);
            vif.cb_drv.penable <= 1'b1; 
            `uvm_info("DRV", $sformatf("Rdata : %0h, Addr : %0h",vif.cb_drv.prdata, vif.cb_drv.paddr),UVM_NONE);
            @(vif.cb_drv);
            vif.cb_drv.psel    <= 1'b0;
            vif.cb_drv.penable <= 1'b0;
            pkt.prdata = vif.cb_drv.prdata; // Capture read data from DUT
          end
    //  end
  endtask

endclass
