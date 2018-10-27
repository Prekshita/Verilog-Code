//one bit full adder using Verilog gate-level modeling
//// fulladd.v - one bit full adder using Verilog gate-level modeling

//Prekshita jain
//10/4/2018

// Description:
// ------------
// designing a 1 bit full adder to compute the sum and find it's carry bit
module fulladd (
	input	a, b,
	input	ci,
	output	s,
	output	co
);
//internal Wire declaration 
wire x1,n1,a1,a2;

//sum of full adder
xor xor1(x1,a,b);
xor xor2(s,x1,ci);

// multiplexing the carry out 
not not1(n1,x1);
and and1(a1,ci,x1);
and and2(a2,b,n1);
or or1(co,a1,a2);

endmodule 