`include "uvm_macros.svh"
 import uvm_pkg::*;
`include "ral_pkg.sv"

`include "../rtl/design.v"
module tb;
  bit pclk;
  bit presetn;
  logic psel;
  logic penable;
  logic pwrite;
  logic [31:0] paddr;
  logic [31:0] pwdata;
  logic [31:0] prdata;
  //apb_slave DUT(.clk(clk),.presetn(presetn),.pwrite(pwrite),.paddr(paddr),.pwdata(pwdata),.prdata(prdata));
  
  top DUT(.pclk(vif.pclk), .presetn(vif.presetn), .psel(vif.psel), .penable(vif.penable), .pwrite(vif.pwrite), .paddr(vif.paddr), .pwdata(vif.pwdata), .prdata(vif.prdata));
  //apb_slave DUT(.clk(PCLK),.presetn(PRESETn),.psel(PSEL),.penable(PENABLE),.pwrite(PWRITE),.paddr(PADDR),.pwdata(PWDATA),.prdata(PRDATA));
  ral_interface vif(.pclk(pclk),.presetn(presetn));

  always #10 pclk = ~pclk;
  
  initial begin
   presetn=0;
  // #10 presetn=1;
    presetn=0;
   #10 presetn = 1;
  end
  initial begin
  uvm_config_db#(virtual ral_interface.mp_drv)::set(null, "*", "vif", vif.mp_drv);
  uvm_config_db#(virtual ral_interface.mp_mon)::set(null, "*", "vif", vif.mp_mon);
  //$dumpfile("dump.vcd");
  //$dumpvars;
  end
  
  initial begin
  run_test("fr2_test");  
  end
  
endmodule
