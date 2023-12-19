module battery_c_rom (
	input logic clock,
	input logic [10:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:1363] /* synthesis ram_init_file = "./battery_c/battery_c.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule
