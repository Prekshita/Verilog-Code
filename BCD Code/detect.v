// detect.v - detecting the sum

// Prekshita Jain 
// 10/2/2018

// Description:
// ------------
// this module will check if sum is grater than 9 or Cout is set. if any one of these condtion is satisfied adjust will be set.

module detect (
output Adjust, 
input [3:0]a, // sum of adder 1
input b //Cout
);
wire Grt, Eql;

//check if sum is greater than 9 
compare #(.SIZE(4)) comp1(.eq(Eql),.gt(Grt),.a(a[3:0]) ,.b(4'b1001));

// if Grt or Cout is set we have to adjust the value
assign Adjust = Grt | b;

endmodule


