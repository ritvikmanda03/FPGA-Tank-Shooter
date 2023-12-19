module explode_fsm (input frame_clk, Reset, timer_flag, bull_collide_flag, 
                output logic timer_start, 
					 output [3:0]tank1_explode_frame 
					 );
					 
	enum logic [3:0] {Z, A, B, C, D, E, F, G, H, I, J, K, L}   curr_state, next_state;

	always_ff @ (posedge frame_clk)  
    begin
        if (Reset) begin
            curr_state <= Z;
		  end
        else begin
            curr_state <= next_state;
		  end
    end
	 
	 always_comb
    begin
        
		  next_state  = curr_state;	//required because I haven't enumerated all possibilities below
        unique case (curr_state)
		  
				 Z: next_state = A;

             A :    if (bull_collide_flag) 
                       next_state = B;
							  
				 B :    if (timer_flag%11110 == 0) 
                       next_state = C;
						 
				 C :   if (timer_flag%11110 == 0) 
                       next_state = D;
						 
				
             D :     if (timer_flag%11110 == 0) 
                       next_state = E;
						 
						 
				 E :     if (timer_flag%11110 == 0) 
                       next_state = F;
						 
						 
				 F :    if (timer_flag%11110 == 0) 
                       next_state = G;
						 
						 
				 G :    if (timer_flag%11110 == 0) 
                       next_state = H;
						 
						 
				 H :    if (timer_flag%11110 == 0) 
                       next_state = I;
						 
						 
				 I :    if (timer_flag%11110 == 0) 
                       next_state = J;
						 
	
				 J :    if (timer_flag%11110 == 0) 
                       next_state = K;
							  
				 K :    if (timer_flag%11110 == 0) 
                       next_state = L;
						 
						 
				 L :   if (~bull_collide_flag)
				
						 next_state = A;
				
						 
					  
        endcase
		  
		   case (curr_state) 
				
				A: 
	         begin
                timer_start = 0;
                tank1_explode_frame = 4'b0000;
		      end
				
				B: 
	         begin
                timer_start = 1;
                tank1_explode_frame = 4'b0001;
		      end
				
				C: 
	         begin
					 timer_start = 1;
                tank1_explode_frame = 4'b0010;
		      end
				
				D: 
	         begin
                timer_start = 1;
                tank1_explode_frame = 4'b0011;
		      end
				
				E: 
	         begin
                timer_start = 1;
                tank1_explode_frame = 4'b0100;
		      end
				
				F: 
	         begin
                timer_start = 1;
                tank1_explode_frame = 4'b0101;
		      end
				
				G: 
	         begin
					 timer_start = 1;
                tank1_explode_frame = 4'b0110;
		      end
				
				H: 
	         begin
                timer_start = 1;
                tank1_explode_frame = 4'b0111;
		      end
				
				I: 
	         begin
                timer_start = 1;
                tank1_explode_frame = 4'b1000;
		      end
				
				J: 
	         begin
                timer_start = 1;
                tank1_explode_frame = 4'b1001;
		      end
				
				K: 
	         begin
                timer_start = 1;
                tank1_explode_frame = 4'b1010;
		      end
				
				L: 
	         begin
                timer_start = 1;
                tank1_explode_frame = 4'b1011;
		      end
				
				default:
				begin
					 timer_start = 0;
                tank1_explode_frame = 4'b0000;
				end
				endcase
		end
	 
endmodule 