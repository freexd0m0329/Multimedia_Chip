
module STI_DAC(clk ,reset, load, pi_data, pi_length, pi_fill, pi_msb, pi_low, pi_end,
           so_data, so_valid,
           oem_finish, oem_dataout, oem_addr,
           odd1_wr, odd2_wr, odd3_wr, odd4_wr, even1_wr, even2_wr, even3_wr, even4_wr);

input       clk, reset;
input       load, pi_msb, pi_low, pi_end; 
input   [15:0]  pi_data;
input   [1:0]   pi_length;
input       pi_fill;
output  reg so_data, so_valid;

output reg oem_finish, odd1_wr, odd2_wr, odd3_wr, odd4_wr, even1_wr, even2_wr, even3_wr, even4_wr;
output reg[4:0] oem_addr;
output reg[7:0] oem_dataout;
//----------------------------------------------
reg [5:0]counter1;
reg [5:0]counter2;
reg [5:0]counter3;
reg [4:0]counter4;
reg [4:0]counter5;
reg [7:0]memory;
reg [8:0]addr;
reg [5:0]row;
reg [8:0]col; 
reg [2:0]num1;
reg [2:0]num2;
//==============================================================================

always@(posedge clk)
begin
    if (reset)
	begin
    so_data <= 1'b0;
    so_valid <= 1'b0;
    oem_finish <= 1'b0;
    odd1_wr <= 1'b0;
    odd2_wr <= 1'b0;
    odd3_wr <= 1'b0;
    odd4_wr <= 1'b0;
    even1_wr <= 1'b0;
    even2_wr <= 1'b0;
    even3_wr <= 1'b0;
    even4_wr <= 1'b0;
    oem_addr <= 5'b0;
    oem_dataout <= 8'b0;
    counter3 <= 6'b000111;
    counter4 <= 5'b0;
    counter5 <= 5'b0;
    row <= 6'b0;
    col <= 4'b0;
    addr <= 9'b0;
    num1 <= 3'b0;
    num2 <= 3'b0;
	end
	else
	begin
	
    if (load)
    begin   
    so_data <= 1'b0;
    counter1 <= 6'b100000;
    counter2 <= 6'b000000;
    end
//--------------------------load == 0
    else
    begin
        case (pi_length)
        2'b00:begin //-------------------------------------8bit
            if (pi_low == 1 && pi_msb == 1)
            begin
                if (counter1 >= 25)
                begin
                so_data <= pi_data[counter1 - 17];
                counter1 <= counter1 - 1;
                so_valid <= 1;
                end
                else
                so_valid <= 0;

            end
            else if (pi_low == 1 && pi_msb == 0) 
            begin
                if (counter2 <= 7)
                begin
                so_data <= pi_data[counter2 + 8];
                counter2 <= counter2 + 1;
                so_valid <= 1;
                end
                else
                so_valid <= 0;
            end
            else if (pi_low == 0 && pi_msb == 1) 
            begin
                if (counter1 >= 25)
                begin
                so_data <= pi_data[counter1 - 25];
                counter1 <= counter1 - 1;
                so_valid <= 1;
                end
                else
                so_valid <= 0;
            end
            else if (pi_low == 0 && pi_msb == 0) 
            begin
                if (counter2 <= 6'b000111)
                begin
                so_data <= pi_data[counter2];
                counter2 <= counter2 + 1;
                so_valid <= 1;
                end
                else
                so_valid <= 0;
            end
			else
				oem_dataout <= oem_dataout;
            end
        2'b01:begin //-------------------------------------16bit
            if (pi_msb == 1)
            begin
                if (counter1 >= 17)
                begin
                so_data <= pi_data[counter1 - 17];
                counter1 <= counter1 - 1;
                so_valid <= 1;
                end
                else
                so_valid <= 0;  
            end     
            else
            begin
                if (counter2 <= 15)
                begin
                so_data <= pi_data[counter2];
                counter2 <= counter2 + 1;
                so_valid <= 1;
                end
                else
                so_valid <= 0;  
            end 
            end     
        2'b10:begin //-------------------------------------24bit
            if (pi_fill == 1 && pi_msb == 1)
            begin
                if (counter1 > 8 && counter1 >= 17)
                begin
                so_data <= pi_data[counter1 - 17];
                counter1 <= counter1 - 1;
                so_valid <= 1;
                end
                else if (counter1 > 8 && counter1 < 17)
                begin
                so_data <= 1'b0;
                counter1 <= counter1 - 1;
                so_valid <= 1;
                end
                else 
                so_valid <= 0;
            end
            else if (pi_fill == 1 && pi_msb == 0)
            begin
                if (counter2 <= 23 && counter2 <= 7)
                begin
                so_data <= 1'b0;
                counter2 <= counter2 + 1;
                so_valid <= 1;
                end
                else if (counter2 <= 23 && counter2 > 7)
                begin
                so_data <= pi_data[counter2 - 8];
                counter2 <= counter2 + 1;
                so_valid <= 1;
                end
                else
                so_valid <= 0;
            end
            else if (pi_fill == 0 && pi_msb == 1)
            begin
                if (counter1 > 8 && counter1 >=25)
                begin
                so_data <= 1'b0;
                counter1 <= counter1 - 1;
                so_valid <= 1;
                end
                else if (counter1 > 8 && counter1 < 25) 
                begin
                so_data <= pi_data[counter1 - 9];
                counter1 <= counter1 - 1;
                so_valid <= 1;
                end
                else 
                so_valid <= 0;
            end
            else if (pi_fill == 0 && pi_msb == 0)
            begin
                if (counter2 <= 23 && counter2 <= 15)
                begin
                so_data <= pi_data[counter2];
                counter2 <= counter2 + 1;
                so_valid <= 1;
                end
                else if (counter2 <= 23 && counter2 > 15)
                begin
                so_data <= 1'b0;
                counter2 <= counter2 + 1;
                so_valid <= 1;
                end
                else
                so_valid <= 0;
            end
			else
				oem_dataout <= oem_dataout;
            end
        2'b11:begin //-------------------------------------32bit
            if (pi_fill == 1 && pi_msb == 1)
            begin
                if (counter1 > 0 && counter1 >= 17)
                begin
                so_data <= pi_data[counter1 - 17];
                counter1 <= counter1 - 1;
                so_valid <= 1;
                end
                else if (counter1 > 0 && counter1 < 17)
                begin
                so_data <= 1'b0;
                counter1 <= counter1 - 1;
                so_valid <= 1;
                end
                else
                so_valid <= 0;
            end
            else if (pi_fill == 1 && pi_msb == 0)
            begin
                if (counter2 <= 31 && counter2 <= 15)
                begin
                so_data <= 1'b0;
                counter2 <= counter2 + 1;
                so_valid <= 1;
                end
                else if (counter2 <= 31 && counter2 > 15)
                begin
                so_data <= pi_data[counter2 - 16];
                counter2 <= counter2 + 1;
                so_valid <= 1;
                end
                else
                so_valid <= 0;
            end
            else if (pi_fill == 0 && pi_msb == 1)
            begin
                if (counter1 > 0 && counter1 > 16)
                begin
                so_data <= 1'b0;
                counter1 <= counter1 - 1;
                so_valid <= 1;
                end
                else if (counter1 > 0 && counter1 <= 16)
                begin
                so_data <= pi_data[counter1 - 1];
                counter1 <= counter1 - 1;
                so_valid <= 1;
                end
                else
                so_valid <= 0;
            end
            else if (pi_fill == 0 && pi_msb == 0)
            begin
                if (counter2 <= 31 && counter2 <= 15)
                begin
                so_data <= pi_data[counter2];
                counter2 <= counter2 + 1;
                so_valid <= 1;
                end
                else if (counter2 <= 31 && counter2 > 15)
                begin
                so_data <= 1'b0;
                counter2 <= counter2 + 1;
                so_valid <= 1;
                end
                else
                so_valid <= 0;
            end
			else
				oem_dataout <= oem_dataout;
            end
        default:begin
                so_data <= 1'b0;
                so_valid <= 1'b0;
            end
        endcase

    end 
//--------------------------------------------memory
            if(so_valid)
            begin       
                memory[counter3] <= so_data;
                if (counter3 > 0)
                counter3 <= counter3 - 1;              
                else
                begin
                	counter3 <= 7; 
            	col <= col + 1;		
                	if (col == 8) 
            	begin
           	 	col <= 1;        
                	row <= row +1;
            	end
            	end
            end
            else if  ((pi_end == 1) && (so_valid == 0) && (so_data == 1))
            begin
                memory[counter3] <= 1'b0;
                if (counter3 > 0)        
                counter3 <= counter3 - 1;              
                else
                begin
                	counter3 <= 7; 
            	col <= col + 1;
                	if (col == 8)   
            	begin
            	col <= 1;      
                	row <= row +1;
            	end
            	end              
            end
			else
				oem_dataout <= oem_dataout;
                   
       

    if (counter3 == 1)
    begin
    odd1_wr <= 0;
    odd2_wr <= 0;
    odd3_wr <= 0;
    odd4_wr <= 0;
    even1_wr <= 0;
    even2_wr <= 0;
    even3_wr <= 0;
    even4_wr <= 0;
    end 
    else if (counter3 == 7)
    begin
    oem_dataout <= memory;
    end
//-----------------------------------------------------------------odd & even
//-------------------------------------------------------
    else if(counter3 == 6 && col > 0)
    begin
                    case(num1)
                    3'b000:begin
                        if (row[0]== 0 && col[0] == 1 && counter4 < 31)
                        begin
                        odd1_wr <= 1;                                           
                        oem_addr <= counter4;
                        counter4 <= counter4 + 1;   
                        end
                        else if (row[0] == 1 && col[0] == 0 && counter4 < 31)
                        begin
                        odd1_wr <= 1;                       
                        oem_addr <= counter4;
                        counter4 <= counter4 + 1;
                        end
                        else if (row[0] == 1 && col[0] == 0 && counter4 == 31)
                        begin
                        odd1_wr <= 1;
                        oem_addr <= counter4;
                        counter4 <= 0;      
                        num1 <= num1 + 1;
                        end
						else
							oem_dataout <= oem_dataout;
                        end
                    3'b001:begin
                        if (row[0] == 0 && col[0] == 1 && counter4 < 31)
                        begin
                        odd2_wr <= 1;                   
                        oem_addr <= counter4;
                        counter4 <= counter4 + 1;
                        end
                        else if (row[0] == 1 && col[0] == 0 && counter4 < 31)
                        begin
                        odd2_wr <= 1;                                               
                        oem_addr <= counter4;
                        counter4 <= counter4 + 1;                       
                        end
                        else if (row[0] == 1 && col[0] == 0 && counter4 == 31)
                        begin
                        odd2_wr <= 1;                       
                        counter4 <= 0;
                        oem_addr <= counter4;
                        num1 <= num1 + 1;                       
                        end
						else
							oem_dataout <= oem_dataout;
                        end
                    3'b010:begin
                        if (row[0] == 0 && col[0] == 1 && counter4 < 31)
                        begin                       
                        odd3_wr <= 1;                                           
                        oem_addr <= counter4;
                        counter4 <= counter4 + 1;                   
                        end
                        else if (row[0] == 1 && col[0] == 0 && counter4 < 31)
                        begin
                        odd3_wr <= 1;                                           
                        oem_addr <= counter4;
                        counter4 <= counter4 + 1;                       
                        end
                        else if (row[0] == 1 && col[0] == 0 && counter4 == 31)
                        begin
                        odd3_wr <= 1;                       
                        counter4 <= 0;
                        oem_addr <= counter4;
                        num1 <= num1 + 1;
                        end
						else
							oem_dataout <= oem_dataout;
                        end
                    3'b011:begin
                        if (row[0] == 0 && col[0] == 1 && counter4 < 31)
                        begin                       
                        odd4_wr <= 1;
                        oem_addr <= counter4;
                        counter4 <= counter4 + 1;
                        end
                        else if (row[0] == 1 && col[0] == 0 && counter4 < 31)
                        begin
                        odd4_wr <= 1;                   
                        oem_addr <= counter4;
                        counter4 <= counter4 + 1;
                        end
                        else if (row[0] == 1 && col[0] == 0 && counter4 == 31)
                        begin
                        odd4_wr <= 1;
                        counter4 <= 0;
                        oem_addr <= counter4;
                        num1 <= num1 + 1;
                        end
						else
							oem_dataout <= oem_dataout;
                        end 
					3'b100:begin
						if (row[0] == 0 && col[0] == 1 && counter4 < 31)
						oem_finish <= 1;
						else
						oem_dataout <= oem_dataout;
						end
                    default:begin
                        odd1_wr <= 0;
                        odd2_wr <= 0;
                        odd3_wr <= 0;
                        odd4_wr <= 0;
                        end
                    endcase 
//----------------------------------------------------------------------------
                    case(num2)
                    3'b000:begin
                        if (row[0] == 0 && col[0] == 0 && counter5 < 31)
                        begin
                        even1_wr <= 1;              
                        oem_addr <= counter5;
                        counter5 <= counter5 + 1;
                        end
                        else if (row[0] == 1 && col[0] == 1 && counter5 < 31)
                        begin
                        even1_wr <= 1;                  
                        oem_addr <= counter5;
                        counter5 <= counter5 + 1;
                        end
                        else if (row[0] == 1 && col[0] == 1 && counter5 == 31)
                        begin
                        even1_wr <= 1;
                        counter5 <= 0;
                        oem_addr <= counter5;
                        num2 <= num2 + 1;
                        end
						else
							oem_dataout <= oem_dataout;
                        end
                    3'b001:begin
                        if (row[0] == 0 && col[0] == 0 && counter5 < 31)
                        begin
                        even2_wr <= 1;                  
                        oem_addr <= counter5;
                        counter5 <= counter5 + 1;
                        end
                        else if (row[0] == 1 && col[0] == 1 && counter5 < 31)
                        begin
                        even2_wr <= 1;                  
                        oem_addr <= counter5;
                        counter5 <= counter5 + 1;
                        end
                        else if (row[0] == 1 && col[0] == 1 && counter5 == 31)
                        begin
                        even2_wr <= 1;
                        counter5 <= 0;
                        oem_addr <= counter5;
                        num2 <= num2 + 1;
                        end
						else
							oem_dataout <= oem_dataout;
                        end
                    3'b010:begin
                        if (row[0] == 0 && col[0] == 0 && counter5 < 31)
                        begin
                        even3_wr <= 1;                  
                        oem_addr <= counter5;
                        counter5<= counter5 + 1;
                        end
                        else if (row[0] == 1 && col[0] == 1 && counter5 < 31)
                        begin
                        even3_wr <= 1;                      
                        oem_addr <= counter5;
                        counter5 <= counter5 + 1;
                        end
                        else if (row[0] == 1 && col[0] == 1 && counter5 == 31)
                        begin
                        even3_wr <= 1;
                        counter5 <= 0;
                        oem_addr <= counter5;
                        num2 <= num2 + 1;
                        end
						else
							oem_dataout <= oem_dataout;
                        end
                    3'b011:begin
                        if (row[0] == 0 && col[0] == 0 && counter5 < 31)
                        begin
                        even4_wr <= 1;                  
                        oem_addr <= counter5;
                        counter5 <= counter5 + 1;
                        end
                        else if (row[0] == 1 && col[0] == 1 && counter5 < 31)
                        begin
                        even4_wr <= 1;                      
                        oem_addr <= counter5;
                        counter5 <= counter5 + 1;
                        end
                        else if (row[0] == 1 && col[0] == 1 && counter5 == 31)
                        begin
                        even4_wr <= 1;
                        counter5 <= 0;
                        oem_addr <= counter5;
                        num2 <= num2 + 1;
                        end
						else
							oem_dataout <= oem_dataout;
                        end
                    default:begin
                        even1_wr <= 0;
                        even2_wr <= 0;
                        even3_wr <= 0;
                        even4_wr <= 0;
                        end
                    endcase
	end
	else
		oem_dataout <= oem_dataout;
end
end
endmodule
