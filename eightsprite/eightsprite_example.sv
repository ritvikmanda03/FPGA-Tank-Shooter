module eightsprite_example (
	input logic [9:0] DrawX, DrawY,
	input logic vga_clk, blank,
	output logic [3:0] red, green, blue
);

logic [7:0] rom_address;
logic [3:0] rom_q;

logic [3:0] palette_red, palette_green, palette_blue;

assign rom_address = ((DrawX * 11) / 640) + (((DrawY * 22) / 480) * 11);

always_ff @ (posedge vga_clk) begin
	red <= 4'h0;
	green <= 4'h0;
	blue <= 4'h0;

	if (blank) begin
		red <= palette_red;
		green <= palette_green;
		blue <= palette_blue;
	end
end

eightsprite_rom eightsprite_rom (
	.clock   (vga_clk),
	.address (rom_address),
	.q       (rom_q)
);

eightsprite_palette eightsprite_palette (
	.index (rom_q),
	.red   (palette_red),
	.green (palette_green),
	.blue  (palette_blue)
);

endmodule
