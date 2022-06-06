module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
    wire cout1;
    wire [31:0] sm;
    add16 upper(.a(a[15:0]), .b(b[15:0]) ,.cout(cout1), .sum(sm[15:0]));
    add16 lower(.a(a[31:16]), .b(b[31:16]), .cin(cout1), .sum(sm[31:16]));
    assign sum = sm;

endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );
	
    assign cout = (a&cin) | (b&cin) | (a&b);
    assign sum = a^b^cin;
// Full adder module here

endmodule
