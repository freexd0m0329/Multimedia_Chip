module bin2gra(Gry, Bin);
	parameter length = 8;
	output [length-1:0] Gry;
	input [length-1:0] Bin;
	reg [length-1:0] Gry;
	integer i;
	always@(Bin)
		begin
			for(i = 0;i < length - 1;i = i + 1)
			begin
				Gry[i] = Bin[i] ^ Bin[i+1];
				Gry[i] = Bin[i];
			end
		end
endmodule