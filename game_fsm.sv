module game_fsm (input frame_clk, Reset, bull_shoot_flag1, bull_shoot_flag2, bull_stop_flag1, bull_stop_flag2, game_start, endgame, 
					  input [3:0] health_1, health_2,
					  input [9:0] startcount1, startcount2,
					 output logic player1flag, player2flag, player1win, player2win, startscreen, startfinaltimer
					 );
					 
	enum logic [3:0] {Z, A, B, C, D, E, F, G, H, I, J, K}   curr_state, next_state;

	always_ff @ (posedge Reset or posedge frame_clk)  
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
		  
				 Z:     next_state = A;
				 
				 A :    if (game_start) //Spacebar Keycode;
                       next_state = B;

             B :    if (bull_shoot_flag1) // player 1 start
                       next_state = C;
							  
				 C :    if (bull_stop_flag1) 
                       next_state = D;

				 D :    next_state = E;
							  
				 E :    if ((health_1 == 0) || (health_2 == 0)) begin 
                       next_state = J;
						  end else begin
							  next_state = F;
						  end
						 
				 F :    if (bull_shoot_flag2) // player 2 start
                       next_state = G;
							  
				 G :    if (bull_stop_flag2) 
                       next_state = H;
					
				 H :    next_state = I;
				
             I :    if (((health_2 == 0) || (health_1 == 0))) begin 
                       next_state = J;
						  end else begin
							  next_state = B;
						  end
						 
						 
				 J :     if (endgame) 
                       next_state = K;
						
			    K :	   if (Reset) 
                       next_state = A;			
					  
        endcase
		  
		   case (curr_state) 
			
				Z: 
	         begin
                player1flag = 0;
					 player2flag = 0;
					 player1win = 0;
					 player2win = 0;
					 startscreen = 0;
					 startfinaltimer = 0;
		      end
				
				A: 
	         begin
                player1flag = 0;
					 player2flag = 0;
					 player1win = 0;
					 player2win = 0;
					 startscreen = 1;
					 startfinaltimer = 0;
		      end
				
				B: 
	         begin
					 player1flag = 1;
					 player2flag = 0;
					 player1win = 0;
					 player2win = 0;
					 startscreen = 0;
					 startfinaltimer = 0;
                
		      end
				
				C: 
	         begin
					 player1flag = 0;
					 player2flag = 0;
					 player1win = 0;
					 player2win = 0;
					 startscreen = 0;
					 startfinaltimer = 0;
		      end
				
				D: 
	         begin
                player1flag = 0;
					 player2flag = 0;
					 player1win = 0;
					 player2win = 0;
					 startscreen = 0;
					 startfinaltimer = 0;
		      end
				
				E: 
	         begin
                player1flag = 0;
					 player2flag = 0;
					 player1win = 0;
					 player2win = 0;
					 startscreen = 0;
					 startfinaltimer = 0;
		      end
				
				F: 
	         begin
                player1flag = 0;
					 player2flag = 1;
					 player1win = 0;
					 player2win = 0;
					 startscreen = 0;
					 startfinaltimer = 0;
		      end
				
				G: 
	         begin
                player1flag = 0;
					 player2flag = 0;
					 player1win = 0;
					 player2win = 0;
					 startscreen = 0;
					 startfinaltimer = 0;
		      end
				
				H: 
	         begin
                player1flag = 0;
					 player2flag = 0;
					 player1win = 0;
					 player2win = 0;
					 startscreen = 0;
					 startfinaltimer = 0;
		      end
				
				I: 
	         begin
                player1flag = 0;
					 player2flag = 0;
					 player1win = 0;
					 player2win = 0;
					 startscreen = 0;
					 startfinaltimer = 0;
		      end
				
				J: 
	         begin
                player1flag = 0;
					 player2flag = 0;
					 player1win = 0;
					 player2win = 0;
					 startscreen = 0;
					 startfinaltimer = 1;
		      end
				
				
				K: 
	         begin
                player1flag = 0;
					 player2flag = 0;
					 if (health_1 <= 0) begin
						player2win = 1;
					 end else begin 
						player2win = 0;
					 end
					 
					 if (health_2 <= 0) begin
						player1win = 1;
					 end else begin 
						player1win = 0;
					 end
						
					 startfinaltimer = 0;
					 startscreen = 0;
		      end
					
				
				default:
				begin
					 player1flag = 0;
					 player2flag = 0;
					 player1win = 0;
					 player2win = 0;
					 startscreen = 1;
					 startfinaltimer = 0;
				end
				endcase
		end
	 
endmodule 