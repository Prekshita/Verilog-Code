// bcd_adder.v - 4-bit BCD Adder with illegal input detection using Verilog dataflow modeling

//Prekshita Jain
//10/4/2018

// Description:
// ------------
// Implementing a BCD adder and also finding the out of range values
module bcd_adder (
	input	[3:0]	X, Y,
	input			c_in,
	output			c_out,
	output	[7:0]	result,
	output			out_of_range
);
wire [3:0]Binarysum1,SUM,muxout;
wire Cout1,Cout2;
wire adjust;
wire X_grt,Y_grt, X_eql,Y_eql;


//out_of_range values comparison


compare #(.SIZE(4)) cmpX(.eq(X_eql),.gt(X_grt),.a(X[3:0]) ,.b(4'b1001));
compare #(.SIZE(4)) cmpY(.eq(Y_eql),.gt(Y_grt),.a(Y[3:0]) ,.b(4'b1001));

assign out_of_range = (X_grt|Y_grt);

//full adder 1

fulladd4 adder1(.s(Binarysum1[3:0]), .c_out(Cout1), .a(X[3:0]), .b(Y[3:0]),.c_in(c_in));

//detect sum of adder 1

detect detect1(.a(Binarysum1[3:0]),.b(Cout1),.Adjust(adjust));

//mutliplexing the input to adder 2 after detecting the sum
mux2to1_nbits #(.SIZE(4)) mux1(.out(muxout[3:0]), .a(4'b0110),.b(4'b0000), .sel(adjust));


//full adder 2
fulladd4 adder2(.s(SUM[3:0]), .c_out(Cout2),.a(muxout[3:0]), .b(Binarysum1[3:0]),.c_in(1'b0));

// generating c_out
assign c_out = Cout1|Cout2;

assign result = {3'b000,c_out,SUM};

endmodule 

 
