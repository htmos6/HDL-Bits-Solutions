module top_module(
    input clk,
    input areset,    // Asynchronous reset to OFF
    input j,
    input k,
    output out); //  

    parameter OFF=0, ON=1; 
    reg state, next_state;

    always @(*) 
		begin
            next_state = OFF;
			if (state == ON && k == 0)
				begin
					next_state = ON;
				end
			else if (state == ON && k == 1)
				begin
					next_state = OFF;
				end
			else if (state == OFF && j == 0)
				begin
					next_state = OFF;
				end
			else if (state == OFF && j == 1)
				begin
					next_state = ON;
				end
		end

    always @(posedge clk, posedge areset) 
		begin
			if (areset)
				begin
					state <= OFF;
				end
			else 
				begin 
					state <= next_state;
				end
		end

	always @(state)
		begin
			if (state == OFF)
				begin
					out <= 0;
				end
			else
				begin 
					out <= 1;
				end

		end
endmodule
