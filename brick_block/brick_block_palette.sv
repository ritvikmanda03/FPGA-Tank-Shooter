module brick_block_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'hA, 4'hB, 4'hC},
	{4'h6, 4'h7, 4'h8},
	{4'h9, 4'hA, 4'hB},
	{4'hC, 4'hD, 4'hE},
	{4'h6, 4'h7, 4'h8},
	{4'hA, 4'hA, 4'hB},
	{4'h7, 4'h8, 4'h9},
	{4'h8, 4'h9, 4'hA},
	{4'h6, 4'h6, 4'h7},
	{4'h7, 4'h8, 4'h8},
	{4'hA, 4'hB, 4'hC},
	{4'h9, 4'hA, 4'hB},
	{4'hB, 4'hC, 4'hD},
	{4'hA, 4'hB, 4'hC},
	{4'h7, 4'h7, 4'h8},
	{4'h9, 4'hA, 4'hA}
};

assign {red, green, blue} = palette[index];

endmodule
