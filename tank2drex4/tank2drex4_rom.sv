module tank2drex4_rom (
	input logic clock,
	input logic [9:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:1023] /* synthesis ram_init_file = "./tank2drex4/tank2drex4.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule
