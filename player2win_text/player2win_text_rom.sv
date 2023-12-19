module player2win_text_rom (
	input logic clock,
	input logic [14:0] address,
	output logic [2:0] q
);

logic [2:0] memory [0:26999] /* synthesis ram_init_file = "./player2win_text/player2win_text.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule
