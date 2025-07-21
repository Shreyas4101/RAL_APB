class ral_scb extends uvm_scoreboard;
  `uvm_component_utils(ral_scb)

  uvm_analysis_imp#(ral_seq_item,ral_scb) sb2mon;
  bit [31:0] expected_mem [16];
  bit [7:0] temp;

  function new(string name = "ral_scb", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual function void  build_phase(uvm_phase phase);
    super.build_phase(phase);
    sb2mon=new("sb2mon",this);
  endfunction
  
  virtual function void write(ral_seq_item pkt);
    if (pkt.pwrite) begin
      expected_mem[pkt.paddr] = pkt.pwdata;
      `uvm_info("SCOREBOARD", $sformatf("WRITE: Addr = %0h, Data = %0h", pkt.paddr, pkt.pwdata), UVM_MEDIUM);
    end else begin
      if (expected_mem[pkt.paddr] !== pkt.prdata) begin
        `uvm_error("SCOREBOARD", $sformatf("Mismatch at Addr = %0h, Expected = %0h, Received = %0h", pkt.paddr, expected_mem[pkt.paddr], pkt.prdata));
      end else begin
        `uvm_info("SCOREBOARD", $sformatf("READ MATCH: Addr = %0h, Data = %0h", pkt.paddr, pkt.prdata), UVM_MEDIUM);
      end
    end
  endfunction
endclass


