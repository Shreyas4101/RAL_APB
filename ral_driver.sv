class ral_driver extends uvm_driver#(ral_seq_item);
  `uvm_component_utils(ral_driver)

  virtual ral_interface.mp_drv vif;
  ral_seq_item pkt;

  function new(string name = "ral_driver", uvm_component parent = null);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    pkt = ral_seq_item::type_id::create("pkt", this);
    if(!uvm_config_db#(virtual ral_interface.mp_drv)::get(this,"","vif",vif))
    //  begin
        `uvm_fatal(get_type_name(), "Unable to get virtual interface");
     // end
  endfunction

  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever begin
      seq_item_port.get_next_item(pkt);
      drive();
   //   `uvm_info("APB_DRIVER",$sformatf("paddr=%d pwrite=%d psel=%d penable=%d pwdata=%d",req.paddr,req.pwrite,req.psel,req.penable,req.pwdata),UVM_LOW)
      seq_item_port.item_done();
$display("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
    end
  endtask

  task drive();
    //drive data
    @(vif.pclk);
    vif.cb_drv.paddr   <=  pkt.paddr;
    vif.cb_drv.pwrite  <=  pkt.pwrite;
    vif.cb_drv.psel    <=  pkt.psel;
    vif.cb_drv.penable <=  pkt.penable;
    if(vif.cb_drv.pwrite == 1'b1)begin
      vif.cb_drv.pwdata  <=  pkt.pwdata;
      `uvm_info("DRV", $sformatf("Data Write -> Wdata : %0d", pkt.pwdata), UVM_NONE);
     // repeat(3)@(vif.cb_drv);
    end
  //  else begin
  //    pkt.prdata <= vif.cb_drv.prdata;
  //  end
  `uvm_info("driver", $sformatf("-------------------DRIVER------------------"), UVM_LOW);
  pkt.print();
  `uvm_info("driver", $sformatf("---------------END OF DRIVER---------------"), UVM_LOW);
  endtask

endclass
