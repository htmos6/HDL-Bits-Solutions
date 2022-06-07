module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output reg [31:0] sum
);
    wire up_down;
    wire [31:0] ouut;
    always @(sub) begin
        case(sub)
            1: ouut = ~b;
            0: ouut = b;
            
        endcase
    end
    add16 upper(.a(a[15:0]), .b(ouut[15:0]),  .cin(sub), .cout(up_down), .sum(sum[15:0]));
    add16 lower(.a(a[31:16]), .b(ouut[31:16]), .cin(up_down), .sum(sum[31:16]) );

endmodule
