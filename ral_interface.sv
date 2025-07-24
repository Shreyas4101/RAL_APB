interface ral_interface(input logic pclk, input logic presetn);

  logic psel;
  logic penable;
  logic pwrite;
  logic [31:0] paddr;
  logic [31:0] pwdata;
  logic [31:0] prdata;

  clocking cb_drv @(posedge pclk);
    default input #0 output #0;
    input presetn;
    inout psel;
    inout penable;
    inout pwrite;
    inout paddr;
    inout pwdata;
    input prdata;
  endclocking

  clocking cb_mon @(posedge pclk);
    default input #0 output #0;
    input psel;
    input penable;
    input pwrite;
    input paddr;
    input pwdata;
    input prdata;
  endclocking

  modport mp_drv(clocking cb_drv, input pclk, presetn, prdata);
  modport mp_mon(clocking cb_mon, input pclk, presetn);

// ASSERTIONS

endinterface

