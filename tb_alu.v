module tb_ALU2();
  wire[15:0] Result;
  reg [15:0] A,B;
  reg [2:0] opcode;
 
  ALU2 DUT (Result,opcode,A,B);

  initial 
  begin
  #0 A=16'd0; B=16'd0; opcode=3'b000;
  #5 A=16'd1; B=16'd3; opcode=3'b001;
  #5 A=16'd3; B=16'd4; opcode=3'b010;
  #5 A=16'd10; B=16'd10; opcode=3'b011;
  #5 A=16'd15; B=16'd1; opcode=3'b100;
  #5 A=16'd20; B=16'd20; opcode=3'b101;
  #5 A=16'd34; B=16'd5; opcode=3'b110;
  #5 A=16'd255; B=16'd0; opcode=3'b111;
  #5 A=16'd15; B=16'd1; opcode=3'b000;
  #5 A=16'd200; B=16'd61; opcode=3'b000;
  end
  endmodule