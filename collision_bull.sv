module collision_bull(input Reset, frame_clk,
					  input [7:0] keycode,
					  input [9:0] firstX, firstY, firstS, 
					  input [9:0] secondX, secondY, secondS,
					  input logic drawbullflag,
					//  input [9:0] floorX, floorY, floorS,
					  output [3:0] health,
					  output logic bull_collide_flag);
					  
					  logic prev_collide;

    always_ff @ (posedge Reset or posedge frame_clk )
	 begin
	 
	 
	 if(Reset) begin
	 bull_collide_flag <= 0;
	 health <= 7;
	 end
	 
	 else if((((firstY >= secondY) && (firstY <= (secondY + secondS))) || (((firstY + firstS) >= secondY ) && ((firstY + firstS) <= (secondY + secondS))))
		&& (((firstX >= secondX) && (firstX <= (secondX + secondS))) || (((firstX + firstS) >= secondX ) && ((firstX + firstS) <= (secondX + secondS)))))
		begin 
		if (drawbullflag == 1) begin
			bull_collide_flag <= 1;
			health <= health - 1;
			
			if (prev_collide == 0) begin
				health <= health - 1;
			end else begin
				health <= health;
			end 
			
			prev_collide <= 1;
			
		end else begin
		end
		
		end 
	else begin 
		
			bull_collide_flag <= 0;
			prev_collide <= 0;
		
		end
		
		
	
end
endmodule 