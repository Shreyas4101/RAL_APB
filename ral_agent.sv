class ral_agent extends uvm_agent;

  `uvm_component_utils(ral_agent)

  ral_driver drv;
  //ral_sequencer seqr;
  ral_mon mon;
  uvm_sequencer#(ral_seq_item) seqr;

  function new(string name = "ral_agent", uvm_component parent= null);
    super.new(name, parent);
  endfunction 

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    drv = ral_driver::type_id::create("drv", this);
    //seqr = ral_sequencer::type_id::create("seqr", this);
    mon = ral_mon::type_id::create("mon", this);
    seqr = uvm_sequencer#(ral_seq_item)::type_id::create("seqr", this);
  endfunction 

  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    drv.seq_item_port.connect(seqr.seq_item_export);
  endfunction 

endclass
