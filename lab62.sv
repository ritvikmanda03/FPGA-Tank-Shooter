//-------------------------------------------------------------------------
//                                                                       --
//                                                                       --
//      For use with ECE 385 Lab 62                                       --
//      UIUC ECE Department                                              --
//-------------------------------------------------------------------------


module lab62 (

      ///////// Clocks /////////
      input     MAX10_CLK1_50, 

      ///////// KEY /////////
      input    [ 1: 0]   KEY,

      ///////// SW /////////
      input    [ 9: 0]   SW,

      ///////// LEDR /////////
      output   [ 9: 0]   LEDR,

      ///////// HEX /////////
      output   [ 7: 0]   HEX0,
      output   [ 7: 0]   HEX1,
      output   [ 7: 0]   HEX2,
      output   [ 7: 0]   HEX3,
      output   [ 7: 0]   HEX4,
      output   [ 7: 0]   HEX5,

      ///////// SDRAM /////////
      output             DRAM_CLK,
      output             DRAM_CKE,
      output   [12: 0]   DRAM_ADDR,
      output   [ 1: 0]   DRAM_BA,
      inout    [15: 0]   DRAM_DQ,
      output             DRAM_LDQM,
      output             DRAM_UDQM,
      output             DRAM_CS_N,
      output             DRAM_WE_N,
      output             DRAM_CAS_N,
      output             DRAM_RAS_N,

      ///////// VGA /////////
      output             VGA_HS,
      output             VGA_VS,
      output   [ 3: 0]   VGA_R,
      output   [ 3: 0]   VGA_G,
      output   [ 3: 0]   VGA_B,


      ///////// ARDUINO /////////
      inout    [15: 0]   ARDUINO_IO,
      inout              ARDUINO_RESET_N 

);




logic Reset_h, vssig, blank, sync, VGA_Clk;
logic NOT_VGA_Clk;
assign NOT_VGA_Clk = !VGA_Clk;


//=======================================================
//  REG/WIRE declarations
//=======================================================
	logic SPI0_CS_N, SPI0_SCLK, SPI0_MISO, SPI0_MOSI, USB_GPX, USB_IRQ, USB_RST;
	logic [3:0] hex_num_4, hex_num_3, hex_num_1, hex_num_0, tank1explodeframe, tank2explodeframe; //4 bit input hex digits
	logic [1:0] signs;
	logic [1:0] hundreds;
	logic [9:0] drawxsig, drawysig, ballxsig, ballsizesig, ballxmotionsig, tank2xsig, tank2ysig, tank2sizesig, bullsizesig, bull2xsig, bull2ysig, tank1xmotion, tank2xmotion, timerflag, tank1ymotion, tank2ymotion;
	logic [9:0] ballysig;
	logic [63:0] bull1xsig, bull1ysig, timesig;
	logic [7:0] Red, Blue, Green;
	logic [7:0] keycode, keycode2;
	logic left_axis, right_axis, down_axis, up_axis, left_axis1, right_axis1, down_axis1, up_axis1, drawbull1, drawbull2, bull1collide, bull2collide, timerstart;
	logic left_axis2, right_axis2, down_axis2, up_axis2, check, startfinaltimer, endgame, xbound;
	logic [9:0] DistX_floor, DistY_floor, x1textsig, x2textsig, y1textsig, y2textsig;
	logic [9:0] firstYnew, fuel1, fuel2, textx1, textx2, texty1, texty2, startcount1, startcount2;
	logic [1:0] floor, floorL, floortank, floorLtank, downramp, downramp2, upramp, upramp2, drawcrit1, drawcrit2, drawdest1, drawdest2, godown, godown2;
	
	//FSM LOGIC
	
	logic bull_shoot_flag1, bull_shoot_flag2, bull_stop_flag1, bull_stop_flag2, game_start;
	logic [3:0] health_1, health_2;
	logic player1flag, player2flag, player1win, player2win, startscreen;
	
//=======================================================
//  Structural coding
//=======================================================
	assign ARDUINO_IO[10] = SPI0_CS_N;
	assign ARDUINO_IO[13] = SPI0_SCLK;
	assign ARDUINO_IO[11] = SPI0_MOSI;
	assign ARDUINO_IO[12] = 1'bZ;
	assign SPI0_MISO = ARDUINO_IO[12];
	
	assign ARDUINO_IO[9] = 1'bZ; 
	assign USB_IRQ = ARDUINO_IO[9];
		
	//Assignments specific to Circuits At Home UHS_20
	assign ARDUINO_RESET_N = USB_RST;
	assign ARDUINO_IO[7] = USB_RST;//USB reset 
	assign ARDUINO_IO[8] = 1'bZ; //this is GPX (set to input)
	assign USB_GPX = 1'b0;//GPX is not needed for standard USB host - set to 0 to prevent interrupt
	
	//Assign uSD CS to '1' to prevent uSD card from interfering with USB Host (if uSD card is plugged in)
	assign ARDUINO_IO[6] = 1'b1;
	
	//HEX drivers to convert numbers to HEX output
	HexDriver hex_driver4 (hex_num_4, HEX4[6:0]);
	assign HEX4[7] = 1'b1;
	
	HexDriver hex_driver3 (hex_num_3, HEX3[6:0]);
	assign HEX3[7] = 1'b1;
	
	HexDriver hex_driver1 (hex_num_1, HEX1[6:0]);
	assign HEX1[7] = 1'b1;
	
	HexDriver hex_driver0 (hex_num_0, HEX0[6:0]);
	assign HEX0[7] = 1'b1;
	
	//fill in the hundreds digit as well as the negative sign
	assign HEX5 = {1'b1, ~signs[1], 3'b111, ~hundreds[1], ~hundreds[1], 1'b1};
	assign HEX2 = {1'b1, ~signs[0], 3'b111, ~hundreds[0], ~hundreds[0], 1'b1};
	
	
	//Assign one button to reset
	assign {Reset_h}=~ (KEY[0]);

	//Our A/D converter is only 12 bit
	assign VGA_R = Red[3:0];
	assign VGA_B = Blue[3:0];
	assign VGA_G = Green[3:0];
	
	
	lab62_soc u0 (
		.clk_clk                           (MAX10_CLK1_50),  //clk.clk
		.reset_reset_n                     (1'b1),           //reset.reset_n
		.altpll_0_locked_conduit_export    (),               //altpll_0_locked_conduit.export
		.altpll_0_phasedone_conduit_export (),               //altpll_0_phasedone_conduit.export
		.altpll_0_areset_conduit_export    (),               //altpll_0_areset_conduit.export
		.key_external_connection_export    (KEY),            //key_external_connection.export

		//SDRAM
		.sdram_clk_clk(DRAM_CLK),                            //clk_sdram.clk
		.sdram_wire_addr(DRAM_ADDR),                         //sdram_wire.addr
		.sdram_wire_ba(DRAM_BA),                             //.ba
		.sdram_wire_cas_n(DRAM_CAS_N),                       //.cas_n
		.sdram_wire_cke(DRAM_CKE),                           //.cke
		.sdram_wire_cs_n(DRAM_CS_N),                         //.cs_n
		.sdram_wire_dq(DRAM_DQ),                             //.dq
		.sdram_wire_dqm({DRAM_UDQM,DRAM_LDQM}),              //.dqm
		.sdram_wire_ras_n(DRAM_RAS_N),                       //.ras_n
		.sdram_wire_we_n(DRAM_WE_N),                         //.we_n

		//USB SPI	
		.spi0_SS_n(SPI0_CS_N),
		.spi0_MOSI(SPI0_MOSI),
		.spi0_MISO(SPI0_MISO),
		.spi0_SCLK(SPI0_SCLK),
		
		//USB GPIO
		.usb_rst_export(USB_RST),
		.usb_irq_export(USB_IRQ),
		.usb_gpx_export(USB_GPX),
		
		//LEDs and HEX
		.hex_digits_export({hex_num_4, hex_num_3, hex_num_1, hex_num_0}),
		.leds_export({hundreds, signs, LEDR}),
		.keycode_export(keycode),
		.keycode2_export(keycode2)
		
	 );


//instantiate a vga_controller, ball, and color_mapper here with the ports.

collision forball(.Reset(Reset_h), .frame_clk(VGA_VS), .firstX(ballxsig), .firstY(ballysig), .firstS(ballsizesig),
.secondX(tank2xsig), .secondY(tank2ysig), .secondS(tank2sizesig), .up_axis(up_axis), .down_axis(down_axis), .left_axis(left_axis), .right_axis(right_axis));

collisionf forballf(.Reset(Reset_h), .firstYnew(firstYnew), .godown(godown), .downramp(downramp), .upramp(upramp), .frame_clk(VGA_VS), .firstX(ballxsig), .firstY(ballysig), .firstS(ballsizesig), .floor(floor), .floorL(floorL));
collisionf fortank2f(.Reset(Reset_h), .frame_clk(VGA_VS), .godown(godown2), .downramp(upramp2), .upramp(downramp2), .firstX(tank2xsig), .firstY(tank2ysig), .firstS(tank2sizesig), .floor(floortank), .floorL(floorLtank));


collision fortank(.Reset(Reset_h), .frame_clk(VGA_VS), .firstX(tank2xsig), .firstY(tank2ysig), .firstS(tank2sizesig),
.secondX(ballxsig), .secondY(ballysig), .secondS(ballsizesig), .up_axis(up_axis1), .down_axis(down_axis1), .left_axis(left_axis1), .right_axis(right_axis1));

collision_bull forbull1(.Reset(Reset_h), .frame_clk(VGA_VS), .firstX(bull1xsig+7), .firstY(bull1ysig+7), .firstS(bull1sizesig),
.secondX(tank2xsig), .secondY(tank2ysig), .secondS(tank2sizesig), .bull_collide_flag(bull1collide), .health(health_2), .drawbullflag(drawbull1));

collision_bull forbull2(.Reset(Reset_h), .frame_clk(VGA_VS), .firstX(bull2xsig), .firstY(bull2ysig), .firstS(bull2sizesig),
.secondX(ballxsig), .secondY(ballysig), .secondS(ballsizesig), .bull_collide_flag(bull2collide), .health(health_1), .drawbullflag(drawbull2));


// FSM
game_fsm fsm(.frame_clk(VGA_VS), .Reset(Reset_h), .bull_shoot_flag1(drawbull1), .bull_shoot_flag2(drawbull2), .bull_stop_flag1(bull_stop_flag1), .bull_stop_flag2(bull_stop_flag2), .game_start(game_start), .health_1(health_1), .health_2(health_2),
				.player1flag(player1flag), .player2flag(player2flag), .player1win(player1win), .player2win(player2win), .startscreen(startscreen), .startcount1(startcount1), .startcount2(startcount2), .startfinaltimer(startfinaltimer), .endgame(endgame)
					 );

ball ball_(.Reset(Reset_h), .godown(godown), .Tank1_Y_Motion(tank1ymotion), .firstYnew(firstYnew), .floor(floor), .fuel(fuel1), .floorL(floorL), .player1flag(player1flag), .player2flag(player2flag), .frame_clk(VGA_VS), .keycode(keycode), .BallX(ballxsig), .BallY(ballysig), .BallS(ballsizesig), .up_axis(up_axis), .down_axis(down_axis), .left_axis(left_axis), .right_axis(right_axis), .Tank1_X_Motion(tank1xmotion), .bull_collide_flag(bull2collide));

bull bull_(.Reset(Reset_h), .xbound(xbound),  .frame_clk(VGA_VS), .player1flag(player1flag), .player2flag(player2flag), .keycode(keycode), .Bull1X(bull1xsig), .Bull1Y(bull1ysig), .BullS(bullsizesig), .Draw_Bull1(drawbull1), .Draw_Bull2(drawbull2), .Bull2X(bull2xsig), .Bull2Y(bull2ysig), .Tank1X(ballxsig), .Tank2X(tank2xsig), .Tank1_X_Motion(tank1xmotion), .Tank2_X_Motion(tank2xmotion), .bull1_collide_flag(bull1collide), .bull2_collide_flag(bull2collide), .timesig(timesig), .X1_text(x1textsig), .X2_text(x2textsig), .Y1_text(y1textsig), .Y2_text(y2textsig), .bull_stop_flag1(bull_stop_flag1), .bull_stop_flag2(bull_stop_flag2));

tank2 tank2(.Reset(Reset_h), .Tank2_Y_Motion(tank2ymotion), .floor(floortank), .fuel(fuel2), .floorL(floorLtank), .frame_clk(VGA_VS), .player2flag(player2flag), .player1flag(player1flag),  .keycode(keycode), .BallX(tank2xsig), .BallY(tank2ysig), .BallS(tank2sizesig), .up_axis(up_axis1), .down_axis(down_axis1), .left_axis(left_axis1), .right_axis(right_axis1), .Tank2_X_Motion(tank2xmotion), .bull_collide_flag(bull1collide));
//color_mapper color_mapper_(.BallX(ballxsig), .BallY(ballysig), .DrawX(drawxsig), .DrawY(drawysig), .Ball_size(ballsizesig), .Red(Red), .Green(Green), .Blue(Blue));
vga_controller vga_controller_(.Clk(MAX10_CLK1_50), .Reset(Reset_h), .hs(VGA_HS), .vs(VGA_VS), .pixel_clk(VGA_Clk), .blank(blank), .sync(sync), .DrawX(drawxsig), .DrawY(drawysig));
//butterfly_example ex(.DrawX(drawxsig), .DrawY(drawysig), .vga_clk(VGA_Clk), .blank(blank), .red(Red), .green(Green), .blue(Blue));
sprite_gen tank_test(.DrawX(drawxsig), .drawcrit1(drawcrit1), .drawcrit2(drawcrit2), .drawdest1(drawdest1), .drawdest2(drawdest2), .textx1(textx1), .textx2(textx2), .texty1(texty1), .texty2(texty2), .fuel1(fuel1), .fuel2(fuel2), .health1(health_1), .health2(health_2), .downramp(downramp), .downramp2(downramp2), .upramp(upramp), .upramp2(upramp2), .DrawY(drawysig), .vga_clk(VGA_Clk), .blank(blank), .red(Red), .green(Green), .blue(Blue), .BallX(ballxsig), .BallY(ballysig), .Ball_Size(ballsizesig), .xaxis(xaxis), .Ball_X_Motion(ballxmotionsig), .Tank2X(tank2xsig), .Tank2Y(tank2ysig), .Tank2_Size(tank2sizesig), .Bull2X(bull2xsig), .Bull2Y(bull2ysig), .Draw_Bull1(drawbull1), .Draw_Bull2(drawbull2), .Bull1X(bull1xsig), .Bull1Y(bull1ysig), .Bull_Size(bullsizesig), .bull_explode_flag(tank1explodeframe), .bull_explode_flag2(tank2explodeframe), .DistX_floor(DistX_floor), .DistY_floor(DistY_floor), .check(check), .x1text(x1textsig), .x2text(x2textsig), .y1text(y1textsig), .y2text(y2textsig), .player1win(player1win), .player2win(player2win), .startscreen(startscreen));

timer_explode timer_explode_1(.frame_clk(VGA_VS), .timer_start(timerstart), .timer_flag(timerflag));

explode_fsm explode_1(.frame_clk(VGA_VS), .Reset(Reset_h), .timer_flag(timerflag), .bull_collide_flag(bull2collide), .timer_start(timerstart), .tank1_explode_frame(tank1explodeframe));
explode_fsm explode_2(.frame_clk(VGA_VS), .Reset(Reset_h), .timer_flag(timerflag), .bull_collide_flag(bull1collide), .timer_start(timerstart), .tank1_explode_frame(tank2explodeframe));
	
time_module time_1(.Reset(Reset_h), .frame_clk(VGA_VS), .time_output(timesig), .drawbullflag(drawbull1), .drawbullflag2(drawbull2), .xbound(xbound));

titlescreen(.keycode(keycode), .frame_clk(VGA_VS), .Reset(Reset_h), .gamestart(game_start));	

hittext (.Reset(Reset_h), .frame_clk(VGA_VS), .health(health_1), .Tank_X_Motion(tank1xmotion), .Tank_Y_Motion(tank1ymotion), .Tank_X(ballxsig), .Tank_Y(ballysig), .bull_collide_flag(bull2collide), .drawcrittext(drawcrit1), .drawdesttext(drawdest1), .textx(textx1), .texty(texty1), .startcount(startcount1));

hittext (.Reset(Reset_h), .frame_clk(VGA_VS), .health(health_2), .Tank_X_Motion(tank2xmotion), .Tank_Y_Motion(tank2ymotion), .Tank_X(tank2xsig), .Tank_Y(tank2ysig), .bull_collide_flag(bull1collide), .drawcrittext(drawcrit2), .drawdesttext(drawdest2), .textx(textx2), .texty(texty2), .startcount(startcount2));
	
finaltimer finaltimer1( .Reset(Reset_h), .frame_clk(VGA_VS), .startfinaltimer(startfinaltimer),
					.endgame(endgame));	
					
endmodule 
