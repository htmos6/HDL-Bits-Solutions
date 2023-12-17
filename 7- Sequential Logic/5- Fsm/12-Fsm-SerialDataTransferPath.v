module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //

    reg [3:0] state, next_state;
    reg [7:0] out;
    
    
    // 0(Start Bit)     1 0 1 0 0 0 0 0         1 (Stop bit) --> Done = 1 (Stop bit is at correct place)
    // 0(Start Bit)     1 0 1 0 0 0 0 0     0 0 1 (Stop bit) --> Done = 0 (Stop bit is not at correct place)
    
    always @(*)
        begin
            if (reset)
                next_state = 0;
            else begin
                case (state)
                    0: next_state = (in == 0) ? 1:0;
                    1: begin
                         next_state = 2;
                        out[0] = in;
                    end
                    2: begin
                        next_state = 3;
                        out[1] = in;
                    end
                    3: begin
                        next_state = 4; 
                        out[2] = in;
                    end
                    4: begin
                        next_state = 5;
                        out[3] = in;
                    end
                    5: begin
                        next_state = 6;
                        out[4] = in;
                    end
                    6: begin
                        next_state = 7;
                        out[5] = in;
                    end
                    7: begin
                        next_state = 8;
                        out[6] = in;
                    end
                    8: begin
                        next_state = 9;
                        out[7] = in;
                    end
                    9: begin
                        next_state = (in == 1) ? 10:11; // Check stop bit
                    end
                    10: begin
                        next_state = (in == 0) ? 1:0; // Done
                    end
                    11: begin
                        next_state = (in == 1) ? 0:11;
                    end
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
                begin
                    done = 1;
                    out_byte = out;
                end
            else 
                begin
                	done = 0;
                    out_byte = 'bx;
                end
        end


endmodule
