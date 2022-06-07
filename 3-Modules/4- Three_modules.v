module top_module ( input clk, input d, output q );
    wire a1,a2;
    
    my_dff left1 (.d(d), .clk(clk), .q(a1));
    my_dff left2 (.d(a1), .clk(clk), .q(a2));
    my_dff left3 (.d(a2), .clk(clk), .q(q));

endmodule
