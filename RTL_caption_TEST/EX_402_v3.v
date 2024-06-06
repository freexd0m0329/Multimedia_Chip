// This module defines a Finite State Machine (FSM) named EX_402_fsm_string_v3 written in Verilog 2000.
// The FSM detects a specific bit pattern in the input stream.
// Timescale is set to 1 ns/1 ns.
// Inputs to the FSM include clk, reset, and bit_in.
// The output from the FSM is the match signal.
// Two 3-bit reg variables, match_state and next_state, are defined for state management, and a 1-bit reg variable, match, for the output.
// The FSM transitions between five states: ZERO, P, A, B, and C, based on the bit_in input.
// States are defined using parameter statements with values: ZERO = 3'b000, P = 3'b001, A = 3'b010, B = 3'b011, C = 3'b100.
// Transition logic is triggered by either the clk or the reset signal, with a 1 ns delay, allowing match_state to change to next_state or reset to the ZERO state.
// The next state logic is based on the current state and the input bit_in. Initially, next_state is set to the current state match_state, and match is reset to 0.
// A case statement determines the next state transitions: If bit_in is 1, it transitions from ZERO to P, P to A, B to C, and C back to A with match set to 1; if bit_in is 0, it transitions back to ZERO, except from A to B which transitions on 0.
// The FSM resets to the ZERO state when the reset signal is active low.



`timescale 1 ns/1 ns										// Define the timescale for simulation

module EX_402_fsm_string_v3(clk, reset, bit_in, match);
input	clk, reset, bit_in;									// Clock, synchronous reset, and input bit
output	match;												// Output signal that indicates a match
reg	match;													// Register to hold the match output
reg	next_match;

parameter ZERO = 3'b000,									// State encoding for the FSM, ZERO is the initial state
	  P    = 3'b001,										// State P which define as 001
	  A    = 3'b010,										// State A which define as 010
	  B    = 3'b011,										// State B which define as 011
	  C    = 3'b100;										// State C which define as 100

reg	[2:0]	match_state, next_state;						// Registers for current and next state

always @(posedge clk or negedge reset)						// Sequential logic to update the state on the positive edge of the clock or the negative edge of the reset
begin
  if (!reset)
    match_state <= #1 ZERO;									// Asynchronously reset to initial state with 1ns delay
  else
    match_state <= #1 next_state;							// Move to next state with 1ns delay
end

always @(match_state or bit_in)								// Combinational logic to determine the next state and match output based on current state and input bit
begin
  next_state = match_state;									// Default next state is the current state
  match      = 1'b0;										// Default match output is 0
  case (match_state)										// Case statement to determine the next state transitions
    ZERO : if (bit_in==1'b1)								// Transition to P on input '1'
	     next_state = P;

    P	 : if (bit_in==1'b1)								// Transition to A on input '1'
	     next_state = A;
	   else													// Transition to ZERO on input '0'
	     next_state = ZERO;

    A    : if (bit_in==1'b0)								// Transition to B on input '0'
	     next_state = B;

    B    : if (bit_in==1'b1)								// Transition to C on input '1'
	     next_state = C;
	   else
	     next_state = ZERO;									// Return to ZERO on input '0'

    C    : if (bit_in==1'b1) begin
	     next_state = A;									// Loop back to A on input '1'
	     match      = 1'b1;									// Output match when '11011' is detected
	   end
	   else
	     next_state = ZERO;									// Return to ZERO on input '0'

    default : next_state = ZERO;							// Fallback to ZERO for any undefined states
  endcase
end

endmodule