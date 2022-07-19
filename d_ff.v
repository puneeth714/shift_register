module d_ff(d,clk,q);
input d,clk;
output reg q;
always @(posedge clk) 
begin
case (d)
1'b0: q<=0;
1'b1: q<=1;
default: q<=0;
endcase
end
endmodule
