// kod działa z framebuffer który jest dynamicznie zmieniany
module top (
    input sys_clk,
    input rst_n,

    output hsync,
    output vsync,
    output [2:0] rgb
);

    wire clk_50;
    wire clk_25;

    // =========================================================
    // PLL
    // =========================================================
    Gowin_rPLL u_pll (
        .clkin(sys_clk),
        .clkout(clk_50),
        .clkoutd(clk_25)
    );

    // =========================================================
    // VGA TIMING
    // =========================================================
    wire [10:0] x;
    wire [10:0] y;
    wire video_on;

    vga_timing u_vga_timing (
        .clk(clk_25),
        .en(1'b1),
        .rst_n(rst_n),

        .hsync(hsync),
        .vsync(vsync),

        .x(x),
        .y(y),
        .video_on(video_on)
    );

    // =========================================================
    // WINDOW + LOCAL COORDS
    // =========================================================
    wire in_window =
        (x >= 11'd64) && (x < 11'd576) &&
        (y >= 11'd112) && (y < 11'd368);

    wire [10:0] lx = x - 11'd64;
    wire [10:0] ly = y - 11'd112;

    wire [16:0] fb_addr =
        (video_on && in_window)
        ? (lx + (ly << 9))
        : 17'd0;

    // =========================================================
    // PIPELINE (ONLY ADDRESS FIX - REQUIRED FOR BRAM)
    // =========================================================
    reg [16:0] fb_addr_d;

    always @(posedge clk_25) begin
        fb_addr_d <= fb_addr;
    end

    // =========================================================
    // FRAMEBUFFER
    // =========================================================
    wire [7:0] fb_rd_data;

    framebuffer fb (
        .clk(clk_50),

        .we(video_on && in_window),     // zapis testowy / generacja
        .wr_addr(fb_addr),
        .wr_data({
            lx[5],
            ly[5],
            lx[4] ^ ly[4],
            5'b0
        }),

        .rd_addr(fb_addr_d),
        .rd_data(fb_rd_data)
    );

    // =========================================================
    // OUTPUT
    // =========================================================
    
    assign rgb =
        (video_on && in_window)
        ? fb_rd_data[7:5]
        : 3'b000;

endmodule