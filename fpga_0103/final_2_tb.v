module bin2gra_tb();
	parameter length = 8;
	wire [length-1:0]Gry;
	reg [length-1:0]Bin;
	reg clk;

	bin2gra bin2gra(.Gry(Gry), .Bin(Bin));

	initial
		begin
			Bin = 0;
			clk = 0;
		end

	always
		#5 clk = !clk;
	always@(posedge clk)
		Bin = Bin + 1;

endmodule