module demo_pattern (
    input clk,                              // zegar systemowy
    input en,                               // impuls 25 MHz (pixel tick)
    input rst_n,                            // reset aktywny niskim
    input [10:0] x,                         // współrzędna X piksela
    input [10:0] y,                         // współrzędna Y piksela
    input video_on,                         // 1 = aktywny obszar obrazu
    output reg [2:0] rgb                    // wyjście RGB
);

    // =========================================================
    // CENTER WINDOW 512x256
    // =========================================================

    localparam [10:0] WIN_W = 11'd512;      // szerokość okna
    localparam [10:0] WIN_H = 11'd256;      // wysokość okna

    localparam [10:0] X_OFF = 11'd64;       // offset X (lewy brzeg)
    localparam [10:0] Y_OFF = 11'd112;      // offset Y (górny brzeg)

    wire in_window =
        (x >= X_OFF) &&                     // lewa granica
        (x <  X_OFF + WIN_W) &&             // prawa granica
        (y >= Y_OFF) &&                     // górna granica
        (y <  Y_OFF + WIN_H);               // dolna granica

    wire [10:0] lx = x - X_OFF;             // lokalne X w oknie

    // =========================================================
    // RGB DEMO
    // =========================================================

    always @(posedge clk) begin             // logika synchroniczna

        if (!rst_n) begin                   // reset
            rgb <= 3'b000;                  // czarny
        end

        else if (en) begin                  // tick piksela

            if (video_on && in_window) begin   // piksel aktywny w oknie

                if (lx < 11'd170)           // 1/3 okna
                    rgb <= 3'b100;          // czerwony

                else if (lx < 11'd340)      // 2/3 okna
                    rgb <= 3'b010;          // zielony

                else                        // 3/3 okna
                    rgb <= 3'b001;          // niebieski

            end
            else begin
                rgb <= 3'b000;              // tło
            end

        end
    end

endmodule