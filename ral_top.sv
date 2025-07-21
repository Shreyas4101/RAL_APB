`include "uvm_macros.svh"
 import uvm_pkg::*;
`include "ral_pkg.sv"

`include "design.v"
module tb;
  bit clk;
  bit rst;
  logic psel;
  logic penable;
  logic pwrite;
  logic [31:0] paddr;
  logic [31:0] pwdata;
  logic [31:0] prdata;
  //apb_slave DUT(.clk(clk),.rst(rst),.pwrite(pwrite),.paddr(paddr),.pwdata(pwdata),.prdata(prdata));
  
  top DUT(.pclk(pclk), .presetn(rst), .psel(psel), .penable(penable), .pwrite(pwrite), .paddr(paddr), .pwdata(pwdata), .prdata(prdata));
  //apb_slave DUT(.clk(PCLK),.rst(PRESETn),.psel(PSEL),.penable(PENABLE),.pwrite(PWRITE),.paddr(PADDR),.pwdata(PWDATA),.prdata(PRDATA));
  ral_interface vif(.pclk(pclk),.presetn(presetn));

  always #10 clk = ~clk;
  
  initial begin
   rst=0;
   #10 rst=1;
   #10 rst=0;
  end
  initial begin
  uvm_config_db#(virtual ral_interface.mp_drv)::set(null, "*", "vif", vif.mp_drv);
  uvm_config_db#(virtual ral_interface.mp_mon)::set(null, "*", "vif", vif.mp_mon);
  //$dumpfile("dump.vcd");
  //$dumpvars;
  end
  
  initial begin
  run_test("ral_test");  
  end
  
endmodule
