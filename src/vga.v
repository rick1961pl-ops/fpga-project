module vga (
    input clk,
    input en,
    input rst_n,

    output reg hsync,
    output reg vsync,
    output reg [2:0] rgb,

    output reg [10:0] x,
    output reg [10:0] y,
    output video_on
);

    // =========================================================
    // TIMING 640x480
    // =========================================================
    localparam [10:0] H_VISIBLE = 11'd640;
    localparam [10:0] H_FRONT   = 11'd16;
    localparam [10:0] H_SYNC    = 11'd96;
    localparam [10:0] H_BACK    = 11'd48;
    localparam [10:0] H_TOTAL   = 11'd800;

    localparam [10:0] V_VISIBLE = 11'd480;
    localparam [10:0] V_FRONT   = 11'd10;
    localparam [10:0] V_SYNC    = 11'd2;
    localparam [10:0] V_BACK    = 11'd33;
    localparam [10:0] V_TOTAL   = 11'd525;

    // =========================================================
    // CENTER WINDOW 512x256
    // =========================================================
    localparam [10:0] WIN_W = 11'd512;
    localparam [10:0] WIN_H = 11'd256;

    localparam [10:0] X_OFF = 11'd64;
    localparam [10:0] Y_OFF = 11'd112;

    wire display = (x < H_VISIBLE) && (y < V_VISIBLE);
    assign video_on = display;

    wire in_window =
        (x >= X_OFF) && (x < X_OFF + WIN_W) &&
        (y >= Y_OFF) && (y < Y_OFF + WIN_H);

    wire [10:0] lx = x - X_OFF;

    // =========================================================
    // COUNTERS
    // =========================================================
    always @(posedge clk) begin
        if (!rst_n) begin
            x <= 11'd0;
            y <= 11'd0;
        end
        else if (en) begin
            if (x == H_TOTAL - 1) begin
                x <= 11'd0;

                if (y == V_TOTAL - 1)
                    y <= 11'd0;
                else
                    y <= y + 11'd1;
            end
            else
                x <= x + 11'd1;
        end
    end

    // =========================================================
    // SYNC
    // =========================================================
    wire [10:0] hsync_start = H_VISIBLE + H_FRONT;
    wire [10:0] hsync_end   = H_VISIBLE + H_FRONT + H_SYNC;

    wire [10:0] vsync_start = V_VISIBLE + V_FRONT;
    wire [10:0] vsync_end   = V_VISIBLE + V_FRONT + V_SYNC;

    always @(posedge clk) begin
        if (!rst_n) begin
            hsync <= 1'b1;
            vsync <= 1'b1;
        end
        else if (en) begin
            hsync <= ~(x >= hsync_start && x < hsync_end);
            vsync <= ~(y >= vsync_start && y < vsync_end);
        end
    end

    // =========================================================
    // DEMO RGB (CENTROWANE OKNO)
    // =========================================================
    always @(posedge clk) begin
        if (!rst_n) begin
            rgb <= 3'b000;
        end
        else if (en) begin

            if (in_window) begin
                if (lx < 11'd170)
                    rgb <= 3'b100;
                else if (lx < 11'd340)
                    rgb <= 3'b010;
                else
                    rgb <= 3'b001;
            end
            else begin
                rgb <= 3'b000;
            end

        end
    end

endmodule