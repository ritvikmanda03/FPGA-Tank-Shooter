module collision(input Reset, frame_clk,
					  input [7:0] keycode,
					  input [9:0] firstX, firstY, firstS, 
					  input [9:0] secondX, secondY, secondS,
					//  input [9:0] floorX, floorY, floorS, 
					  output logic up_axis, down_axis, left_axis, right_axis);
					  
	 

    always_ff @ (posedge frame_clk )
	 begin
	 
	 
	 
	 
	 if((((firstY >= secondY) && (firstY <= (secondY + secondS))) || (((firstY + firstS) >= secondY ) && ((firstY + firstS) <= (secondY + secondS))))
		&& (((firstX >= secondX) && (firstX <= (secondX + secondS))) || (((firstX + firstS) >= secondX ) && ((firstX + firstS) <= (secondX + secondS)))))
		begin 
		
		if((firstX + firstS) <= secondX) begin
			left_axis <= 1;
			right_axis <= 0;
			up_axis <= 1;
			down_axis <= 1;
		end
		else begin end
		
		if(firstX >= (secondX + secondS)) begin
			left_axis <= 0;
			right_axis <= 1;
			up_axis <= 1;
			down_axis <= 1;
		end
		else begin end
		
		if(firstY >= (secondY + secondS)) begin
			left_axis <= 1;
			right_axis <= 1;
			up_axis <= 0;
			down_axis <= 1;
		end
		else begin end
		
		if((firstY + firstS) <= secondY) begin
			left_axis <= 1;
			right_axis <= 1;
			up_axis <= 1;
			down_axis <= 0;
		end
		else begin end
		
		end
		
	else begin
			left_axis <= 1;
			right_axis <= 1;
			up_axis <= 1;
			down_axis <= 1;
		end
	
end
endmodule 