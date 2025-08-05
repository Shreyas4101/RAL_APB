/*class freg_test extends uvm_test;

`uvm_component_utils(freg_test)

  function new(string name = "freg_test", uvm_component parent = null);
    super.new(name,parent);
  endfunction

  ral_env env;
  freg_seq seq;

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = ral_env::type_id::create("env",this);
    seq = freg_seq::type_id::create("seq",this);
  endfunction

  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    seq.regmodel = env.regmodel;
    seq.start(env.agent.seqr);
    phase.drop_objection(this);
    phase.phase_done.set_drain_time(this, 20);
  endtask
endclass*/


class freg_test extends uvm_test;

  `uvm_component_utils(freg_test)

  rst1_seq seq1;
  rst2_seq seq2;
  rst3_seq seq3;
  rst4_seq seq4;
  fr1_seq seq5; 
  fr2_seq seq6;
  fr3_seq seq7;
  fr4_seq seq8;

  ral_env env;

  /*
  apb_slave_toggle slave_toggle_pkt;

  apb_transfer_invalid transfer_invalid_pkt;*/

  function new(string name = "freg_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction	

  //defining build phase
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = ral_env::type_id::create("env",this);


    seq1 = rst1_seq::type_id::create("seq5", this);
    seq2 = rst2_seq::type_id::create("seq6", this);
    seq3 = rst3_seq::type_id::create("seq8", this);
    seq4 = rst4_seq::type_id::create("seq7", this);
    seq5 = fr1_seq::type_id::create("seq1", this);
    seq6 = fr2_seq::type_id::create("seq2", this);
    seq7 = fr3_seq::type_id::create("seq3", this);
    seq8 = fr4_seq::type_id::create("seq4", this);
    
    /*
    slave_toggle_pkt     = apb_slave_toggle::type_id::create("slave_toggle_pkt", this);
    transfer_invalid_pkt = apb_transfer_invalid::type_id::create("transfer_invalid_pkt", this);*/
  endfunction

  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    seq1.regmodel = env.regmodel;
    seq1.start(env.agent.seqr);
    phase.drop_objection(this);
    phase.phase_done.set_drain_time(this, 20);
  endtask

  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    seq2.regmodel = env.regmodel;
    seq2.start(env.agent.seqr);
    phase.drop_objection(this);
    phase.phase_done.set_drain_time(this, 20);
  endtask

  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    seq3.regmodel = env.regmodel;
    seq3.start(env.agent.seqr);
    phase.drop_objection(this);
    phase.phase_done.set_drain_time(this, 20);
  endtask

  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    seq4.regmodel = env.regmodel;
    seq4.start(env.agent.seqr);
    phase.drop_objection(this);
    phase.phase_done.set_drain_time(this, 20);
  endtask
  
    virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    seq5.regmodel = env.regmodel;
    seq5.start(env.agent.seqr);
    phase.drop_objection(this);
    phase.phase_done.set_drain_time(this, 20);
  endtask

  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    seq6.regmodel = env.regmodel;
    seq6.start(env.agent.seqr);
    phase.drop_objection(this);
    phase.phase_done.set_drain_time(this, 20);
  endtask

  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    seq7.regmodel = env.regmodel;
    seq7.start(env.agent.seqr);
    phase.drop_objection(this);
    phase.phase_done.set_drain_time(this, 20);
  endtask

  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    seq8.regmodel = env.regmodel;
    seq8.start(env.agent.seqr);
    phase.drop_objection(this);
    phase.phase_done.set_drain_time(this, 20);
  endtask

endclass
