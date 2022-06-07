module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
    
    wire [3:0] internal;
    assign internal[0] = p1a & p1b & p1c;
    assign internal[1] = p1e & p1f & p1d;
    assign p1y = internal[0] | internal[1];
    
    assign internal[2] = p2a & p2b;
    assign internal[3] = p2c & p2d;
    
    assign p2y = internal[2] | internal[3];

endmodule
