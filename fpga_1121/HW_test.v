module HW_test;

// Signal declaration
	reg [3:0] a, b;
	reg Add, Sub, Inc, Switch;
	wire [3:0] c;

// MUX instance
	Func_AS Func_AS(a, b, Add, Sub, Inc, Switch, c);

// Apply Stimulus

initial
begin
  // ** Add stimulus here **
  	#10 begin a = 4'b1001; b = 4'b0010; Add = 1; Sub = 0; Inc = 0; Switch = 1; end
	#10 begin a = 4'b1001; b = 4'b0010; Add = 0; Sub = 1; Inc = 0; Switch = 1; end
	#10 begin a = 4'b1001; b = 4'b0010; Add = 0; Sub = 0; Inc = 0; Switch = 1; end
	#10 begin a = 4'b1001; b = 4'b0010; Add = 0; Sub = 0; Inc = 1; Switch = 1; end
	#10 begin a = 4'b1001; b = 4'b0010; Add = 1; Sub = 0; Inc = 0; Switch = 0; end
	#10 begin a = 4'b1001; b = 4'b0010; Add = 0; Sub = 1; Inc = 0; Switch = 0; end
	#10 begin a = 4'b1001; b = 4'b0010; Add = 0; Sub = 0; Inc = 0; Switch = 0; end
	#10 begin a = 4'b1001; b = 4'b0010; Add = 0; Sub = 0; Inc = 1; Switch = 0; end
  	#10 $finish;
  // ** Add stimulus here **
end


// Display Results

//  Waveform Record  
initial
begin
    $fsdbDumpfile("HW.fsdb"); // The FSDB Database
    $fsdbDumpvars(0, HW_test);

end



endmodule
