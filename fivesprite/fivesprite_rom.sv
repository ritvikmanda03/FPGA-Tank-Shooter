module fivesprite_rom (
	input logic clock,
	input logic [7:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:241] /* synthesis ram_init_file = "./fivesprite/fivesprite.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule
