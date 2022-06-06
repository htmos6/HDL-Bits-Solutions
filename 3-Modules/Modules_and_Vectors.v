module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);

    wire [7:0] a1,a2,a3,a4;
    
    my_dff8 l1(.clk(clk), .d(d), .q(a1));
    my_dff8 l2(.clk(clk), .d(a1), .q(a2));
    my_dff8 l3(.clk(clk), .d(a2), .q(a3));
    
    always @(sel) begin 
        case(sel)
            2'b00: q = d; 
            2'b01: q = a1;
            2'b10: q = a2;
            2'b11: q = a3;
        endcase
    end
endmodule
