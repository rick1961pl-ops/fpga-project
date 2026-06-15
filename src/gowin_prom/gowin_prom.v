//Copyright (C)2014-2025 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: IP file
//Tool Version: V1.9.11.03 Education
//Part Number: GW1NR-LV9QN88PC6/I5
//Device: GW1NR-9
//Device Version: C
//Created Time: Sun Jun 14 14:37:50 2026

module Gowin_pROM (dout, clk, oce, ce, reset, ad);

output [2:0] dout;
input clk;
input oce;
input ce;
input reset;
input [16:0] ad;

wire lut_f_0;
wire lut_f_1;
wire lut_f_2;
wire lut_f_3;
wire lut_f_4;
wire lut_f_5;
wire lut_f_6;
wire lut_f_7;
wire [30:0] prom_inst_0_dout_w;
wire [0:0] prom_inst_0_dout;
wire [30:0] prom_inst_1_dout_w;
wire [0:0] prom_inst_1_dout;
wire [30:0] prom_inst_2_dout_w;
wire [0:0] prom_inst_2_dout;
wire [30:0] prom_inst_3_dout_w;
wire [0:0] prom_inst_3_dout;
wire [30:0] prom_inst_4_dout_w;
wire [0:0] prom_inst_4_dout;
wire [30:0] prom_inst_5_dout_w;
wire [0:0] prom_inst_5_dout;
wire [30:0] prom_inst_6_dout_w;
wire [0:0] prom_inst_6_dout;
wire [30:0] prom_inst_7_dout_w;
wire [0:0] prom_inst_7_dout;
wire [30:0] prom_inst_8_dout_w;
wire [1:1] prom_inst_8_dout;
wire [30:0] prom_inst_9_dout_w;
wire [1:1] prom_inst_9_dout;
wire [30:0] prom_inst_10_dout_w;
wire [1:1] prom_inst_10_dout;
wire [30:0] prom_inst_11_dout_w;
wire [1:1] prom_inst_11_dout;
wire [30:0] prom_inst_12_dout_w;
wire [1:1] prom_inst_12_dout;
wire [30:0] prom_inst_13_dout_w;
wire [1:1] prom_inst_13_dout;
wire [30:0] prom_inst_14_dout_w;
wire [1:1] prom_inst_14_dout;
wire [30:0] prom_inst_15_dout_w;
wire [1:1] prom_inst_15_dout;
wire [30:0] prom_inst_16_dout_w;
wire [2:2] prom_inst_16_dout;
wire [30:0] prom_inst_17_dout_w;
wire [2:2] prom_inst_17_dout;
wire [30:0] prom_inst_18_dout_w;
wire [2:2] prom_inst_18_dout;
wire [30:0] prom_inst_19_dout_w;
wire [2:2] prom_inst_19_dout;
wire [30:0] prom_inst_20_dout_w;
wire [2:2] prom_inst_20_dout;
wire [30:0] prom_inst_21_dout_w;
wire [2:2] prom_inst_21_dout;
wire [30:0] prom_inst_22_dout_w;
wire [2:2] prom_inst_22_dout;
wire [30:0] prom_inst_23_dout_w;
wire [2:2] prom_inst_23_dout;
wire dff_q_0;
wire dff_q_1;
wire dff_q_2;
wire dff_q_3;
wire dff_q_4;
wire dff_q_5;
wire mux_o_0;
wire mux_o_1;
wire mux_o_2;
wire mux_o_3;
wire mux_o_4;
wire mux_o_5;
wire mux_o_7;
wire mux_o_8;
wire mux_o_9;
wire mux_o_10;
wire mux_o_11;
wire mux_o_12;
wire mux_o_14;
wire mux_o_15;
wire mux_o_16;
wire mux_o_17;
wire mux_o_18;
wire mux_o_19;

LUT4 lut_inst_0 (
  .F(lut_f_0),
  .I0(ce),
  .I1(ad[14]),
  .I2(ad[15]),
  .I3(ad[16])
);
defparam lut_inst_0.INIT = 16'h0002;
LUT4 lut_inst_1 (
  .F(lut_f_1),
  .I0(ce),
  .I1(ad[14]),
  .I2(ad[15]),
  .I3(ad[16])
);
defparam lut_inst_1.INIT = 16'h0008;
LUT4 lut_inst_2 (
  .F(lut_f_2),
  .I0(ce),
  .I1(ad[14]),
  .I2(ad[15]),
  .I3(ad[16])
);
defparam lut_inst_2.INIT = 16'h0020;
LUT4 lut_inst_3 (
  .F(lut_f_3),
  .I0(ce),
  .I1(ad[14]),
  .I2(ad[15]),
  .I3(ad[16])
);
defparam lut_inst_3.INIT = 16'h0080;
LUT4 lut_inst_4 (
  .F(lut_f_4),
  .I0(ce),
  .I1(ad[14]),
  .I2(ad[15]),
  .I3(ad[16])
);
defparam lut_inst_4.INIT = 16'h0200;
LUT4 lut_inst_5 (
  .F(lut_f_5),
  .I0(ce),
  .I1(ad[14]),
  .I2(ad[15]),
  .I3(ad[16])
);
defparam lut_inst_5.INIT = 16'h0800;
LUT4 lut_inst_6 (
  .F(lut_f_6),
  .I0(ce),
  .I1(ad[14]),
  .I2(ad[15]),
  .I3(ad[16])
);
defparam lut_inst_6.INIT = 16'h2000;
LUT4 lut_inst_7 (
  .F(lut_f_7),
  .I0(ce),
  .I1(ad[14]),
  .I2(ad[15]),
  .I3(ad[16])
);
defparam lut_inst_7.INIT = 16'h8000;
pROM prom_inst_0 (
    .DO({prom_inst_0_dout_w[30:0],prom_inst_0_dout[0]}),
    .CLK(clk),
    .OCE(oce),
    .CE(lut_f_0),
    .RESET(reset),
    .AD(ad[13:0])
);

defparam prom_inst_0.READ_MODE = 1'b1;
defparam prom_inst_0.BIT_WIDTH = 1;
defparam prom_inst_0.RESET_MODE = "SYNC";

pROM prom_inst_1 (
    .DO({prom_inst_1_dout_w[30:0],prom_inst_1_dout[0]}),
    .CLK(clk),
    .OCE(oce),
    .CE(lut_f_1),
    .RESET(reset),
    .AD(ad[13:0])
);

defparam prom_inst_1.READ_MODE = 1'b1;
defparam prom_inst_1.BIT_WIDTH = 1;
defparam prom_inst_1.RESET_MODE = "SYNC";

pROM prom_inst_2 (
    .DO({prom_inst_2_dout_w[30:0],prom_inst_2_dout[0]}),
    .CLK(clk),
    .OCE(oce),
    .CE(lut_f_2),
    .RESET(reset),
    .AD(ad[13:0])
);

defparam prom_inst_2.READ_MODE = 1'b1;
defparam prom_inst_2.BIT_WIDTH = 1;
defparam prom_inst_2.RESET_MODE = "SYNC";

pROM prom_inst_3 (
    .DO({prom_inst_3_dout_w[30:0],prom_inst_3_dout[0]}),
    .CLK(clk),
    .OCE(oce),
    .CE(lut_f_3),
    .RESET(reset),
    .AD(ad[13:0])
);

defparam prom_inst_3.READ_MODE = 1'b1;
defparam prom_inst_3.BIT_WIDTH = 1;
defparam prom_inst_3.RESET_MODE = "SYNC";

pROM prom_inst_4 (
    .DO({prom_inst_4_dout_w[30:0],prom_inst_4_dout[0]}),
    .CLK(clk),
    .OCE(oce),
    .CE(lut_f_4),
    .RESET(reset),
    .AD(ad[13:0])
);

defparam prom_inst_4.READ_MODE = 1'b1;
defparam prom_inst_4.BIT_WIDTH = 1;
defparam prom_inst_4.RESET_MODE = "SYNC";

pROM prom_inst_5 (
    .DO({prom_inst_5_dout_w[30:0],prom_inst_5_dout[0]}),
    .CLK(clk),
    .OCE(oce),
    .CE(lut_f_5),
    .RESET(reset),
    .AD(ad[13:0])
);

defparam prom_inst_5.READ_MODE = 1'b1;
defparam prom_inst_5.BIT_WIDTH = 1;
defparam prom_inst_5.RESET_MODE = "SYNC";

pROM prom_inst_6 (
    .DO({prom_inst_6_dout_w[30:0],prom_inst_6_dout[0]}),
    .CLK(clk),
    .OCE(oce),
    .CE(lut_f_6),
    .RESET(reset),
    .AD(ad[13:0])
);

defparam prom_inst_6.READ_MODE = 1'b1;
defparam prom_inst_6.BIT_WIDTH = 1;
defparam prom_inst_6.RESET_MODE = "SYNC";

pROM prom_inst_7 (
    .DO({prom_inst_7_dout_w[30:0],prom_inst_7_dout[0]}),
    .CLK(clk),
    .OCE(oce),
    .CE(lut_f_7),
    .RESET(reset),
    .AD(ad[13:0])
);

defparam prom_inst_7.READ_MODE = 1'b1;
defparam prom_inst_7.BIT_WIDTH = 1;
defparam prom_inst_7.RESET_MODE = "SYNC";

pROM prom_inst_8 (
    .DO({prom_inst_8_dout_w[30:0],prom_inst_8_dout[1]}),
    .CLK(clk),
    .OCE(oce),
    .CE(lut_f_0),
    .RESET(reset),
    .AD(ad[13:0])
);

defparam prom_inst_8.READ_MODE = 1'b1;
defparam prom_inst_8.BIT_WIDTH = 1;
defparam prom_inst_8.RESET_MODE = "SYNC";

pROM prom_inst_9 (
    .DO({prom_inst_9_dout_w[30:0],prom_inst_9_dout[1]}),
    .CLK(clk),
    .OCE(oce),
    .CE(lut_f_1),
    .RESET(reset),
    .AD(ad[13:0])
);

defparam prom_inst_9.READ_MODE = 1'b1;
defparam prom_inst_9.BIT_WIDTH = 1;
defparam prom_inst_9.RESET_MODE = "SYNC";

pROM prom_inst_10 (
    .DO({prom_inst_10_dout_w[30:0],prom_inst_10_dout[1]}),
    .CLK(clk),
    .OCE(oce),
    .CE(lut_f_2),
    .RESET(reset),
    .AD(ad[13:0])
);

defparam prom_inst_10.READ_MODE = 1'b1;
defparam prom_inst_10.BIT_WIDTH = 1;
defparam prom_inst_10.RESET_MODE = "SYNC";

pROM prom_inst_11 (
    .DO({prom_inst_11_dout_w[30:0],prom_inst_11_dout[1]}),
    .CLK(clk),
    .OCE(oce),
    .CE(lut_f_3),
    .RESET(reset),
    .AD(ad[13:0])
);

defparam prom_inst_11.READ_MODE = 1'b1;
defparam prom_inst_11.BIT_WIDTH = 1;
defparam prom_inst_11.RESET_MODE = "SYNC";

pROM prom_inst_12 (
    .DO({prom_inst_12_dout_w[30:0],prom_inst_12_dout[1]}),
    .CLK(clk),
    .OCE(oce),
    .CE(lut_f_4),
    .RESET(reset),
    .AD(ad[13:0])
);

defparam prom_inst_12.READ_MODE = 1'b1;
defparam prom_inst_12.BIT_WIDTH = 1;
defparam prom_inst_12.RESET_MODE = "SYNC";

pROM prom_inst_13 (
    .DO({prom_inst_13_dout_w[30:0],prom_inst_13_dout[1]}),
    .CLK(clk),
    .OCE(oce),
    .CE(lut_f_5),
    .RESET(reset),
    .AD(ad[13:0])
);

defparam prom_inst_13.READ_MODE = 1'b1;
defparam prom_inst_13.BIT_WIDTH = 1;
defparam prom_inst_13.RESET_MODE = "SYNC";

pROM prom_inst_14 (
    .DO({prom_inst_14_dout_w[30:0],prom_inst_14_dout[1]}),
    .CLK(clk),
    .OCE(oce),
    .CE(lut_f_6),
    .RESET(reset),
    .AD(ad[13:0])
);

defparam prom_inst_14.READ_MODE = 1'b1;
defparam prom_inst_14.BIT_WIDTH = 1;
defparam prom_inst_14.RESET_MODE = "SYNC";

pROM prom_inst_15 (
    .DO({prom_inst_15_dout_w[30:0],prom_inst_15_dout[1]}),
    .CLK(clk),
    .OCE(oce),
    .CE(lut_f_7),
    .RESET(reset),
    .AD(ad[13:0])
);

defparam prom_inst_15.READ_MODE = 1'b1;
defparam prom_inst_15.BIT_WIDTH = 1;
defparam prom_inst_15.RESET_MODE = "SYNC";

pROM prom_inst_16 (
    .DO({prom_inst_16_dout_w[30:0],prom_inst_16_dout[2]}),
    .CLK(clk),
    .OCE(oce),
    .CE(lut_f_0),
    .RESET(reset),
    .AD(ad[13:0])
);

defparam prom_inst_16.READ_MODE = 1'b1;
defparam prom_inst_16.BIT_WIDTH = 1;
defparam prom_inst_16.RESET_MODE = "SYNC";

pROM prom_inst_17 (
    .DO({prom_inst_17_dout_w[30:0],prom_inst_17_dout[2]}),
    .CLK(clk),
    .OCE(oce),
    .CE(lut_f_1),
    .RESET(reset),
    .AD(ad[13:0])
);

defparam prom_inst_17.READ_MODE = 1'b1;
defparam prom_inst_17.BIT_WIDTH = 1;
defparam prom_inst_17.RESET_MODE = "SYNC";

pROM prom_inst_18 (
    .DO({prom_inst_18_dout_w[30:0],prom_inst_18_dout[2]}),
    .CLK(clk),
    .OCE(oce),
    .CE(lut_f_2),
    .RESET(reset),
    .AD(ad[13:0])
);

defparam prom_inst_18.READ_MODE = 1'b1;
defparam prom_inst_18.BIT_WIDTH = 1;
defparam prom_inst_18.RESET_MODE = "SYNC";

pROM prom_inst_19 (
    .DO({prom_inst_19_dout_w[30:0],prom_inst_19_dout[2]}),
    .CLK(clk),
    .OCE(oce),
    .CE(lut_f_3),
    .RESET(reset),
    .AD(ad[13:0])
);

defparam prom_inst_19.READ_MODE = 1'b1;
defparam prom_inst_19.BIT_WIDTH = 1;
defparam prom_inst_19.RESET_MODE = "SYNC";

pROM prom_inst_20 (
    .DO({prom_inst_20_dout_w[30:0],prom_inst_20_dout[2]}),
    .CLK(clk),
    .OCE(oce),
    .CE(lut_f_4),
    .RESET(reset),
    .AD(ad[13:0])
);

defparam prom_inst_20.READ_MODE = 1'b1;
defparam prom_inst_20.BIT_WIDTH = 1;
defparam prom_inst_20.RESET_MODE = "SYNC";

pROM prom_inst_21 (
    .DO({prom_inst_21_dout_w[30:0],prom_inst_21_dout[2]}),
    .CLK(clk),
    .OCE(oce),
    .CE(lut_f_5),
    .RESET(reset),
    .AD(ad[13:0])
);

defparam prom_inst_21.READ_MODE = 1'b1;
defparam prom_inst_21.BIT_WIDTH = 1;
defparam prom_inst_21.RESET_MODE = "SYNC";

pROM prom_inst_22 (
    .DO({prom_inst_22_dout_w[30:0],prom_inst_22_dout[2]}),
    .CLK(clk),
    .OCE(oce),
    .CE(lut_f_6),
    .RESET(reset),
    .AD(ad[13:0])
);

defparam prom_inst_22.READ_MODE = 1'b1;
defparam prom_inst_22.BIT_WIDTH = 1;
defparam prom_inst_22.RESET_MODE = "SYNC";

pROM prom_inst_23 (
    .DO({prom_inst_23_dout_w[30:0],prom_inst_23_dout[2]}),
    .CLK(clk),
    .OCE(oce),
    .CE(lut_f_7),
    .RESET(reset),
    .AD(ad[13:0])
);

defparam prom_inst_23.READ_MODE = 1'b1;
defparam prom_inst_23.BIT_WIDTH = 1;
defparam prom_inst_23.RESET_MODE = "SYNC";

DFFE dff_inst_0 (
  .Q(dff_q_0),
  .D(ad[16]),
  .CLK(clk),
  .CE(ce)
);
DFFE dff_inst_1 (
  .Q(dff_q_1),
  .D(dff_q_0),
  .CLK(clk),
  .CE(oce)
);
DFFE dff_inst_2 (
  .Q(dff_q_2),
  .D(ad[15]),
  .CLK(clk),
  .CE(ce)
);
DFFE dff_inst_3 (
  .Q(dff_q_3),
  .D(dff_q_2),
  .CLK(clk),
  .CE(oce)
);
DFFE dff_inst_4 (
  .Q(dff_q_4),
  .D(ad[14]),
  .CLK(clk),
  .CE(ce)
);
DFFE dff_inst_5 (
  .Q(dff_q_5),
  .D(dff_q_4),
  .CLK(clk),
  .CE(oce)
);
MUX2 mux_inst_0 (
  .O(mux_o_0),
  .I0(prom_inst_0_dout[0]),
  .I1(prom_inst_1_dout[0]),
  .S0(dff_q_5)
);
MUX2 mux_inst_1 (
  .O(mux_o_1),
  .I0(prom_inst_2_dout[0]),
  .I1(prom_inst_3_dout[0]),
  .S0(dff_q_5)
);
MUX2 mux_inst_2 (
  .O(mux_o_2),
  .I0(prom_inst_4_dout[0]),
  .I1(prom_inst_5_dout[0]),
  .S0(dff_q_5)
);
MUX2 mux_inst_3 (
  .O(mux_o_3),
  .I0(prom_inst_6_dout[0]),
  .I1(prom_inst_7_dout[0]),
  .S0(dff_q_5)
);
MUX2 mux_inst_4 (
  .O(mux_o_4),
  .I0(mux_o_0),
  .I1(mux_o_1),
  .S0(dff_q_3)
);
MUX2 mux_inst_5 (
  .O(mux_o_5),
  .I0(mux_o_2),
  .I1(mux_o_3),
  .S0(dff_q_3)
);
MUX2 mux_inst_6 (
  .O(dout[0]),
  .I0(mux_o_4),
  .I1(mux_o_5),
  .S0(dff_q_1)
);
MUX2 mux_inst_7 (
  .O(mux_o_7),
  .I0(prom_inst_8_dout[1]),
  .I1(prom_inst_9_dout[1]),
  .S0(dff_q_5)
);
MUX2 mux_inst_8 (
  .O(mux_o_8),
  .I0(prom_inst_10_dout[1]),
  .I1(prom_inst_11_dout[1]),
  .S0(dff_q_5)
);
MUX2 mux_inst_9 (
  .O(mux_o_9),
  .I0(prom_inst_12_dout[1]),
  .I1(prom_inst_13_dout[1]),
  .S0(dff_q_5)
);
MUX2 mux_inst_10 (
  .O(mux_o_10),
  .I0(prom_inst_14_dout[1]),
  .I1(prom_inst_15_dout[1]),
  .S0(dff_q_5)
);
MUX2 mux_inst_11 (
  .O(mux_o_11),
  .I0(mux_o_7),
  .I1(mux_o_8),
  .S0(dff_q_3)
);
MUX2 mux_inst_12 (
  .O(mux_o_12),
  .I0(mux_o_9),
  .I1(mux_o_10),
  .S0(dff_q_3)
);
MUX2 mux_inst_13 (
  .O(dout[1]),
  .I0(mux_o_11),
  .I1(mux_o_12),
  .S0(dff_q_1)
);
MUX2 mux_inst_14 (
  .O(mux_o_14),
  .I0(prom_inst_16_dout[2]),
  .I1(prom_inst_17_dout[2]),
  .S0(dff_q_5)
);
MUX2 mux_inst_15 (
  .O(mux_o_15),
  .I0(prom_inst_18_dout[2]),
  .I1(prom_inst_19_dout[2]),
  .S0(dff_q_5)
);
MUX2 mux_inst_16 (
  .O(mux_o_16),
  .I0(prom_inst_20_dout[2]),
  .I1(prom_inst_21_dout[2]),
  .S0(dff_q_5)
);
MUX2 mux_inst_17 (
  .O(mux_o_17),
  .I0(prom_inst_22_dout[2]),
  .I1(prom_inst_23_dout[2]),
  .S0(dff_q_5)
);
MUX2 mux_inst_18 (
  .O(mux_o_18),
  .I0(mux_o_14),
  .I1(mux_o_15),
  .S0(dff_q_3)
);
MUX2 mux_inst_19 (
  .O(mux_o_19),
  .I0(mux_o_16),
  .I1(mux_o_17),
  .S0(dff_q_3)
);
MUX2 mux_inst_20 (
  .O(dout[2]),
  .I0(mux_o_18),
  .I1(mux_o_19),
  .S0(dff_q_1)
);
endmodule //Gowin_pROM
