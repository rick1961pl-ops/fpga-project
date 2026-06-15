
// 8 kolorowych pasow
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

    wire [2:0] color_index;
    assign color_index =
        (x < 80)  ? 0 :
        (x < 160) ? 1 :
        (x < 240) ? 2 :
        (x < 320) ? 3 :
        (x < 400) ? 4 :
        (x < 480) ? 5 :
        (x < 560) ? 6 :
                7;

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
