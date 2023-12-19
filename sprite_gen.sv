

module sprite_gen (
	input logic [9:0] DrawX, DrawY, fuel1, fuel2, textx1, textx2, texty1, texty2,
	input logic [1:0] downramp, downramp2, upramp2, upramp,
	input logic vga_clk, blank, Draw_Bull1, Draw_Bull2, startscreen, player1win, player2win, drawcrit1, drawcrit2, drawdest1, drawdest2,
	input logic [3:0] bull_explode_flag, bull_explode_flag2, health1, health2,
	input logic [9:0] BallX, BallY, Ball_Size, xaxis, Ball_X_Motion, Tank2X, Tank2Y, Tank2_Size, Bull2X, Bull2Y, Bull_Size, x1text, x2text, y1text, y2text,
	input logic [63:0] Bull1X, Bull1Y,
	output logic [3:0] red, green, blue,
	output logic [9:0] DistX_floor, DistY_floor,
	output logic check
);

logic [12:0] rom_address_tank;
logic [3:0] rom_q_tank;
logic [3:0] tank_red, tank_green, tank_blue;

logic [12:0] rom_address_lr;
logic [3:0] rom_q_lr;
logic [3:0] lr_red, lr_green, lr_blue;

logic [16:0] rom_address_bg;
logic [3:0] rom_q_bg;
logic [3:0] bg_red, bg_green, bg_blue;

logic [5:0] rom_address_bull1;
logic [3:0] rom_q_bull1;
logic [3:0] bull1_red, bull1_green, bull1_blue;

logic [5:0] rom_address_bull2;
logic [3:0] rom_q_bull2;
logic [3:0] bull2_red, bull2_green, bull2_blue;


logic [9:0] rom_address_tank2;
logic [3:0] rom_q_tank2;
logic [3:0] tank2_red, tank2_green, tank2_blue;


logic [11:0] rom_address_floor;
logic [3:0] rom_q_floor;
logic [3:0] floor_red, floor_green, floor_blue;

logic [11:0] rom_address_player1;
logic [3:0] rom_q_player1;
logic [3:0] player1_red, player1_green, player1_blue;

logic [11:0] rom_address_player2;
logic [3:0] rom_q_player2;
logic [3:0] player2_red, player2_green, player2_blue;

logic [10:0] rom_address_batteryfull1;
logic [3:0] rom_q_batteryfull1;
logic [3:0] batteryfull1_red, batteryfull1_green, batteryfull1_blue;

logic [10:0] rom_address_batteryfull2;
logic [3:0] rom_q_batteryfull2;
logic [3:0] batteryfull2_red, batteryfull2_green, batteryfull2_blue;

logic [16:0] rom_address_shellshocktitle;
logic [2:0] rom_q_shellshocktitle;
logic [3:0] shellshocktitle_red, shellshocktitle_green, shellshocktitle_blue;

logic [14:0] rom_address_player1win;
logic [2:0] rom_q_player1win;
logic [3:0] player1win_red, player1win_green, player1win_blue;

logic [14:0] rom_address_player2win;
logic [2:0] rom_q_player2win;
logic [3:0] player2win_red, player2win_green, player2win_blue;

logic [9:0] rom_address_downramp2;
logic [3:0] rom_q_downramp2;
logic [3:0] downramp2_red, downramp2_green, downramp2_blue;

logic [9:0] rom_address_downramp;
logic [3:0] rom_q_downramp;
logic [3:0] downramp_red, downramp_green, downramp_blue;

logic [9:0] rom_address_upramp2;
logic [3:0] rom_q_upramp2;
logic [3:0] upramp2_red, upramp2_green, upramp2_blue;

logic [9:0] rom_address_upramp;
logic [3:0] rom_q_upramp;
logic [3:0] upramp_red, upramp_green, upramp_blue;

logic [10:0] rom_address_battery_b1;
logic [3:0] rom_q_battery_b1;
logic [3:0] battery_b1_red, battery_b1_green, battery_b1_blue;

logic [10:0] rom_address_battery_c1;
logic [3:0] rom_q_battery_c1;
logic [3:0] battery_c1_red, battery_c1_green, battery_c1_blue;

logic [10:0] rom_address_battery_d1;
logic [3:0] rom_q_battery_d1;
logic [3:0] battery_d1_red, battery_d1_green, battery_d1_blue;

logic [10:0] rom_address_battery_e1;
logic [3:0] rom_q_battery_e1;
logic [3:0] battery_e1_red, battery_e1_green, battery_e1_blue;

logic [10:0] rom_address_battery_f1;
logic [3:0] rom_q_battery_f1;
logic [3:0] battery_f1_red, battery_f1_green, battery_f1_blue;

logic [10:0] rom_address_battery_g1;
logic [3:0] rom_q_battery_g1;
logic [3:0] battery_g1_red, battery_g1_green, battery_g1_blue;

logic [10:0] rom_address_batteryempty1;
logic [3:0] rom_q_batteryempty1;
logic [3:0] batteryempty1_red, batteryempty1_green, batteryempty1_blue;

logic [10:0] rom_address_battery_b2;
logic [3:0] rom_q_battery_b2;
logic [3:0] battery_b2_red, battery_b2_green, battery_b2_blue;

logic [10:0] rom_address_battery_c2;
logic [3:0] rom_q_battery_c2;
logic [3:0] battery_c2_red, battery_c2_green, battery_c2_blue;

logic [10:0] rom_address_battery_d2;
logic [3:0] rom_q_battery_d2;
logic [3:0] battery_d2_red, battery_d2_green, battery_d2_blue;

logic [10:0] rom_address_battery_e2;
logic [3:0] rom_q_battery_e2;
logic [3:0] battery_e2_red, battery_e2_green, battery_e2_blue;

logic [10:0] rom_address_battery_f2;
logic [3:0] rom_q_battery_f2;
logic [3:0] battery_f2_red, battery_f2_green, battery_f2_blue;

logic [10:0] rom_address_battery_g2;
logic [3:0] rom_q_battery_g2;
logic [3:0] battery_g2_red, battery_g2_green, battery_g2_blue;

logic [10:0] rom_address_batteryempty2;
logic [3:0] rom_q_batteryempty2;
logic [3:0] batteryempty2_red, batteryempty2_green, batteryempty2_blue;

logic [9:0] rom_address_fuelfull1;
logic [2:0] rom_q_fuelfull1;
logic [3:0] fuelfull1_red, fuelfull1_green, fuelfull1_blue;

logic [9:0] rom_address_fuel_b1;
logic [2:0] rom_q_fuel_b1;
logic [3:0] fuel_b1_red, fuel_b1_green, fuel_b1_blue;

logic [9:0] rom_address_fuel_c1;
logic [2:0] rom_q_fuel_c1;
logic [3:0] fuel_c1_red, fuel_c1_green, fuel_c1_blue;

logic [9:0] rom_address_fuel_d1;
logic [2:0] rom_q_fuel_d1;
logic [3:0] fuel_d1_red, fuel_d1_green, fuel_d1_blue;

logic [9:0] rom_address_fuel_e1;
logic [2:0] rom_q_fuel_e1;
logic [3:0] fuel_e1_red, fuel_e1_green, fuel_e1_blue;

logic [9:0] rom_address_fuelempty1;
logic [2:0] rom_q_fuelempty1;
logic [3:0] fuelempty1_red, fuelempty1_green, fuelempty1_blue;

logic [9:0] rom_address_fuelfull2;
logic [2:0] rom_q_fuelfull2;
logic [3:0] fuelfull2_red, fuelfull2_green, fuelfull2_blue;

logic [9:0] rom_address_fuel_b2;
logic [2:0] rom_q_fuel_b2;
logic [3:0] fuel_b2_red, fuel_b2_green, fuel_b2_blue;

logic [9:0] rom_address_fuel_c2;
logic [2:0] rom_q_fuel_c2;
logic [3:0] fuel_c2_red, fuel_c2_green, fuel_c2_blue;

logic [9:0] rom_address_fuel_d2;
logic [2:0] rom_q_fuel_d2;
logic [3:0] fuel_d2_red, fuel_d2_green, fuel_d2_blue;

logic [9:0] rom_address_fuel_e2;
logic [2:0] rom_q_fuel_e2;
logic [3:0] fuel_e2_red, fuel_e2_green, fuel_e2_blue;

logic [9:0] rom_address_fuelempty2;
logic [2:0] rom_q_fuelempty2;
logic [3:0] fuelempty2_red, fuelempty2_green, fuelempty2_blue;

logic [10:0] rom_address_crit1;
logic [1:0] rom_q_crit1;
logic [3:0] crit1_red, crit1_green, crit1_blue;

logic [10:0] rom_address_crit2;
logic [1:0] rom_q_crit2;
logic [3:0] crit2_red, crit2_green, crit2_blue;

logic [10:0] rom_address_dest1;
logic [1:0] rom_q_dest1;
logic [3:0] dest1_red, dest1_green, dest1_blue;

logic [10:0] rom_address_dest2;
logic [1:0] rom_q_dest2;
logic [3:0] dest2_red, dest2_green, dest2_blue;

logic [11:0] rom_address_x1;
logic [0:0] rom_q_x1;
logic [3:0] x1_red, x1_green, x1_blue;

logic [11:0] rom_address_x2;
logic [0:0] rom_q_x2;
logic [3:0] x2_red, x2_green, x2_blue;

logic [11:0] rom_address_y1;
logic [0:0] rom_q_y1;
logic [3:0] y1_red, y1_green, y1_blue;

logic [11:0] rom_address_y2;
logic [0:0] rom_q_y2;
logic [3:0] y2_red, y2_green, y2_blue;

logic [9:0] rom_address_ex1, rom_address_ex2, rom_address_ex3, rom_address_ex4, rom_address_ex5, rom_address_ex6, rom_address_ex7, rom_address_ex8, rom_address_ex9, rom_address_ex10;
logic [3:0] rom_q_ex1,rom_q_ex2, rom_q_ex3, rom_q_ex4, rom_q_ex5, rom_q_ex6, rom_q_ex7, rom_q_ex8, rom_q_ex9, rom_q_ex10;
logic [3:0] ex1_red, ex1_green, ex1_blue;
logic [3:0] ex2_red, ex2_green, ex2_blue;
logic [3:0] ex3_red, ex3_green, ex3_blue;
logic [3:0] ex4_red, ex4_green, ex4_blue;
logic [3:0] ex5_red, ex5_green, ex5_blue;
logic [3:0] ex6_red, ex6_green, ex6_blue;
logic [3:0] ex7_red, ex7_green, ex7_blue;
logic [3:0] ex8_red, ex8_green, ex8_blue;
logic [3:0] ex9_red, ex9_green, ex9_blue;
logic [3:0] ex10_red, ex10_green, ex10_blue;

logic [9:0] rom_address_drex1, rom_address_drex2, rom_address_drex3, rom_address_drex4, rom_address_drex5, rom_address_drex6, rom_address_drex7, rom_address_drex8, rom_address_drex9, rom_address_drex10;
logic [3:0] rom_q_drex1,rom_q_drex2, rom_q_drex3, rom_q_drex4, rom_q_drex5, rom_q_drex6, rom_q_drex7, rom_q_drex8, rom_q_drex9, rom_q_drex10;
logic [3:0] drex1_red, drex1_green, drex1_blue;
logic [3:0] drex2_red, drex2_green, drex2_blue;
logic [3:0] drex3_red, drex3_green, drex3_blue;
logic [3:0] drex4_red, drex4_green, drex4_blue;
logic [3:0] drex5_red, drex5_green, drex5_blue;
logic [3:0] drex6_red, drex6_green, drex6_blue;
logic [3:0] drex7_red, drex7_green, drex7_blue;
logic [3:0] drex8_red, drex8_green, drex8_blue;
logic [3:0] drex9_red, drex9_green, drex9_blue;
logic [3:0] drex10_red, drex10_green, drex10_blue;

logic [9:0] rom_address_urex1, rom_address_urex2, rom_address_urex3, rom_address_urex4, rom_address_urex5, rom_address_urex6, rom_address_urex7, rom_address_urex8, rom_address_urex9, rom_address_urex10;
logic [3:0] rom_q_urex1,rom_q_urex2, rom_q_urex3, rom_q_urex4, rom_q_urex5, rom_q_urex6, rom_q_urex7, rom_q_urex8, rom_q_urex9, rom_q_urex10;
logic [3:0] urex1_red, urex1_green, urex1_blue;
logic [3:0] urex2_red, urex2_green, urex2_blue;
logic [3:0] urex3_red, urex3_green, urex3_blue;
logic [3:0] urex4_red, urex4_green, urex4_blue;
logic [3:0] urex5_red, urex5_green, urex5_blue;
logic [3:0] urex6_red, urex6_green, urex6_blue;
logic [3:0] urex7_red, urex7_green, urex7_blue;
logic [3:0] urex8_red, urex8_green, urex8_blue;
logic [3:0] urex9_red, urex9_green, urex9_blue;
logic [3:0] urex10_red, urex10_green, urex10_blue;

logic [9:0] rom_address_tank2ex1, rom_address_tank2ex2, rom_address_tank2ex3, rom_address_tank2ex4, rom_address_tank2ex5, rom_address_tank2ex6, rom_address_tank2ex7, rom_address_tank2ex8, rom_address_tank2ex9, rom_address_tank2ex10;
logic [3:0] rom_q_tank2ex1,rom_q_tank2ex2, rom_q_tank2ex3, rom_q_tank2ex4, rom_q_tank2ex5, rom_q_tank2ex6, rom_q_tank2ex7, rom_q_tank2ex8, rom_q_tank2ex9, rom_q_tank2ex10;
logic [3:0] tank2ex1_red, tank2ex1_green, tank2ex1_blue;
logic [3:0] tank2ex2_red, tank2ex2_green, tank2ex2_blue;
logic [3:0] tank2ex3_red, tank2ex3_green, tank2ex3_blue;
logic [3:0] tank2ex4_red, tank2ex4_green, tank2ex4_blue;
logic [3:0] tank2ex5_red, tank2ex5_green, tank2ex5_blue;
logic [3:0] tank2ex6_red, tank2ex6_green, tank2ex6_blue;
logic [3:0] tank2ex7_red, tank2ex7_green, tank2ex7_blue;
logic [3:0] tank2ex8_red, tank2ex8_green, tank2ex8_blue;
logic [3:0] tank2ex9_red, tank2ex9_green, tank2ex9_blue;
logic [3:0] tankex10_red, tank2ex10_green, tank2ex10_blue;

logic [9:0] rom_address_tank2drex1, rom_address_tank2drex2, rom_address_tank2drex3, rom_address_tank2drex4, rom_address_tank2drex6, rom_address_tank2drex7, rom_address_tank2drex8, rom_address_tank2drex9, rom_address_tank2drex10;
logic [3:0] rom_q_tank2drex1,rom_q_tank2drex2, rom_q_tank2drex3, rom_q_tank2drex4, rom_q_tank2drex6, rom_q_tank2drex7, rom_q_tank2drex8, rom_q_tank2drex9, rom_q_tank2drex10;
logic [3:0] tank2drex1_red, tank2drex1_green, tank2drex1_blue;
logic [3:0] tank2drex2_red, tank2drex2_green, tank2drex2_blue;
logic [3:0] tank2drex3_red, tank2drex3_green, tank2drex3_blue;
logic [3:0] tank2drex4_red, tank2drex4_green, tank2drex4_blue;
logic [3:0] tank2drex6_red, tank2drex6_green, tank2drex6_blue;
logic [3:0] tank2drex7_red, tank2drex7_green, tank2drex7_blue;
logic [3:0] tank2drex8_red, tank2drex8_green, tank2drex8_blue;
logic [3:0] tank2drex9_red, tank2drex9_green, tank2drex9_blue;
logic [3:0] tank2drex10_red, tank2drex10_green, tank2drex10_blue;

logic [9:0] rom_address_tank2urex1, rom_address_tank2urex2, rom_address_tank2urex3, rom_address_tank2urex4, rom_address_tank2urex6, rom_address_tank2urex7, rom_address_tank2urex8, rom_address_tank2urex9, rom_address_tank2urex10;
logic [3:0] rom_q_tank2urex1,rom_q_tank2urex2, rom_q_tank2urex3, rom_q_tank2urex4, rom_q_tank2urex6, rom_q_tank2urex7, rom_q_tank2urex8, rom_q_tank2urex9, rom_q_tank2urex10;
logic [3:0] tank2urex1_red, tank2urex1_green, tank2urex1_blue;
logic [3:0] tank2urex2_red, tank2urex2_green, tank2urex2_blue;
logic [3:0] tank2urex3_red, tank2urex3_green, tank2urex3_blue;
logic [3:0] tank2urex4_red, tank2urex4_green, tank2urex4_blue;
logic [3:0] tank2urex6_red, tank2urex6_green, tank2urex6_blue;
logic [3:0] tank2urex7_red, tank2urex7_green, tank2urex7_blue;
logic [3:0] tank2urex8_red, tank2urex8_green, tank2urex8_blue;
logic [3:0] tank2urex9_red, tank2urex9_green, tank2urex9_blue;
logic [3:0] tank2urex10_red, tank2urex10_green, tank2urex10_blue;



logic [7:0] rom_address_x10, rom_address_x11, rom_address_x12, rom_address_x13, rom_address_x14, rom_address_x15, rom_address_x16, rom_address_x17, rom_address_x18, rom_address_x19;
logic [3:0] rom_q_x10, rom_q_x11, rom_q_x12, rom_q_x13, rom_q_x14, rom_q_x15, rom_q_x16, rom_q_x17, rom_q_x18, rom_q_x19;
logic [3:0] x10_red, x10_green, x10_blue;
logic [3:0] x11_red, x11_green, x11_blue;
logic [3:0] x12_red, x12_green, x12_blue;
logic [3:0] x13_red, x13_green, x13_blue;
logic [3:0] x14_red, x14_green, x14_blue;
logic [3:0] x15_red, x15_green, x15_blue;
logic [3:0] x16_red, x16_green, x16_blue;
logic [3:0] x17_red, x17_green, x17_blue;
logic [3:0] x18_red, x18_green, x18_blue;
logic [3:0] x19_red, x19_green, x19_blue;

logic [7:0] rom_address_x20, rom_address_x21, rom_address_x22, rom_address_x23, rom_address_x24, rom_address_x25, rom_address_x26, rom_address_x27, rom_address_x28, rom_address_x29;
logic [3:0] rom_q_x20, rom_q_x21, rom_q_x22, rom_q_x23, rom_q_x24, rom_q_x25, rom_q_x26, rom_q_x27, rom_q_x28, rom_q_x29;
logic [3:0] x20_red, x20_green, x20_blue;
logic [3:0] x21_red, x21_green, x21_blue;
logic [3:0] x22_red, x22_green, x22_blue;
logic [3:0] x23_red, x23_green, x23_blue;
logic [3:0] x24_red, x24_green, x24_blue;
logic [3:0] x25_red, x25_green, x25_blue;
logic [3:0] x26_red, x26_green, x26_blue;
logic [3:0] x27_red, x27_green, x27_blue;
logic [3:0] x28_red, x28_green, x28_blue;
logic [3:0] x29_red, x29_green, x29_blue;

logic [7:0] rom_address_y10, rom_address_y11, rom_address_y12, rom_address_y13, rom_address_y14, rom_address_y15, rom_address_y16, rom_address_y17, rom_address_y18, rom_address_y19;
logic [3:0] rom_q_y10, rom_q_y11, rom_q_y12, rom_q_y13, rom_q_y14, rom_q_y15, rom_q_y16, rom_q_y17, rom_q_y18, rom_q_y19;
logic [3:0] y10_red, y10_green, y10_blue;
logic [3:0] y11_red, y11_green, y11_blue;
logic [3:0] y12_red, y12_green, y12_blue;
logic [3:0] y13_red, y13_green, y13_blue;
logic [3:0] y14_red, y14_green, y14_blue;
logic [3:0] y15_red, y15_green, y15_blue;
logic [3:0] y16_red, y16_green, y16_blue;
logic [3:0] y17_red, y17_green, y17_blue;
logic [3:0] y18_red, y18_green, y18_blue;
logic [3:0] y19_red, y19_green, y19_blue;

logic [7:0] rom_address_y20, rom_address_y21, rom_address_y22, rom_address_y23, rom_address_y24, rom_address_y25, rom_address_y26, rom_address_y27, rom_address_y28, rom_address_y29;
logic [3:0] rom_q_y20, rom_q_y21, rom_q_y22, rom_q_y23, rom_q_y24, rom_q_y25, rom_q_y26, rom_q_y27, rom_q_y28, rom_q_y29;
logic [3:0] y20_red, y20_green, y20_blue;
logic [3:0] y21_red, y21_green, y21_blue;
logic [3:0] y22_red, y22_green, y22_blue;
logic [3:0] y23_red, y23_green, y23_blue;
logic [3:0] y24_red, y24_green, y24_blue;
logic [3:0] y25_red, y25_green, y25_blue;
logic [3:0] y26_red, y26_green, y26_blue;
logic [3:0] y27_red, y27_green, y27_blue;
logic [3:0] y28_red, y28_green, y28_blue;
logic [3:0] y29_red, y29_green, y29_blue;


logic [9:0] FloorX, FloorY, Floor_X_Size, Floor_Y_Size, Floor_X_Left, Floor_X_Right, Floor_Y_Top, Floor_Y_Down; //Bull1X, Bull1Y, Bull_Size;
logic [9:0] Player1X, Player1Y, Player2X, Player2Y, Player1X_Size, Player2X_Size, Player1Y_Size, Player2Y_Size;

assign Player1X = 48;
assign Player1Y = 20;

assign Player2X = 466;
assign Player2Y = 20;

assign Player1X_Size = 128;
assign Player1Y_Size = 22;

assign Player2X_Size = 128;
assign Player2Y_Size = 22;

logic [9:0] Battery1X, Battery1Y, Battery2X, Battery2Y, Battery1X_Size, Battery2X_Size, Battery1Y_Size, Battery2Y_Size;

assign Battery1X = 48;
assign Battery1Y = 45;

assign Battery2X = 466;
assign Battery2Y = 45;

assign Battery1X_Size = 62;
assign Battery1Y_Size = 22;

assign Battery2X_Size = 62;
assign Battery2Y_Size = 22;

logic [9:0] x1text_X, x1text_Y, x2text_X, x2text_Y;
logic [9:0] y1text_X, y1text_Y, y2text_X, y2text_Y;
logic [9:0] text_SizeX, text_SizeY;

assign x1text_X = 293;
assign x1text_Y = 20;

assign x2text_X = 305;
assign x2text_Y = 20;

assign y1text_X = 335;
assign y1text_Y = 20;

assign y2text_X = 347;
assign y2text_Y = 20;

assign text_SizeX = 10;
assign text_SizeY = 22;


assign FloorX = 0;
assign FloorY = 0; //352;

logic [9:0] Player1winX, Player1winY, Player2winX, Player2winY, PlayerwinX_Size, PlayerwinY_Size, titleX, titleY, titleX_Size, titleY_Size;

assign Player1winX = 140;
assign Player1winY = 202;

assign Player2winX = 140;
assign Player2winY = 202;

assign titleX = 160;
assign titleY = 62;

assign PlayerwinX_Size = 360;
assign PlayerwinY_Size = 75;

assign titleX_Size = 320;
assign titleY_Size = 240;

logic [9:0] Fuel1X, Fuel1Y, Fuel2X, Fuel2Y, Fuel1X_Size, Fuel2X_Size, Fuel1Y_Size, Fuel2Y_Size;

assign Fuel1X = 115;
assign Fuel1Y = 45;

assign Fuel2X = 533;
assign Fuel2Y = 45;

assign Fuel1X_Size = 44;
assign Fuel1Y_Size = 22;

assign Fuel2X_Size = 44;
assign Fuel2Y_Size = 22;

logic [9:0] textxsize, textysize;

assign textxsize = 100;
assign textysize = 15; 

//assign Floor_X_Size = 640; 
//assign Floor_Y_Size = 128;
//
//assign Floor_X_Left = 0;
//assign Floor_Y_Top = 5;//|(DistX_floor%16)-8|-4;
//assign Floor_X_Right = 640;
//assign Floor_Y_Down = 128;;

//assign Bull1X = 110;
//assign Bull1Y = 300;
////	 
//assign Bull_Size = 7;



logic [9:0] DistX_tank, DistY_tank, Size_tank;
assign DistX_tank = DrawX - BallX;
assign DistY_tank = DrawY - BallY;
assign Size_tank = Ball_Size;
logic ball_on;

logic [9:0] DistX_tank2, DistY_tank2, Size_tank2;
assign DistX_tank2 = DrawX - Tank2X;
assign DistY_tank2 = DrawY - Tank2Y;
assign Size_tank2 = Tank2_Size;
logic tank2_on;

logic [9:0] SizeX_floor, SizeY_floor;
assign DistX_floor = DrawX - FloorX;
assign DistY_floor = DrawY - FloorY;
//assign SizeX_floor = Floor_X_Size;
//assign SizeY_floor = Floor_Y_Size;
logic floor_on, base_on, two, three, four, five;


logic [9:0] DistX_bull1, DistY_bull1, Size_bull1;
assign DistX_bull1 = DrawX - Bull1X;
assign DistY_bull1 = DrawY - Bull1Y;
assign Size_bull1 = Bull_Size;
logic bull1_on;

logic [9:0] DistX_bull2, DistY_bull2, Size_bull2;
assign DistX_bull2 = DrawX - Bull2X;
assign DistY_bull2 = DrawY - Bull2Y;
assign Size_bull2 = Bull_Size;
logic bull2_on;

// int addr1 = $urandom_range(3'd352,3'd382);
logic [9:0] DistX_player1, DistY_player1, SizeX_player1, SizeY_player1;
assign DistX_player1 = DrawX - Player1X;
assign DistY_player1 = DrawY - Player1Y;
assign SizeX_player1 = Player1X_Size;
assign SizeY_player1 = Player1Y_Size;
logic player1_on;

logic [9:0] DistX_player2, DistY_player2, SizeX_player2, SizeY_player2;
assign DistX_player2 = DrawX - Player2X;
assign DistY_player2 = DrawY - Player2Y;
assign SizeX_player2 = Player2X_Size;
assign SizeY_player2 = Player2Y_Size;
logic player2_on;

logic [9:0] DistX_battery1, DistY_battery1, SizeX_battery1, SizeY_battery1;
assign DistX_battery1 = DrawX - Battery1X;
assign DistY_battery1 = DrawY - Battery1Y;
assign SizeX_battery1 = Battery1X_Size;
assign SizeY_battery1 = Battery1Y_Size;
logic battery1_on;

logic [9:0] DistX_battery2, DistY_battery2, SizeX_battery2, SizeY_battery2;
assign DistX_battery2 = DrawX - Battery2X;
assign DistY_battery2 = DrawY - Battery2Y;
assign SizeX_battery2 = Battery2X_Size;
assign SizeY_battery2 = Battery2Y_Size;
logic battery2_on;

logic [9:0] DistX_x1text, DistY_x1text, SizeX_x1text, SizeY_x1text;
assign DistX_x1text = DrawX - x1text_X;
assign DistY_x1text = DrawY - x1text_Y;
assign SizeX_x1text = text_SizeX;
assign SizeY_x1text = text_SizeY;
logic x1text_on;

logic [9:0] DistX_x2text, DistY_x2text, SizeX_x2text, SizeY_x2text;
assign DistX_x2text = DrawX - x2text_X;
assign DistY_x2text = DrawY - x2text_Y;
assign SizeX_x2text = text_SizeX;
assign SizeY_x2text = text_SizeY;
logic x2text_on;

logic [9:0] DistX_y1text, DistY_y1text, SizeX_y1text, SizeY_y1text;
assign DistX_y1text = DrawX - y1text_X;
assign DistY_y1text = DrawY - y1text_Y;
assign SizeX_y1text = text_SizeX;
assign SizeY_y1text = text_SizeY;
logic y1text_on;

logic [9:0] DistX_y2text, DistY_y2text, SizeX_y2text, SizeY_y2text;
assign DistX_y2text = DrawX - y2text_X;
assign DistY_y2text = DrawY - y2text_Y;
assign SizeX_y2text = text_SizeX;
assign SizeY_y2text = text_SizeY;
logic y2text_on;

logic [9:0] DistX_player1win, DistY_player1win, SizeX_player1win, SizeY_player1win;
assign DistX_player1win = DrawX - Player1winX;
assign DistY_player1win = DrawY - Player1winY;
assign SizeX_player1win = PlayerwinX_Size;
assign SizeY_player1win = PlayerwinY_Size;
logic player1win_on;

logic [9:0] DistX_player2win, DistY_player2win, SizeX_player2win, SizeY_player2win;
assign DistX_player2win = DrawX - Player2winX;
assign DistY_player2win = DrawY - Player2winY;
assign SizeX_player2win = PlayerwinX_Size;
assign SizeY_player2win = PlayerwinY_Size;
logic player2win_on;

logic [9:0] DistX_title, DistY_title, SizeX_title, SizeY_title;
assign DistX_title = DrawX - titleX;
assign DistY_title = DrawY - titleY;
assign SizeX_title = titleX_Size;
assign SizeY_title = titleY_Size;
logic title_on;

logic [9:0] DistX_fuel1, DistY_fuel1, SizeX_fuel1, SizeY_fuel1;
assign DistX_fuel1 = DrawX - Fuel1X;
assign DistY_fuel1 = DrawY - Fuel1Y;
assign SizeX_fuel1 = Fuel1X_Size;
assign SizeY_fuel1 = Fuel1Y_Size;
logic fuel1_on;

logic [9:0] DistX_fuel2, DistY_fuel2, SizeX_fuel2, SizeY_fuel2;
assign DistX_fuel2 = DrawX - Fuel2X;
assign DistY_fuel2 = DrawY - Fuel2Y;
assign SizeX_fuel2 = Fuel2X_Size;
assign SizeY_fuel2 = Fuel2Y_Size;
logic fuel2_on;

logic [9:0] DistX_text1, DistY_text1, SizeX_text1, SizeY_text1;
assign DistX_text1 = DrawX - textx1;
assign DistY_text1 = DrawY - texty1;
assign SizeX_text1 = textxsize;
assign SizeY_text1 = textysize;
logic text1_on;

logic [9:0] DistX_text2, DistY_text2, SizeX_text2, SizeY_text2;
assign DistX_text2 = DrawX - textx2;
assign DistY_text2 = DrawY - texty2;
assign SizeX_text2 = textxsize;
assign SizeY_text2 = textysize;
logic text2_on;

  
always_comb
begin:ball_on_proc
  if (DistX_tank < Size_tank && DistY_tank < Size_tank)begin //NEED TO CHANGE LOGIC
		ball_on = 1'b1;
  end
  else begin
		ball_on = 1'b0;
  end
		
  if (DistX_tank2 < Size_tank2 && DistY_tank2 < Size_tank2)begin //NEED TO CHANGE LOGIC
		tank2_on = 1'b1;
  end
  else begin 
		tank2_on = 1'b0;
  end
  
  if((DistY_floor > DistX_floor + 240) && (DistY_floor > 352) && (DistY_floor > 400 - DistX_floor))begin
		floor_on = 1'b1;
  end
  
  else begin
		floor_on = 1'b0;
  end
  
    if((DistY_floor > DistX_floor + 80) && (DistY_floor > 352) && (DistY_floor > 560 - DistX_floor))begin
		two = 1'b1;
  end
  
  else begin
		two = 1'b0;
  end
  
    if((DistY_floor > DistX_floor - 80) && (DistY_floor > 352) && (DistY_floor > 720 - DistX_floor))begin
		three = 1'b1;
  end
  
  else begin
		three = 1'b0;
  end
  
    if((DistY_floor > DistX_floor - 240) && (DistY_floor > 352) && (DistY_floor > 880 - DistX_floor))begin
		four = 1'b1;
  end
  
  else begin
		four = 1'b0;
  end
  
  
  if(DistY_floor > 380) begin
		base_on = 1'b1;
		end
		else begin 
		base_on = 1'b0;
		end
  
  if (DistX_bull1 < Size_bull1 && DistY_bull1 < Size_bull1)begin //NEED TO CHANGE LOGIC
		bull1_on = 1'b1;
  end
  else begin 
		bull1_on = 1'b0;
  end
  
    if (DistX_bull2 < Size_bull2 && DistY_bull2 < Size_bull2)begin //NEED TO CHANGE LOGIC
		bull2_on = 1'b1;
  end
  else begin 
		bull2_on = 1'b0;
  end
  
   if (DistX_player1 < SizeX_player1 && DistY_player1 < SizeY_player1)begin //NEED TO CHANGE LOGIC
		player1_on = 1'b1;
  end
  else begin
		player1_on = 1'b0;
  end
  
   if (DistX_player2 < SizeX_player2 && DistY_player2 < SizeY_player2)begin //NEED TO CHANGE LOGIC
		player2_on = 1'b1;
  end
  else begin
		player2_on = 1'b0;
  end
  
     if (DistX_battery1 < SizeX_battery1 && DistY_battery1 < SizeY_battery1)begin //NEED TO CHANGE LOGIC
		battery1_on = 1'b1;
  end
  else begin
		battery1_on = 1'b0;
  end
  
   if (DistX_battery2 < SizeX_battery2 && DistY_battery2 < SizeY_battery2)begin //NEED TO CHANGE LOGIC
		battery2_on = 1'b1;
  end
  else begin
		battery2_on = 1'b0;
  end
  
  if (DistX_x1text < SizeX_x1text && DistY_x1text < SizeY_x1text)begin //NEED TO CHANGE LOGIC
		x1text_on = 1'b1;
  end
  else begin
		x1text_on = 1'b0;
  end
  
  if (DistX_x2text < SizeX_x2text && DistY_x2text < SizeY_x2text)begin //NEED TO CHANGE LOGIC
		x2text_on = 1'b1;
  end
  else begin
		x2text_on = 1'b0;
  end
  
  if (DistX_y1text < SizeX_y1text && DistY_y1text < SizeY_y1text)begin //NEED TO CHANGE LOGIC
		y1text_on = 1'b1;
  end
  else begin
		y1text_on = 1'b0;
  end
  
  if (DistX_y2text < SizeX_y2text && DistY_y2text < SizeY_y2text)begin //NEED TO CHANGE LOGIC
		y2text_on = 1'b1;
  end
  else begin
		y2text_on = 1'b0;
  end
  
  if (DistX_player2win < SizeX_player2win && DistY_player2win < SizeY_player2win)begin //NEED TO CHANGE LOGIC
		player2win_on = 1'b1;
  end
  else begin
		player2win_on = 1'b0;
  end
  
  if (DistX_player1win < SizeX_player1win && DistY_player1win < SizeY_player1win)begin //NEED TO CHANGE LOGIC
		player1win_on = 1'b1;
  end
  else begin
		player1win_on = 1'b0;
  end
  
  if (DistX_title < SizeX_title && DistY_title < SizeY_title)begin //NEED TO CHANGE LOGIC
		title_on = 1'b1;
  end
  else begin
		title_on = 1'b0;
  end
  
   if (DistX_fuel1 < SizeX_fuel1 && DistY_fuel1 < SizeY_fuel1)begin //NEED TO CHANGE LOGIC
		fuel1_on = 1'b1;
  end
  else begin
		fuel1_on = 1'b0;
  end
  
   if (DistX_fuel2 < SizeX_fuel2 && DistY_fuel2 < SizeY_fuel2)begin //NEED TO CHANGE LOGIC
		fuel2_on = 1'b1;
  end
  else begin
		fuel2_on = 1'b0;
  end
  
     if (DistX_text1 < SizeX_text1 && DistY_text1 < SizeY_text1)begin //NEED TO CHANGE LOGIC
		text1_on = 1'b1;
  end
  else begin
		text1_on = 1'b0;
  end
  
   if (DistX_text2 < SizeX_text2 && DistY_text2 < SizeY_text2)begin //NEED TO CHANGE LOGIC
		text2_on = 1'b1;
  end
  else begin
		text2_on = 1'b0;
  end
  
  
end

assign rom_address_tank = ((DrawX - BallX) +(DrawY - BallY) *32);
//assign rom_address_tank = ((((DrawX - BallX + DrawY - BallY) / 2) + ((DrawY - BallY - DrawX - BallX) / 2) * 32) % 1024);

assign rom_address_lr = ((DrawX - BallX) +(DrawY - BallY) *32);
//assign rom_address = ((DrawX * 80) / 640) + (((DrawY * 60) / 480) * 80);
//assign rom_address = (((DrawX * 160) / 640) + (((DrawY * 120) / 480) * 160));

assign rom_address_bg = ((DrawX * 320) / 640) + (((DrawY * 240) / 480) * 320);


assign rom_address_tank2 = ((DrawX - Tank2X) +(DrawY - Tank2Y) *32);

assign rom_address_floor = ((DrawX - FloorX) +(DrawY - FloorY) *320);
//assign rom_address_floor = (((DrawX - FloorX) * 640) / 640) + ((((DrawY - FloorY) * 128) / 480) * 640);


assign rom_address_bull1 = ((DrawX - Bull1X) + (DrawY - Bull1Y) * 7);

assign rom_address_bull2 = ((DrawX - Bull2X) + (DrawY - Bull2Y) * 7);

assign rom_address_player1 = ((DrawX - Player1X) + (DrawY - Player1Y) * 128);

assign rom_address_player2 = ((DrawX - Player2X) + (DrawY - Player2Y) * 128);

assign rom_address_x1 = ((x1text*10 + DrawX - x1text_X) + (DrawY - x1text_Y) * 100);
assign rom_address_x2 = ((x2text*10 + DrawX - x2text_X) + (DrawY - x2text_Y) * 100);
assign rom_address_y1 = ((y1text*10 + DrawX - y1text_X) + (DrawY - y1text_Y) * 100);
assign rom_address_y2 = ((y2text*10 + DrawX - y2text_X) + (DrawY - y2text_Y) * 100);

assign rom_address_batteryfull1 = ((DrawX - Battery1X) + (DrawY - Battery1Y) * 62);
assign rom_address_battery_b1 = ((DrawX - Battery1X) + (DrawY - Battery1Y) * 62);
assign rom_address_battery_c1 = ((DrawX - Battery1X) + (DrawY - Battery1Y) * 62);
assign rom_address_battery_d1 = ((DrawX - Battery1X) + (DrawY - Battery1Y) * 62);
assign rom_address_battery_e1 = ((DrawX - Battery1X) + (DrawY - Battery1Y) * 62);
assign rom_address_battery_f1 = ((DrawX - Battery1X) + (DrawY - Battery1Y) * 62);
assign rom_address_battery_g1 = ((DrawX - Battery1X) + (DrawY - Battery1Y) * 62);
assign rom_address_batteryempty1 = ((DrawX - Battery1X) + (DrawY - Battery1Y) * 62);


assign rom_address_batteryfull2 = ((DrawX - Battery2X) + (DrawY - Battery2Y) * 62);
assign rom_address_battery_b2 = ((DrawX - Battery2X) + (DrawY - Battery2Y) * 62);
assign rom_address_battery_c2 = ((DrawX - Battery2X) + (DrawY - Battery2Y) * 62);
assign rom_address_battery_d2 = ((DrawX - Battery2X) + (DrawY - Battery2Y) * 62);
assign rom_address_battery_e2 = ((DrawX - Battery2X) + (DrawY - Battery2Y) * 62);
assign rom_address_battery_f2 = ((DrawX - Battery2X) + (DrawY - Battery2Y) * 62);
assign rom_address_battery_g2 = ((DrawX - Battery2X) + (DrawY - Battery2Y) * 62);
assign rom_address_batteryempty2 = ((DrawX - Battery2X) + (DrawY - Battery2Y) * 62);

assign rom_address_shellshocktitle = ((DrawX - titleX) + (DrawY - titleY) * 320);

assign rom_address_player1win = ((DrawX - Player1winX) + (DrawY - Player1winY) * 360);

assign rom_address_player2win = ((DrawX - Player2winX) + (DrawY - Player2winY) * 360);

assign rom_address_downramp = ((DrawX - BallX) +(DrawY - BallY) *32);
assign rom_address_downramp2 = ((DrawX - Tank2X) +(DrawY - Tank2Y) *32);
assign rom_address_upramp2 = ((DrawX - Tank2X) +(DrawY - Tank2Y) *32);
assign rom_address_upramp = ((DrawX - BallX) +(DrawY - BallY) *32);

assign rom_address_fuelfull1 = ((DrawX - Fuel1X) + (DrawY - Fuel1Y) * 44);
assign rom_address_fuel_b1 = ((DrawX - Fuel1X) + (DrawY - Fuel1Y) * 44);
assign rom_address_fuel_c1 = ((DrawX - Fuel1X) + (DrawY - Fuel1Y) * 44);
assign rom_address_fuel_d1 = ((DrawX - Fuel1X) + (DrawY - Fuel1Y) * 44);
assign rom_address_fuel_e1 = ((DrawX - Fuel1X) + (DrawY - Fuel1Y) * 44);
assign rom_address_fuelempty1 = ((DrawX - Fuel1X) + (DrawY - Fuel1Y) * 44);


assign rom_address_fuelfull2 = ((DrawX - Fuel2X) + (DrawY - Fuel2Y) * 44);
assign rom_address_fuel_b2 = ((DrawX - Fuel2X) + (DrawY - Fuel2Y) * 44);
assign rom_address_fuel_c2 = ((DrawX - Fuel2X) + (DrawY - Fuel2Y) * 44);
assign rom_address_fuel_d2 = ((DrawX - Fuel2X) + (DrawY - Fuel2Y) * 44);
assign rom_address_fuel_e2 = ((DrawX - Fuel2X) + (DrawY - Fuel2Y) * 44);
assign rom_address_fuelempty2 = ((DrawX - Fuel2X) + (DrawY - Fuel2Y) * 44);

assign rom_address_crit1 = ((DrawX - textx1) + (DrawY - texty1) * 100);
assign rom_address_crit2 = ((DrawX - textx2) + (DrawY - texty2) * 100);
assign rom_address_dest1 = ((DrawX - textx1) + (DrawY - texty1) * 100);
assign rom_address_dest2 = ((DrawX - textx2) + (DrawY - texty2) * 100);

assign rom_address_ex1 = ((DrawX - BallX) +(DrawY - BallY) *32);
assign rom_address_ex2 = ((DrawX - BallX) +(DrawY - BallY) *32);
assign rom_address_ex3 = ((DrawX - BallX) +(DrawY - BallY) *32);
assign rom_address_ex4 = ((DrawX - BallX) +(DrawY - BallY) *32);
assign rom_address_ex5 = ((DrawX - BallX) +(DrawY - BallY) *32);
assign rom_address_ex6 = ((DrawX - BallX) +(DrawY - BallY) *32);
assign rom_address_ex7 = ((DrawX - BallX) +(DrawY - BallY) *32);
assign rom_address_ex8 = ((DrawX - BallX) +(DrawY - BallY) *32);
assign rom_address_ex9 = ((DrawX - BallX) +(DrawY - BallY) *32);
assign rom_address_ex10 = ((DrawX - BallX) +(DrawY - BallY) *32);

assign rom_address_urex1 = ((DrawX - BallX) +(DrawY - BallY) *32);
assign rom_address_urex2 = ((DrawX - BallX) +(DrawY - BallY) *32);
assign rom_address_urex3 = ((DrawX - BallX) +(DrawY - BallY) *32);
assign rom_address_urex4 = ((DrawX - BallX) +(DrawY - BallY) *32);
assign rom_address_urex5 = ((DrawX - BallX) +(DrawY - BallY) *32);
assign rom_address_urex6 = ((DrawX - BallX) +(DrawY - BallY) *32);
assign rom_address_urex7 = ((DrawX - BallX) +(DrawY - BallY) *32); 
assign rom_address_urex8 = ((DrawX - BallX) +(DrawY - BallY) *32);
assign rom_address_urex9 = ((DrawX - BallX) +(DrawY - BallY) *32);
assign rom_address_urex10 = ((DrawX - BallX) +(DrawY - BallY) *32);


assign rom_address_drex1 = ((DrawX - BallX) +(DrawY - BallY) *32);
assign rom_address_drex2 = ((DrawX - BallX) +(DrawY - BallY) *32);
assign rom_address_drex3 = ((DrawX - BallX) +(DrawY - BallY) *32);
assign rom_address_drex4 = ((DrawX - BallX) +(DrawY - BallY) *32);
assign rom_address_drex5 = ((DrawX - BallX) +(DrawY - BallY) *32);
assign rom_address_drex6 = ((DrawX - BallX) +(DrawY - BallY) *32);
assign rom_address_drex7 = ((DrawX - BallX) +(DrawY - BallY) *32);
assign rom_address_drex8 = ((DrawX - BallX) +(DrawY - BallY) *32); 
assign rom_address_drex9 = ((DrawX - BallX) +(DrawY - BallY) *32);
assign rom_address_drex10 = ((DrawX - BallX) +(DrawY - BallY) *32);

assign rom_address_tank2ex1 = ((DrawX - Tank2X) +(DrawY - Tank2Y) *32);
assign rom_address_tank2ex2 = ((DrawX - Tank2X) +(DrawY - Tank2Y) *32);
assign rom_address_tank2ex3 = ((DrawX - Tank2X) +(DrawY - Tank2Y) *32);
assign rom_address_tank2ex4 = ((DrawX - Tank2X) +(DrawY - Tank2Y) *32);
assign rom_address_tank2ex5 = ((DrawX - Tank2X) +(DrawY - Tank2Y) *32);
assign rom_address_tank2ex6 = ((DrawX - Tank2X) +(DrawY - Tank2Y) *32);
assign rom_address_tank2ex7 = ((DrawX - Tank2X) +(DrawY - Tank2Y) *32);
assign rom_address_tank2ex8 = ((DrawX - Tank2X) +(DrawY - Tank2Y) *32);
assign rom_address_tank2ex9 = ((DrawX - Tank2X) +(DrawY - Tank2Y) *32);
assign rom_address_tank2ex10 = ((DrawX - Tank2X) +(DrawY - Tank2Y) *32);

assign rom_address_tank2urex1 = ((DrawX - Tank2X) +(DrawY - Tank2Y) *32);
assign rom_address_tank2urex2 = ((DrawX - Tank2X) +(DrawY - Tank2Y) *32);
assign rom_address_tank2urex3 = ((DrawX - Tank2X) +(DrawY - Tank2Y) *32);
assign rom_address_tank2urex4 = ((DrawX - Tank2X) +(DrawY - Tank2Y) *32);
assign rom_address_tank2urex6 = ((DrawX - Tank2X) +(DrawY - Tank2Y) *32);
assign rom_address_tank2urex7 = ((DrawX - Tank2X) +(DrawY - Tank2Y) *32);
assign rom_address_tank2urex8 = ((DrawX - Tank2X) +(DrawY - Tank2Y) *32);
assign rom_address_tank2urex9 = ((DrawX - Tank2X) +(DrawY - Tank2Y) *32);
assign rom_address_tank2urex10 = ((DrawX - Tank2X) +(DrawY - Tank2Y) *32);


assign rom_address_tank2drex1 = ((DrawX - Tank2X) +(DrawY - Tank2Y) *32);
assign rom_address_tank2drex2 = ((DrawX - Tank2X) +(DrawY - Tank2Y) *32);
assign rom_address_tank2drex3 = ((DrawX - Tank2X) +(DrawY - Tank2Y) *32);
assign rom_address_tank2drex4 = ((DrawX - Tank2X) +(DrawY - Tank2Y) *32);
assign rom_address_tank2drex6 = ((DrawX - Tank2X) +(DrawY - Tank2Y) *32);
assign rom_address_tank2drex7 = ((DrawX - Tank2X) +(DrawY - Tank2Y) *32);
assign rom_address_tank2drex8 = ((DrawX - Tank2X) +(DrawY - Tank2Y) *32);
assign rom_address_tank2drex9 = ((DrawX - Tank2X) +(DrawY - Tank2Y) *32);
assign rom_address_tank2drex10 = ((DrawX - Tank2X) +(DrawY - Tank2Y) *32);



assign rom_address_x10 = ((DrawX - x1text_X) + (DrawY - x1text_Y) * 11);
assign rom_address_x11 = ((DrawX - x1text_X) + (DrawY - x1text_Y) * 11);
assign rom_address_x12 = ((DrawX - x1text_X) + (DrawY - x1text_Y) * 11);
assign rom_address_x13 = ((DrawX - x1text_X) + (DrawY - x1text_Y) * 11);
assign rom_address_x14 = ((DrawX - x1text_X) + (DrawY - x1text_Y) * 11);
assign rom_address_x15 = ((DrawX - x1text_X) + (DrawY - x1text_Y) * 11);
assign rom_address_x16 = ((DrawX - x1text_X) + (DrawY - x1text_Y) * 11);
assign rom_address_x17 = ((DrawX - x1text_X) + (DrawY - x1text_Y) * 11);
assign rom_address_x18 = ((DrawX - x1text_X) + (DrawY - x1text_Y) * 11);
assign rom_address_x19 = ((DrawX - x1text_X) + (DrawY - x1text_Y) * 11);

assign rom_address_x20 = ((DrawX - x2text_X) + (DrawY - x2text_Y) * 11);
assign rom_address_x21 = ((DrawX - x2text_X) + (DrawY - x2text_Y) * 11);
assign rom_address_x22 = ((DrawX - x2text_X) + (DrawY - x2text_Y) * 11);
assign rom_address_x23 = ((DrawX - x2text_X) + (DrawY - x2text_Y) * 11);
assign rom_address_x24 = ((DrawX - x2text_X) + (DrawY - x2text_Y) * 11);
assign rom_address_x25 = ((DrawX - x2text_X) + (DrawY - x2text_Y) * 11);
assign rom_address_x26 = ((DrawX - x2text_X) + (DrawY - x2text_Y) * 11);
assign rom_address_x27 = ((DrawX - x2text_X) + (DrawY - x2text_Y) * 11);
assign rom_address_x28 = ((DrawX - x2text_X) + (DrawY - x2text_Y) * 11);
assign rom_address_x29 = ((DrawX - x2text_X) + (DrawY - x2text_Y) * 11);

assign rom_address_y10 = ((DrawX - y1text_X) + (DrawY - y1text_Y) * 11);
assign rom_address_y11 = ((DrawX - y1text_X) + (DrawY - y1text_Y) * 11);
assign rom_address_y12 = ((DrawX - y1text_X) + (DrawY - y1text_Y) * 11);
assign rom_address_y13 = ((DrawX - y1text_X) + (DrawY - y1text_Y) * 11);
assign rom_address_y14 = ((DrawX - y1text_X) + (DrawY - y1text_Y) * 11);
assign rom_address_y15 = ((DrawX - y1text_X) + (DrawY - y1text_Y) * 11);
assign rom_address_y16 = ((DrawX - y1text_X) + (DrawY - y1text_Y) * 11);
assign rom_address_y17 = ((DrawX - y1text_X) + (DrawY - y1text_Y) * 11);
assign rom_address_y18 = ((DrawX - y1text_X) + (DrawY - y1text_Y) * 11);
assign rom_address_y19 = ((DrawX - y1text_X) + (DrawY - y1text_Y) * 11);

assign rom_address_y20 = ((DrawX - y2text_X) + (DrawY - y2text_Y) * 11);
assign rom_address_y21 = ((DrawX - y2text_X) + (DrawY - y2text_Y) * 11);
assign rom_address_y22 = ((DrawX - y2text_X) + (DrawY - y2text_Y) * 11);
assign rom_address_y23 = ((DrawX - y2text_X) + (DrawY - y2text_Y) * 11);
assign rom_address_y24 = ((DrawX - y2text_X) + (DrawY - y2text_Y) * 11);
assign rom_address_y25 = ((DrawX - y2text_X) + (DrawY - y2text_Y) * 11);
assign rom_address_y26 = ((DrawX - y2text_X) + (DrawY - y2text_Y) * 11);
assign rom_address_y27 = ((DrawX - y2text_X) + (DrawY - y2text_Y) * 11);
assign rom_address_y28 = ((DrawX - y2text_X) + (DrawY - y2text_Y) * 11);
assign rom_address_y29 = ((DrawX - y2text_X) + (DrawY - y2text_Y) * 11);


always_ff @ (posedge vga_clk) begin

red <= 4'h0;
green <= 4'h0;
blue <= 4'h0;

	if (blank) begin
	
		if ((startscreen == 1) & (title_on == 1'b1)) begin
			//if ((title_on == 1'b1)) begin
			red <= shellshocktitle_red;
			green <= shellshocktitle_green;
			blue <= shellshocktitle_blue;
//			end else begin
//			end
//			red <= 4'hF;
//			green <= 4'hF;
//			blue <= 4'HF;
		
		end
		
		else if ((player1win == 1) & (player1win_on == 1'b1)) begin
			red <= player1win_red;
			green <= player1win_green;
			blue <= player1win_blue;

//			red <= 4'hF;
//			green <= 4'hF;
//			blue <= 4'HF;
		
		end
		
		else if ((player2win == 1) & (player2win_on == 1'b1)) begin
		
			red <= player2win_red;
			green <= player2win_green;
			blue <= player2win_blue;
			
//			red <= 4'hF;
//			green <= 4'hF;
//			blue <= 4'HF;
		end
		
		else if ((x1text_on == 1)) begin
		
			red <= x1_red;
			green <= x1_green;
			blue <= x1_blue;
			
//			red <= 4'hF;
//			green <= 4'hF;
//			blue <= 4'HF;
		end
		
		else if ((x2text_on == 1)) begin
		
			red <= x2_red;
			green <= x2_green;
			blue <= x2_blue;
			
//			red <= 4'hF;
//			green <= 4'hF;
//			blue <= 4'HF;
		end
		
		else if ((y1text_on == 1)) begin
		
			red <= y1_red;
			green <= y1_green;
			blue <= y1_blue;
			
//			red <= 4'hF;
//			green <= 4'hF;
//			blue <= 4'HF;
		end
		
		else if ((y2text_on == 1)) begin
		
			red <= y2_red;
			green <= y2_green;
			blue <= y2_blue;
			
//			red <= 4'hF;
//			green <= 4'hF;
//			blue <= 4'HF;
		end
		
		else if ((floor_on == 1'b1) || (base_on == 1'b1) || (two == 1'b1) || (three == 1'b1) || (four == 1'b1)) begin
			red <= floor_red;
			green <= floor_green;
			blue <= floor_blue;
			check <= 1'b1;
		end
		
		else if (bull1_on == 1'b1 & (bull1_red != 4'hF) & (bull1_green != 4'h0) & (bull1_blue != 4'hF) & (Draw_Bull1 == 1)) begin
			red <= bull1_red;
			green <= bull1_green;
			blue <= bull1_blue;
		
		end
		else if (bull2_on == 1'b1 & (bull2_red != 4'hF) & (bull2_green != 4'h0) & (bull2_blue != 4'hF) & (Draw_Bull2 == 1)) begin
			red <= bull2_red;
			green <= bull2_green;
			blue <= bull2_blue;
		
		end
		else if (text1_on == 1'b1 & drawcrit1 == 1) begin
			red <= crit1_red;
			green <= crit1_green;
			blue <= crit1_blue;
		
		end
		else if (text2_on == 1'b1 & drawcrit2 == 1) begin
			red <= crit2_red;
			green <= crit2_green;
			blue <= crit2_blue;
		
		end
		else if (text1_on == 1'b1 & drawdest1 == 1) begin
			red <= dest1_red;
			green <= dest1_green;
			blue <= dest1_blue;
		
		end
		else if (text2_on == 1'b1 & drawdest2 == 1) begin
			red <= dest2_red;
			green <= dest2_green;
			blue <= dest2_blue;
		
		end
		else if ((ball_on == 1'b1))begin //& ((tank_red != 4'hE) & (tank_green != 4'h3) & (tank_blue != 4'hF)) & (bull_explode_flag == 4'b0000))begin
			if(downramp == 2'b01) begin
			if (health1 == 0) begin
			if ((ball_on == 1'b1)  & ((drex1_red != 4'hF) & (drex1_green != 4'hF) & (drex1_blue != 4'hF)) & (bull_explode_flag == 4'b0001))begin
			red <= drex1_red;
			green <= drex1_green;
			blue <= drex1_blue;
			end
			else if ((ball_on == 1'b1)  & ((drex1_red != 4'hF) & (drex1_green != 4'hF) & (drex1_blue != 4'hF)) & (bull_explode_flag == 4'b0010))begin
			red <= drex1_red;
			green <= drex1_green;
			blue <= drex1_blue;
			end
			else if ((ball_on == 1'b1)  & ((drex2_red != 4'hF) & (drex2_green != 4'hF) & (drex2_blue != 4'hF)) & (bull_explode_flag == 4'b0011))begin
			red <= drex2_red;
			green <= drex2_green;
			blue <= drex2_blue;
			end
			else if ((ball_on == 1'b1)  & ((drex3_red != 4'hF) & (drex3_green != 4'hF) & (drex3_blue != 4'hF)) & (bull_explode_flag == 4'b0100))begin
			red <= drex3_red;
			green <= drex3_green;
			blue <= drex3_blue;
			end
			else if ((ball_on == 1'b1)  & ((drex4_red != 4'hF) & (drex4_green != 4'hF) & (drex4_blue != 4'hF)) & (bull_explode_flag == 4'b0101))begin
			red <= drex4_red;
			green <= drex4_green;
			blue <= drex4_blue;
			end
			else if ((ball_on == 1'b1)  & ((drex5_red != 4'hF) & (drex5_green != 4'hF) & (drex5_blue != 4'hF)) & (bull_explode_flag == 4'b0110))begin
			red <= drex5_red;
			green <= drex5_green;
			blue <= drex5_blue;
			end
			else if ((ball_on == 1'b1)  & ((drex6_red != 4'hF) & (drex6_green != 4'hF) & (drex6_blue != 4'hF)) & (bull_explode_flag == 4'b0111))begin
			red <= drex6_red;
			green <= drex6_green;
			blue <= drex6_blue;
			end
			else if ((ball_on == 1'b1)  & ((drex7_red != 4'hF) & (drex7_green != 4'hF) & (drex7_blue != 4'hF)) & (bull_explode_flag == 4'b1000))begin
			red <= drex7_red;
			green <= drex7_green;
			blue <= drex7_blue;
			end
			else if ((ball_on == 1'b1)  & ((drex8_red != 4'hF) & (drex8_green != 4'hF) & (drex8_blue != 4'hF)) & (bull_explode_flag == 4'b1001))begin
			red <= drex8_red;
			green <= drex8_green;
			blue <= drex8_blue;
			end
			else if ((ball_on == 1'b1)  & ((drex9_red != 4'hF) & (drex9_green != 4'hF) & (drex9_blue != 4'hF)) & (bull_explode_flag == 4'b1010))begin
			red <= drex9_red;
			green <= drex9_green;
			blue <= drex9_blue;
			end
			else if ((ball_on == 1'b1)  & ((drex10_red != 4'hF) & (drex10_green != 4'hF) & (drex10_blue != 4'hF)) & (bull_explode_flag == 4'b1011))begin
			red <= drex10_red;
			green <= drex10_green;
			blue <= drex10_blue;
			end
			else begin
			red <= bg_red;
			green <= bg_green;
			blue <= bg_blue;
			end
			
			end
			else begin 
			if ((ball_on == 1'b1)  & !((downramp_red == 4'hF) & (downramp_green == 4'h1) & (downramp_blue == 4'hF)) & ((bull_explode_flag == 4'b0000))) begin
			red <= downramp_red;
			green <= downramp_green;
			blue <= downramp_blue;
			end else if ((ball_on == 1'b1)  & !((downramp_red == 4'hF) & (downramp_green == 4'h1) & (downramp_red == 4'hF)) & ((bull_explode_flag == 4'b0001))) begin
			red <= 4'hF;
			green <= 4'hF;
			blue <= 4'hF;
			end 
			else if ((ball_on == 1'b1)  & !((downramp_red == 4'hF) & (downramp_green == 4'h1) & (downramp_red == 4'hF)) & ((bull_explode_flag == 4'b0011))) begin
			red <= 4'h0;
			green <= 4'h0;
			blue <= 4'h0;
			end 
			else if ((ball_on == 1'b1)  & !((downramp_red == 4'hF) & (downramp_green == 4'h1) & (downramp_red == 4'hF)) & ((bull_explode_flag == 4'b0101))) begin
			red <= 4'hF;
			green <= 4'hF;
			blue <= 4'hF;
			end 
			else if ((ball_on == 1'b1)  & !((downramp_red == 4'hF) & (downramp_green == 4'h1) & (downramp_red == 4'hF)) & ((bull_explode_flag == 4'b0110))) begin
			red <= 4'h0;
			green <= 4'h0;
			blue <= 4'h0;
			end 
			else if ((ball_on == 1'b1)  & !((downramp_red == 4'hF) & (downramp_green == 4'h1) & (downramp_red == 4'hF)) & ((bull_explode_flag == 4'b0111))) begin
			red <= 4'hF;
			green <= 4'hF;
			blue <= 4'hF;
			end 
			else if ((ball_on == 1'b1)  & !((downramp_red == 4'hF) & (downramp_green == 4'h1) & (downramp_red == 4'hF)) & ((bull_explode_flag == 4'b1000))) begin
			red <= 4'h0;
			green <= 4'h0;
			blue <= 4'h0;
			end 
			else if ((ball_on == 1'b1)  & !((downramp_red == 4'hF) & (downramp_green == 4'h1) & (downramp_red == 4'hF)) & ((bull_explode_flag == 4'b1001))) begin
			red <= 4'hF;
			green <= 4'hF;
			blue <= 4'hF;
			end 
			else if ((ball_on == 1'b1)  & !((downramp_red == 4'hF) & (downramp_green == 4'h1) & (downramp_red == 4'hF)) & ((bull_explode_flag == 4'b1010))) begin
			red <= 4'hE;
			green <= 4'h3;
			blue <= 4'hF;
			end 
			
			else if ((ball_on == 1'b1)  & !((downramp_red == 4'hF) & (downramp_green == 4'h1) & (downramp_red == 4'hF)) & ((bull_explode_flag == 4'b1011))) begin
			red <= 4'hE;
			green <= 4'h3;
			blue <= 4'hF;
			end 
			
			
			else begin
			red <= bg_red;
			green <= bg_green;
			blue <= bg_blue;
			end
			end
			//red <= downramp_red;
			//green <= downramp_green;
			//blue <= downramp_blue;
		   end
			else if (upramp == 2'b01) begin
			if (health1 == 0) begin
			if ((ball_on == 1'b1)  & ((urex1_red != 4'hF) & (urex1_green != 4'hF) & (urex1_blue != 4'hF)) & (bull_explode_flag == 4'b0001))begin
			red <= urex1_red;
			green <= urex1_green;
			blue <= urex1_blue;
			end
			else if ((ball_on == 1'b1)  & ((urex1_red != 4'hF) & (urex1_green != 4'hF) & (urex1_blue != 4'hF)) & (bull_explode_flag == 4'b0010))begin
			red <= urex1_red;
			green <= urex1_green;
			blue <= urex1_blue;
			end
			else if ((ball_on == 1'b1)  & ((urex2_red != 4'hF) & (urex2_green != 4'hF) & (urex2_blue != 4'hF)) & (bull_explode_flag == 4'b0011))begin
			red <= urex2_red;
			green <= urex2_green;
			blue <= urex2_blue;
			end
			else if ((ball_on == 1'b1)  & ((urex3_red != 4'hF) & (urex3_green != 4'hF) & (urex3_blue != 4'hF)) & (bull_explode_flag == 4'b0100))begin
			red <= urex3_red;
			green <= urex3_green;
			blue <= urex3_blue;
			end
			else if ((ball_on == 1'b1)  & ((urex4_red != 4'hF) & (urex4_green != 4'hF) & (urex4_blue != 4'hF)) & (bull_explode_flag == 4'b0101))begin
			red <= urex4_red;
			green <= urex4_green;
			blue <= urex4_blue;
			end
			else if ((ball_on == 1'b1)  & ((urex5_red != 4'hF) & (urex5_green != 4'hF) & (urex5_blue != 4'hF)) & (bull_explode_flag == 4'b0110))begin
			red <= urex5_red;
			green <= urex5_green;
			blue <= urex5_blue;
			end
			else if ((ball_on == 1'b1)  & ((urex6_red != 4'hF) & (urex6_green != 4'hF) & (urex6_blue != 4'hF)) & (bull_explode_flag == 4'b0111))begin
			red <= urex6_red;
			green <= urex6_green;
			blue <= urex6_blue;
			end
			else if ((ball_on == 1'b1)  & ((urex7_red != 4'hF) & (urex7_green != 4'hF) & (urex7_blue != 4'hF)) & (bull_explode_flag == 4'b1000))begin
			red <= urex7_red;
			green <= urex7_green;
			blue <= urex7_blue;
			end
			else if ((ball_on == 1'b1)  & ((urex8_red != 4'hF) & (urex8_green != 4'hF) & (urex8_blue != 4'hF)) & (bull_explode_flag == 4'b1001))begin
			red <= urex8_red;
			green <= urex8_green;
			blue <= urex8_blue;
			end
			else if ((ball_on == 1'b1)  & ((urex9_red != 4'hF) & (urex9_green != 4'hF) & (urex9_blue != 4'hF)) & (bull_explode_flag == 4'b1010))begin
			red <= urex9_red;
			green <= urex9_green;
			blue <= urex9_blue;
			end
			else if ((ball_on == 1'b1)  & ((urex10_red != 4'hF) & (urex10_green != 4'hF) & (urex10_blue != 4'hF)) & (bull_explode_flag == 4'b1011))begin
			red <= urex10_red;
			green <= urex10_green;
			blue <= urex10_blue;
			end
			end
			else begin 
			if ((ball_on == 1'b1)  & !((upramp_red == 4'hF) & (upramp_green == 4'h1) & (upramp_red == 4'hF)) & ((bull_explode_flag == 4'b0000))) begin
			red <= upramp_red;
			green <= upramp_green;
			blue <= upramp_blue;
			end
			else if ((ball_on == 1'b1)  & !((upramp_red == 4'hF) & (upramp_green == 4'h1) & (upramp_red == 4'hF)) & ((bull_explode_flag == 4'b0001))) begin
			red <= 4'h0;
			green <= 4'h0;
			blue <= 4'h0;
			end 
			else if ((ball_on == 1'b1)  & !((upramp_red == 4'hF) & (upramp_green == 4'h1) & (upramp_red == 4'hF)) & ((bull_explode_flag == 4'b0010))) begin
			red <= 4'hF;
			green <= 4'hF;
			blue <= 4'hF;
			end 
			else if ((ball_on == 1'b1)  & !((upramp_red == 4'hF) & (upramp_green == 4'h1) & (upramp_red == 4'hF)) & ((bull_explode_flag == 4'b0011))) begin
			red <= 4'h0;
			green <= 4'h0;
			blue <= 4'h0;
			end 
			else if ((ball_on == 1'b1)  & !((upramp_red == 4'hF) & (upramp_green == 4'h1) & (upramp_red == 4'hF)) & ((bull_explode_flag == 4'b0100))) begin
			red <= 4'hF;
			green <= 4'hF;
			blue <= 4'hF;
			end 
			else if ((ball_on == 1'b1)  & !((upramp_red == 4'hF) & (upramp_green == 4'h1) & (upramp_red == 4'hF)) & ((bull_explode_flag == 4'b0101))) begin
			red <= 4'h0;
			green <= 4'h0;
			blue <= 4'h0;
			end 
			else if ((ball_on == 1'b1)  & !((upramp_red == 4'hF) & (upramp_green == 4'h1) & (upramp_red == 4'hF)) & ((bull_explode_flag == 4'b0110))) begin
			red <= 4'hF;
			green <= 4'hF;
			blue <= 4'hF;
			end 
			else if ((ball_on == 1'b1)  & !((upramp_red == 4'hF) & (upramp_green == 4'h1) & (upramp_red == 4'hF)) & ((bull_explode_flag == 4'b0111))) begin
			red <= 4'h0;
			green <= 4'h0;
			blue <= 4'h0;
			end 
			else if ((ball_on == 1'b1)  & !((upramp_red == 4'hF) & (upramp_green == 4'h1) & (upramp_red == 4'hF)) & ((bull_explode_flag == 4'b1000))) begin
			red <= 4'hF;
			green <= 4'hF;
			blue <= 4'hF;
			end 
			else if ((ball_on == 1'b1)  & !((upramp_red == 4'hF) & (upramp_green == 4'h1) & (upramp_red == 4'hF)) & ((bull_explode_flag == 4'b1001))) begin
			red <= 4'h0;
			green <= 4'h0;
			blue <= 4'h0;
			end 
			else if ((ball_on == 1'b1)  & !((upramp_red == 4'hF) & (upramp_green == 4'h1) & (upramp_red == 4'hF)) & ((bull_explode_flag == 4'b1010))) begin
			red <= 4'hE;
			green <= 4'h3;
			blue <= 4'hF;
			end 
			else if ((ball_on == 1'b1)  & !((upramp_red == 4'hF) & (upramp_green == 4'h1) & (upramp_red == 4'hF)) & ((bull_explode_flag == 4'b1011))) begin
			red <= 4'hE;
			green <= 4'h3;
			blue <= 4'hF;
			end else begin
			red <= bg_red;
			green <= bg_green;
			blue <= bg_blue;
			end
			end
			//red <= upramp_red;
			//green <= upramp_green;
			//blue <= upramp_blue;
			end
			else begin
			if (health1 == 0) begin 
			if ((ball_on == 1'b1)  & ((ex1_red != 4'hF) & (ex1_green != 4'hF) & (ex1_blue != 4'hF)) & (bull_explode_flag == 4'b0001))begin
			red <= ex1_red;
			green <= ex1_green;
			blue <= ex1_blue;
			end
			else if ((ball_on == 1'b1)  & ((ex1_red != 4'hF) & (ex1_green != 4'hF) & (ex1_blue != 4'hF)) & (bull_explode_flag == 4'b0010))begin
			red <= ex1_red;
			green <= ex1_green;
			blue <= ex1_blue;
			end
			else if ((ball_on == 1'b1)  & ((ex2_red != 4'hF) & (ex2_green != 4'hF) & (ex2_blue != 4'hF)) & (bull_explode_flag == 4'b0011))begin
			red <= ex2_red;
			green <= ex2_green;
			blue <= ex2_blue;
			end
			else if ((ball_on == 1'b1)  & ((ex3_red != 4'hF) & (ex3_green != 4'hF) & (ex3_blue != 4'hF)) & (bull_explode_flag == 4'b0100))begin
			red <= ex3_red;
			green <= ex3_green;
			blue <= ex3_blue;
			end
			else if ((ball_on == 1'b1)  & ((ex4_red != 4'hF) & (ex4_green != 4'hF) & (ex4_blue != 4'hF)) & (bull_explode_flag == 4'b0101))begin
			red <= ex4_red;
			green <= ex4_green;
			blue <= ex4_blue;
			end
			else if ((ball_on == 1'b1)  & ((ex5_red != 4'hF) & (ex5_green != 4'hF) & (ex5_blue != 4'hF)) & (bull_explode_flag == 4'b0110))begin
			red <= ex5_red;
			green <= ex5_green;
			blue <= ex5_blue;
			end
			else if ((ball_on == 1'b1)  & ((ex6_red != 4'hF) & (ex6_green != 4'hF) & (ex6_blue != 4'hF)) & (bull_explode_flag == 4'b0111))begin
			red <= ex6_red;
			green <= ex6_green;
			blue <= ex6_blue;
			end
			else if ((ball_on == 1'b1)  & ((ex7_red != 4'hF) & (ex7_green != 4'hF) & (ex7_blue != 4'hF)) & (bull_explode_flag == 4'b1000))begin
			red <= ex7_red;
			green <= ex7_green;
			blue <= ex7_blue;
			end
			else if ((ball_on == 1'b1)  & ((ex8_red != 4'hF) & (ex8_green != 4'hF) & (ex8_blue != 4'hF)) & (bull_explode_flag == 4'b1001))begin
			red <= ex8_red;
			green <= ex8_green;
			blue <= ex8_blue;
			end
			else if ((ball_on == 1'b1)  & ((ex9_red != 4'hF) & (ex9_green != 4'hF) & (ex9_blue != 4'hF)) & (bull_explode_flag == 4'b1010))begin
			red <= ex9_red;
			green <= ex9_green;
			blue <= ex9_blue;
			end
			else if ((ball_on == 1'b1)  & ((ex10_red != 4'hF) & (ex10_green != 4'hF) & (ex10_blue != 4'hF)) & (bull_explode_flag == 4'b1011))begin
			red <= ex10_red;
			green <= ex10_green;
			blue <= ex10_blue;
			end
			else begin
			red <= bg_red;
			green <= bg_green;
			blue <= bg_blue;
			end
			
			end else begin
			if ((ball_on == 1'b1)  & ((tank_red != 4'hE) & (tank_green != 4'h3) & (tank_blue != 4'hF)) & (bull_explode_flag == 4'b0000))begin
			red <= tank_red;
			green <= tank_green;
			blue <= tank_blue;
			end
			else if ((ball_on == 1'b1)  & ((tank_red != 4'hE) & (tank_green != 4'h3) & (tank_blue != 4'hF)) & (bull_explode_flag == 4'b0001))begin
			red <= 4'h0;
			green <= 4'h0;
			blue <= 4'h0;
			end
			else if ((ball_on == 1'b1)  & ((tank_red != 4'hE) & (tank_green != 4'h3) & (tank_blue != 4'hF)) & (bull_explode_flag == 4'b0010))begin
				red <= 4'hF;
				green <= 4'hF;
				blue <= 4'hF;
			end
			else if ((ball_on == 1'b1)  & ((tank_red != 4'hE) & (tank_green != 4'h3) & (tank_blue != 4'hF)) & (bull_explode_flag == 4'b0011))begin
				red <= 4'h0;
				green <= 4'h0;
				blue <= 4'h0;
			end
			else if ((ball_on == 1'b1)  & ((tank_red != 4'hE) & (tank_green != 4'h3) & (tank_blue != 4'hF)) & (bull_explode_flag == 4'b0100))begin
				red <= 4'hF;
				green <= 4'hF;
				blue <= 4'hF;
			end
			else if ((ball_on == 1'b1)  & ((tank_red != 4'hE) & (tank_green != 4'h3) & (tank_blue != 4'hF)) & (bull_explode_flag == 4'b0101))begin
				red <= 4'h0;
				green <= 4'h0;
				blue <= 4'h0;
			end
			else if ((ball_on == 1'b1)  & ((tank_red != 4'hE) & (tank_green != 4'h3) & (tank_blue != 4'hF)) & (bull_explode_flag == 4'b0110))begin
				red <= 4'hF;
				green <= 4'hF;
				blue <= 4'hF;
			end
			else if ((ball_on == 1'b1)  & ((tank_red != 4'hE) & (tank_green != 4'h3) & (tank_blue != 4'hF)) & (bull_explode_flag == 4'b0111))begin
				red <= 4'h0;
				green <= 4'h0;
				blue <= 4'h0;
			end
			else if ((ball_on == 1'b1)  & ((tank_red != 4'hE) & (tank_green != 4'h3) & (tank_blue != 4'hF)) & (bull_explode_flag == 4'b1000))begin
				red <= 4'hF;
				green <= 4'hF;
				blue <= 4'hF;
			end
			else if ((ball_on == 1'b1)  & ((tank_red != 4'hE) & (tank_green != 4'h3) & (tank_blue != 4'hF)) & (bull_explode_flag == 4'b1001))begin
				red <= 4'h0;
				green <= 4'h0;
				blue <= 4'h0;
			end
			else if ((ball_on == 1'b1)  & ((tank_red != 4'hE) & (tank_green != 4'h3) & (tank_blue != 4'hF)) & (bull_explode_flag == 4'b1010))begin
				red <= 4'hD;
				green <= 4'h4;
				blue <= 4'hE;
			end
			else if ((ball_on == 1'b1)  & ((tank_red != 4'hE) & (tank_green != 4'h3) & (tank_blue != 4'hF)) & (bull_explode_flag == 4'b1011))begin
				red <= 4'hD;
				green <= 4'h4;
				blue <= 4'hE;
			end
			else begin
			red <= bg_red;
			green <= bg_green;
			blue <= bg_blue;
			end
			
			end
		   end
		
			end
//		else if ((ball_on == 1'b1)  && ((tank_red != 4'hE) && (tank_green != 4'h3) && (tank_blue != 4'hF)))begin
//			red <= lr_red;
//			green <= lr_green;
//			blue <= lr_blue;
//		end
		//end
		else if ((tank2_on == 1'b1)) begin //& ((tank2_red != 4'hE) & (tank2_green != 4'h3) & (tank2_blue != 4'hF)) ) begin
			if(downramp2 == 2'b01) begin
			if (health2 == 0) begin
			
			if ((tank2_on == 1'b1)  & ((tank2drex1_red != 4'hF) & (tank2drex1_green != 4'hF) & (tank2drex1_blue != 4'hF)) & (bull_explode_flag2 == 4'b0001))begin
			red <= tank2drex1_red;
			green <= tank2drex1_green;
			blue <= tank2drex1_blue;
			end
			else if ((tank2_on == 1'b1)  & ((tank2drex1_red != 4'hF) & (tank2drex1_green != 4'hF) & (tank2drex1_blue != 4'hF)) & (bull_explode_flag2 == 4'b0010))begin
			red <= tank2drex1_red;
			green <= tank2drex1_green;
			blue <= tank2drex1_blue;
			end
			else if ((tank2_on == 1'b1)  & ((tank2drex2_red != 4'hF) & (tank2drex2_green != 4'hF) & (tank2drex2_blue != 4'hF)) & (bull_explode_flag2 == 4'b0011))begin
			red <= tank2drex2_red;
			green <= tank2drex2_green;
			blue <= tank2drex2_blue;
			end
			else if ((tank2_on == 1'b1)  & ((tank2drex3_red != 4'hF) & (tank2drex3_green != 4'hF) & (tank2drex3_blue != 4'hF)) & (bull_explode_flag2 == 4'b0100))begin
			red <= tank2drex3_red;
			green <= tank2drex3_green;
			blue <= tank2drex3_blue;
			end
			else if ((tank2_on == 1'b1)  & ((tank2drex4_red != 4'hF) & (tank2drex4_green != 4'hF) & (tank2drex4_blue != 4'hF)) & (bull_explode_flag2 == 4'b0101))begin
			red <= tank2drex4_red;
			green <= tank2drex4_green;
			blue <= tank2drex4_blue;
			end
			else if ((tank2_on == 1'b1)  & ((tank2drex4_red != 4'hF) & (tank2drex4_green != 4'hF) & (tank2drex4_blue != 4'hF)) & (bull_explode_flag2 == 4'b0110))begin
			red <= tank2drex4_red;
			green <= tank2drex4_green;
			blue <= tank2drex4_blue;
			end
			else if ((tank2_on == 1'b1)  & ((tank2drex6_red != 4'hF) & (tank2drex6_green != 4'hF) & (tank2drex6_blue != 4'hF)) & (bull_explode_flag2 == 4'b0111))begin
			red <= tank2drex6_red;
			green <= tank2drex6_green;
			blue <= tank2drex6_blue;
			end
			else if ((tank2_on == 1'b1)  & ((tank2drex7_red != 4'hF) & (tank2drex7_green != 4'hF) & (tank2drex7_blue != 4'hF)) & (bull_explode_flag2 == 4'b1000))begin
			red <= tank2drex7_red;
			green <= tank2drex7_green;
			blue <= tank2drex7_blue;
			end
			else if ((tank2_on == 1'b1)  & ((tank2drex8_red != 4'hF) & (tank2drex8_green != 4'hF) & (tank2drex8_blue != 4'hF)) & (bull_explode_flag2 == 4'b1001))begin
			red <= drex8_red;
			green <= drex8_green;
			blue <= drex8_blue;
			end
			else if ((tank2_on == 1'b1)  & ((tank2drex9_red != 4'hF) & (tank2drex9_green != 4'hF) & (tank2drex9_blue != 4'hF)) & (bull_explode_flag2 == 4'b1010))begin
			red <= tank2drex9_red;
			green <= tank2drex9_green;
			blue <= tank2drex9_blue;
			end
			else if ((tank2_on == 1'b1)  & ((tank2drex10_red != 4'hE) & (tank2drex10_green != 4'h3) & (tank2drex10_blue != 4'hF)) & (bull_explode_flag2 == 4'b1011))begin
			red <= tank2drex10_red;
			green <= tank2drex10_green;
			blue <= tank2drex10_blue;
			end
			else begin
			red <= bg_red;
			green <= bg_green;
			blue <= bg_blue;
			end
			
			end else begin
			if ((tank2_on == 1'b1)  & !((downramp2_red == 4'hF) & (downramp2_green == 4'h1) & (downramp2_blue == 4'hF)) & ((bull_explode_flag2 == 4'b0000))) begin
			red <= downramp2_red;
			green <= downramp2_green;
			blue <= downramp2_blue;
			end 
			
			else if ((tank2_on == 1'b1)  & !((downramp2_red == 4'hF) & (downramp2_green == 4'h1) & (downramp2_blue == 4'hF)) & ((bull_explode_flag2 == 4'b0001))) begin
			red <= 4'hF;
			green <= 4'hF;
			blue <= 4'hF;
			end
			
			else if ((tank2_on == 1'b1)  & !((downramp2_red == 4'hF) & (downramp2_green == 4'h1) & (downramp2_blue == 4'hF)) & ((bull_explode_flag2 == 4'b0010))) begin
			red <= 4'h0;
			green <= 4'h0;
			blue <= 4'h0;
			end
			
			else if ((tank2_on == 1'b1)  & !((downramp2_red == 4'hF) & (downramp2_green == 4'h1) & (downramp2_blue == 4'hF)) & ((bull_explode_flag2 == 4'b0011))) begin
			red <= 4'hF;
			green <= 4'hF;
			blue <= 4'hF;
			end
			
			else if ((tank2_on == 1'b1)  & !((downramp2_red == 4'hF) & (downramp2_green == 4'h1) & (downramp2_blue == 4'hF)) & ((bull_explode_flag2 == 4'b0100))) begin
			red <= 4'h0;
			green <= 4'h0;
			blue <= 4'h0;
			end
			
			else if ((tank2_on == 1'b1)  & !((downramp2_red == 4'hF) & (downramp2_green == 4'h1) & (downramp2_blue == 4'hF)) & ((bull_explode_flag2 == 4'b0101))) begin
			red <= 4'hF;
			green <= 4'hF;
			blue <= 4'hF;
			end
			
			else if ((tank2_on == 1'b1)  & !((downramp2_red == 4'hF) & (downramp2_green == 4'h1) & (downramp2_blue == 4'hF)) & ((bull_explode_flag2 == 4'b0110))) begin
			red <= 4'h0;
			green <= 4'h0;
			blue <= 4'h0;
			end
			
			else if ((tank2_on == 1'b1)  & !((downramp2_red == 4'hF) & (downramp2_green == 4'h1) & (downramp2_blue == 4'hF)) & ((bull_explode_flag2 == 4'b0111))) begin
			red <= 4'hF;
			green <= 4'hF;
			blue <= 4'hF;
			end
			
			else if ((tank2_on == 1'b1)  & !((downramp2_red == 4'hF) & (downramp2_green == 4'h1) & (downramp2_blue == 4'hF)) & ((bull_explode_flag2 == 4'b1000))) begin
			red <= 4'h0;
			green <= 4'h0;
			blue <= 4'h0;
			end
			
			else if ((tank2_on == 1'b1)  & !((downramp2_red == 4'hF) & (downramp2_green == 4'h1) & (downramp2_blue == 4'hF)) & ((bull_explode_flag2 == 4'b1001))) begin
			red <= 4'hF;
			green <= 4'hF;
			blue <= 4'hF;
			end
			
			else if ((tank2_on == 1'b1)  & !((downramp2_red == 4'hF) & (downramp2_green == 4'h1) & (downramp2_blue == 4'hF)) & ((bull_explode_flag2 == 4'b1010))) begin
			red <= 4'hE;
			green <= 4'h3;
			blue <= 4'hF;
			end
			
			else if ((tank2_on == 1'b1)  & !((downramp2_red == 4'hF) & (downramp2_green == 4'h1) & (downramp2_blue == 4'hF)) & ((bull_explode_flag2 == 4'b1011))) begin
			red <= 4'hE;
			green <= 4'h3;
			blue <= 4'hF;
			end
			
			else begin
			red <= bg_red;
			green <= bg_green;
			blue <= bg_blue;
			end
			end
			end
			else if (upramp2 == 2'b01) begin
			if (health2 == 0) begin
			
			if ((tank2_on == 1'b1)  & ((tank2urex1_red != 4'hF) & (tank2urex1_green != 4'hF) & (tank2urex1_blue != 4'hF)) & (bull_explode_flag2 == 4'b0001))begin
			red <= tank2urex1_red;
			green <= tank2urex1_green;
			blue <= tank2urex1_blue;
			end
			else if ((tank2_on == 1'b1)  & ((tank2urex1_red != 4'hF) & (tank2urex1_green != 4'hF) & (tank2urex1_blue != 4'hF)) & (bull_explode_flag2 == 4'b0010))begin
			red <= tank2urex1_red;
			green <= tank2urex1_green;
			blue <= tank2urex1_blue;
			end
			else if ((tank2_on == 1'b1)  & ((tank2urex2_red != 4'hF) & (tank2urex2_green != 4'hF) & (tank2urex2_blue != 4'hF)) & (bull_explode_flag2 == 4'b0011))begin
			red <= tank2urex2_red;
			green <= tank2urex2_green;
			blue <= tank2urex2_blue;
			end
			else if ((tank2_on == 1'b1)  & ((tank2urex3_red != 4'hF) & (tank2urex3_green != 4'hF) & (tank2urex3_blue != 4'hF)) & (bull_explode_flag2 == 4'b0100))begin
			red <= tank2urex3_red;
			green <= tank2urex3_green;
			blue <= tank2urex3_blue;
			end
			else if ((tank2_on == 1'b1)  & ((tank2urex4_red != 4'hF) & (tank2urex4_green != 4'hF) & (tank2urex4_blue != 4'hF)) & (bull_explode_flag2 == 4'b0101))begin
			red <= tank2urex4_red;
			green <= tank2urex4_green;
			blue <= tank2urex4_blue;
			end
			else if ((tank2_on == 1'b1)  & ((tank2urex4_red != 4'hF) & (tank2urex4_green != 4'hF) & (tank2urex4_blue != 4'hF)) & (bull_explode_flag2 == 4'b0110))begin
			red <= tank2urex4_red;
			green <= tank2urex4_green;
			blue <= tank2urex4_blue;
			end
			else if ((tank2_on == 1'b1)  & ((tank2urex6_red != 4'hF) & (tank2urex6_green != 4'hF) & (tank2urex6_blue != 4'hF)) & (bull_explode_flag2 == 4'b0111))begin
			red <= tank2urex6_red;
			green <= tank2urex6_green;
			blue <= tank2urex6_blue;
			end
			else if ((tank2_on == 1'b1)  & ((tank2urex7_red != 4'hF) & (tank2urex7_green != 4'hF) & (tank2urex7_blue != 4'hF)) & (bull_explode_flag2 == 4'b1000))begin
			red <= tank2urex7_red;
			green <= tank2urex7_green;
			blue <= tank2urex7_blue;
			end
			else if ((tank2_on == 1'b1)  & ((tank2urex8_red != 4'hF) & (tank2urex8_green != 4'hF) & (tank2urex8_blue != 4'hF)) & (bull_explode_flag2 == 4'b1001))begin
			red <= tank2urex8_red;
			green <= tank2urex8_green;
			blue <= tank2urex8_blue;
			end
			else if ((tank2_on == 1'b1)  & ((tank2urex9_red != 4'hF) & (tank2urex9_green != 4'hF) & (tank2urex9_blue != 4'hF)) & (bull_explode_flag2 == 4'b1010))begin
			red <= tank2urex9_red;
			green <= tank2urex9_green;
			blue <= tank2urex9_blue;
			end
			else if ((tank2_on == 1'b1)  & ((tank2urex10_red != 4'hF) & (tank2urex10_green != 4'hF) & (tank2urex10_blue != 4'hF)) & (bull_explode_flag2 == 4'b1011))begin
			red <= tank2urex10_red;
			green <= tank2urex10_green;
			blue <= tank2urex10_blue;
			end
			else begin
			red <= bg_red;
			green <= bg_green;
			blue <= bg_blue;
			end
			end else begin
			if ((tank2_on == 1'b1)  & !((upramp2_red == 4'hF) & (upramp2_green == 4'h1) & (upramp2_blue == 4'hF)) & (bull_explode_flag2 == 4'b0000)) begin
			red <= upramp2_red;
			green <= upramp2_green;
			blue <= upramp2_blue;
			end
			
			else if ((tank2_on == 1'b1)  & !((upramp2_red == 4'hF) & (upramp2_green == 4'h1) & (upramp2_blue == 4'hF)) & (bull_explode_flag2 == 4'b0001)) begin
			red <= 4'h0;
			green <= 4'h0;
			blue <= 4'h0;
			end 
			
			else if ((tank2_on == 1'b1)  & !((upramp2_red == 4'hF) & (upramp2_green == 4'h1) & (upramp2_blue == 4'hF)) & (bull_explode_flag2 == 4'b0010)) begin
			red <= 4'hF;
			green <= 4'hF;
			blue <= 4'hF;
			end 
			
			else if ((tank2_on == 1'b1)  & !((upramp2_red == 4'hF) & (upramp2_green == 4'h1) & (upramp2_blue == 4'hF)) & (bull_explode_flag2 == 4'b0011)) begin
			red <= 4'h0;
			green <= 4'h0;
			blue <= 4'h0;
			end 
			
			else if ((tank2_on == 1'b1)  & !((upramp2_red == 4'hF) & (upramp2_green == 4'h1) & (upramp2_blue == 4'hF)) & (bull_explode_flag2 == 4'b0100)) begin
			red <= 4'hF;
			green <= 4'hF;
			blue <= 4'hF;
			end 
			
			else if ((tank2_on == 1'b1)  & !((upramp2_red == 4'hF) & (upramp2_green == 4'h1) & (upramp2_blue == 4'hF)) & (bull_explode_flag2 == 4'b0101)) begin
			red <= 4'h0;
			green <= 4'h0;
			blue <= 4'h0;
			end 
			
			else if ((tank2_on == 1'b1)  & !((upramp2_red == 4'hF) & (upramp2_green == 4'h1) & (upramp2_blue == 4'hF)) & (bull_explode_flag2 == 4'b0110)) begin
			red <= 4'hF;
			green <= 4'hF;
			blue <= 4'hF;
			end 
			
			else if ((tank2_on == 1'b1)  & !((upramp2_red == 4'hF) & (upramp2_green == 4'h1) & (upramp2_blue == 4'hF)) & (bull_explode_flag2 == 4'b0111)) begin
			red <= 4'h0;
			green <= 4'h0;
			blue <= 4'h0;
			end 
			
			else if ((tank2_on == 1'b1)  & !((upramp2_red == 4'hF) & (upramp2_green == 4'h1) & (upramp2_blue == 4'hF)) & (bull_explode_flag2 == 4'b1000)) begin
			red <= 4'hF;
			green <= 4'hF;
			blue <= 4'hF;
			end 
			
			else if ((tank2_on == 1'b1)  & !((upramp2_red == 4'hF) & (upramp2_green == 4'h1) & (upramp2_blue == 4'hF)) & (bull_explode_flag2 == 4'b1001)) begin
			red <= 4'h0;
			green <= 4'h0;
			blue <= 4'h0;
			end 
			
			else if ((tank2_on == 1'b1)  & !((upramp2_red == 4'hF) & (upramp2_green == 4'h1) & (upramp2_blue == 4'hF)) & (bull_explode_flag2 == 4'b1010)) begin
			red <= 4'hE;
			green <= 4'h3;
			blue <= 4'hF;
			end 
			
			else if ((tank2_on == 1'b1)  & !((upramp2_red == 4'hF) & (upramp2_green == 4'h1) & (upramp2_blue == 4'hF)) & (bull_explode_flag2 == 4'b1011)) begin
			red <= 4'hE;
			green <= 4'h3;
			blue <= 4'hF;
			end 
			
			else begin
			red <= bg_red;
			green <= bg_green;
			blue <= bg_blue;
			end
			end
			end
			else begin
			if (health2 == 0) begin
			
			if ((tank2_on == 1'b1)  & ((tank2ex1_red != 4'hF) & (tank2ex1_green != 4'hF) & (tank2ex1_blue != 4'hF)) & (bull_explode_flag2 == 4'b0001))begin
			red <= tank2ex1_red;
			green <= tank2ex1_green;
			blue <= tank2ex1_blue;
			end
			else if ((tank2_on == 1'b1)  & ((tank2ex1_red != 4'hF) & (tank2ex1_green != 4'hF) & (tank2ex1_blue != 4'hF)) & (bull_explode_flag2 == 4'b0010))begin
			red <= tank2ex1_red;
			green <= tank2ex1_green;
			blue <= tank2ex1_blue;
			end
			else if ((tank2_on == 1'b1)  & ((tank2ex2_red != 4'hF) & (tank2ex2_green != 4'hF) & (tank2ex2_blue != 4'hF)) & (bull_explode_flag2 == 4'b0011))begin
			red <= tank2ex2_red;
			green <= tank2ex2_green;
			blue <= tank2ex2_blue;
			end
			else if ((tank2_on == 1'b1)  & ((tank2ex3_red != 4'hF) & (tank2ex3_green != 4'hF) & (tank2ex3_blue != 4'hF)) & (bull_explode_flag2 == 4'b0100))begin
			red <= tank2ex3_red;
			green <= tank2ex3_green;
			blue <= tank2ex3_blue;
			end
			else if ((tank2_on == 1'b1)  & ((tank2ex4_red != 4'hF) & (tank2ex4_green != 4'hF) & (tank2ex4_blue != 4'hF)) & (bull_explode_flag2 == 4'b0101))begin
			red <= tank2ex4_red;
			green <= tank2ex4_green;
			blue <= tank2ex4_blue;
			end
			else if ((tank2_on == 1'b1)  & ((tank2ex5_red != 4'hF) & (tank2ex5_green != 4'hF) & (tank2ex5_blue != 4'hF)) & (bull_explode_flag2 == 4'b0110))begin
			red <= tank2ex5_red;
			green <= tank2ex5_green;
			blue <= tank2ex5_blue;
			end
			else if ((tank2_on == 1'b1)  & ((tank2ex6_red != 4'hF) & (tank2ex6_green != 4'hF) & (tank2ex6_blue != 4'hF)) & (bull_explode_flag2 == 4'b0111))begin
			red <= tank2ex6_red;
			green <= tank2ex6_green;
			blue <= tank2ex6_blue;
			end
			else if ((tank2_on == 1'b1)  & ((tank2ex7_red != 4'h1) & (tank2ex7_green != 4'h1) & (tank2ex7_blue != 4'h1)) & (bull_explode_flag2 == 4'b1000))begin
			red <= tank2ex7_red;
			green <= tank2ex7_green;
			blue <= tank2ex7_blue;
			end
			else if ((tank2_on == 1'b1)  & ((tank2ex8_red != 4'hF) & (tank2ex8_green != 4'hF) & (tank2ex8_blue != 4'hF)) & (bull_explode_flag2 == 4'b1001))begin
			red <= tank2ex8_red;
			green <= tank2ex8_green;
			blue <= tank2ex8_blue;
			end
			else if ((tank2_on == 1'b1)  & ((tank2ex9_red != 4'hF) & (tank2ex9_green != 4'hF) & (tank2ex9_blue != 4'hF)) & (bull_explode_flag2 == 4'b1010))begin
			red <= tank2ex9_red;
			green <= tank2ex9_green;
			blue <= tank2ex9_blue;
			end
			else if ((tank2_on == 1'b1)  & ((tank2ex10_red != 4'hF) & (tank2ex10_green != 4'hF) & (tank2ex10_blue != 4'hF)) & (bull_explode_flag2 == 4'b1011))begin
			red <= tank2ex10_red;
			green <= tank2ex10_green;
			blue <= tank2ex10_blue;
			end
			
			else begin
			red <= bg_red;
			green <= bg_green;
			blue <= bg_blue;
			end
			
			end else begin
			if ((tank2_on == 1'b1)  & ((tank2_red != 4'hE) & (tank2_green != 4'h3) & (tank2_blue != 4'hF)) & (bull_explode_flag2 == 4'b0000)) begin
			red <= tank2_red;
			green <= tank2_green;
			blue <= tank2_blue;
			end
			
			else if ((tank2_on == 1'b1)  & ((tank2_red != 4'hE) & (tank2_green != 4'h3) & (tank2_blue != 4'hF)) & (bull_explode_flag2 == 4'b0001)) begin
			red <= 4'h0;
			green <= 4'h0;
			blue <= 4'h0;
			end 
			
			else if ((tank2_on == 1'b1)  & ((tank2_red != 4'hE) & (tank2_green != 4'h3) & (tank2_blue != 4'hF)) & (bull_explode_flag2 == 4'b0010)) begin
			red <= 4'hF;
			green <= 4'hF;
			blue <= 4'hF;
			end 
			
			else if ((tank2_on == 1'b1)  & ((tank2_red != 4'hE) & (tank2_green != 4'h3) & (tank2_blue != 4'hF)) & (bull_explode_flag2 == 4'b0011)) begin
			red <= 4'h0;
			green <= 4'h0;
			blue <= 4'h0;
			end 
			
			else if ((tank2_on == 1'b1)  & ((tank2_red != 4'hE) & (tank2_green != 4'h3) & (tank2_blue != 4'hF)) & (bull_explode_flag2 == 4'b0100)) begin
			red <= 4'hF;
			green <= 4'hF;
			blue <= 4'hF;
			end 
			
			else if ((tank2_on == 1'b1)  & ((tank2_red != 4'hE) & (tank2_green != 4'h3) & (tank2_blue != 4'hF)) & (bull_explode_flag2 == 4'b0101)) begin
			red <= 4'h0;
			green <= 4'h0;
			blue <= 4'h0;
			end 
			
			else if ((tank2_on == 1'b1)  & ((tank2_red != 4'hE) & (tank2_green != 4'h3) & (tank2_blue != 4'hF)) & (bull_explode_flag2 == 4'b0110)) begin
			red <= 4'hF;
			green <= 4'hF;
			blue <= 4'hF;
			end 
			
			else if ((tank2_on == 1'b1)  & ((tank2_red != 4'hE) & (tank2_green != 4'h3) & (tank2_blue != 4'hF)) & (bull_explode_flag2 == 4'b0111)) begin
			red <= 4'h0;
			green <= 4'h0;
			blue <= 4'h0;
			end 
			
			else if ((tank2_on == 1'b1)  & ((tank2_red != 4'hE) & (tank2_green != 4'h3) & (tank2_blue != 4'hF)) & (bull_explode_flag2 == 4'b1000)) begin
			red <= 4'hF;
			green <= 4'hF;
			blue <= 4'hF;
			end 
			
			else if ((tank2_on == 1'b1)  & ((tank2_red != 4'hE) & (tank2_green != 4'h3) & (tank2_blue != 4'hF)) & (bull_explode_flag2 == 4'b1001)) begin
			red <= 4'h0;
			green <= 4'h0;
			blue <= 4'h0;
			end 
			
			else if ((tank2_on == 1'b1)  & ((tank2_red != 4'hE) & (tank2_green != 4'h3) & (tank2_blue != 4'hF)) & (bull_explode_flag2 == 4'b1010)) begin
			red <= 4'hE;
			green <= 4'h3;
			blue <= 4'hF;
			end 
			
			else if ((tank2_on == 1'b1)  & ((tank2_red != 4'hE) & (tank2_green != 4'h3) & (tank2_blue != 4'hF)) & (bull_explode_flag2 == 4'b1011)) begin
			red <= 4'hE;
			green <= 4'h3;
			blue <= 4'hF;
			end 
			
			else begin
			red <= bg_red;
			green <= bg_green;
			blue <= bg_blue;
			end
			
			end
			end
			end
		//end
		
		else if (player1_on == 1'b1 & (player1_red != 4'h0) & (player1_green != 4'h0) & (player1_blue != 4'h0)) begin
			red <= player1_red;
			green <= player1_green;
			blue <= player1_blue;
		
		end
		
		else if (player2_on == 1'b1 & (player2_red != 4'h0) & (player2_green != 4'h0) & (player2_blue != 4'h0)) begin
			red <= player2_red;
			green <= player2_green;
			blue <= player2_blue;
		
		end
		
		else if (battery1_on == 1'b1 & (batteryfull1_red != 4'hF) & (batteryfull1_green != 4'h0) & (batteryfull1_blue != 4'hD) & (health1 == 7)) begin
			red <= batteryfull1_red;
			green <= batteryfull1_green;
			blue <= batteryfull1_blue;
		
		end
		
		else if (battery1_on == 1'b1 & (battery_b1_red != 4'hF) & (battery_b1_green != 4'h0) & (battery_b1_blue != 4'hD) & (health1 == 6)) begin
			red <= battery_b1_red;
			green <= battery_b1_green;
			blue <= battery_b1_blue;
		
		end
		
		else if (battery1_on == 1'b1 & (battery_c1_red != 4'hF) & (battery_c1_green != 4'h0) & (battery_c1_blue != 4'hD) & (health1 == 5)) begin
			red <= battery_c1_red;
			green <= battery_c1_green;
			blue <= battery_c1_blue;
		
		end
		
		else if (battery1_on == 1'b1 & (battery_d1_red != 4'hF) & (battery_d1_green != 4'h0) & (battery_d1_blue != 4'hD) & (health1 == 4)) begin
			red <= battery_d1_red;
			green <= battery_d1_green;
			blue <= battery_d1_blue;
		
		end
		
		else if (battery1_on == 1'b1 & (battery_e1_red != 4'hF) & (battery_e1_green != 4'h0) & (battery_e1_blue != 4'hD) & (health1 == 3)) begin
			red <= battery_e1_red;
			green <= battery_e1_green;
			blue <= battery_e1_blue;
		
		end
		
		else if (battery1_on == 1'b1 & (battery_f1_red != 4'hF) & (battery_f1_green != 4'h0) & (battery_f1_blue != 4'hD) & (health1 == 2)) begin
			red <= battery_f1_red;
			green <= battery_f1_green;
			blue <= battery_f1_blue;
		
		end
		
		else if (battery1_on == 1'b1 & (battery_g1_red != 4'hF) & (battery_g1_green != 4'h0) & (battery_g1_blue != 4'hD) & (health1 == 1)) begin
			red <= battery_g1_red;
			green <= battery_g1_green;
			blue <= battery_g1_blue;
		
		end
		
		else if (battery1_on == 1'b1 & (batteryempty1_red != 4'hF) & (batteryempty1_green != 4'h0) & (batteryempty1_blue != 4'hD) & (health1 == 0)) begin
			red <= batteryempty1_red;
			green <= batteryempty1_green;
			blue <= batteryempty1_blue;
		
		end
		
		else if (battery2_on == 1'b1 & (batteryfull2_red != 4'hF) & (batteryfull2_green != 4'h0) & (batteryfull2_blue != 4'hD) & (health2 == 7)) begin
			red <= batteryfull2_red;
			green <= batteryfull2_green;
			blue <= batteryfull2_blue;
		
		end
		
		else if ((battery2_on == 1'b1) & (health2 == 6) & (battery_b2_red != 4'hF) & (battery_b2_green != 4'h0) & (battery_b2_blue != 4'hD)) begin
			red <= battery_b2_red;
			green <= battery_b2_green;
			blue <= battery_b2_blue;
         
//			red <= 4'd0;
//			green <= 4'd0;
//			blue <= 4'd0;

		
		end
		
		else if (battery2_on == 1'b1 & (battery_c2_red != 4'hF) & (battery_c2_green != 4'h0) & (battery_c2_blue != 4'hD) & (health2 == 5)) begin
			red <= battery_c2_red;
			green <= battery_c2_green;
			blue <= battery_c2_blue;
		
		end
		
		else if (battery2_on == 1'b1 & (battery_d2_red != 4'hF) & (battery_d2_green != 4'h0) & (battery_d2_blue != 4'hD) & (health2 == 4)) begin
			red <= battery_d2_red;
			green <= battery_d2_green;
			blue <= battery_d2_blue;
		
		end
		
		else if (battery2_on == 1'b1 & (battery_e2_red != 4'hF) & (battery_e2_green != 4'h0) & (battery_e2_blue != 4'hD) & (health2 == 3)) begin
			red <= battery_e2_red;
			green <= battery_e2_green;
			blue <= battery_e2_blue;
		
		end
		
		else if (battery2_on == 1'b1 & (battery_f2_red != 4'hF) & (battery_f2_green != 4'h0) & (battery_f2_blue != 4'hD) & (health2 == 2)) begin
			red <= battery_f2_red;
			green <= battery_f2_green;
			blue <= battery_f2_blue;
		
		end
		
		else if (battery2_on == 1'b1 & (battery_g2_red != 4'hF) & (battery_g2_green != 4'h0) & (battery_g2_blue != 4'hD) & (health2 == 1)) begin
			red <= battery_g2_red;
			green <= battery_g2_green;
			blue <= battery_g2_blue;
		
		end
		
		else if (battery2_on == 1'b1 & (batteryempty2_red != 4'hF) & (batteryempty2_green != 4'h0) & (batteryempty2_blue != 4'hD) & (health2 == 0)) begin
			red <= batteryempty2_red;
			green <= batteryempty2_green;
			blue <= batteryempty2_blue;
		
		end
		
		else if (fuel1_on == 1'b1 & !((fuelfull1_red == 4'hF) & (fuelfull1_green == 4'h0) & (fuelfull1_blue == 4'hD)) & (fuel1 > 40)) begin
			red <= fuelfull1_red;
			green <= fuelfull1_green;
			blue <= fuelfull1_blue;
		
		end
		
		else if (fuel1_on == 1'b1 & !((fuel_b1_red == 4'hF) & (fuel_b1_green == 4'h0) & (fuel_b1_blue == 4'hD)) & (fuel1 > 30 & fuel1 <= 40)) begin
			red <= fuel_b1_red;
			green <= fuel_b1_green;
			blue <= fuel_b1_blue;
		
		end
		
		else if (fuel1_on == 1'b1 & !((fuel_c1_red == 4'hF) & (fuel_c1_green == 4'h0) & (fuel_c1_blue == 4'hD)) & (fuel1 > 20 & fuel1 <= 30)) begin
			red <= fuel_c1_red;
			green <= fuel_c1_green;
			blue <= fuel_c1_blue;
		
		end
		
		else if (fuel1_on == 1'b1 & !((fuel_d1_red == 4'hF) & (fuel_d1_green == 4'h0) & (fuel_d1_blue == 4'hD)) & (fuel1 > 10 & fuel1 <= 20)) begin
			red <= fuel_d1_red;
			green <= fuel_d1_green;
			blue <= fuel_d1_blue;
		
		end
		
		else if (fuel1_on == 1'b1 & !((fuel_e1_red == 4'hF) & (fuel_e1_green == 4'h0) & (fuel_e1_blue == 4'hD)) & (fuel1 >= 1 & fuel1 <= 10 )) begin
			red <= fuel_e1_red;
			green <= fuel_e1_green;
			blue <= fuel_e1_blue;
		
		end
	
		else if (fuel1_on == 1'b1 & !((fuelempty1_red == 4'hF) & (fuelempty1_green == 4'h0) & (fuelempty1_blue == 4'hD)) & (fuel1 == 0)) begin
			red <= fuelempty1_red;
			green <= fuelempty1_green;
			blue <= fuelempty1_blue;
		
		end
		
		else if (fuel2_on == 1'b1 & !((fuelfull2_red == 4'hF) & (fuelfull2_green == 4'h0) & (fuelfull2_blue == 4'hD)) & (fuel2 > 40)) begin
			red <= fuelfull2_red;
			green <= fuelfull2_green;
			blue <= fuelfull2_blue;
		
		end
		
		else if ((fuel2_on == 1'b1) & !((fuel_b2_red == 4'hF) & (fuel_b2_green == 4'h0) & (fuel_b2_blue == 4'hD)) & (fuel2 > 30 & fuel2 <= 40)) begin
			red <= fuel_b2_red;
			green <= fuel_b2_green;
			blue <= fuel_b2_blue;
	
		end
		
		else if (fuel2_on == 1'b1 & !((fuel_c2_red == 4'hF) & (fuel_c2_green == 4'h0) & (fuel_c2_blue == 4'hD)) & (fuel2 > 20 & fuel2 <= 30)) begin
			red <= fuel_c2_red;
			green <= fuel_c2_green;
			blue <= fuel_c2_blue;
		
		end
		
		else if (fuel2_on == 1'b1 & !((fuel_d2_red == 4'hF) & (fuel_d2_green == 4'h0) & (fuel_d2_blue == 4'hD)) & (fuel2 > 10 & fuel2 <= 20)) begin
			red <= fuel_d2_red;
			green <= fuel_d2_green;
			blue <= fuel_d2_blue;
		
		end
		
		else if (fuel2_on == 1'b1 & !((fuel_e2_red == 4'hF) & (fuel_e2_green == 4'h0) & (fuel_e2_blue == 4'hD)) & (fuel2 >= 1 & fuel2 <= 10)) begin
			red <= fuel_e2_red;
			green <= fuel_e2_green;
			blue <= fuel_e2_blue;
		
		end
		
		else if (fuel2_on == 1'b1 & !((fuelempty2_red == 4'hF) & (fuelempty2_green == 4'h0) & (fuelempty2_blue == 4'hD)) & (fuel2 == 0)) begin
			red <= fuelempty2_red;
			green <= fuelempty2_green;
			blue <= fuelempty2_blue;
		
		end
		
		else if (x1text_on == 1'b1) begin
			case (x1text)
			4'd0: begin
					//	if ((x10_red != 4'hF) & (x10_green != 4'h0) & (x10_blue != 4'hD)) begin
						red <= x10_red;
						green <= x10_green;
						blue <= x10_blue;
					//	end else begin 
					//	end
					end
					
			4'd1: begin
					//	if ((x11_red != 4'hF) & (x11_green != 4'h0) & (x11_blue != 4'hD)) begin
						red <= x11_red;
						green <= x11_green;
						blue <= x11_blue;
					//	end else begin 
					//	end
					end
					
			4'd2: begin
					//	if ((x12_red != 4'hF) & (x12_green != 4'h0) & (x12_blue != 4'hD)) begin
						red <= x12_red;
						green <= x12_green;
						blue <= x12_blue;
					//	end else begin 
					//	end
					end
					
			4'd3: begin
					//	if ((x13_red != 4'hF) & (x13_green != 4'h0) & (x13_blue != 4'hD)) begin
						red <= x13_red;
						green <= x13_green;
						blue <= x13_blue;
					//	end else begin 
					//	end
					end
					
			4'd4: begin // test
					//   if ((x14_red != 4'hF) & (x14_green != 4'h0) & (x14_blue != 4'hD)) begin
						red <= x14_red;
						green <= x14_green;
						blue <= x14_blue;
						
					//	end
					end
					
			4'd5: begin
					//	if ((x15_red != 4'hF) & (x15_green != 4'h0) & (x15_blue != 4'hD)) begin
						red <= x15_red;
						green <= x15_green;
						blue <= x15_blue;
						//end else begin 
						//end
					end
					
			4'd6: begin
					//	if ((x16_red != 4'hF) & (x16_green != 4'h0) & (x16_blue != 4'hD)) begin
						red <= x16_red;
						green <= x16_green;
						blue <= x16_blue;
					//	end else begin 
					//	end
					end
					
			4'd7: begin
					//	if ((x17_red != 4'hF) & (x17_green != 4'h0) & (x17_blue != 4'hD)) begin
						red <= x17_red;
						green <= x17_green;
						blue <= x17_blue;
					//	end else begin 
					//	end
					end
					
			4'd8: begin
					//	if ((x18_red != 4'hF) & (x18_green != 4'h0) & (x18_blue != 4'hD)) begin
						red <= x18_red;
						green <= x18_green;
						blue <= x18_blue;
					//	end else begin 
					//	end
					end
					
			4'd9: begin
					//	if ((x19_red != 4'hF) & (x19_green != 4'h0) & (x19_blue != 4'hD)) begin
						red <= x19_red;
						green <= x19_green;
						blue <= x19_blue;
					//	end else begin 
					//	end
					end
			endcase
		
		end
		
		else if (x2text_on == 1'b1) begin
				case (x2text)
			4'd0: begin
					//	if ((x20_red != 4'hF) & (x20_green != 4'h0) & (x20_blue != 4'hD)) begin
						red <= x20_red;
						green <= x20_green;
						blue <= x20_blue;
					//	end else begin 
					//	end
					end
					
			4'd1: begin
					//	if ((x21_red != 4'hF) & (x21_green != 4'h0) & (x21_blue != 4'hD)) begin
						red <= x21_red;
						green <= x21_green;
						blue <= x21_blue;
					//	end else begin 
					//	end
					end
					
			4'd2: begin
					//	if ((x22_red != 4'hF) & (x22_green != 4'h0) & (x22_blue != 4'hD)) begin
						red <= x22_red;
						green <= x22_green;
						blue <= x22_blue;
//						end else begin 
//						end
					end
					
			4'd3: begin
					//	if ((x23_red != 4'hF) & (x23_green != 4'h0) & (x23_blue != 4'hD)) begin
						red <= x23_red;
						green <= x23_green;
						blue <= x23_blue;
					//	end else begin 
					//	end
					end
					
			4'd4: begin
					//	if ((x24_red != 4'hF) & (x24_green != 4'h0) & (x24_blue != 4'hD)) begin
						red <= x24_red;
						green <= x24_green;
						blue <= x24_blue;
					//	end else begin 
					//	end
					end
					
			4'd5: begin
					//	if ((x25_red != 4'hF) & (x25_green != 4'h0) & (x25_blue != 4'hD)) begin
						red <= x25_red;
						green <= x25_green;
						blue <= x25_blue;
					//	end else begin 
					//	end
					end
					
			4'd6: begin
					//	if ((x26_red != 4'hF) & (x26_green != 4'h0) & (x26_blue != 4'hD)) begin
						red <= x26_red;
						green <= x26_green;
						blue <= x26_blue;
					//	end else begin 
					//	end
					end
					
			4'd7: begin
					//	if ((x27_red != 4'hF) & (x27_green != 4'h0) & (x27_blue != 4'hD)) begin
						red <= x27_red;
						green <= x27_green;
						blue <= x27_blue;
					//	end else begin 
					//	end
					end
					
			4'd8: begin
					//if ((x28_red != 4'hF) & (x28_green != 4'hF) & (x28_blue != 4'hF)) begin
						red <= x28_red;
						green <= x28_green;
						blue <= x28_blue;
				//	end else begin 
					
				//	end
					
					end
					
			4'd9: begin
					//	if ((x29_red != 4'hF) & (x29_green != 4'h0) & (x29_blue != 4'hD)) begin
						red <= x29_red;
						green <= x29_green;
						blue <= x29_blue;
					//	end else begin 
					//	end
					end
					
			endcase
		
		end
		
		else if (y1text_on == 1'b1) begin
				case (y1text)
			4'd0: begin
					//	if ((y10_red != 4'hF) & (y10_green != 4'h0) & (y10_blue != 4'hD)) begin
						red <= y10_red;
						green <= y10_green;
						blue <= y10_blue;
//						end else begin 
//						end
					end
					
			4'd1: begin
					//	if ((y11_red != 4'hF) & (y11_green != 4'h0) & (y11_blue != 4'hD)) begin
						red <= y11_red;
						green <= y11_green;
						blue <= y11_blue;
					//	end else begin 
					//	end
					end
					
			4'd2: begin
					///	if ((y12_red != 4'hF) & (y12_green != 4'h0) & (y12_blue != 4'hD)) begin
						red <= y12_red;
						green <= y12_green;
						blue <= y12_blue;
					//	end else begin 
					//	end
					end
					
			4'd3: begin
					//	if ((y13_red != 4'hF) & (y13_green != 4'h0) & (y13_blue != 4'hD)) begin
						red <= y13_red;
						green <= y13_green;
						blue <= y13_blue;
					//	end else begin 
					//	end
					end
					
			4'd4: begin
					//	if ((y14_red != 4'hF) & (y14_green != 4'h0) & (y14_blue != 4'hD)) begin
						red <= y14_red;
						green <= y14_green;
						blue <= y14_blue;
					//	end else begin 
					//	end
					end
					
			4'd5: begin
					//	if ((y15_red != 4'hF) & (y15_green != 4'h0) & (y15_blue != 4'hD)) begin
						red <= y15_red;
						green <= y15_green;
						blue <= y15_blue;
					//	end else begin 
					//	end
					end
					
			4'd6: begin
					//	if ((y16_red != 4'hF) & (y16_green != 4'h0) & (y16_blue != 4'hD)) begin
						red <= y16_red;
						green <= y16_green;
						blue <= y16_blue;
					//	end else begin 
					//	end
					end
					
			4'd7: begin
					//	if ((y17_red != 4'hF) & (y17_green != 4'h0) & (y17_blue != 4'hD)) begin
						red <= y17_red;
						green <= y17_green;
						blue <= y17_blue;
					//	end else begin 
					//	end
					end
					
			4'd8: begin
					//	if ((y18_red != 4'hF) & (y18_green != 4'h0) & (y18_blue != 4'hD)) begin
						red <= y18_red;
						green <= y18_green;
						blue <= y18_blue;
					//	end else begin 
					//	end
					end
					
			4'd9: begin
					//	if ((y19_red != 4'hF) & (y19_green != 4'h0) & (y19_blue != 4'hD)) begin
						red <= y19_red;
						green <= y19_green;
						blue <= y19_blue;
					//	end else begin 
					//	end
					end
			endcase
		
		end
		
		else if (y2text_on == 1'b1) begin
				case (y2text)
			4'd0: begin
					//	if ((y20_red != 4'hF) & (y20_green != 4'h0) & (y20_blue != 4'hD)) begin
						red <= y20_red;
						green <= y20_green;
						blue <= y20_blue;
					//	end else begin 
					//	end
					end
					
			4'd1: begin
					//	if ((y21_red != 4'hF) & (y21_green != 4'h0) & (y21_blue != 4'hD)) begin
						red <= y21_red;
						green <= y21_green;
						blue <= y21_blue;
					//	end else begin 
					//	end
					end
					
			4'd2: begin
					//	if ((y22_red != 4'hF) & (y22_green != 4'h0) & (y22_blue != 4'hD)) begin
						red <= y22_red;
						green <= y22_green;
						blue <= y22_blue;
					//	end else begin 
					//	end
					end
					
			4'd3: begin
					//	if ((y23_red != 4'hF) & (y23_green != 4'h0) & (y23_blue != 4'hD)) begin
						red <= y23_red;
						green <= y23_green;
						blue <= y23_blue;
					//	end else begin 
					//	end
					end
					
			4'd4: begin
					//	if ((y24_red != 4'hF) & (y24_green != 4'h0) & (y24_blue != 4'hD)) begin
						red <= y24_red;
						green <= y24_green;
						blue <= y24_blue;
					//	end else begin 
					//	end
					end
					
			4'd5: begin
					//	if ((y25_red != 4'hF) & (y25_green != 4'h0) & (y25_blue != 4'hD)) begin
						red <= y25_red;
						green <= y25_green;
						blue <= y25_blue;
					//	end else begin 
						//end
					end
					
			4'd6: begin
					//	if ((y26_red != 4'hF) & (y26_green != 4'h0) & (y26_blue != 4'hD)) begin
						red <= y26_red;
						green <= y26_green;
						blue <= y26_blue;
					//	end else begin 
					//	end
					end
					
			4'd7: begin
					//	if ((y27_red != 4'hF) & (y27_green != 4'h0) & (y27_blue != 4'hD)) begin
						red <= y27_red;
						green <= y27_green;
						blue <= y27_blue;
					//	end else begin 
					//	end
					end
					
			4'd8: begin
					//	if ((y28_red != 4'hF) & (y28_green != 4'h0) & (y28_blue != 4'hD)) begin
						red <= y28_red;
						green <= y28_green;
						blue <= y28_blue;
					//	end else begin 
					//	end
					end
					
			4'd9: begin
					//	if ((y29_red != 4'hF) & (y29_green != 4'h0) & (y29_blue != 4'hD)) begin
						red <= y29_red;
						green <= y29_green;
						blue <= y29_blue;
					//	end else begin 
						//end
					end
					
			endcase
		end
		
		
		else begin 
			red <= bg_red;
			green <= bg_green;
			blue <= bg_blue;
			check <= 1'b0;
		end
	end
end

score_rom score_romx1 (
	.clock   (!vga_clk),
	.address (rom_address_x1),
	.q       (rom_q_x1)
);

score_palette score_palettex1 (
	.index (rom_q_x1),
	.red   (x1_red),
	.green (x1_green),
	.blue  (x1_blue)
);

score_rom score_romx2 (
	.clock   (!vga_clk),
	.address (rom_address_x2),
	.q       (rom_q_x2)
);

score_palette score_palettex2 (
	.index (rom_q_x2),
	.red   (x2_red),
	.green (x2_green),
	.blue  (x2_blue)
);

score_rom score_romy1 (
	.clock   (!vga_clk),
	.address (rom_address_y1),
	.q       (rom_q_y1)
);

score_palette score_palettey1 (
	.index (rom_q_y1),
	.red   (y1_red),
	.green (y1_green),
	.blue  (y1_blue)
);

score_rom score_romy2 (
	.clock   (!vga_clk),
	.address (rom_address_y2),
	.q       (rom_q_y2)
);

score_palette score_palettey2 (
	.index (rom_q_y2),
	.red   (y2_red),
	.green (y2_green),
	.blue  (y2_blue)
);

tank_test1_rom tank_test1_rom (
	.clock   (!vga_clk),
	.address (rom_address_tank),
	.q       (rom_q_tank)
);

tank_test1_palette tank_test1_palette (
	.index (rom_q_tank),
	.red   (tank_red),
	.green (tank_green),
	.blue  (tank_blue)
);

bgmt2_rom bgmt2_rom (
	.clock   (!vga_clk),
	.address (rom_address_bg),
	.q       (rom_q_bg)
);

bgmt2_palette bgmt2_palette (
	.index (rom_q_bg),
	.red   (bg_red),
	.green (bg_green),
	.blue  (bg_blue)
);

left_right_rom left_right_rom (
	.clock   (!vga_clk),
	.address (rom_address_lr),
	.q       (rom_q_lr)
);

left_right_palette left_right_palette (
	.index (rom_q_lr),
	.red   (lr_red),
	.green (lr_green),
	.blue  (lr_blue)
);

tank_test2_rom tank_test2_rom (
	.clock   (!vga_clk),
	.address (rom_address_tank2),
	.q       (rom_q_tank2)
);

tank_test2_palette tank_test2_palette (
	.index (rom_q_tank2),
	.red   (tank2_red),
	.green (tank2_green),
	.blue  (tank2_blue)
);

//brick_block_rom brick_block_rom (
//	.clock   (vga_clk),
//	.address (rom_address_floor),
//	.q       (rom_q_floor)
//);
//
//brick_block_palette brick_block_palette (
//	.index (rom_q_floor),
//	.red   (floor_red),
//	.green (floor_green),
//	.blue  (floor_blue)
//);

floor2_rom floor2_rom (
	.clock   (!vga_clk),
	.address (rom_address_floor),
	.q       (rom_q_floor)
);

floor2_palette floor2_palette (
	.index (rom_q_floor),
	.red   (floor_red),
	.green (floor_green),
	.blue  (floor_blue)
);

finalbullet_rom finalbullet_rom (
	.clock   (!vga_clk),
	.address (rom_address_bull1),
	.q       (rom_q_bull1)
);

finalbullet_palette finalbullet_palette (
	.index (rom_q_bull1),
	.red   (bull1_red),
	.green (bull1_green),
	.blue  (bull1_blue)
);

finalbullet_rom finalbullet_rom_2 (
	.clock   (!vga_clk),
	.address (rom_address_bull2),
	.q       (rom_q_bull2)
);

finalbullet_palette finalbullet_palette_2 (
	.index (rom_q_bull2),
	.red   (bull2_red),
	.green (bull2_green),
	.blue  (bull2_blue)
);

player1text_rom player1text_rom (
	.clock   (!vga_clk),
	.address (rom_address_player1),
	.q       (rom_q_player1)
);

player1text_palette player1text_palette (
	.index (rom_q_player1),
	.red   (player1_red),
	.green (player1_green),
	.blue  (player1_blue)
);

player2text_rom player2text_rom (
	.clock   (!vga_clk),
	.address (rom_address_player2),
	.q       (rom_q_player2)
);

player2text_palette player2text_palette (
	.index (rom_q_player2),
	.red   (player2_red),
	.green (player2_green),
	.blue  (player2_blue)
);

batteryfull_rom batteryfull_rom (
	.clock   (!vga_clk),
	.address (rom_address_batteryfull1),
	.q       (rom_q_batteryfull1)
);

batteryfull_palette batteryfull_palette (
	.index (rom_q_batteryfull1),
	.red   (batteryfull1_red),
	.green (batteryfull1_green),
	.blue  (batteryfull1_blue)
);

//_______________________________

battery_b_rom battery_b_rom (
	.clock   (!vga_clk),
	.address (rom_address_battery_b1),
	.q       (rom_q_battery_b1)
);

battery_b_palette battery_b_palette (
	.index (rom_q_battery_b1),
	.red   (battery_b1_red),
	.green (battery_b1_green),
	.blue  (battery_b1_blue)
);

battery_c_rom battery_c_rom (
	.clock   (!vga_clk),
	.address (rom_address_battery_c1),
	.q       (rom_q_battery_c1)
);

battery_c_palette battery_c_palette (
	.index (rom_q_battery_c1),
	.red   (battery_c1_red),
	.green (battery_c1_green),
	.blue  (battery_c1_blue)
);


battery_d_rom battery_d_rom (
	.clock   (!vga_clk),
	.address (rom_address_battery_d1),
	.q       (rom_q_battery_d1)
);

battery_d_palette battery_d_palette (
	.index (rom_q_battery_d1),
	.red   (battery_d1_red),
	.green (battery_d1_green),
	.blue  (battery_d1_blue)
);


battery_e_rom battery_e_rom (
	.clock   (!vga_clk),
	.address (rom_address_battery_e1),
	.q       (rom_q_battery_e1)
);

battery_e_palette battery_e_palette (
	.index (rom_q_battery_e1),
	.red   (battery_e1_red),
	.green (battery_e1_green),
	.blue  (battery_e1_blue)
);

battery_f_rom battery_f_rom (
	.clock   (!vga_clk),
	.address (rom_address_battery_f1),
	.q       (rom_q_battery_f1)
);

battery_f_palette battery_f_palette (
	.index (rom_q_battery_f1),
	.red   (battery_f1_red),
	.green (battery_f1_green),
	.blue  (battery_f1_blue)
);

battery_g_rom battery_g_rom (
	.clock   (!vga_clk),
	.address (rom_address_battery_g1),
	.q       (rom_q_battery_g1)
);

battery_g_palette battery_g_palette (
	.index (rom_q_battery_g1),
	.red   (battery_g1_red),
	.green (battery_g1_green),
	.blue  (battery_g1_blue)
);

batteryempty_rom batteryempty_rom (
	.clock   (!vga_clk),
	.address (rom_address_batteryempty1),
	.q       (rom_q_batteryempty1)
);

batteryempty_palette batteryempty_palette (
	.index (rom_q_batteryempty1),
	.red   (batteryempty1_red),
	.green (batteryempty1_green),
	.blue  (batteryempty1_blue)
);

//_______________________________



batteryfull_rom batteryfull_rom2 (
	.clock   (!vga_clk),
	.address (rom_address_batteryfull2),
	.q       (rom_q_batteryfull2)
);

batteryfull_palette batteryfull_palette2 (
	.index (rom_q_batteryfull2),
	.red   (batteryfull2_red),
	.green (batteryfull2_green),
	.blue  (batteryfull2_blue)
);

//_________________________

battery_b_rom battery_b_rom2 (
	.clock   (!vga_clk),
	.address (rom_address_battery_b2),
	.q       (rom_q_battery_b2)
);

battery_b_palette battery_b_palette2 (
	.index (rom_q_battery_b2),
	.red   (battery_b2_red),
	.green (battery_b2_green),
	.blue  (battery_b2_blue)
);

battery_c_rom battery_c_rom2 (
	.clock   (!vga_clk),
	.address (rom_address_battery_c2),
	.q       (rom_q_battery_c2)
);

battery_c_palette battery_c_palette2 (
	.index (rom_q_battery_c2),
	.red   (battery_c2_red),
	.green (battery_c2_green),
	.blue  (battery_c2_blue)
);


battery_d_rom battery_d_rom2 (
	.clock   (!vga_clk),
	.address (rom_address_battery_d2),
	.q       (rom_q_battery_d2)
);

battery_d_palette battery_d_palette2 (
	.index (rom_q_battery_d2),
	.red   (battery_d2_red),
	.green (battery_d2_green),
	.blue  (battery_d2_blue)
);


battery_e_rom battery_e_rom2 (
	.clock   (!vga_clk),
	.address (rom_address_battery_e2),
	.q       (rom_q_battery_e2)
);

battery_e_palette battery_e_palette2 (
	.index (rom_q_battery_e2),
	.red   (battery_e2_red),
	.green (battery_e2_green),
	.blue  (battery_e2_blue)
);

battery_f_rom battery_f_rom2 (
	.clock   (!vga_clk),
	.address (rom_address_battery_f2),
	.q       (rom_q_battery_f2)
);

battery_f_palette battery_f_palette2 (
	.index (rom_q_battery_f2),
	.red   (battery_f2_red),
	.green (battery_f2_green),
	.blue  (battery_f2_blue)
);

battery_g_rom battery_g_rom2 (
	.clock   (!vga_clk),
	.address (rom_address_battery_g2),
	.q       (rom_q_battery_g2)
);

battery_g_palette battery_g_palette2 (
	.index (rom_q_battery_g2),
	.red   (battery_g2_red),
	.green (battery_g2_green),
	.blue  (battery_g2_blue)
);

batteryempty_rom batteryempty_rom2 (
	.clock   (!vga_clk),
	.address (rom_address_batteryempty2),
	.q       (rom_q_batteryempty2)
);

batteryempty_palette batteryempty_palette2 (
	.index (rom_q_batteryempty2),
	.red   (batteryempty2_red),
	.green (batteryempty2_green),
	.blue  (batteryempty2_blue)
);

//_________________________

shellshocktitlescreen_rom shellshocktitlescreen_rom (
	.clock   (!vga_clk),
	.address (rom_address_shellshocktitle),
	.q       (rom_q_shellshocktitle)
);

shellshocktitlescreen_palette shellshocktitlescreen_palette (
	.index (rom_q_shellshocktitle),
	.red   (shellshocktitle_red),
	.green (shellshocktitle_green),
	.blue  (shellshocktitle_blue)
);

//shellshocktitlescreen_rom shellshocktitlescreen_rom (
//	.clock   (vga_clk),
//	.address (rom_address),
//	.q       (rom_q)
//);
//
//shellshocktitlescreen_palette shellshocktitlescreen_palette (
//	.index (rom_q),
//	.red   (palette_red),
//	.green (palette_green),
//	.blue  (palette_blue)
//);

player1win_text_rom player1win_rom (
	.clock   (!vga_clk),
	.address (rom_address_player1win),
	.q       (rom_q_player1win)
);

player1win_text_palette player1win_palette (
	.index (rom_q_player1win),
	.red   (player1win_red),
	.green (player1win_green),
	.blue  (player1win_blue)
);

player2win_text_rom player2win_rom (
	.clock   (!vga_clk),
	.address (rom_address_player2win),
	.q       (rom_q_player2win)
);

player2win_text_palette player2win_palette (
	.index (rom_q_player2win),
	.red   (player2win_red),
	.green (player2win_green),
	.blue  (player2win_blue)
);

downramp_rom downramp_rom (
	.clock   (!vga_clk),
	.address (rom_address_downramp),
	.q       (rom_q_downramp)
);

downramp_palette downramp_palette (
	.index (rom_q_downramp),
	.red   (downramp_red),
	.green (downramp_green),
	.blue  (downramp_blue)
);


downramp2_rom downramp2_rom (
	.clock   (!vga_clk),
	.address (rom_address_downramp2),
	.q       (rom_q_downramp2)
);

downramp2_palette downramp2_palette (
	.index (rom_q_downramp2),
	.red   (downramp2_red),
	.green (downramp2_green),
	.blue  (downramp2_blue)
);

upramp2_rom upramp2_rom (
	.clock   (!vga_clk),
	.address (rom_address_upramp2),
	.q       (rom_q_upramp2)
);

upramp2_palette upramp2_palette (
	.index (rom_q_upramp2),
	.red   (upramp2_red),
	.green (upramp2_green),
	.blue  (upramp2_blue)
);

upramp_rom upramp_rom (
	.clock   (!vga_clk),
	.address (rom_address_upramp),
	.q       (rom_q_upramp)
);

upramp_palette upramp_palette (
	.index (rom_q_upramp),
	.red   (upramp_red),
	.green (upramp_green),
	.blue  (upramp_blue)
);

fuelfull_rom fuelfull_rom (
	.clock   (!vga_clk),
	.address (rom_address_fuelfull1),
	.q       (rom_q_fuelfull1)
);

fuelfull_palette fuelfull_palette (
	.index (rom_q_fuelfull1),
	.red   (fuelfull1_red),
	.green (fuelfull1_green),
	.blue  (fuelfull1_blue)
);

fuel_b_rom fuel_b_rom (
	.clock   (!vga_clk),
	.address (rom_address_fuel_b1),
	.q       (rom_q_fuel_b1)
);

fuel_b_palette fuel_b_palette (
	.index (rom_q_fuel_b1),
	.red   (fuel_b1_red),
	.green (fuel_b1_green),
	.blue  (fuel_b1_blue)
);


fuel_c_rom fuel_c_rom (
	.clock   (!vga_clk),
	.address (rom_address_fuel_c1),
	.q       (rom_q_fuel_c1)
);

fuel_c_palette fuel_c_palette (
	.index (rom_q_fuel_c1),
	.red   (fuel_c1_red),
	.green (fuel_c1_green),
	.blue  (fuel_c1_blue)
);

fuel_d_rom fuel_d_rom (
	.clock   (!vga_clk),
	.address (rom_address_fuel_d1),
	.q       (rom_q_fuel_d1)
);

fuel_d_palette fuel_d_palette (
	.index (rom_q_fuel_d1),
	.red   (fuel_d1_red),
	.green (fuel_d1_green),
	.blue  (fuel_d1_blue)
);

fuel_e_rom fuel_e_rom (
	.clock   (!vga_clk),
	.address (rom_address_fuel_e1),
	.q       (rom_q_fuel_e1)
);

fuel_e_palette fuel_e_palette (
	.index (rom_q_fuel_e1),
	.red   (fuel_e1_red),
	.green (fuel_e1_green),
	.blue  (fuel_e1_blue)
);

fuelempty_rom fuelempty_rom (
	.clock   (!vga_clk),
	.address (rom_address_fuelempty1),
	.q       (rom_q_fuelempty1)
);

fuelempty_palette fuelempty_palette (
	.index (rom_q_fuelempty1),
	.red   (fuelempty1_red),
	.green (fuelempty1_green),
	.blue  (fuelempty1_blue)
);

fuelfull_rom fuelfull_rom2 (
	.clock   (!vga_clk),
	.address (rom_address_fuelfull2),
	.q       (rom_q_fuelfull2)
);

fuelfull_palette fuelfull_palette2 (
	.index (rom_q_fuelfull2),
	.red   (fuelfull2_red),
	.green (fuelfull2_green),
	.blue  (fuelfull2_blue)
);

fuel_b_rom fuel_b_rom2 (
	.clock   (!vga_clk),
	.address (rom_address_fuel_b2),
	.q       (rom_q_fuel_b2)
);

fuel_b_palette fuel_b_palette2 (
	.index (rom_q_fuel_b2),
	.red   (fuel_b2_red),
	.green (fuel_b2_green),
	.blue  (fuel_b2_blue)
);


fuel_c_rom fuel_c_rom2 (
	.clock   (!vga_clk),
	.address (rom_address_fuel_c2),
	.q       (rom_q_fuel_c2)
);

fuel_c_palette fuel_c_palette2 (
	.index (rom_q_fuel_c2),
	.red   (fuel_c2_red),
	.green (fuel_c2_green),
	.blue  (fuel_c2_blue)
);

fuel_d_rom fuel_d_rom2 (
	.clock   (!vga_clk),
	.address (rom_address_fuel_d2),
	.q       (rom_q_fuel_d2)
);

fuel_d_palette fuel_d_palette2 (
	.index (rom_q_fuel_d2),
	.red   (fuel_d2_red),
	.green (fuel_d2_green),
	.blue  (fuel_d2_blue)
);

fuel_e_rom fuel_e_rom2 (
	.clock   (!vga_clk),
	.address (rom_address_fuel_e2),
	.q       (rom_q_fuel_e2)
);

fuel_e_palette fuel_e_palette2 (
	.index (rom_q_fuel_e2),
	.red   (fuel_e2_red),
	.green (fuel_e2_green),
	.blue  (fuel_e2_blue)
);

fuelempty_rom fuelempty_rom2 (
	.clock   (!vga_clk),
	.address (rom_address_fuelempty2),
	.q       (rom_q_fuelempty2)
);

fuelempty_palette fuelempty_palette2 (
	.index (rom_q_fuelempty2),
	.red   (fuelempty2_red),
	.green (fuelempty2_green),
	.blue  (fuelempty2_blue)
);

destructionz_rom destructionz_rom (
	.clock   (!vga_clk),
	.address (rom_address_dest1),
	.q       (rom_q_dest1)
);

destructionz_palette destructionz_palette (
	.index (rom_q_dest1),
	.red   (dest1_red),
	.green (dest1_green),
	.blue  (dest1_blue)
);

destructionz_rom destructionz_rom2 (
	.clock   (!vga_clk),
	.address (rom_address_dest2),
	.q       (rom_q_dest2)
);

destructionz_palette destructionz_palette2 (
	.index (rom_q_dest2),
	.red   (dest2_red),
	.green (dest2_green),
	.blue  (dest2_blue)
);

crithitz_rom crithitz_rom (
	.clock   (!vga_clk),
	.address (rom_address_crit1),
	.q       (rom_q_crit1)
);

crithitz_palette crithitz_palette (
	.index (rom_q_crit1),
	.red   (crit1_red),
	.green (crit1_green),
	.blue  (crit1_blue)
);

crithitz_rom crithitz_rom2 (
	.clock   (!vga_clk),
	.address (rom_address_crit2),
	.q       (rom_q_crit2)
);

crithitz_palette crithitz_palette2 (
	.index (rom_q_crit2),
	.red   (crit2_red),
	.green (crit2_green),
	.blue  (crit2_blue)
);

//_____________________________________________________________________________________________________________
ex1_rom ex1_rom (.clock(!vga_clk), .address (rom_address_ex1), .q(rom_q_ex1));
ex1_palette ex1_palette (.index(rom_q_ex1), .red(ex1_red), .green (ex1_green), .blue(ex1_blue));

ex2_rom ex2_rom (.clock(!vga_clk), .address (rom_address_ex2), .q(rom_q_ex2));
ex2_palette ex2_palette (.index(rom_q_ex2), .red(ex2_red), .green (ex2_green), .blue(ex2_blue));

ex3_rom ex3_rom (.clock(!vga_clk), .address (rom_address_ex3), .q(rom_q_ex3));
ex3_palette ex3_palette (.index(rom_q_ex3), .red(ex3_red), .green (ex3_green), .blue(ex3_blue));

ex4_rom ex4_rom (.clock(!vga_clk), .address (rom_address_ex4), .q(rom_q_ex4));
ex4_palette ex4_palette (.index(rom_q_ex4), .red(ex4_red), .green (ex4_green), .blue(ex4_blue));

ex5_rom ex5_rom (.clock(!vga_clk), .address (rom_address_ex5), .q(rom_q_ex5));
ex5_palette ex5_palette (.index(rom_q_ex5), .red(ex5_red), .green (ex5_green), .blue(ex5_blue));

ex6_rom ex6_rom (.clock(!vga_clk), .address (rom_address_ex6), .q(rom_q_ex6));
ex6_palette ex6_palette (.index(rom_q_ex6), .red(ex6_red), .green (ex6_green), .blue(ex6_blue));

ex7_rom ex7_rom (.clock(!vga_clk), .address (rom_address_ex7), .q(rom_q_ex7));
ex7_palette ex7_palette (.index(rom_q_ex7), .red(ex7_red), .green (ex7_green), .blue(ex7_blue));

ex8_rom ex8_rom (.clock(!vga_clk), .address (rom_address_ex8), .q(rom_q_ex8));
ex8_palette ex8_palette (.index(rom_q_ex8), .red(ex8_red), .green (ex8_green), .blue(ex8_blue));

ex9_rom ex9_rom (.clock(!vga_clk), .address (rom_address_ex9), .q(rom_q_ex9));
ex9_palette ex9_palette (.index(rom_q_ex9), .red(ex9_red), .green (ex9_green), .blue(ex9_blue));

ex10_rom ex10_rom (.clock(!vga_clk), .address (rom_address_ex10), .q(rom_q_ex10));
ex10_palette ex10_palette (.index(rom_q_ex10), .red(ex10_red), .green (ex10_green), .blue(ex10_blue));
//_____________________________________________________________________________________________________________

drex1_rom drex1_rom (.clock(!vga_clk), .address (rom_address_drex1), .q(rom_q_drex1));
drex1_palette drex1_palette (.index(rom_q_drex1), .red(drex1_red), .green (drex1_green), .blue(drex1_blue));

drex2_rom drex2_rom (.clock(!vga_clk), .address (rom_address_drex2), .q(rom_q_drex2));
drex2_palette drex2_palette (.index(rom_q_drex2), .red(drex2_red), .green (drex2_green), .blue(drex2_blue));

drex3_rom drex3_rom (.clock(!vga_clk), .address (rom_address_drex3), .q(rom_q_drex3));
drex3_palette drex3_palette (.index(rom_q_drex3), .red(drex3_red), .green (drex3_green), .blue(drex3_blue));

drex4_rom drex4_rom (.clock(!vga_clk), .address (rom_address_drex4), .q(rom_q_drex4));
drex4_palette drex4_palette (.index(rom_q_drex4), .red(drex4_red), .green (drex4_green), .blue(drex4_blue));

drex5_rom drex5_rom (.clock(!vga_clk), .address (rom_address_drex5), .q(rom_q_drex5));
drex5_palette drex5_palette (.index(rom_q_drex5), .red(drex5_red), .green (drex5_green), .blue(drex5_blue));

drex6_rom drex6_rom (.clock(!vga_clk), .address (rom_address_drex6), .q(rom_q_drex6));
drex6_palette drex6_palette (.index(rom_q_drex6), .red(drex6_red), .green (drex6_green), .blue(drex6_blue));

drex7_rom drex7_rom (.clock(!vga_clk), .address (rom_address_drex7), .q(rom_q_drex7));
drex7_palette drex7_palette (.index(rom_q_drex7), .red(drex7_red), .green (drex7_green), .blue(drex7_blue));

drex8_rom drex8_rom (.clock(!vga_clk), .address (rom_address_drex8), .q(rom_q_drex8));
drex8_palette drex8_palette (.index(rom_q_drex8), .red(drex8_red), .green (drex8_green), .blue(drex8_blue));

drex9_rom drex9_rom (.clock(!vga_clk), .address (rom_address_drex9), .q(rom_q_drex9));
drex9_palette drex9_palette (.index(rom_q_drex9), .red(drex9_red), .green (drex9_green), .blue(drex9_blue));

drex10_rom drex10_rom (.clock(!vga_clk), .address (rom_address_drex10), .q(rom_q_drex10));
drex10_palette drex10_palette (.index(rom_q_drex10), .red(drex10_red), .green (drex10_green), .blue(drex10_blue));

//_____________________________________________________________________________________________________________

urex1_rom urex1_rom (.clock(!vga_clk), .address (rom_address_urex1), .q(rom_q_urex1));
urex1_palette urex1_palette (.index(rom_q_urex1), .red(urex1_red), .green (urex1_green), .blue(urex1_blue));

urex2_rom urex2_rom (.clock(!vga_clk), .address (rom_address_urex2), .q(rom_q_urex2));
urex2_palette urex2_palette (.index(rom_q_urex2), .red(urex2_red), .green (urex2_green), .blue(urex2_blue));

urex3_rom urex3_rom (.clock(!vga_clk), .address (rom_address_urex3), .q(rom_q_urex3));
urex3_palette urex3_palette (.index(rom_q_urex3), .red(urex3_red), .green (urex3_green), .blue(urex3_blue));

urex4_rom urex4_rom (.clock(!vga_clk), .address (rom_address_urex4), .q(rom_q_urex4));
urex4_palette urex4_palette (.index(rom_q_urex4), .red(urex4_red), .green (urex4_green), .blue(urex4_blue));

urex5_rom urex5_rom (.clock(!vga_clk), .address (rom_address_urex5), .q(rom_q_urex5));
urex5_palette urex5_palette (.index(rom_q_urex5), .red(urex5_red), .green (urex5_green), .blue(urex5_blue));

urex6_rom urex6_rom (.clock(!vga_clk), .address (rom_address_urex6), .q(rom_q_urex6));
urex6_palette urex6_palette (.index(rom_q_urex6), .red(urex6_red), .green (urex6_green), .blue(urex6_blue));

urex7_rom urex7_rom (.clock(!vga_clk), .address (rom_address_urex7), .q(rom_q_urex7));
urex7_palette urex7_palette (.index(rom_q_urex7), .red(urex7_red), .green (urex7_green), .blue(urex7_blue));

urex8_rom urex8_rom (.clock(!vga_clk), .address (rom_address_urex8), .q(rom_q_urex8));
urex8_palette urex8_palette (.index(rom_q_urex8), .red(urex8_red), .green (urex8_green), .blue(urex8_blue));

urex9_rom urex9_rom (.clock(!vga_clk), .address (rom_address_urex9), .q(rom_q_urex9));
urex9_palette urex9_palette (.index(rom_q_urex9), .red(urex9_red), .green (urex9_green), .blue(urex9_blue));

urex10_rom urex10_rom (.clock(!vga_clk), .address (rom_address_urex10), .q(rom_q_urex10));
urex10_palette urex10_palette (.index(rom_q_urex10), .red(urex10_red), .green (urex10_green), .blue(urex10_blue));

//_____________________________________________________________________________________________________________
//_____________________________________________________________________________________________________________

tank2ex1_rom tank2ex1_rom (.clock(!vga_clk), .address (rom_address_tank2ex1), .q(rom_q_tank2ex1));
tank2ex1_palette tank2ex1_palette (.index(rom_q_tank2ex1), .red(tank2ex1_red), .green (tank2ex1_green), .blue(tank2ex1_blue));

tank2ex2_rom tank2ex2_rom (.clock(!vga_clk), .address (rom_address_tank2ex2), .q(rom_q_tank2ex2));
tank2ex2_palette tank2ex2_palette (.index(rom_q_tank2ex2), .red(tank2ex2_red), .green (tank2ex2_green), .blue(tank2ex2_blue));

tank2ex3_rom tank2ex3_rom (.clock(!vga_clk), .address (rom_address_tank2ex3), .q(rom_q_tank2ex3));
tank2ex3_palette tank2ex3_palette (.index(rom_q_tank2ex3), .red(tank2ex3_red), .green (tank2ex3_green), .blue(tank2ex3_blue));

tank2ex4_rom tank2ex4_rom (.clock(!vga_clk), .address (rom_address_tank2ex4), .q(rom_q_tank2ex4));
tank2ex4_palette tank2ex4_palette (.index(rom_q_tank2ex4), .red(tank2ex4_red), .green (tank2ex4_green), .blue(tank2ex4_blue));

tank2ex5_rom tank2ex5_rom (.clock(!vga_clk), .address (rom_address_tank2ex5), .q(rom_q_tank2ex5));
tank2ex5_palette tank2ex5_palette (.index(rom_q_tank2ex5), .red(tank2ex5_red), .green (tank2ex5_green), .blue(tank2ex5_blue));

tank2ex6_rom tank2ex6_rom (.clock(!vga_clk), .address (rom_address_tank2ex6), .q(rom_q_tank2ex6));
tank2ex6_palette tank2ex6_palette (.index(rom_q_tank2ex6), .red(tank2ex6_red), .green (tank2ex6_green), .blue(tank2ex6_blue));

tank2ex7_rom tank2ex7_rom (.clock(!vga_clk), .address (rom_address_tank2ex7), .q(rom_q_tank2ex7));
tank2ex7_palette tank2ex7_palette (.index(rom_q_tank2ex7), .red(tank2ex7_red), .green (tank2ex7_green), .blue(tank2ex7_blue));

tank2ex8_rom tank2ex8_rom (.clock(!vga_clk), .address (rom_address_tank2ex8), .q(rom_q_tank2ex8));
tank2ex8_palette tank2ex8_palette (.index(rom_q_tank2ex8), .red(tank2ex8_red), .green (tank2ex8_green), .blue(tank2ex8_blue));

tank2ex9_rom tank2ex9_rom (.clock(!vga_clk), .address (rom_address_tank2ex9), .q(rom_q_tank2ex9));
tank2ex9_palette tank2ex9_palette (.index(rom_q_tank2ex9), .red(tank2ex9_red), .green (tank2ex9_green), .blue(tank2ex9_blue));

tank2ex10_rom tank2ex10_rom (.clock(!vga_clk), .address (rom_address_tank2ex10), .q(rom_q_tank2ex10));
tank2ex10_palette tank2ex10_palette (.index(rom_q_tank2ex10), .red(tank2ex10_red), .green (tank2ex10_green), .blue(tank2ex10_blue));

//_____________________________________________________________________________________________________________

tank2drex1_rom tank2drex1_rom (.clock(!vga_clk), .address (rom_address_tank2drex1), .q(rom_q_tank2drex1));
tank2drex1_palette tank2drex1_palette (.index(rom_q_tank2drex1), .red(tank2drex1_red), .green (tank2drex1_green), .blue(tank2drex1_blue));

tank2drex2_rom tank2drex2_rom (.clock(!vga_clk), .address (rom_address_tank2drex2), .q(rom_q_tank2drex2));
tank2drex2_palette tank2drex2_palette (.index(rom_q_tank2drex2), .red(tank2drex2_red), .green (tank2drex2_green), .blue(tank2drex2_blue));

tank2drex3_rom tank2drex3_rom (.clock(!vga_clk), .address (rom_address_tank2drex3), .q(rom_q_tank2drex3));
tank2drex3_palette tank2drex3_palette (.index(rom_q_tank2drex3), .red(tank2drex3_red), .green (tank2drex3_green), .blue(tank2drex3_blue));

tank2drex4_rom tank2drex4_rom (.clock(!vga_clk), .address (rom_address_tank2drex4), .q(rom_q_tank2drex4));
tank2drex4_palette tank2drex4_palette (.index(rom_q_tank2drex4), .red(tank2drex4_red), .green (tank2drex4_green), .blue(tank2drex4_blue));

tank2drex6_rom tank2drex6_rom (.clock(!vga_clk), .address (rom_address_tank2drex6), .q(rom_q_tank2drex6));
tank2drex6_palette tank2drex6_palette (.index(rom_q_tank2drex6), .red(tank2drex6_red), .green (tank2drex6_green), .blue(tank2drex6_blue));

tank2drex7_rom tank2drex7_rom (.clock(!vga_clk), .address (rom_address_tank2drex7), .q(rom_q_tank2drex7));
tank2drex7_palette tank2drex7_palette (.index(rom_q_tank2drex7), .red(tank2drex7_red), .green (tank2drex7_green), .blue(tank2drex7_blue));

tank2drex8_rom tank2drex8_rom (.clock(!vga_clk), .address (rom_address_tank2drex8), .q(rom_q_tank2drex8));
tank2drex8_palette tank2drex8_palette (.index(rom_q_tank2drex8), .red(tank2drex8_red), .green (tank2drex8_green), .blue(tank2drex8_blue));

tank2drex9_rom tank2drex9_rom (.clock(!vga_clk), .address (rom_address_tank2drex9), .q(rom_q_tank2drex9));
tank2drex9_palette tank2drex9_palette (.index(rom_q_tank2drex9), .red(tank2drex9_red), .green (tank2drex9_green), .blue(tank2drex9_blue));

tank2drex10_rom tank2drex10_rom (.clock(!vga_clk), .address (rom_address_tank2drex10), .q(rom_q_tank2drex10));
tank2drex10_palette tank2drex10_palette (.index(rom_q_tank2drex10), .red(tank2drex10_red), .green (tank2drex10_green), .blue(tank2drex10_blue));

//_____________________________________________________________________________________________________________


tank2urex1_rom tank2urex1_rom (.clock(!vga_clk), .address (rom_address_tank2urex1), .q(rom_q_tank2urex1));
tank2urex1_palette tank2urex1_palette (.index(rom_q_tank2urex1), .red(tank2urex1_red), .green (tank2urex1_green), .blue(tank2urex1_blue));

tank2urex2_rom tank2urex2_rom (.clock(!vga_clk), .address (rom_address_tank2urex2), .q(rom_q_tank2urex2));
tank2urex2_palette tank2urex2_palette (.index(rom_q_tank2urex2), .red(tank2urex2_red), .green (tank2urex2_green), .blue(tank2urex2_blue));

tank2urex3_rom tank2urex3_rom (.clock(!vga_clk), .address (rom_address_tank2urex3), .q(rom_q_tank2urex3));
tank2urex3_palette tank2urex3_palette (.index(rom_q_tank2urex3), .red(tank2urex3_red), .green (tank2urex3_green), .blue(tank2urex3_blue));

tank2urex4_rom tank2urex4_rom (.clock(!vga_clk), .address (rom_address_tank2urex4), .q(rom_q_tank2urex4));
tank2urex4_palette tank2urex4_palette (.index(rom_q_tank2urex4), .red(tank2urex4_red), .green (tank2urex4_green), .blue(tank2urex4_blue));

tank2urex6_rom tank2urex6_rom (.clock(!vga_clk), .address (rom_address_tank2urex6), .q(rom_q_tank2urex6));
tank2urex6_palette tank2urex6_palette (.index(rom_q_tank2urex6), .red(tank2urex6_red), .green (tank2urex6_green), .blue(tank2urex6_blue));

tank2urex7_rom tank2urex7_rom (.clock(!vga_clk), .address (rom_address_tank2urex7), .q(rom_q_tank2urex7));
tank2urex7_palette tank2urex7_palette (.index(rom_q_tank2urex7), .red(tank2urex7_red), .green (tank2urex7_green), .blue(tank2urex7_blue));

tank2urex8_rom tank2urex8_rom (.clock(!vga_clk), .address (rom_address_tank2urex8), .q(rom_q_tank2urex8));
tank2urex8_palette tank2urex8_palette (.index(rom_q_tank2urex8), .red(tank2urex8_red), .green (tank2urex8_green), .blue(tank2urex8_blue));

tank2urex9_rom tank2urex9_rom (.clock(!vga_clk), .address (rom_address_tank2urex9), .q(rom_q_tank2urex9));
tank2urex9_palette tank2urex9_palette (.index(rom_q_tank2urex9), .red(tank2urex9_red), .green (tank2urex9_green), .blue(tank2urex9_blue));

tank2urex10_rom tank2urex10_rom (.clock(!vga_clk), .address (rom_address_tank2urex10), .q(rom_q_tank2urex10));
tank2urex10_palette tank2urex10_palette (.index(rom_q_tank2urex10), .red(tank2urex10_red), .green (tank2urex10_green), .blue(tank2urex10_blue));

//_____________________________________________________________________________________________________________

//_____________________________________________________________________________________________________________


zerosprite_rom zerosprite_rom_x10 (.clock(!vga_clk), .address(rom_address_x10), .q(rom_q_x10));
zerosprite_palette zerosprite_palette_x10 (.index(rom_q_x10), .red(x10_red), .green(x10_green), .blue(x10_blue));

onesprite_rom onesprite_rom_x11 (.clock(!vga_clk), .address(rom_address_x11), .q(rom_q_x11));
onesprite_palette onesprite_palette_x11 (.index(rom_q_x11), .red(x11_red), .green(x11_green), .blue(x11_blue));

twosprite_rom twosprite_rom_x12 (.clock(!vga_clk), .address(rom_address_x12), .q(rom_q_x12));
twosprite_palette twosprite_palette_x12 (.index(rom_q_x12), .red(x12_red), .green(x12_green), .blue(x12_blue));

threesprite_rom threesprite_rom_x13 (.clock(!vga_clk), .address(rom_address_x13), .q(rom_q_x13));
threesprite_palette threesprite_palette_x13 (.index(rom_q_x13), .red(x13_red), .green(x13_green), .blue(x13_blue));

foursprite_rom foursprite_rom_x14 (.clock(!vga_clk), .address(rom_address_x14), .q(rom_q_x14));
foursprite_palette foursprite_palette_x14 (.index(rom_q_x14), .red(x14_red), .green(x14_green), .blue(x14_blue));

fivesprite_rom fivesprite_rom_x15 (.clock(!vga_clk), .address(rom_address_x15), .q(rom_q_x15));
fivesprite_palette fivesprite_palette_x15 (.index(rom_q_x15), .red(x15_red), .green(x15_green), .blue(x15_blue));

sixsprite_rom sixsprite_rom_x16 (.clock(!vga_clk), .address(rom_address_x16), .q(rom_q_x16));
sixsprite_palette sixsprite_palette_x16 (.index(rom_q_x16), .red(x16_red), .green(x16_green), .blue(x16_blue));

sevensprite_rom sevensprite_rom_x17 (.clock(!vga_clk), .address(rom_address_x17), .q(rom_q_x17));
sevensprite_palette sevensprite_palette_x17 (.index(rom_q_x17), .red(x17_red), .green(x17_green), .blue(x17_blue));

eightsprite_rom eightsprite_rom_x18 (.clock(!vga_clk), .address(rom_address_x18), .q(rom_q_x18));
eightsprite_palette eightsprite_palette_x18 (.index(rom_q_x18), .red(x18_red), .green(x18_green), .blue(x18_blue));

ninesprite_rom ninesprite_rom_x19 (.clock(!vga_clk), .address(rom_address_x19), .q(rom_q_x19));
ninesprite_palette ninesprite_palette_x19 (.index(rom_q_x19), .red(x19_red), .green(x19_green), .blue(x19_blue));

//_____________________________________________________________________________________________________________

zerosprite_rom zerosprite_rom_x20 (.clock(!vga_clk), .address(rom_address_x20), .q(rom_q_x20));
zerosprite_palette zerosprite_palette_x20 (.index(rom_q_x20), .red(x20_red), .green(x20_green), .blue(x20_blue));

onesprite_rom onesprite_rom_x21 (.clock(!vga_clk), .address(rom_address_x21), .q(rom_q_x21));
onesprite_palette onesprite_palette_x21 (.index(rom_q_x21), .red(x21_red), .green(x21_green), .blue(x21_blue));

twosprite_rom twosprite_rom_x22 (.clock(!vga_clk), .address(rom_address_x22), .q(rom_q_x22));
twosprite_palette twosprite_palette (.index(rom_q_x22), .red(x22_red), .green(x22_green), .blue(x22_blue));

threesprite_rom threesprite_rom_x23 (.clock(!vga_clk), .address(rom_address_x23), .q(rom_q_x23));
threesprite_palette threesprite_palette_x23 (.index(rom_q_x23), .red(x23_red), .green(x23_green), .blue(x23_blue));

foursprite_rom foursprite_rom_x24 (.clock(!vga_clk), .address(rom_address_x24), .q(rom_q_x24));
foursprite_palette foursprite_palette_x24 (.index(rom_q_x24), .red(x24_red), .green(x24_green), .blue(x24_blue));

fivesprite_rom fivesprite_rom_x25 (.clock(!vga_clk), .address(rom_address_x25), .q(rom_q_x25));
fivesprite_palette fivesprite_palette_x25 (.index(rom_q_x25), .red(x25_red), .green(x25_green), .blue(x25_blue));

sixsprite_rom sixsprite_rom_x26 (.clock(!vga_clk), .address(rom_address_x26), .q(rom_q_x26));
sixsprite_palette sixsprite_palette_x26 (.index(rom_q_x26), .red(x26_red), .green(x26_green), .blue(x26_blue));

sevensprite_rom sevensprite_rom_x27 (.clock(!vga_clk), .address(rom_address_x27), .q(rom_q_x27));
sevensprite_palette sevensprite_palette_x27 (.index(rom_q_x27), .red(x27_red), .green(x27_green), .blue(x27_blue));

eightsprite_rom eightsprite_rom_x28 (.clock(!vga_clk), .address(rom_address_x28), .q(rom_q_x28));
eightsprite_palette eightsprite_palette_x28 (.index(rom_q_x28), .red(x28_red), .green(x28_green), .blue(x28_blue));

ninesprite_rom ninesprite_rom_x29 (.clock(!vga_clk), .address(rom_address_x29), .q(rom_q_x29));
ninesprite_palette ninesprite_palette_x29 (.index(rom_q_x29), .red(x29_red), .green(x29_green), .blue(x29_blue));

//_____________________________________________________________________________________________________________

zerosprite_rom zerosprite_rom_y10 (.clock(!vga_clk), .address(rom_address_y10), .q(rom_q_y10));
zerosprite_palette zerosprite_palette_y10 (.index(rom_q_y10), .red(y10_red), .green(y10_green), .blue(y10_blue));

onesprite_rom onesprite_rom_y11 (.clock(!vga_clk), .address(rom_address_y11), .q(rom_q_y11));
onesprite_palette onesprite_palette_y11 (.index(rom_q_y11), .red(y11_red), .green(y11_green), .blue(y11_blue));

twosprite_rom twosprite_rom_y12 (.clock(!vga_clk), .address(rom_address_y12), .q(rom_q_y12));
twosprite_palette twosprite_palette_y12 (.index(rom_q_y12), .red(y12_red), .green(y12_green), .blue(y12_blue));

threesprite_rom threesprite_rom_y13 (.clock(!vga_clk), .address(rom_address_y13), .q(rom_q_y13));
threesprite_palette threesprite_palette_y13 (.index(rom_q_y13), .red(y13_red), .green(y13_green), .blue(y13_blue));

foursprite_rom foursprite_rom_y14 (.clock(!vga_clk), .address(rom_address_y14), .q(rom_q_y14));
foursprite_palette foursprite_palette_y14 (.index(rom_q_y14), .red(y14_red), .green(y14_green), .blue(y14_blue));

fivesprite_rom fivesprite_rom_y15 (.clock(!vga_clk), .address(rom_address_y15), .q(rom_q_y15));
fivesprite_palette fivesprite_palette_y15 (.index(rom_q_y15), .red(y15_red), .green(y15_green), .blue(y15_blue));

sixsprite_rom sixsprite_rom_y16 (.clock(!vga_clk), .address(rom_address_y16), .q(rom_q_y16));
sixsprite_palette sixsprite_palette_y16 (.index(rom_q_y16), .red(y16_red), .green(y16_green), .blue(y16_blue));

sevensprite_rom sevensprite_rom_y17 (.clock(!vga_clk), .address(rom_address_y17), .q(rom_q_y17));
sevensprite_palette sevensprite_palette_y17 (.index(rom_q_y17), .red(y17_red), .green(y17_green), .blue(y17_blue));

eightsprite_rom eightsprite_rom_y18 (.clock(!vga_clk), .address(rom_address_y18), .q(rom_q_y18));
eightsprite_palette eightsprite_palette_y18 (.index(rom_q_y18), .red(y18_red), .green(y18_green), .blue(y18_blue));

ninesprite_rom ninesprite_rom_y19 (.clock(!vga_clk), .address(rom_address_y19), .q(rom_q_y19));
ninesprite_palette ninesprite_palette_y19 (.index(rom_q_y19), .red(y19_red), .green(y19_green), .blue(y19_blue));

//_____________________________________________________________________________________________________________

zerosprite_rom zerosprite_rom_y20 (.clock(!vga_clk), .address(rom_address_y20), .q(rom_q_y20));
zerosprite_palette zerosprite_palette_y20 (.index(rom_q_y20), .red(y20_red), .green(y20_green), .blue(y20_blue));

onesprite_rom onesprite_rom_y21 (.clock(!vga_clk), .address(rom_address_y21), .q(rom_q_y21));
onesprite_palette onesprite_palette_y21 (.index(rom_q_y21), .red(y21_red), .green(y21_green), .blue(y21_blue));

twosprite_rom twosprite_rom_y22 (.clock(!vga_clk), .address(rom_address_y22), .q(rom_q_y22));
twosprite_palette twosprite_palette_y22 (.index(rom_q_y22), .red(y22_red), .green(y22_green), .blue(y22_blue));

threesprite_rom threesprite_rom_y23 (.clock(!vga_clk), .address(rom_address_y23), .q(rom_q_y23));
threesprite_palette threesprite_palette_y23 (.index(rom_q_y23), .red(y23_red), .green(y23_green), .blue(y23_blue));

foursprite_rom foursprite_rom_y24 (.clock(!vga_clk), .address(rom_address_y24), .q(rom_q_y24));
foursprite_palette foursprite_palette_y24 (.index(rom_q_y24), .red(y24_red), .green(y24_green), .blue(y24_blue));

fivesprite_rom fivesprite_rom_y25 (.clock(!vga_clk), .address(rom_address_y25), .q(rom_q_y25));
fivesprite_palette fivesprite_palette_y25 (.index(rom_q_y25), .red(y25_red), .green(y25_green), .blue(y25_blue));

sixsprite_rom sixsprite_rom_y26 (.clock(!vga_clk), .address(rom_address_y26), .q(rom_q_y26));
sixsprite_palette sixsprite_palette_y26 (.index(rom_q_y26), .red(y26_red), .green(y26_green), .blue(y26_blue));

sevensprite_rom sevensprite_rom_y27 (.clock(!vga_clk), .address(rom_address_y27), .q(rom_q_y27));
sevensprite_palette sevensprite_palette_y27 (.index(rom_q_y27), .red(y27_red), .green(y27_green), .blue(y27_blue));

eightsprite_rom eightsprite_rom_y28 (.clock(!vga_clk), .address(rom_address_y28), .q(rom_q_y28));
eightsprite_palette eightsprite_palette_y28 (.index(rom_q_y28), .red(y28_red), .green(y28_green), .blue(y28_blue));

ninesprite_rom ninesprite_rom_y29 (.clock(!vga_clk), .address(rom_address_y29), .q(rom_q_y29));
ninesprite_palette ninesprite_palette_y29 (.index(rom_q_y29), .red(y29_red), .green(y29_green), .blue(y29_blue));



//sonic_rom sonic_rom (
//	.clock   (vga_clk),
//	.address (rom_address_bull),
//	.q       (rom_q_bull)
//);
//
//sonic_palette sonic_palette (
//	.index (rom_q_bull),
//	.red   (bull_red),
//	.green (bull_green),
//	.blue  (bull_blue)
//);



endmodule
