module sigmoid(X,Y);
	parameter DATA_WIDTH = 32;
  	parameter FRACT_WIDTH = 23;
	
	input signed [DATA_WIDTH-1:0] X;
	output wire signed [DATA_WIDTH-1:0] Y;

	wire signed [DATA_WIDTH-1:0] abs_X;
	wire signed [DATA_WIDTH-1:0] point_five;
	wire signed [DATA_WIDTH-1:0] point_two_five;
	wire signed [DATA_WIDTH-1:0] mul_out;

	wire signed [DATA_WIDTH-1:0] a_alu,b_alu;

	assign abs_X = X[31]?{~X[31],X[30:0] }: X; 
	assign point_five=32'h3f000000;
	assign point_two_five=32'h3e800000;
	
	float_mul mul_pos(abs_X, point_two_five, mul_out);

	assign {a_alu,b_alu} = (X[31]) ? {point_five,mul_out} : {mul_out,point_five};	
	
	float_Addition_Subtraction alu(a_alu,b_alu ,X[31], Y);
	
endmodule