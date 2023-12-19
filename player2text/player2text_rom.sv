module player2text_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:2815] /* synthesis ram_init_file = "./player2text/player2text.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule
