class ral_env extends uvm_env;

  `uvm_component_utils(ral_env)

  function new(string name = "ral_env",uvm_component parent);
    super.new(name,parent);
  endfunction

  ral_agent agent;
  ral_scb sb;
  reg_block regmodel;
  ral_adapter adapter;

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agent = ral_agent::type_id::create("agent",this);
    //cov = ral_cov::type_id::create("cov",this);
    regmodel = reg_block::type_id::create("regmodel", this);
    regmodel.build();
    adapter = ral_adapter::type_id::create("adapter",this);
    sb = ral_scb::type_id::create("sb",this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    agent.mon.mon2sb_cov.connect(sb.sb2mon);
    regmodel.default_map.set_sequencer( .sequencer(agent.seqr), .adapter(adapter) );
    regmodel.default_map.set_base_addr(0);
    //regmodel.default_map.set_auto_predict(1);
  endfunction

endclass
