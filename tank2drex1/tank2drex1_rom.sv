module tank2drex1_rom (
	input logic clock,
	input logic [9:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:1023] /* synthesis ram_init_file = "./tank2drex1/tank2drex1.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule
