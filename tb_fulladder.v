module tb_add_sub();
reg [15:0] A, B; // Declaration of two four-bit inputs
reg sel; // and the one-bit input carry
wire [15:0] s; // Declaration of the five-bit outputs
wire  v;  // internal carry wires
add_sub DUT (V,s,cout,sel,A,B);

initial
begin
#10 A=16'b0000000000000000;B=16'b0000000100000001;sel=1'b0;
#10 A=16'b0000000100000001;B=16'b0000000100000001;sel=1'b1;
#10 A=16'b0000001000000010;B=16'b0000000100000001;sel=1'b0;
#10 A=16'b0011000100110001;B=16'b1100000111100001;sel=1'b1;
#10 A=16'b1111111011111110;B=16'b1111000111110001;sel=1'b0;
end
endmodule
