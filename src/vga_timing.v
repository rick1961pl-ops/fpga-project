module vga_timing (
    input clk,
    input en,
    input rst_n,

    output reg hsync,
    output reg vsync,

    output reg [10:0] x,
    output reg [10:0] y,

    output reg video_on
);

    // ================= TIMING 640x480@60Hz =================
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

    wire [10:0] hsync_start = H_VISIBLE + H_FRONT;
    wire [10:0] hsync_end   = H_VISIBLE + H_FRONT + H_SYNC;

    wire [10:0] vsync_start = V_VISIBLE + V_FRONT;
    wire [10:0] vsync_end   = V_VISIBLE + V_FRONT + V_SYNC;

    // ================= COUNTERS =================
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
            else begin
                x <= x + 11'd1;
            end
        end
    end

    // ================= SYNC SIGNALS =================
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

    // ================= VIDEO ON (FIX UWAGA 2) =================
    always @(posedge clk) begin
        if (!rst_n)
            video_on <= 1'b0;
        else if (en)
            video_on <= (x < H_VISIBLE) && (y < V_VISIBLE);
    end

endmodule