/*
This Verilog code performs a 8-to-1 Multiplexer with WIDTH bit inputs.
Declare the module `mux16` with a parameter `WIDTH` which defaults to 16.
*/
module mux16 #(parameter WIDTH=16) (
    input wire  [WIDTH - 1 : 0]    in0,     // WIDTH bits data inputs in0
    input wire  [WIDTH - 1 : 0]    in1,     // WIDTH bits data inputs in1
    input wire  [WIDTH - 1 : 0]    in2,     // WIDTH bits data inputs in2
    input wire  [WIDTH - 1 : 0]    in3,     // WIDTH bits data inputs in3
    input wire  [WIDTH - 1 : 0]    in4,     // WIDTH bits data inputs in4
    input wire  [WIDTH - 1 : 0]    in5,     // WIDTH bits data inputs in5
    input wire  [WIDTH - 1 : 0]    in6,     // WIDTH bits data inputs in6
    input wire  [WIDTH - 1 : 0]    in7,     // WIDTH bits data inputs in7
    input wire  [ 3: 0]        sel,         // 4-bits data inputs sel
    output reg  [WIDTH - 1 : 0]    mux_out  // WIDTH bits data output with register mux_out
  );

  always @(*) begin                         // Combinational block trigger whenever any of inpus changes
    case(sel)                               // Case statement decides output selection base on the value of sel signal (all value in binary format)
      4'b0000:    mux_out = in0;            // When sel is 0, output will take the vaule of input signal in0
      4'b0001:    mux_out = in1;            // When sel is 1, output will take the vaule of input signal in1
      4'b0010:    mux_out = in2;            // When sel is 2, output will take the vaule of input signal in2
      4'b0011:    mux_out = in3;            // When sel is 3, output will take the vaule of input signal in3
      4'b0100:    mux_out = in4;            // When sel is 4, output will take the vaule of input signal in4
      4'b0101:    mux_out = in5;            // When sel is 5, output will take the vaule of input signal in5
      4'b0110:    mux_out = in6;            // When sel is 6, output will take the vaule of input signal in6
      4'b0111:    mux_out = in7;            // When sel is 7, output will take the vaule of input signal in7
      default:    mux_out = 16'h0000;       // Set default state when there is any other state of sel will set output to 0
    endcase                                 
  end                                       
endmodule                                   