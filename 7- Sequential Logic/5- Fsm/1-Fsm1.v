module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  

    parameter A=0, B=1; 
    reg state, next_state;
    
	always @(*)
	begin
		if (state == B && in == 1)
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

	always @(posedge clk, posedge areset) 
		begin 
        	if (areset)
				begin
					state <= B;
				end
			else 
				begin
				state <= next_state;
				end
    	end

    always @(state)
        begin
            if (state == A)
                out = 0;
            else if (state == B)
                out = 1;
        end
endmodule
