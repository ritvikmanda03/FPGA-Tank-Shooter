module timer_explode (input logic frame_clk, timer_start,
						  output logic [9:0] timer_flag);
						  
						  
 always_ff @ (posedge frame_clk) begin
		timer_flag <= timer_flag + 1;
 end 
	
						
						
						  
endmodule 