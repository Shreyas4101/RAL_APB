class ral_env extends uvm_env;

  `uvm_component_utils(ral_env)

  function new(string name = "ral_env",uvm_component parent);
    super.new(name,parent);
  endfunction

  ral_agent agent;
  ral_scb sb;
  reg_block regmodel;
  ral_adapter adapter_inst;
  //uvm_reg_predictor #(ral_seq_item) predictor_inst;  

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agent = ral_agent::type_id::create("agent",this);
    //cov = ral_cov::type_id::create("cov",this);
    regmodel = reg_block::type_id::create("regmodel", this);
    regmodel.build();
    adapter_inst = ral_adapter::type_id::create("adapter_inst",this);
    sb = ral_scb::type_id::create("sb",this);
    //predictor_inst = uvm_reg_predictor#(ral_seq_item) :: type_id :: create("predictor_inst", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    agent.mon.mon2sb_cov.connect(sb.sb2mon);
    regmodel.default_map.set_sequencer( .sequencer(agent.seqr), .adapter(adapter_inst) );
    regmodel.default_map.set_base_addr(0);

 //   predictor_inst.map = regmodel.default_map;
 //   predictor_inst.adapter = adapter_inst;

//    agent.mon.mon_ap.connect(predictor_inst.bus_in);
//    regmodel.default_map.set_auto_predict(0);

  endfunction

endclass
