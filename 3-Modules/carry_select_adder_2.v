module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] sm_up, sm_down;
    reg [31:0] sm;
    wire cot;
    
    add16 upper(.a(a[31:16]), .b(b[31:16]), .cin(0), .sum(sm_up) );
    add16 lower(.a(a[31:16]), .b(b[31:16]), .cin(1), .sum(sm_down) );
    add16 right(.a(a[15:0]), .b(b[15:0]), .cin(0), .cout(cot), .sum(sm[15:0]) );
    
    always @(cot) begin
        case (cot)
            1'b0: sm[31:16] = sm_up;
            1'b1: sm[31:16] = sm_down;
       endcase
    end
    assign sum = sm;
endmodule
