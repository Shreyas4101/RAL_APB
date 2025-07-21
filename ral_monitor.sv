class ral_mon extends uvm_monitor;
  `uvm_component_utils(ral_mon)

  virtual ral_interface.mp_mon vif;
  uvm_analysis_port #(ral_seq_item) mon2sb_cov;
  ral_seq_item pkt;

  function new(string name = "ral_mon", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    mon2sb_cov = new("mon2sb_cov", this);
    if(!uvm_config_db#(virtual ral_interface.mp_mon)::get(this, "", "vif", vif))
      `uvm_error("monitor", "Unable to get virtual interface")
  endfunction

  virtual task run_phase(uvm_phase phase);
    pkt = ral_seq_item::type_id::create("pkt");
    forever begin
    repeat(3) @(vif.pclk);
     // @(vif.cb_mon) begin
      $display("-------------monitor begin----------");
      pkt.paddr    =   vif.cb_mon.paddr;
      pkt.pwrite   =   vif.cb_mon.pwrite;
      pkt.psel     =   vif.cb_mon.psel;
      pkt.penable  =   vif.cb_mon.penable;
      pkt.pwdata   =   vif.cb_mon.pwdata;
      pkt.prdata   =   vif.cb_mon.prdata;

      mon2sb_cov.write(pkt);

      `uvm_info("output monitor", $sformatf("--------------OUTPUT MONITOR---------------"), UVM_LOW);
      pkt.print();
      `uvm_info("output monitor", $sformatf("----------END OF OUTPUT MONITOR------------"), UVM_LOW);
     // @(vif.cb_mon);
     // @(vif.cb_mon);
     // @(vif.cb_mon);
     // end
    end
  endtask

endclass
