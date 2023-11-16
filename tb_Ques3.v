module tb_Ques3();
 
wire [31:0] out;
  reg [31:0] Data_in;
reg [4:0] Read_Addr_1,Read_Addr_2,Write_Addr;
reg [2:0] opcode; 
reg Write_Enable, Clock=0, Mux_ctrl;

always #20 Clock = ~Clock;
  Ques3 DUT (out,zero,Data_in, Read_Addr_1, Read_Addr_2, Write_Addr, Write_Enable, Clock, Mux_ctrl,opcode);
  //Register_File register (Data_Out_1, Data_Out_2, Data_in, Read_Addr_1, Read_Addr_2, Write_Addr, Write_Enable, Clock);
  //ALU arithmatic (Result,zero,opcode,A,B);
  //mux_behav multiplexer (out,in1,in2,sel);

  initial 
  begin
  #0 Data_in=32'd2; Read_Addr_1=32'd0; Read_Addr_2=32'd0; Write_Addr=32'd0; Write_Enable=1'b1; Mux_ctrl=1'b0; opcode=3'b000; 
  #20 Data_in=32'd3; Read_Addr_1=32'd0; Read_Addr_2=32'd0; Write_Addr=32'd1; Write_Enable=1'b1; Mux_ctrl=1'b0; opcode=3'b000;
  #20 Data_in=32'd2; Read_Addr_1=32'd0; Read_Addr_2=32'd1; Write_Addr=32'd0; Write_Enable=1'b1; Mux_ctrl=1'b1; opcode=3'b000;

  end
  endmodule

