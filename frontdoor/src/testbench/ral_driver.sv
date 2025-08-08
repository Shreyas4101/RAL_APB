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
           // vif.presetn <= 1'b1;
            vif.cb_drv.pwrite  <= 1'b1;
            vif.cb_drv.psel    <= 1'b1;
            vif.cb_drv.paddr   <= pkt.paddr;
            vif.cb_drv.pwdata  <= pkt.pwdata;
            repeat(1)@(vif.cb_drv);
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
            repeat(1)@(vif.cb_drv);
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

/*
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
    // Initialize bus signals to a safe state at the start of simulation
    // This should ideally be done in connect_phase or pre_reset/reset sequence if your DUT requires it
    // vif.presetn should be controlled by the testbench top, not the driver generally
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
    if(pkt.pwrite == 1'b1) begin // Write Transaction
      // Cycle 1 (SETUP Phase)
      @(vif.cb_drv); // Wait for the positive clock edge
      vif.cb_drv.psel    <= 1'b1;
      vif.cb_drv.pwrite  <= 1'b1;
      vif.cb_drv.paddr   <= pkt.paddr;
      vif.cb_drv.pwdata  <= pkt.pwdata;
      vif.cb_drv.penable <= 1'b0; // Ensure penable is low in setup phase

      // Cycle 2 (ACCESS Phase)
      @(vif.cb_drv); // Wait for the next positive clock edge
      vif.cb_drv.penable <= 1'b1; // Assert penable
      `uvm_info("DRV", $sformatf("APB Write: Addr=0x%0h, Data=0x%0h", vif.cb_drv.paddr, vif.cb_drv.pwdata), UVM_NONE);

      // Cycle 3 (IDLE Phase / Transaction Completion)
      @(vif.cb_drv); // Wait for the next positive clock edge
      vif.cb_drv.psel    <= 1'b0;    // De-assert psel
      vif.cb_drv.penable <= 1'b0; // De-assert penable (can be done earlier for a single transaction)

    end else begin // Read Transaction
      // Cycle 1 (SETUP Phase)
      @(vif.cb_drv); // Wait for the positive clock edge
      vif.cb_drv.psel    <= 1'b1;
      vif.cb_drv.pwrite  <= 1'b0;
      vif.cb_drv.paddr   <= pkt.paddr;
      vif.cb_drv.penable <= 1'b0; // Ensure penable is low in setup phase
      vif.cb_drv.pwdata  <= 32'hX; // Drive X for write data on reads (best practice)

      // Cycle 2 (ACCESS Phase)
      @(vif.cb_drv); // Wait for the next positive clock edge
      vif.cb_drv.penable <= 1'b1; // Assert penable
      // prdata is valid from DUT AFTER this clock edge (i.e., in the subsequent @(vif.cb_drv))
      `uvm_info("DRV", $sformatf("APB Read Request: Addr=0x%0h", vif.cb_drv.paddr), UVM_NONE);

      // Cycle 3 (READ DATA VALID Phase / IDLE Phase)
      @(vif.cb_drv); // Wait for the next positive clock edge. prdata is now stable.
      pkt.prdata = vif.cb_drv.prdata; // Capture read data from DUT

      vif.cb_drv.psel    <= 1'b0;    // De-assert psel
      vif.cb_drv.penable <= 1'b0; // De-assert penable

      `uvm_info("DRV", $sformatf("APB Read Response: Data=0x%0h", pkt.prdata, vif.cb_drv.paddr), UVM_NONE);
    end
  endtask

endclass

*/
