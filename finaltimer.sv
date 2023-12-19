module  finaltimer( input Reset, frame_clk, startfinaltimer,
					output logic endgame);

logic [9:0] COUNT;

always_ff @ (posedge frame_clk or posedge Reset) begin
					
if (Reset) begin
	COUNT <= 0;
	endgame <= 0;
end else begin 
	if (startfinaltimer == 1) begin
	COUNT <= COUNT + 1;
		if (COUNT > 180) begin
		endgame <= 1;
		end else begin
		endgame <= 0;
		end
	end else begin 
	COUNT <= 0;
	endgame <= 0;
	end 
	
end

end
					

					
endmodule
					
					
					 