module fuel_d_rom (
	input logic clock,
	input logic [9:0] address,
	output logic [2:0] q
);

logic [2:0] memory [0:967] /* synthesis ram_init_file = "./fuel_d/fuel_d.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule
