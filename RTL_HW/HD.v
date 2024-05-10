module HD(
    //  input signals pattern
    code_word1,
    code_word2,
    //  output signals
    out_n
);

//  input signals pattern
input   [6:0]code_word1;
input   [6:0]code_word2;

//  output signals
output reg signed   [5:0]out_n;

//  reg
reg [1:0]opt;
reg signed [3:0]w1;    //  input word1
reg signed [3:0]w2;    //  input word2
reg [1:0]c1;    //  circle1
reg [1:0]c2;    //  circle2
reg [1:0]c3;    //  circle3

//  wire

always@(*) begin

    //  write input data to reg
    w1 = code_word1[3:0];
    w2 = code_word2[3:0];

    /*  Check circle is odd or not
    Circle1 contain p1, x1, x2, x3
    Circle2 contain p2, x1, x2, x4
    Circle3 contain p3, x1, x3, x4  */
    c1[1] = code_word1[6] ^ code_word1[3] ^ code_word1[2] ^ code_word1[1];
    c2[1] = code_word1[5] ^ code_word1[3] ^ code_word1[2] ^ code_word1[0];
    c3[1] = code_word1[4] ^ code_word1[3] ^ code_word1[1] ^ code_word1[0];
    c1[0] = code_word2[6] ^ code_word2[3] ^ code_word2[2] ^ code_word2[1];
    c2[0] = code_word2[5] ^ code_word2[3] ^ code_word2[2] ^ code_word2[0];
    c3[0] = code_word2[4] ^ code_word2[3] ^ code_word2[1] ^ code_word2[0];   

    //  Check which input are incorrect and output to opt
    //  input code_word1
    if(c1[1] & c2[1] & !(c3[1])) begin
        //  if c1 and c2 are odd -> x2 is incorrect
        opt[1] = w1[2];
        w1[2] = !(w1[2]);
    end
    if(!(c1[1]) & c2[1] & c3[1]) begin
        //  if c2 and c3 are odd -> x4 is incorrect
        opt[1] = w1[0];
        w1[0] = !(w1[0]);
    end
    if(c1[1] & !(c2[1]) & c3[1]) begin
        //  if c1 and c3 are odd -> x3 is incorrect
        opt[1] = w1[1];
        w1[1] = !(w1[1]);
    end
    if(c1[1] & c2[1] & c3[1]) begin
        //  if all circle are odd -> x1 is incorrect
        opt[1] = w1[3];
        w1[3] = !(w1[3]);
    end
    if(c1[1] & !(c2[1]) & !(c3[1]))
        //  if only c1 are odd -> p1 is incorrect
        opt[1] = code_word1[6];
    if(!(c1[1]) & c2[1] & !(c3[1]))
        //  if only c2 are odd -> p2 is incorrect
        opt[1] = code_word1[5];
    if(!(c1[1]) & !(c2[1]) & c3[1])
        //  if only c1 are odd -> p3 is incorrect
        opt[1] = code_word1[4];
    
    //  input code_word2
     if(c1[0] & c2[0] & !(c3[0])) begin
        //  if c1 and c2 are odd -> x2 is incorrect
        opt[0] = w2[2];
        w2[2] = !(w2[2]);
    end
    if(!(c1[0]) & c2[0] & c3[0]) begin
        //  if c2 and c3 are odd -> x4 is incorrect
        opt[0] = w2[0];
        w2[0] = !(w2[0]);
    end
    if(c1[0] & !(c2[0]) & c3[0]) begin
        //  if c1 and c3 are odd -> x3 is incorrect
        opt[0] = w2[1];
        w2[1] = !(w2[1]);
    end
    if(c1[0] & c2[0] & c3[0]) begin
        //  if all circle are odd -> x1 is incorrect
        opt[0] = w2[3];
        w2[3] = !(w2[3]);
    end
    if(c1[0] & !(c2[0]) & !(c3[0]))
        //  if only c1 are odd -> p1 is incorrect
        opt[0] = code_word2[6];
    if(!(c1[0]) & c2[0] & !(c3[0]))
        //  if only c2 are odd -> p2 is incorrect
        opt[0] = code_word2[5];
    if(!(c1[0]) & !(c2[0]) & c3[0])
        //  if only c1 are odd -> p3 is incorrect
        opt[0] = code_word2[4];

    //  Follow pattern to define output
    case(opt)
        2'b00:  out_n = 2 * w1 + w2;
        2'b01:  out_n = 2 * w1 - w2;
        2'b10:  out_n = w1 - 2 * w2;
        2'b11:  out_n = w1 + 2 * w2;
    endcase
end

endmodule