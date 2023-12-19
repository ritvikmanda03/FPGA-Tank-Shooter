module time_module( input Reset, 
				input frame_clk,
				 input logic drawbullflag, drawbullflag2, xbound,
				 output [63:0] time_output);

logic [63:0] COUNT;
logic [63:0] TIME;
logic [63:0] Prev_TIME;

//assign Reset = drawbullflag;

always_ff @ (posedge frame_clk) begin
	
	if(Reset) begin
		COUNT <= 0;
		TIME <= 0;
		Prev_TIME  <= 0;
	end 
	else begin 
	end
	
	if(drawbullflag == 1 || drawbullflag2 == 1) begin
		COUNT <= COUNT + 1;
		if((COUNT % 3) == 0) begin
			if (xbound == 0) begin
			TIME <= TIME + 1;
			Prev_TIME <= TIME;
			end else begin
			TIME <= TIME + 1 - Prev_TIME;
			end
			end
		else begin 
			end
	end
	else begin
		COUNT <= 0;
		TIME <= 0;
		Prev_TIME <= 0;

		end
	
end

assign time_output = TIME;

endmodule

