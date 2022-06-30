module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
    
    always @(posedge clk) begin
        if (reset) begin
			q <= 0;
        end 
        else if (slowena && q<9 ) begin 
			q <= q+1;
        end
        else if (q == 9 && slowena) begin 
			q <= 0;
        end
    end
endmodule
