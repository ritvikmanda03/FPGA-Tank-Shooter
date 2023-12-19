module  hittext ( input Reset, frame_clk,
					input [3:0] health,
					input [9:0] Tank_X_Motion, Tank_Y_Motion, Tank_X, Tank_Y,
					input logic bull_collide_flag,
					output logic drawcrittext, drawdesttext,
					output logic [9:0] textx, texty, startcount);
					
logic [9:0] COUNT;
					
always_ff @ (posedge frame_clk or posedge Reset) begin
	
	if(Reset) begin
		COUNT <= 0;
		drawcrittext <= 0;
		startcount <= 0;
		drawdesttext <= 0;
	end 
	else if (bull_collide_flag == 1) begin
		startcount <= 1;
		COUNT <= 0;
	end else if (startcount <= 1) begin
		if (COUNT < 180) begin
			COUNT <= COUNT + 1;
			if (health == 0)begin
				drawdesttext <= 1;
			end else begin
				drawcrittext <= 1;
			end
		end else begin 
			drawcrittext <= 0;
			startcount <= 0;
			drawdesttext <= 0;
		end
	end else begin
			drawcrittext <= 0;
			startcount <= 0;
			drawdesttext <= 0;
	end
	
	if (Reset) begin 
		textx = Tank_X - 34;
		texty = Tank_Y - 20;
		startcount <= 0;
		COUNT <= 0;
	end else begin 
		textx = textx + Tank_X_Motion;
		texty = texty + Tank_Y_Motion;
	end
	

	
end

endmodule

