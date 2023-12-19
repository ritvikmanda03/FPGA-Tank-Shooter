module titlescreen(
					  input [7:0] keycode,
					  input frame_clk, Reset,
					  output logic gamestart);
					  
always_ff @ (posedge Reset or posedge frame_clk ) 
begin

if (Reset) begin
	gamestart <= 0;
end
else begin
end

case (keycode)
					8'h2c : begin
									gamestart <= 1; 	
								
							  end 
							  
					default: gamestart <= 0 ;
							  
endcase

end 
endmodule 