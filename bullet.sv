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


module  bull ( input Reset, frame_clk,
					input [7:0] keycode,
					input [9:0] Tank1X, Tank2X, Tank1_X_Motion, Tank2_X_Motion,
					input logic [63:0] timesig,
					input logic bull1_collide_flag, bull2_collide_flag, player1flag, player2flag, 
					//input [9:0] TankX, TankY, TankS,
               output [9:0]  BullS, Bull2X, Bull2Y,
					output [63:0] Bull1X, Bull1Y,
					output [3:0] bull_explode_flag,
					output logic Draw_Bull1, Draw_Bull2, bull_stop_flag1, bull_stop_flag2, xbound,
					output [9:0] X1_text, X2_text, Y1_text, Y2_text);
					// output logic [9:0] xaxis, Ball_X_Motion);
    
    logic [9:0] Ball1_Y_Motion, Ball_Size, Ball1_X_Motion, Ball2_Y_Motion, Ball2_X_Motion, Ball2_X_Pos, Ball2_Y_Pos, X_power, Y_power, Prev_BallX, Prev_BallY, Prev_Ball2Y, Prev_Ball2X, Bounce_BallX, Bounce_BallY;
	 logic [63:0] Ball1_X_Pos, Ball1_Y_Pos;
	 logic [7:0] prev_keycode;
	 logic ybound;
	 
   //logic [9:0] Ball1_X_Center;
	 parameter [9:0] Ball1_X_Center = 123; // Center position on the X axis
    parameter [9:0] Ball1_Y_Center = 330;  // Center position on the Y axis
	//logic [9:0] Ball2_X_Center;
	 parameter [9:0] Ball2_X_Center = 530;  // Center position on the X axis
    parameter [9:0] Ball2_Y_Center = 330;  // Center position on the Y axis
	 
    parameter [9:0] Ball_X_Min=0;       // Leftmost point on the X axis
    parameter [9:0] Ball_X_Max=639;     // Rightmost point on the X axis
    parameter [9:0] Ball_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Ball_Y_Max=352;     // Bottommost point on the Y axis
    parameter [9:0] Ball_X_Step=1;      // Step size on the X axis
    parameter [9:0] Ball_Y_Step=1;      // Step size on the Y axis

    assign Ball_Size = 7;  // assigns the value 4 as a 10-digit binary number, ie "0000000100"
	 
	 //assign Ball1_X_Pos = Tank1X;
	 //assign Ball2_X_Pos = Tank2X;
   
    always_ff @ (posedge Reset or posedge frame_clk) 
    begin: Move_Ball
        if (Reset) // Asynchronous Reset
        begin 
            Ball1_Y_Motion <= 10'd0; //Ball_Y_Step;
				Ball1_X_Motion <= 10'd0; //Ball_X_Step;
				Ball1_Y_Pos <= Ball1_Y_Center;
				Ball1_X_Pos <= Ball1_X_Center;
				Ball2_Y_Motion <= 10'd0; //Ball_Y_Step;
				Ball2_X_Motion <= 10'd0; //Ball_X_Step;
				Ball2_Y_Pos <= Ball2_Y_Center; //Ball2_Y_Center;
				Ball2_X_Pos <= Ball2_X_Center;
				Draw_Bull1 <= 0;
				Draw_Bull2 <= 0;
				X_power <= 7;
				Y_power <= 30;
				X1_text <= 0;
				X2_text <= 7;
				Y1_text <= 3;
				Y2_text <= 0;
				bull_stop_flag1 <= 0;
				bull_stop_flag2 <= 0;
				Prev_Ball2X <= 530;
				Prev_Ball2Y <= 330;
				xbound <= 0;
				ybound <= 0;
				//Prev_Ball2X <= 530;
				//Prev_Ball2Y <= 330;
        end
//		  else if (player1flag == 1)begin 
//				Ball2_Y_Motion <= 10'd0; //Ball_Y_Step;
//				Ball2_X_Motion <= 10'd0; //Ball_X_Step;
//				Ball2_Y_Pos <= Ball2_Y_Center; //Ball2_Y_Center;
//				Ball2_X_Pos <= Ball2_X_Center;
//				Draw_Bull2 <= 0;
//		  end 
//		  else if (player2flag == 1) begin
//				Ball1_Y_Motion <= 10'd0; //Ball_Y_Step;
//				Ball1_X_Motion <= 10'd0; //Ball_X_Step;
//				Ball1_Y_Pos <= Ball1_Y_Center;
//				Ball1_X_Pos <= Ball1_X_Center;
//				Draw_Bull1 <= 0;
//				X_power <= 7;
//				Y_power <= 30;
//				X1_text <= 0;
//				X2_text <= 7;
//				Y1_text <= 3;
//				Y2_text <= 0;
//				bull_stop_flag1 <= 0;
//		  end
        else begin
				//Ball1_X_Pos <= Tank1X;
				//Ball2_X_Pos <= Tank2X;
		  
				//Ball2_Y_Pos <= 320; //Ball2_Y_Center;
				//Ball2_X_Pos <= 540; //Ball2_X_Center;
//					if ( (Ball_Y_Pos + Ball_Size) >= Ball_Y_Max )  // Ball is at the bottom edge, BOUNCE!
//					;//  Ball_Y_Motion <= (~ (Ball_Y_Step) + 1'b1);  // 2's complement.
//					  
//				   else if ( (Ball_Y_Pos) <= Ball_Y_Min )  // Ball is at the top edge, BOUNCE!
//					;//  Ball_Y_Motion <= Ball_Y_Step;
//					  
//				   else if ( (Ball_X_Pos + Ball_Size) >= Ball_X_Max )  // Ball is at the Right edge, BOUNCE!
//					 ;// Ball_X_Motion <= (~ (Ball_X_Step) + 1'b1);  // 2's complement.
//					  
//				   else if ( (Ball_X_Pos) <= Ball_X_Min )  // Ball is at the Left edge, BOUNCE!
//					 ;// Ball_X_Motion <= Ball_X_Step;
//					 
//					else 
//					  Ball_Y_Motion <= Ball_Y_Step; 
//					  Ball_X_Motion <= Ball_X_Step;

					//Draw_Bull1 <= 0;
					//Draw_Bull2 <= 1;

		  if (player1flag == 1) begin
		  case (keycode)
					8'h16 : begin
									Draw_Bull1 <= 1;
									//Ball1_X_Pos <= Tank1X;
									//Ball1_Y_Motion <= (-5*(Ball1_X_Motion)*(Ball1_X_Motion)) + (Ball1_X_Motion * 8);
									//Ball2_Y_Motion <= 0;
									//Ball1_X_Motion <= 2; 	
								
							  end 
					        
							  
					8'h52 : begin
								if (prev_keycode == 8'h0) begin
									//Y_power <= Y_power + 1;
									if (Y_power == 35) begin 
										Y_power <= Y_power;
									end else begin
										Y_power <= Y_power + 1;
									end
									prev_keycode <= keycode;
									

//									if (Y2_text == 9) begin
//										if (Y1_text == 9) begin
//											Y1_text <= 9;
//											Y2_text <= 9;
//										end else begin
//											Y1_text <= Y1_text + 1;
//											Y2_text <= 0;
//										end
//									end else begin
//									Y2_text <= Y2_text + 1;
//									end

								if (Y2_text == 9) begin
										Y1_text <= Y1_text + 1;
									   Y2_text <= 0;
									end else if (Y2_text == 5 && Y1_text ==3) begin
										Y1_text <= 3;
									   Y2_text <= 5;
									end
									else begin
										Y2_text <= Y2_text + 1;
									end

									
									
								end else begin
								end
							  
							  end
							  
					8'h51 : begin
								if (prev_keycode == 8'h0) begin
									//Y_power <= Y_power - 1;
									if (Y_power == 0) begin 
										Y_power <= Y_power;
									end else begin
										Y_power <= Y_power - 1;
									end
									prev_keycode <= keycode;
									
									if (Y2_text == 0 && Y1_text == 0) begin
									// If both Y1_text and Y2_text are 0, do nothing
									end else if (Y2_text == 0) begin
									// If Y2_text is 0, check Y1_text
										if (Y1_text == 0) begin
										// If Y1_text is also 0, set both to 0
										   Y1_text <= 0;
											Y2_text <= 0;
										end else begin
											Y1_text <= Y1_text - 1;
											Y2_text <= 9;
										end
									end else begin
											Y2_text <= Y2_text - 1;
									end
									
								end else begin
								end
								
							  
							  end
							  
					8'h4f : begin
								if (prev_keycode == 8'h0) begin
									//X_power <= X_power + 1;
									if (X_power ==20) begin 
										X_power <= X_power;
									end else begin
										X_power <= X_power + 1;
									end
									
									prev_keycode <= keycode;
									
//									if (X2_text == 9) begin
//										if (X1_text == 9) begin
//											X1_text <= 9;
//											X2_text <= 9;
//										end else begin
//											X1_text <= X1_text + 1;
//											X2_text <= 0;
//										end
//									end else begin
//										X2_text <= X2_text + 1;
//									end

									if (X2_text == 9) begin
										X1_text <= X1_text + 1;
									   X2_text <= 0;
									end else if (X2_text == 0 && X1_text ==2) begin
										X1_text <= 2;
									   X2_text <= 0;
									end
									else begin
										X2_text <= X2_text + 1;
									end
								
								end else begin
								end
							  
							  end
							  
					8'h50 : begin
								if (prev_keycode == 8'h0)begin
									//X_power <= X_power - 1;
									if (X_power == 0) begin 
										X_power <= X_power;
									end else begin
										X_power <= X_power - 1;
									end
									prev_keycode <= keycode;
									
									if (X2_text == 0 && X1_text == 0) begin
									// If both Y1_text and Y2_text are 0, do nothing
									end else if (X2_text == 0) begin
									// If Y2_text is 0, check Y1_text
										if (X1_text == 0) begin
										// If Y1_text is also 0, set both to 0
										   X1_text <= 0;
											X2_text <= 0;
										end else begin
											X1_text <= X1_text - 1;
											X2_text <= 9;
										end
									end else begin
											X2_text <= X2_text - 1;
									end
									
								end else begin
								end
							  
							  end
							  
					default: prev_keycode <= keycode; 
								
			endcase
			
//				Ball2_Y_Motion <= 10'd0; //Ball_Y_Step;
//				Ball2_X_Motion <= 10'd0; //Ball_X_Step;
//				Ball2_Y_Pos <= Ball2_Y_Center; //Ball2_Y_Center;
//				Ball2_X_Pos <= Ball2_X_Center;
//				Draw_Bull2 <= 0;
//				X_power <= 7;
//				Y_power <= 30;
//				X1_text <= 0;
//				X2_text <= 7;
//				Y1_text <= 3;
//				Y2_text <= 0;
				bull_stop_flag1 <= 0;
				bull_stop_flag2 <= 0;

			end else begin
			end
			
			
			if (player2flag == 1) begin
			case (keycode)
			
					8'h16 : begin
									Draw_Bull2 <= 1;
									//Ball1_X_Pos <= Tank1X;
									//Ball1_Y_Motion <= (-5*(Ball1_X_Motion)*(Ball1_X_Motion)) + (Ball1_X_Motion * 8);
									//Ball2_Y_Motion <= 0;
									//Ball1_X_Motion <= 2; 	
								
							  end 
					        
							  
					8'h52 : begin
								if (prev_keycode == 8'h0) begin
									//Y_power <= Y_power + 1;
									if (Y_power == 35) begin 
										Y_power <= Y_power;
									end else begin
										Y_power <= Y_power + 1;
									end
									prev_keycode <= keycode;
									

//									if (Y2_text == 9) begin
//										if (Y1_text == 9) begin
//											Y1_text <= 9;
//											Y2_text <= 9;
//										end else begin
//											Y1_text <= Y1_text + 1;
//											Y2_text <= 0;
//										end
//									end else begin
//									Y2_text <= Y2_text + 1;
//									end

									if (Y2_text == 9) begin
										Y1_text <= Y1_text + 1;
									   Y2_text <= 0;
									end else if (Y2_text == 5 && Y1_text ==3) begin
										Y1_text <= 3;
									   Y2_text <= 5;
									end
									else begin
										Y2_text <= Y2_text + 1;
									end
									
								end else begin
								end
							  
							  end
							  
					8'h51 : begin
								if (prev_keycode == 8'h0) begin
									//Y_power <= Y_power - 1;
									if (Y_power == 0) begin 
										Y_power <= Y_power;
									end else begin
										Y_power <= Y_power - 1;
									end
									prev_keycode <= keycode;
									
									if (Y2_text == 0 && Y1_text == 0) begin
									// If both Y1_text and Y2_text are 0, do nothing
									end else if (Y2_text == 0) begin
									// If Y2_text is 0, check Y1_text
										if (Y1_text == 0) begin
										// If Y1_text is also 0, set both to 0
										   Y1_text <= 0;
											Y2_text <= 0;
										end else begin
											Y1_text <= Y1_text - 1;
											Y2_text <= 9;
										end
									end else begin
											Y2_text <= Y2_text - 1;
									end
									
								end else begin
								end
								
							  
							  end
							  
					8'h4f : begin
								if (prev_keycode == 8'h0) begin
									//X_power <= X_power + 1;
									if (X_power == 20) begin 
										X_power <= X_power;
									end else begin
										X_power <= X_power + 1;
									end
									prev_keycode <= keycode;
//									
//									if (X2_text == 9) begin
//										if (X1_text == 9) begin
//											X1_text <= 9;
//											X2_text <= 9;
//										end else begin
//											X1_text <= X1_text + 1;
//											X2_text <= 0;
//										end
//									end else begin
//										X2_text <= X2_text + 1;
//									end

									if (X2_text == 9) begin
										X1_text <= X1_text + 1;
									   X2_text <= 0;
									end else if (X2_text == 0 && X1_text ==2) begin
										X1_text <= 2;
									   X2_text <= 0;
									end
									else begin
										X2_text <= X2_text + 1;
									end
								
								end else begin
								end
							  
							  end
							  
					8'h50 : begin
								if (prev_keycode == 8'h0)begin
									//X_power <= X_power - 1;
									if (X_power == 0) begin 
										X_power <= X_power;
									end else begin
										X_power <= X_power - 1;
									end
									prev_keycode <= keycode;
									
									if (X2_text == 0 && X1_text == 0) begin
									// If both Y1_text and Y2_text are 0, do nothing
									end else if (X2_text == 0) begin
									// If Y2_text is 0, check Y1_text
										if (X1_text == 0) begin
										// If Y1_text is also 0, set both to 0
										   X1_text <= 0;
											X2_text <= 0;
										end else begin
											X1_text <= X1_text - 1;
											X2_text <= 9;
										end
									end else begin
											X2_text <= X2_text - 1;
									end
									
								end else begin
								end
							  
							  end
							  
				  default: prev_keycode <= keycode; 
								
				
			endcase
			
//				Ball1_Y_Motion <= 10'd0; //Ball_Y_Step;
//				Ball1_X_Motion <= 10'd0; //Ball_X_Step;
//				Ball1_Y_Pos <= Ball1_Y_Center;
//				Ball1_X_Pos <= Ball1_X_Center;
//				Draw_Bull1 <= 0;
//				
//
//				X_power <= 7;
//				Y_power <= 30;
//				X1_text <= 0;
//				X2_text <= 7;
//				Y1_text <= 3;
//				Y2_text <= 0;
				bull_stop_flag1 <= 0;
				bull_stop_flag2 <= 0;

			end else begin
			end
			
//			if (bull1_collide_flag == 1) begin
//				Ball1_X_Motion <= 0;
//			end
//			else begin 
//				Ball1_X_Motion <= 1;
//			end
////			
//			if (bull2_collide_flag == 1) begin
//				Ball2_X_Motion <= 0;
//			end
//			else begin 
//				Ball2_X_Motion <= -2;
//			end

			if (bull_stop_flag2 == 1) begin
				//Draw_Bull2 <= 0;
				X_power <= 7;
				Y_power <= 30;
				X1_text <= 0;
				X2_text <= 7;
				Y1_text <= 3;
				Y2_text <= 0;
			end else begin
			end
			
			if (bull_stop_flag1 == 1) begin
				//Draw_Bull1 <= 0;
				X_power <= 7;
				Y_power <= 30;
				X1_text <= 0;
				X2_text <= 7;
				Y1_text <= 3;
				Y2_text <= 0;
			end else begin
			end
		
				 if (Draw_Bull1 == 1) begin
					if (bull1_collide_flag == 1 || Ball1_Y_Pos >= 381) begin
						Ball1_X_Pos <= Ball1_X_Pos;
						Ball1_Y_Pos <= Ball1_Y_Pos;
						bull_stop_flag1 <= 1;
						Draw_Bull1 <= 0;
					end else begin
//					if(Ball1_X_Pos > 350 & Ball1_X_Pos < 380) begin  
//						xbound <= 1;
//					end
//					
//					if (xbound == 1) begin
//					Ball1_X_Pos <= (300 - 2*timesig);
//					Ball1_Y_Pos <= 200 - 30*timesig + ((1*timesig*timesig));
//					//Ball1_X_Pos <= 320;
//					//Ball1_Y_Pos <= 240;
//					end
//					
////					else if(Ball1_Y_Pos == 0) begin
////					ybound <= 1;
////					end
////					else if (ybound == 1) begin
////					Ball1_X_Pos <= Prev_BallX + X_power*timesig;
////					Ball1_Y_Pos <= Prev_BallY + Y_power*timesig + ((1*timesig*timesig));
////					end
//					
//					
					//else begin
					Ball1_X_Pos <= Prev_BallX + X_power*timesig;
					Ball1_Y_Pos <= Prev_BallY - Y_power*timesig + ((1*timesig*timesig));
					Bounce_BallX <= Ball1_X_Pos;
					Bounce_BallY <= Ball1_Y_Pos;
					//xbound <= 0;
					
					//end
					
					
					end
				 end 
				 else if (player1flag == 1)begin 
					Ball1_X_Pos <= (Ball1_X_Pos + Tank1_X_Motion);
					Prev_BallX <= Ball1_X_Pos;
					Prev_BallY <= Ball1_Y_Pos;
					
				 end
				 else if (player2flag == 1) begin
				 
					Ball1_X_Pos <= Prev_BallX;
					Ball1_Y_Pos <= Prev_BallY;
					xbound <= 0;
					
				 end
				 
				 if (Draw_Bull2 == 1) begin
				 
					 if (bull2_collide_flag == 1 || Ball2_Y_Pos >= 381) begin
							Ball2_X_Pos <= Ball2_X_Pos;
							Ball2_Y_Pos <= Ball2_Y_Pos;
							bull_stop_flag2 <= 1;
							Draw_Bull2 <= 0;
						end else begin
						Ball2_X_Pos <= Prev_Ball2X - X_power*timesig;
						Ball2_Y_Pos <= Prev_Ball2Y - Y_power*timesig + ((timesig*timesig));
						end
					 end 
					 else if (player2flag == 1)begin 
						Ball2_X_Pos <= (Ball2_X_Pos + Tank2_X_Motion);
						Prev_Ball2X <= Ball2_X_Pos;
						Prev_Ball2Y <= Ball2_Y_Pos;
						
					 end
					 else if (player1flag == 1) begin
					 
						Ball2_X_Pos <= Prev_Ball2X;
						Ball2_Y_Pos <= Prev_Ball2Y;
				 
				 
				 
				 
				 
				 
				 
//					Ball2_Y_Pos <= (Ball2_Y_Pos + Ball2_Y_Motion);  // Update ball position
//					Ball2_X_Pos <= (Ball2_X_Pos + Ball2_X_Motion);
//				 end 
//				 else if (player2flag == 1) begin
//					Ball2_X_Pos <= (Ball2_X_Pos + Tank2_X_Motion);
//				 end
//				 else begin
//					Ball2_X_Pos <= Ball2_X_Center;
				 end
					  
		end
		
		// else begin end
	 end
       
    assign Bull1X = Ball1_X_Pos;
   
    assign Bull1Y = Ball1_Y_Pos;
   
    assign BullS = Ball_Size;
	 
	 assign Bull2X = Ball2_X_Pos;
   
    assign Bull2Y = Ball2_Y_Pos;
   

endmodule
