
module add_sub(V,s,cout,sel,A,B);
input [15:0] A, B; // Declaration of two four-bit inputs
input sel; // and the one-bit input carry
output [15:0] s; // Declaration of the five-bit outputs
output V,cout;  //overflow bit
wire [15:0] D;
wire [15:1] c;  // internal carry wires
assign V= c[15] ^ cout;  // carry 3 or 4 creates an overflow
//overflow indicates wrong output
assign D=B ^({sel,sel,sel,sel,sel,sel,sel,sel,sel,sel,sel,sel,sel,sel,sel,sel});
fulladder fa0(A[0],D[0],sel,s[0],c[1]);
fulladder fa1(A[1],D[1],c[1],s[1],c[2]);
fulladder fa2(A[2],D[2],c[2],s[2],c[3]);
fulladder fa3(A[3],D[3],c[3],s[3],c[4]);
fulladder fa4(A[4],D[4],c[4],s[4],c[5]);
fulladder fa5(A[5],D[5],c[5],s[5],c[6]);
fulladder fa6(A[6],D[6],c[6],s[6],c[7]);
fulladder fa7(A[7],D[7],c[7],s[7],c[8]);
fulladder fa8(A[8],D[8],c[8],s[8],c[9]);
fulladder fa9(A[9],D[9],c[9],s[9],c[10]);
fulladder fa10(A[10],D[10],c[10],s[10],c[11]);
fulladder fa11(A[11],D[11],c[11],s[11],c[12]);
fulladder fa12(A[12],D[12],c[12],s[12],c[13]);
fulladder fa13(A[13],D[13],c[13],s[13],c[14]);
fulladder fa14(A[14],D[14],c[14],s[14],c[15]);
fulladder fa15(A[15],D[15],c[15],s[15],cout);
endmodule




module fulladder(a,b,cin,sum,cout);
  input a,b,cin;
  output sum,cout;
  reg sum,cout;
  always @ (a or b or cin)
  begin
    sum <= a ^ b ^ cin;
    cout <= (a & b) | (a & cin) | (b & cin);
  end
endmodule