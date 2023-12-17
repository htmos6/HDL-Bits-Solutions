module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
    
    reg [3:0] state, next_state;
    // 0(Start Bit)     1 0 1 0 0 0 0 0         1 (Stop bit) --> Done = 1 (Stop bit is at correct place)
    // 0(Start Bit)     1 0 1 0 0 0 0 0     0 0 1 (Stop bit) --> Done = 0 (Stop bit is not at correct place)
    always @(*)
        begin
            if (reset)
                next_state = 0;
            else begin
                case (state)
                    0: next_state = (in == 0) ? 1:0;
                    1: next_state = 2;
                    2: next_state = 3;
                    3: next_state = 4; 
                    4: next_state = 5; 
                    5: next_state = 6;
                    6: next_state = 7;
                    7: next_state = 8;
                    8: next_state = 9;
                    9: next_state = (in == 1) ? 10:11; // Check stop bit
                    10: next_state = (in == 0) ? 1:0; // Done
                    11: next_state = (in == 1) ? 0:11;
                endcase
            end
        end
    
    
    always @(posedge clk)
        begin
        	state <= next_state;
        end
    
    
    always @(state)
        begin
            if (state == 10)
                done = 1;
            else 
                done = 0;
        end
endmodule
