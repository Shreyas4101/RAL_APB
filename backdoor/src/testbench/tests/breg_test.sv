class breg_test extends uvm_test;

  `uvm_component_utils(breg_test)

  bctrl_seq seq1;
  br1_seq seq2; 
  br2_seq seq3;
  br3_seq seq4;
  br4_seq seq5;

  ral_env env;

  function new(string name = "breg_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction	

  //defining build phase
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = ral_env::type_id::create("env",this);

    seq1 = bctrl_seq::type_id::create("seq1", this);
    seq2 = br1_seq::type_id::create("seq2", this);
    seq3 = br2_seq::type_id::create("seq3", this);
    seq4 = br3_seq::type_id::create("seq4", this);
    seq5 = br4_seq::type_id::create("seq5", this);
    
  endfunction

  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    seq1.regmodel = env.regmodel;
    seq1.start(env.agent.seqr);
    phase.drop_objection(this);
    phase.phase_done.set_drain_time(this, 20);

    phase.raise_objection(this);
    seq2.regmodel = env.regmodel;
    seq2.start(env.agent.seqr);
    phase.drop_objection(this);
    phase.phase_done.set_drain_time(this, 20);

    phase.raise_objection(this);
    seq3.regmodel = env.regmodel;
    seq3.start(env.agent.seqr);
    phase.drop_objection(this);
    phase.phase_done.set_drain_time(this, 20);

    phase.raise_objection(this);
    seq4.regmodel = env.regmodel;
    seq4.start(env.agent.seqr);
    phase.drop_objection(this);
    phase.phase_done.set_drain_time(this, 20);

    phase.raise_objection(this);
    seq5.regmodel = env.regmodel;
    seq5.start(env.agent.seqr);
    phase.drop_objection(this);
    phase.phase_done.set_drain_time(this, 20);
 
  endtask

endclass
