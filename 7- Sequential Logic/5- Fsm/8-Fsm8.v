module top_module(
    input clk,
    input in,
    input reset,
    output out); //
    
    parameter A=0, B=1, C=2, D=3;
    reg [1:0] state, next_state;

    always @(*)
        begin
            if (reset)
                begin
                 	next_state = A;  
                end
            else 
                begin
                    case (state)
                        A:
                            next_state = (in == 1) ? B:A;
                        B: 
                            next_state = (in == 0) ? C:B;
                        C:
                            next_state = (in == 1) ? D:A;
                        D:
                            next_state = (in == 1) ? B:C;
                        default:
                            begin
                                next_state = A; 
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
            out = 0;
            if (state == D)
                begin
                    out = 1;
                end
        end

endmodule
