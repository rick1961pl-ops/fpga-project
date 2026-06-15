/*
module top (
    input sys_clk,
    input rst_n,

    output hsync,
    output vsync,
    output [2:0] rgb
);

    // ================= CLOCK =================
    wire clk_25;
    wire clk_50;

    Gowin_rPLL pll (
        .clkin(sys_clk),
        .clkout(clk_50),
        .clkoutd(clk_25)
    );

    // ================= VGA =================
    wire [10:0] x;
    wire [10:0] y;
    wire video_on;

    vga_timing vga (
        .clk(clk_25),
        .en(1'b1),
        .rst_n(rst_n),

        .hsync(hsync),
        .vsync(vsync),

        .x(x),
        .y(y),
        .video_on(video_on)
    );

    // ================= FRAMEBUFFER =================
    wire [16:0] fb_wr_addr;
    wire [16:0] fb_rd_addr;
    wire [3:0]  fb_wr_data;
    wire [3:0]  fb_rd_data;
    wire        fb_we;

    framebuffer fb (
        .clk(clk_25),

        .we(fb_we),
        .wr_addr(fb_wr_addr),
        .wr_data(fb_wr_data),

        .rd_addr(fb_rd_addr),
        .rd_data(fb_rd_data)
    );

    // ================= RENDER ENGINE =================
    reg [8:0] rx;
    reg [7:0] ry;

    wire [16:0] wr_addr_calc;
    wire [16:0] rd_addr_calc;

    // WRITE ADDRESS
    assign wr_addr_calc = (ry * 9'd320) + rx;
    assign fb_wr_addr = wr_addr_calc;

    assign fb_wr_data = rx[3:0] ^ ry[3:0];
    assign fb_we = 1'b1;

    // VGA READ ADDRESS (FIX: no slicing on expression)
    assign rd_addr_calc = ((y >> 1) * 9'd320) + (x >> 1);
    assign fb_rd_addr = rd_addr_calc;

    // ================= COUNTER =================
    always @(posedge clk_25) begin
        if (!rst_n) begin
            rx <= 9'd0;
            ry <= 8'd0;
        end else begin
            if (rx == 9'd319) begin
                rx <= 9'd0;
                ry <= ry + 8'd1;
            end else begin
                rx <= rx + 9'd1;
            end
        end
    end

    // ================= OUTPUT =================
    assign rgb = video_on ? fb_rd_data[2:0] : 3'b000;


endmodule
*/
module top (
    input sys_clk,
    input rst_n,

    output hsync,
    output vsync,
    output [2:0] rgb
);

    // ================= CLOCK =================
    wire clk_25;
    wire clk_50;

    Gowin_rPLL pll (
        .clkin(sys_clk),
        .clkout(clk_50),
        .clkoutd(clk_25)
    );

    // ================= VGA TIMING =================
    wire [10:0] x;
    wire [10:0] y;
    wire video_on;

    vga_timing vga (
        .clk(clk_25),
        .en(1'b1),
        .rst_n(rst_n),

        .hsync(hsync),
        .vsync(vsync),

        .x(x),
        .y(y),
        .video_on(video_on)
    );

    // ================= 8 COLOR TEST PATTERN =================
    // 8 pionowych pasów
    //wire [2:0] color_index = x[8:6];
    wire [2:0] color_index = x / 80;

    reg [2:0] rgb_reg;

    always @(*) begin
        case (color_index)
            3'd0: rgb_reg = 3'b000; // black
            3'd1: rgb_reg = 3'b001; // blue
            3'd2: rgb_reg = 3'b010; // green
            3'd3: rgb_reg = 3'b011; // cyan
            3'd4: rgb_reg = 3'b100; // red
            3'd5: rgb_reg = 3'b101; // magenta
            3'd6: rgb_reg = 3'b110; // yellow
            3'd7: rgb_reg = 3'b111; // white
        endcase
    end

    // ================= OUTPUT =================
    assign rgb = video_on ? rgb_reg : 3'b000;

endmodule