/*
This Verilog code contains a topmodule "adder_4bit" and a submodule "full_adder".
Performs a 4-bits full adder with a basic logical combination.
*/
module full_adder (                                         // Define a submodule full_adder
    input A,                                                // 1 bit data input A
    input B,                                                // 1 bit data input B
    input CIN,                                              // 1 bit data input CIN
    output S,                                               // 1 bit data output S
    output COUT                                             // 1 bit dat output COUT
);

    assign S = A ^ B ^ CIN;                                 // Set output "S" vaule as all inputs exclusive OR state
    assign COUT = (A & B) | (CIN & (A ^ B));                // Set output "COUT" vaule as a simple boolean algebra with all inputs which A‧B+CIN(A⊕B)

endmodule


module adder_4bit (                                         // Define a topmodule adder_4bit
    input [3:0] A,                                          // 4-bits data inputs A
    input [3:0] B,                                          // 4-bits data inputs B
    input CIN,                                              // 1 bit data input CIN
    output [3:0] S,                                         // 4-bits data outputs S
    output COUT                                             // 1 bit data output COUT
);

    wire [3:0] c;                                           // Define a connection "c" with 4 bits
    full_adder fa0(A[0], B[0], CIN, S[0], c[0]);            // Call submodule "full_adder" named "fa0" with 5 ports A[0], B[0], CIN, S[0] and c[0] which connection by order 
    full_adder fa1(A[1], B[1], c[0], S[1], c[1]);           // Call submodule "full_adder" named "fa1" with 5 ports A[1], B[1], c[0], S[1] and c[1] which connection by order 
    full_adder fa2(A[2], B[2], c[1], S[2], c[2]);           // Call submodule "full_adder" named "fa2" with 5 ports A[2], B[2], c[1], S[2] and c[2] which connection by order 
    full_adder fa3(A[3], B[3], c[2], S[3], COUT);           // Call submodule "full_adder" named "fa0" with 5 ports A[3], B[3], c[2], S[3] and COUT which connection by order 

endmodule