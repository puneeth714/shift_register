`include "shift_register.v"
module shift_register_tb;
parameter WIDTH=8;
reg d,clk;
wire  [WIDTH-1:0]out;
shift_register  #(.WIDTH(WIDTH)) s1 (d,clk,out);
initial begin
    clk=0;
    d=0;
end
always #10 clk=!clk;
initial begin
    $monitor("%b",out);
    d=1;
    #100 d=0;
end
initial #20000 $finish;
endmodule