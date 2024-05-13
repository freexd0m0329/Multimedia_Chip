module mux16 #(parameter WIDTH=16) (
    input wire  [WIDTH - 1 : 0]    in0,    
    input wire  [WIDTH - 1 : 0]    in1,    
    input wire  [WIDTH - 1 : 0]    in2,    
    input wire  [WIDTH - 1 : 0]    in3,    
    input wire  [WIDTH - 1 : 0]    in4,    
    input wire  [WIDTH - 1 : 0]    in5,    
    input wire  [WIDTH - 1 : 0]    in6,    
    input wire  [WIDTH - 1 : 0]    in7,    
    input wire  [ 3: 0]        sel,    
    output reg  [WIDTH - 1 : 0]    mux_out    
  );

  always @(*) begin
    case(sel)
      4'b0000:    mux_out = in0;
      4'b0001:    mux_out = in1;
      4'b0010:    mux_out = in2;
      4'b0011:    mux_out = in3;
      4'b0100:    mux_out = in4;
      4'b0101:    mux_out = in5;
      4'b0110:    mux_out = in6;
      4'b0111:    mux_out = in7;
      default:    mux_out = 16'h0000;  
    endcase
  end
endmodule