// fulladd4.v - 4-bit binary adder

//Prekshita Jain
//10/4/2018

// Description:
// ------------
// Designing a 4 bit full adder to compute the sum and find it's carry bit 

module fulladd4 (
	input	[3:0]	a, b,
	input			c_in,
	output	[3:0]	s,
	output			c_out
);

//initial nets

wire c1,c2,c3;

// instantiate four 1-bit full adders
fulladd fa0(.s(s[0]), .co(c1), .a(a[0]), .b(b[0]), .ci(c_in)); 
fulladd fa1(.s(s[1]), .co(c2), .a(a[1]), .b(b[1]), .ci(c1));
fulladd fa2(.s(s[2]), .co(c3), .a(a[2]), .b(b[2]), .ci(c2));
fulladd fa3(.s(s[3]), .co(c_out), .a(a[3]), .b(b[3]), .ci(c3));

endmodule