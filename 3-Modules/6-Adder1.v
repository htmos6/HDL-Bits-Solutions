module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire cout;
    wire [31:0] sm;
    add16 upper(.a(a[15:0]), .b(b[15:0]), .sum(sm[15:0]), .cout(cout) );
    add16 lower(.a(a[31:16]), .b(b[31:16]) , .sum(sm[31:16]), .cin(cout) );
    
    assign sum = sm;
   

endmodule
