module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
    
    wire and_1 = a & b;
    wire and_2 = c & d;
    
    assign out = and_1 | and_2;
    assign out_n = ~out;

endmodule
