`include "d_ff.v"
module shift_register #(parameter WIDTH=10)(d,clk,out);
input d,clk;
// output o;
output wire [WIDTH-1:0] out;

genvar i;
generate
for(i=0;i<WIDTH;i=i+1)
begin
    if(i==0)
    begin
        d_ff d1(d,clk,out[i]);
    end
    else
    begin
        d_ff d2(out[i-1],clk,out[i]);
        // initial begin
        // $display("once");
        // end
    end
end
endgenerate
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("shift_register.vcd");
  $dumpvars (0, shift_register);
  #1;
end
`endif
endmodule

