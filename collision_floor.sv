module collisionf(input Reset, frame_clk,
					  input [9:0] firstX, 
					  input [9:0] firstY, 
					  input [9:0] firstS, 
					  output logic [9:0] firstYnew,
					  output logic [1:0] floor, floorL, downramp, upramp, godown);
					  
always_ff @ (posedge frame_clk )
	 begin
	 
//	 if (  
//	 
//	 (((firstX)  >= 48 - firstS + 11) && ((firstX) < 107))  || 
//	 
//	 (((firstX)  >= 208 - firstS + 11) && ((firstX) <= 272 - 6))  ||
//	 
//	 (((firstX)  >= 368 - firstS + 11) && ((firstX) <= 432 - 6))  ||
//	 
//	 (((firstX)  >= 528 - firstS + 11) && ((firstX) <= 592 - 6)) 
//	 
//	 
//	 ) begin // top
//		
//		
//	 
//	 
//		
//		floor <= 2'b00;
//		floorL <= 2'b00;
//		downramp <= 2'b00;
//		firstYnew <= firstY;
//	   upramp <= 2'b00;
//	
//		
//	 
//		end
//		
		
	  if(  
	 
			((firstX >= 112) && ((firstX) <= 140))  ||
	 
	 
			((firstX >= 272) && ((firstX) <= 300))  ||
			
			((firstX >= 432) && ((firstX) <= 460))  ||
			
			((firstX >= 592) && ((firstX) <= 620)) 
	 
	 
	 ) begin // down ramp
	 
//		if (firstX == 112) begin
//		
//		floor <= 2'b00;
//		downramp <= 2'b00;
//		firstYnew <= 0;
//		upramp <= 2'b00;
//		godown = 2'b01;
//		floorL <= 2'b00;
//		
//			
//		end
//		else begin 
		floor <= 2'b01;
		downramp <= 2'b01;
		firstYnew <= 10;
		upramp <= 2'b00;
		godown = 2'b00;
		floorL <= 2'b01;
//		end
	 
		end
		
		
	
	 else if (   
	 
	 (((firstX+ firstS)  >= 30) && ((firstX + firstS) <= 48)) || 
	 
	 (((firstX+ firstS)  >= 180 ) && ((firstX + firstS) <= 218)) || 
	 
	 (((firstX+ firstS)  >= 340) && ((firstX + firstS) <= 368)) || 
	 
	 (((firstX+ firstS)  >= 500) && ((firstX + firstS) <= 528)) 
	 
	 
	 ) begin // up ramp
		
		floor <= 2'b10;
		downramp <= 2'b00;
		firstYnew <= firstY;
		upramp <= 2'b01;
		godown = 2'b00;
		floorL <= 2'b10;
	 
		end
		
		
		else begin // bottom
		
		floor <= 2'b00;
		downramp <= 2'b00;
		firstYnew <= firstY;
		upramp <= 2'b00;
		godown = 2'b00;
		floorL <= 2'b00;
	 
		end
		
	end
		
///////////////////////////
//always_ff @ (posedge frame_clk )
//	 begin
//	 
//	 if (  // no yes
//	 
//	 (((firstX)  >= 48 - firstS) && ((firstX + firstS) <= 112 + firstS))  ||
//	 
//	 (((firstX)  >= 208 - firstS) && ((firstX + firstS) <= 272 + firstS))  ||
//	 
//	 (((firstX)  >= 368 - firstS) && ((firstX + firstS) <= 432 + firstS))  ||
//	 
//	 (((firstX)  >= 528 - firstS) && ((firstX + firstS) <= 592 + firstS)) 
//	 
//	 
//	 ) begin // top
//		
//		floorL <= 2'b00;
//	 
//		end
//		
//		
//	 else if(  ((firstX >= 112) && ((firstX + firstS) <= 140 + firstS))  || // no no
//	 
//	 
//			((firstX >= 272) && ((firstX + firstS) <= 300 + firstS))  ||
//			
//			((firstX >= 432) && ((firstX + firstS) <= 460 + firstS))  ||
//			
//			((firstX >= 592) && ((firstX + firstS) <= 620 + firstS)) 
//	 
//	 
//	 ) begin // down ramp
//		
//		floorL <= 2'b01;
//	 
//		end
//		
//		
//	
//	 else if (   // no yes
//	 
//	 (((firstX+ firstS)  >= 20 ) && ((firstX + firstS) <= 48)) || 
//	 
//	 (((firstX+ firstS)  >= 180 ) && ((firstX + firstS) <= 208)) || 
//	 
//	 (((firstX+ firstS)  >= 340 ) && ((firstX + firstS) <= 368)) || 
//	 
//	 (((firstX+ firstS)  >= 500 ) && ((firstX + firstS) <= 528)) 
//	 
//	 
//	 ) begin // up ramp
//		
//		floorL <= 2'b10;
//	
//	 
//		end
//		
//		
//	else begin // bottom
//		
//		floorL <= 2'b00;
//		
//	 
//		end
//		
//		
//		end
	

endmodule 

//????????????????????????????????????????????????????????????????????????????????????????
//
//module collisionf(input Reset, frame_clk,
//					  input [9:0] firstX, firstY, firstS, 
//					  output logic [1:0] floor, floorL);
//					  
//always_ff @ (posedge frame_clk )
//	 begin
//	 
//	 if (  
//	 
//	 (((firstX)  >= 48 - firstS) && ((firstX + firstS) <= 112 + firstS))  ||
//	 
//	 (((firstX)  >= 208 - firstS) && ((firstX + firstS) <= 272 + firstS))  ||
//	 
//	 (((firstX)  >= 368 - firstS) && ((firstX + firstS) <= 432 + firstS))  ||
//	 
//	 (((firstX)  >= 528 - firstS) && ((firstX + firstS) <= 592 + firstS)) 
//	 
//	 
//	 ) begin // top
//		
//		floor <= 2'b00;
//	 
//		end
//		
//		
//	 else if(  ((firstX > 112) && ((firstX + firstS) < 140 + firstS))  ||
//	 
//	 
//			((firstX > 272) && ((firstX + firstS) < 300 + firstS))  ||
//			
//			((firstX > 432) && ((firstX + firstS) < 460 + firstS))  ||
//			
//			((firstX > 592) && ((firstX + firstS) < 620 + firstS)) 
//	 
//	 
//	 ) begin // down ramp
//		
//		floor <= 2'b01;
//	 
//		end
//		
//		
//	else if (  
//	
//	(((firstX)  >= 140) && ((firstX + firstS) <= 180)) ||
//	
//	
//	(((firstX)  >= 300) && ((firstX + firstS) <= 340)) ||
//	
//	(((firstX)  >= 460) && ((firstX + firstS) <= 500)) ||
//	
//	(((firstX)  >= 620) && ((firstX + firstS) <= 660))
//
//	
//	) begin // bottom
//		
//		floor <= 2'b00;
//		
//	 
//		end
//		
//	
//	 else if (   
//	 
//	 (((firstX)  > 20 - firstS) && ((firstX + firstS) < 48)) || 
//	 
//	 (((firstX)  > 180 - firstS) && ((firstX + firstS) < 208)) || 
//	 
//	 (((firstX)  > 340 - firstS) && ((firstX + firstS) < 368)) || 
//	 
//	 (((firstX
//	 )  > 500 - firstS) && ((firstX + firstS) < 528)) 
//	 
//	 
//	 ) begin // up ramp
//		
//		floor <= 2'b10;
//	
//	 
//		end
//	end
//		
/////////////////////////////
//always_ff @ (posedge frame_clk )
//	 begin
//	 
//	 if (  
//	 
//	 (((firstX)  >= 48 - firstS) && ((firstX + firstS) <= 112 + firstS))  ||
//	 
//	 (((firstX)  >= 208 - firstS) && ((firstX + firstS) <= 272 + firstS))  ||
//	 
//	 (((firstX)  >= 368 - firstS) && ((firstX + firstS) <= 432 + firstS))  ||
//	 
//	 (((firstX)  >= 528 - firstS) && ((firstX + firstS) <= 592 + firstS)) 
//	 
//	 
//	 ) begin // top
//		
//		floorL <= 2'b00;
//	 
//		end
//		
//		
//	 else if(  ((firstX > 112) && ((firstX + firstS) < 140 + firstS))  ||
//	 
//	 
//			((firstX > 272) && ((firstX + firstS) < 300 + firstS))  ||
//			
//			((firstX > 432) && ((firstX + firstS) < 460 + firstS))  ||
//			
//			((firstX > 592) && ((firstX + firstS) < 620 + firstS)) 
//	 
//	 
//	 ) begin // down ramp
//		
//		floorL <= 2'b01;
//	 
//		end
//		
//		
//	else if (  
//	
//	(((firstX)  >= 140) && ((firstX + firstS) <= 180)) ||
//	
//	
//	(((firstX)  >= 300) && ((firstX + firstS) <= 340)) ||
//	
//	(((firstX)  >= 460) && ((firstX + firstS) <= 500)) ||
//	
//	(((firstX)  >= 620) && ((firstX + firstS) <= 660))
//
//	
//	) begin // bottom
//		
//		floorL <= 2'b00;
//		
//	 
//		end
//		
//	
//	 else if (   
//	 
//	 (((firstX)  > 20 - firstS) && ((firstX + firstS) < 48)) || 
//	 
//	 (((firstX)  > 180 - firstS) && ((firstX + firstS) < 208)) || 
//	 
//	 (((firstX)  > 340 - firstS) && ((firstX + firstS) < 368)) || 
//	 
//	 (((firstX
//	 )  > 500 - firstS) && ((firstX + firstS) < 528)) 
//	 
//	 
//	 ) begin // up ramp
//		
//		floorL <= 2'b10;
//	
//	 
//		end
//		
//		
//		end
//	
//
//endmodule 