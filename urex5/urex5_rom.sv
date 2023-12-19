module urex5_rom (
	input logic clock,
	input logic [9:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:1023] /* synthesis ram_init_file = "./urex5/urex5.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule
