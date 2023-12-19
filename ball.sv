//-------------------------------------------------------------------------
//    Ball.sv                                                            --
//    Viral Mehta                                                        --
//    Spring 2005                                                        --
//                                                                       --
//    Modified by Stephen Kempf 03-01-2006                               --
//                              03-12-2007                               --
//    Translated by Joe Meng    07-07-2013                               --
//    Fall 2014 Distribution                                             --
//                                                                       --
//    For use with ECE 298 Lab 7                                         --
//    UIUC ECE Department                                                --
//-------------------------------------------------------------------------


module  ball ( input Reset, frame_clk,
					input [7:0] keycode,
					input logic up_axis, left_axis, right_axis, down_axis, bull_collide_flag, 
					input [9:0] firstYnew,
					input logic [1:0] floor, floorL, godown,
					input logic player1flag, player2flag,
					//input [9:0] TankX, TankY, TankS,
               output [9:0]  BallX, BallY, BallS, fuel,
					output [9:0] Tank1_X_Motion, Tank1_Y_Motion);
	
	 
    
    logic [9:0] Ball_X_Pos, Ball_Y_Pos, Ball_Y_Motion, Ball_Size, Ball_X_Motion;
	 
    parameter [9:0] Ball_X_Center=75;  // Center position on the X axis
    parameter [9:0] Ball_Y_Center=320;  // Center position on the Y axis
    parameter [9:0] Ball_X_Min=800;       // Leftmost point on the X axis
    parameter [9:0] Ball_X_Max=639;     // Rightmost point on the X axis
    parameter [9:0] Ball_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Ball_Y_Max=381;     // Bottommost point on the Y axis
    parameter [9:0] Ball_X_Step=1;      // Step size on the X axis
    parameter [9:0] Ball_Y_Step=1;      // Step size on the Y axis

    assign Ball_Size = 32;  // assigns the value 4 as a 10-digit binary number, ie "0000000100"
   
    always_ff @ (posedge Reset or posedge frame_clk )
    begin: Move_Ball
        if (Reset)  // Asynchronous Reset
        begin 
            Ball_Y_Motion <= 10'd0; //Ball_Y_Step;
				Ball_X_Motion <= 10'd0; //Ball_X_Step;
				Ball_Y_Pos <= Ball_Y_Center;
				Ball_X_Pos <= Ball_X_Center;
				fuel <= 50;
				
        end
		  
		  
           
        else // was else before 
        begin
					if ( (Ball_Y_Pos + Ball_Size) >= Ball_Y_Max )  // Ball is at the bottom edge, BOUNCE!
					;//  Ball_Y_Motion <= (~ (Ball_Y_Step) + 1'b1);  // 2's complement.
					  
				   else if ( (Ball_Y_Pos) <= Ball_Y_Min )  // Ball is at the top edge, BOUNCE!
					;//  Ball_Y_Motion <= Ball_Y_Step;
					  
				   else if ( (Ball_X_Pos + Ball_Size) >= Ball_X_Max )  // Ball is at the Right edge, BOUNCE!
					 ;// Ball_X_Motion <= (~ (Ball_X_Step) + 1'b1);  // 2's complement.
					  
				   else if ( (Ball_X_Pos) >= Ball_X_Min )  // Ball is at the Left edge, BOUNCE!
					 ;// Ball_X_Motion <= Ball_X_Step;
					 
					else 
					  Ball_Y_Motion <= 10'd0; 
					  Ball_X_Motion <= 10'd0;  
					  
//					  if((Ball_X_Pos == 113 || Ball_X_Pos == 273 || Ball_X_Pos == 433 || Ball_X_Pos == 593) && (keycode == 8'h07)) begin
//							Ball_Y_Pos = 340;
//					  end
					  
					  
					   if((Ball_Y_Pos + Ball_Size) < 352) begin
							  Ball_Y_Pos = 320;
							  
							  end
							  
							  
						
					   else if((Ball_Y_Pos + Ball_Size) > 381) begin
							  Ball_Y_Pos = 347;
							  
							  end
							  
							 
					 else begin 
					 
				if (player2flag) begin
					fuel <= 50;
				end else begin
				end
				
				if(player1flag) begin 
					  
				 case (keycode)
					8'h04 : begin
					
							  if (fuel > 0)begin
								
								fuel <= fuel - 1;
								
								if
								
								(!( (Ball_X_Pos) >= Ball_X_Min ) && ((Ball_Y_Pos + Ball_Size) <= Ball_Y_Max) && (left_axis == 1) && (bull_collide_flag == 0))
	
								begin
								
								
								
								 if(floorL == 2'b01)
							  begin
							  Ball_X_Motion <= -1;
							  
							  Ball_Y_Motion <= -1;
							  
							  end
							  
							  
							  if(floorL == 2'b10)
							  begin
							  Ball_X_Motion <= -1;
							  
							  Ball_Y_Motion <= 1;
							  
							  end
							  
							  if(godown == 2'b01) begin
							  Ball_X_Motion <= 0;
							  
							  Ball_Y_Motion <= -10;
							  end
							  
							  
							  if(floorL == 2'b00)
							   begin
					        Ball_X_Motion <= -1;//D
							  
							  Ball_Y_Motion <= 0;
							  end
							  
//								Ball_X_Motion <= -1;//A
//								
//								Ball_Y_Motion<= 0;
//								end
//								else begin 
//								
//								Ball_X_Motion <= 0;
//								end

								end
								
								end else begin
									fuel<= fuel;
									Ball_X_Motion <= 0;
									Ball_Y_Motion <= 0;
								end
							  end
					        
					8'h07 : begin
					
							if (fuel > 0)begin
								
								fuel <= fuel - 1;
							  
							   if(!((Ball_X_Pos + Ball_Size) >= Ball_X_Max) && ((Ball_Y_Pos + Ball_Size) <= Ball_Y_Max)  && (right_axis == 1) && (bull_collide_flag == 0))
						
								begin // first if begin
							
							 
							  
							  if(floor == 2'b01)
							  begin
							  Ball_X_Motion <= 1;
							  
							  Ball_Y_Motion <= 1;
							  
							  end
							  
							  
							  if(floor == 2'b10)
							  begin
							  Ball_X_Motion <= 1;
							  
							  Ball_Y_Motion <= -1;
							  
							  end
							  
							  
							  if(floor == 2'b00)
							   begin
					        Ball_X_Motion <= 1;//D
							  
							  Ball_Y_Motion <= 0;
							  end
							  
							 
							  
							  
							  
							  end // first if end
//							  
//							  else begin
//							  
//							  Ball_X_Motion <= 0;
//							  end

								end else begin
									fuel<= fuel;
									Ball_X_Motion <= 0;
									Ball_Y_Motion <= 0;
								end
							  
							 end

							  
//					8'h16 : begin
//							  if(!( (Ball_Y_Pos + Ball_Size) >= Ball_Y_Max ) && (down_axis == 1) && (bull_collide_flag == 0)) begin
//					        Ball_Y_Motion <= 1;//S
//							  Ball_X_Motion <= 0;
//							 
//							  end
//							  else begin 
//							  Ball_Y_Motion <= 0; 
//							  
//							  end
//							 end
////							  
//					8'h1A : begin
//							  if(!( (Ball_Y_Pos) <= Ball_Y_Min ) && (up_axis == 1)) begin
//					        Ball_Y_Motion <= -1;//W
//							  Ball_X_Motion <= 0;
//							
//							  end
//							  else begin 
//							  Ball_Y_Motion <= 0; 
//							
//							  end
//							 end	  
					default: ;
			   endcase
				
				end else begin
			   end	// end statement for player1 turn 
				
				end
				
				 Ball_Y_Pos <= (Ball_Y_Pos + Ball_Y_Motion);  // Update ball position
				 Ball_X_Pos <= (Ball_X_Pos + Ball_X_Motion);
			
	  /**************************************************************************************
	    ATTENTION! Please answer the following quesiton in your lab report! Points will be allocated for the answers!
		 Hidden Question #2/2:
          Note that Ball_Y_Motion in the above statement may have been changed at the same clock edge
          that is causing the assignment of Ball_Y_pos.  Will the new value of Ball_Y_Motion be used,
          or the old?  How will this impact behavior of the ball during a bounce, and how might that 
          interact with a response to a keypress?  Can you fix it?  Give an answer in your Post-Lab.
      **************************************************************************************/
//				if ((Ball_X_Motion != 0)||(Ball_Y_Motion != 0))begin
//					Ball_X_Motion <= 0;
//					Ball_Y_Motion <= 0;
//					xaxis <= 0;
//				end else begin
//				end
//			
		end  
    end
	 
	 
	
   always_ff @(posedge frame_clk) begin  
	 if ((floor == 2'b01)) begin
		BallX <= Ball_X_Pos;
   
      BallY <= Ball_Y_Pos + 7 ;
		
	 end else if (floor == 2'b10) begin
		BallX <= Ball_X_Pos;
   
      BallY <= Ball_Y_Pos + 7; 
		
	 end else begin
		BallX <= Ball_X_Pos;
		
		BallY <= Ball_Y_Pos;
	 end
	 end
	
assign BallS = Ball_Size;
	 
assign Tank1_X_Motion = Ball_X_Motion;
    

endmodule
