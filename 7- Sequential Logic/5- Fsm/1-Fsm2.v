// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

    // Fill in state name declarations
	parameter A=0,B=1;
    reg state, next_state;

    always @(*)
	begin
        if (reset)
            begin 
               next_state = B;
            end
		else if (state == B && in == 1)
			begin
				next_state = B;
			end
		else if (state == B && in == 0)
			begin
				next_state = A;
			end
		else if (state == A && in == 0)
			begin
				next_state = B;
			end
		else
			begin
				next_state = A;
			end
	end

    always @(posedge clk) 
        begin 
        	state <= next_state;
        end
    
    always @(state, reset)
        begin
            if (state == A)
                out = 0;
            else if (state == B)
                out = 1;
        end
    

endmodule
