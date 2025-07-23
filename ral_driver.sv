/*class ral_driver extends uvm_driver#(ral_seq_item);
  `uvm_component_utils(ral_driver)

  virtual ral_interface.mp_drv vif;
  ral_seq_item pkt;

  function new(string name = "ral_driver", uvm_component parent = null);
    super.new(name,parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual ral_interface.mp_drv)::get(this,"","vif",vif))
    //  begin
        `uvm_error("drv", "Unable to get virtual interface");
     // end
  endfunction

  virtual task run_phase(uvm_phase phase); 
    pkt = ral_seq_item::type_id::create("pkt", this);
    super.run_phase(phase);
    forever begin
      seq_item_port.get_next_item(pkt);
      drive();
   //   `uvm_info("APB_DRIVER",$sformatf("paddr=%d pwrite=%d psel=%d penable=%d pwdata=%d",req.paddr,req.pwrite,req.psel,req.penable,req.pwdata),UVM_LOW)
      seq_item_port.item_done();
    end
  endtask

  task drive();
    //drive data
    @( vif.cb_drv);
    vif.cb_drv.paddr   <=  pkt.paddr;
    vif.cb_drv.pwrite  <=  pkt.pwrite;
    vif.cb_drv.psel    <=  pkt.psel;
    vif.cb_drv.penable <=  pkt.penable;
    if(pkt.pwrite == 1'b1)begin
      vif.cb_drv.pwdata  <=  pkt.pwdata;
    `uvm_info("DRV", $sformatf("Data Write -> Wdata : %0d", pkt.pwdata), UVM_NONE);
     // repeat(3)@(vif.cb_drv);
    end
  /*  else begin
  //    pkt.prdata <= vif.cb_drv.prdata;
  //  end
  `uvm_info("driver", $sformatf("-------------------DRIVER------------------"), UVM_LOW);
  pkt.print();
  `uvm_info("driver", $sformatf("---------------END OF DRIVER---------------"), UVM_LOW);
 
   endtask

endclass
*/

class ral_driver extends uvm_driver#(ral_seq_item);
  uvm_component_utils(ral_driver)

  virtual ral_interface.mp_drv vif;
  ral_seq_item pkt;

  function new(string name = "ral_driver", uvm_component parent = null);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    // pkt is created inside run_phase for each transaction
    if(!uvm_config_db#(virtual ral_interface.mp_drv)::get(this,"","vif",vif))
      uvm_fatal(get_type_name(), "Unable to get virtual interface");
  endfunction

  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    // Initialize interface signals to idle state
    vif.cb_drv.psel    <= 1'b0;
    vif.cb_drv.penable <= 1'b0;
    vif.cb_drv.pwrite  <= 1'b0;
    vif.cb_drv.paddr   <= 32'h0;
    vif.cb_drv.pwdata  <= 32'h0;

    forever begin
      seq_item_port.get_next_item(pkt); // Get transaction from sequencer

      if (pkt.pwrite == 1'b1) begin
        drive_write();
      end else begin
        drive_read();
      end

      seq_item_port.item_done(); // Notify sequencer that item is done
      uvm_info("DRV", $sformatf("Transaction completed: %s", pkt.sprint()), UVM_LOW);
    end
  endtask

  // Task to drive a write transaction
  task drive_write();
    @(vif.pclk); // Wait for positive clock edge

    // Drive address, write data, and control signals
    vif.cb_drv.paddr   <= pkt.paddr;
    vif.cb_drv.pwdata  <= pkt.pwdata;
    vif.cb_drv.pwrite  <= 1'b1;
    vif.cb_drv.psel    <= 1'b1;
    vif.cb_drv.penable <= 1'b1; // Assert penable in the same cycle as psel

    uvm_info("DRV", $sformatf("Driving Write: ADDR=0x%0h, WDATA=0x%0h", pkt.paddr, pkt.pwdata), UVM_MEDIUM);

    @(vif.pclk); // Wait for one clock cycle for the transaction to complete

    // De-assert control signals
    vif.cb_drv.psel    <= 1'b0;
    vif.cb_drv.penable <= 1'b0;
    vif.cb_drv.pwrite  <= 1'b0; // Return pwrite to default

    uvm_info("DRV", $sformatf("Write Cycle Done."), UVM_HIGH);
  endtask

  // Task to drive a read transaction
  task drive_read();
    @(vif.pclk); // Wait for positive clock edge

    // Drive address and control signals for read
    vif.cb_drv.paddr   <= pkt.paddr;
    vif.cb_drv.pwrite  <= 1'b0;
    vif.cb_drv.psel    <= 1'b1;
    vif.cb_drv.penable <= 1'b1; // Assert penable in the same cycle as psel
    vif.cb_drv.pwdata  <= 32'hX; // pwdata is don't care for read

    uvm_info("DRV", $sformatf("Driving Read: ADDR=0x%0h", pkt.paddr), UVM_MEDIUM);

    @(vif.pclk); // Wait for one clock cycle for the transaction to complete

    // Capture read data from DUT
    pkt.prdata = vif.cb_drv.prdata;
    uvm_info("DRV", $sformatf("Read Data Received: RDATA=0x%0h", pkt.prdata), UVM_MEDIUM);

    // De-assert control signals
    vif.cb_drv.psel    <= 1'b0;
    vif.cb_drv.penable <= 1'b0;

    uvm_info("DRV", $sformatf("Read Cycle Done."), UVM_HIGH);
  endtask

endclass
