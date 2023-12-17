module top_module(
    input in,
    input [1:0] state,
    output [1:0] next_state,
    output out); //

    parameter A=0, B=1, C=2, D=3;

	always @(*)
		begin
			out = 0;
			case (state)
				A: 
					begin
						if (in == 0)
							next_state = A;
						else 
							next_state = B;
					end
				B: 
					begin
						if (in == 0)
							next_state = C;
						else 
							next_state = B;
					end
				C: 
					begin
						if (in == 0)
							next_state = A;
						else 
							next_state = D;
					end
				D: 
					begin
						out = 1;
						if (in == 0)
							next_state = C;
						else 
							next_state = B;
					end
				default:
                    begin
                        next_state = A;
						out = 0;
                    end
			endcase
		end
endmodule
