class fr2_test extends uvm_test;

`uvm_component_utils(fr2_test)

  function new(string name = "fr2_test", uvm_component parent = null);
    super.new(name,parent);
  endfunction

  ral_env env;
  fr2_seq seq;

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = ral_env::type_id::create("env",this);
    seq = fr2_seq::type_id::create("seq",this);
  endfunction

  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    seq.regmodel = env.regmodel;
    seq.start(env.agent.seqr);
    phase.drop_objection(this);
    phase.phase_done.set_drain_time(this, 20);
  endtask
endclass
