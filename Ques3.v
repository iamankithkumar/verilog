module Ques3 (out,zero,Data_in, Read_Addr_1, Read_Addr_2, Write_Addr, Write_Enable, Clock, Mux_ctrl,opcode);
output [31:0] out;
output zero;
input [31:0] Data_in;
input [4:0] Read_Addr_1, Read_Addr_2, Write_Addr;
input [2:0] opcode;
input Write_Enable,Clock,Mux_ctrl; 
wire [31:0] r2a1, r2a2, m2r;
mux_behav1 MUX(m2r,Data_in,out,Mux_ctrl);
Register_File1 RF(r2a1,r2a2,Data_in, Read_Addr_1, Read_Addr_2, Write_Addr, Write_Enable, Clock);
ALU1 ALU(out,zero,opcode,r2a1,r2a2);


endmodule
module mux_behav1(out, in1,in2,sel );  //you list all inputs and outputs, by convention outputs go first
output [31:0] out;                          // this tells the compile which lines are inputs and outputs 
input [31:0] in1,in2;
input sel;
reg [31:0] out;
always@(in1 or in2 or sel)
begin
	if (sel) 
out =in2;
           else	
	out=in1;
end

endmodule
module Register_File1 (Data_Out_1, Data_Out_2, Data_in, Read_Addr_1, Read_Addr_2, Write_Addr, Write_Enable, Clock); 
output [31: 0] Data_Out_1, Data_Out_2; 
input [31: 0] Data_in; 
input [4: 0] Read_Addr_1, Read_Addr_2, Write_Addr; 
input Write_Enable, Clock; 
reg [31: 0] Reg_File [31: 0]; //32bit x32 word memory declaration 
assign Data_Out_1 = Reg_File[Read_Addr_1]; 
assign Data_Out_2 = Reg_File[Read_Addr_2]; 
always @ (posedge Clock) begin 
if (Write_Enable) 
Reg_File[Write_Addr] <= Data_in; 
end 
endmodule 

module ALU1(Result,zero,opcode,A,B);
output[31:0] Result;
input [31:0] A,B;
input [2:0] opcode;
reg   [31:0] Result;
output zero;

always @ (opcode)
       case (opcode)
      3'd0:  Result <= A+B;
      3'd1:  Result <= A-B;
      3'd2:  Result <= A &B;
      3'd3:  Result <= A^B;
      3'd4:  Result <= A|B;
      3'd5:  Result <= A+1;
      3'd6:  Result <= A<<<B;
      3'd7:  Result <= A>>>B;
      default:	Result <= 32'd0;
    endcase
	assign zero = (Result == 32'b0);
endmodule

