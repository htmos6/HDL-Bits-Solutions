module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //

    reg [1:0] state, next_state;
    reg [23:0] data_received;
    reg [7:0] missing_bits;
    parameter A=0, B=1, C=2, D=3;
	
    always @(*) 
        begin
            done = 0;
            if (reset)
                begin 
                    next_state = A;
                end
            else
                begin
                    case (state)
                        A: begin
                                if (in[3] == 1)
                                    begin
                                        next_state = B;
                                        missing_bits = in;
                                    end
                                else 
                                    begin
                                        next_state = A;
                                    end   
                            end
                        B: begin
                                begin
                                    next_state = C;
                                    data_received[23:16] = missing_bits;
                                    data_received[15:8] = in;
                                end   
                            end
                        C: begin
                                begin
                                    next_state = D;
                                    data_received[7:0] = in;
                                end   
                            end
                        D: begin // Needs to spend 1 cycle at state D to output done signal 1 clock cycle
                                done = 1;
                                if (in[3] == 1)
                                    begin
                                        next_state = B;
                                        missing_bits = in;
                                    end
                                else 
                                    begin
                                        next_state = A;
                                    end   
                            end
                	endcase
        	end
		end
    
    always @ (posedge clk) begin
        state <= next_state;
    end
    
    always @(state)
        begin
            if (state == D)
                begin
                    out_bytes = data_received;
                end
            else 
                begin
                    out_bytes = 'bx;
                end
        end
    
    
    
endmodule
