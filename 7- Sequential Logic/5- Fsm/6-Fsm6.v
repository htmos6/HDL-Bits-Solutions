module top_module(
    input clk,
    input in,
    input areset,
    output reg out
);

    parameter A=0, B=1, C=2, D=3;
    
    reg [1:0] state, next_state;

    always @(*)
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
                    next_state = A;
            endcase
        end
   
    always @(posedge clk or posedge areset)
        begin 
            if (areset)
                begin
                    state <= A;
                end
            else 
                begin 
                     state <= next_state; 
                end            
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
