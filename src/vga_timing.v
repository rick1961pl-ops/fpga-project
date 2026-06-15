
module vga_timing (
    input clk,                              // zegar systemowy
    input en,                               // tick 25 MHz (pixel enable)
    input rst_n,                            // reset aktywny niskim

    output reg hsync,                       // synchronizacja pozioma
    output reg vsync,                       // synchronizacja pionowa

    output reg [10:0] x,                    // aktualna pozycja X
    output reg [10:0] y,                    // aktualna pozycja Y

    output video_on                         // 1 = obszar widoczny
);

    // =========================================================
    // VGA 640x480 @60Hz
    // =========================================================

    localparam [10:0] H_VISIBLE = 11'd640;  // aktywny obszar X
    localparam [10:0] H_FRONT   = 11'd16;   // front porch poziomy
    localparam [10:0] H_SYNC    = 11'd96;   // impuls HSYNC
    localparam [10:0] H_BACK    = 11'd48;   // back porch poziomy
    localparam [10:0] H_TOTAL   = 11'd800;  // pełna linia

    localparam [10:0] V_VISIBLE = 11'd480;  // aktywny obszar Y
    localparam [10:0] V_FRONT   = 11'd10;   // front porch pionowy
    localparam [10:0] V_SYNC    = 11'd2;    // impuls VSYNC
    localparam [10:0] V_BACK    = 11'd33;   // back porch pionowy
    localparam [10:0] V_TOTAL   = 11'd525;  // pełna ramka

    assign video_on = (x < H_VISIBLE) && (y < V_VISIBLE);  // aktywny piksel

    // =========================================================
    // PIXEL COUNTERS
    // =========================================================

    always @(posedge clk) begin             // logika synchroniczna
        if (!rst_n) begin                   // reset
            x <= 11'd0;                     // reset X
            y <= 11'd0;                     // reset Y
        end
        else if (en) begin                  // tylko przy ticku

            if (x == H_TOTAL - 1) begin     // koniec linii
                x <= 11'd0;                 // reset X

                if (y == V_TOTAL - 1)       // koniec ramki
                    y <= 11'd0;             // reset Y
                else
                    y <= y + 11'd1;         // następna linia
            end
            else begin
                x <= x + 11'd1;             // kolejny piksel w linii
            end

        end
    end

    // =========================================================
    // SYNC GENERATION
    // =========================================================

    wire [10:0] hsync_start = H_VISIBLE + H_FRONT;              // początek HSYNC
    wire [10:0] hsync_end   = H_VISIBLE + H_FRONT + H_SYNC;     // koniec HSYNC

    wire [10:0] vsync_start = V_VISIBLE + V_FRONT;              // początek VSYNC
    wire [10:0] vsync_end   = V_VISIBLE + V_FRONT + V_SYNC;     // koniec VSYNC

    always @(posedge clk) begin             // generacja sync
        if (!rst_n) begin                   // reset
            hsync <= 1'b1;                  // HSYNC domyślnie high
            vsync <= 1'b1;                  // VSYNC domyślnie high
        end
        else if (en) begin                  // tylko przy ticku
            hsync <= ~(x >= hsync_start && x < hsync_end);  // impuls HSYNC (aktywny low)
            vsync <= ~(y >= vsync_start && y < vsync_end);  // impuls VSYNC (aktywny low)
        end
    end

endmodule
