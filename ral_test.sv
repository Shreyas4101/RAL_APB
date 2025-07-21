  `uvm_component_utils(ral_test)

  function new(string name = "ral_test", uvm_component parent = null);
    super.new(name,parent);
  endfunction
  
  ral_env env;
  reg_seq rseq;

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = ral_env::type_id::create("env",this);
    rseq = reg_seq::type_id::create("rseq", this);
  endfunction

  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    rseq.regmodel = env.regmodel;
    rseq.start(env.agent.seqr);
    phase.drop_objection(this);
    phase.phase_done.set_drain_time(this, 20);
  endtask
endclass
/*
class reg_sequence_ral_test extends ral_test;
  `uvm_component_utils(reg_sequence_ral_test)
  function new(string name = "reg_sequence_ral_test",uvm_component parent = null);
    super.new(name,parent);
  endfunction

 //connect phase 
 virtual function void connect_phase(uvm_phase phase);
   super.connect_phase(phase);
 endfunction

 //end_of_elaboration phase
  virtual function void end_of_elaboration();
    print();
  endfunction
 
 //run phase 
  virtual task run_phase(uvm_phase phase);
    reg_seq rseq;
    phase.raise_objection(this);
    rseq = reg_seq::type_id::create("rseq");
    rseq.start(env.agent.seqr);
    phase.drop_objection(this);
    phase.phase_done.set_drain_time(this,100); 
  endtask 
endclass*/
