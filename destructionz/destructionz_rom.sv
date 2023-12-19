module destructionz_rom (
	input logic clock,
	input logic [10:0] address,
	output logic [1:0] q
);

logic [1:0] memory [0:1499] /* synthesis ram_init_file = "./destructionz/destructionz.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule
