module renderer (
    input clk,
    input rst_n,

    output reg we,
    output reg [16:0] addr,
    output reg [3:0] data
);

    reg [8:0] x;
    reg [7:0] y;

    wire [16:0] base_y;
    assign base_y = (y << 8) + (y << 6); // y * 320

    // ================= 8-COLOR BANDS =================
    // dzielimy ekran na pionowe pasy co 40 px
    wire [2:0] color_index = x[8:6]; // 0..7 (8 pasów)

    always @(posedge clk) begin
        if (!rst_n) begin
            x <= 0;
            y <= 0;
            addr <= 0;
            data <= 0;
            we <= 0;
        end else begin

            // address
            addr <= base_y + x;

            // ================= 8 COLORS =================
            case (color_index)
                3'd0: data <= 4'b0000; // black
                3'd1: data <= 4'b0001; // blue
                3'd2: data <= 4'b0010; // green
                3'd3: data <= 4'b0011; // cyan
                3'd4: data <= 4'b0100; // red
                3'd5: data <= 4'b0101; // magenta
                3'd6: data <= 4'b0110; // yellow
                3'd7: data <= 4'b0111; // white
                default: data <= 4'b0000;
            endcase

            we <= 1'b1;

            // ================= SCAN 320x240 =================
            if (x == 9'd319) begin
                x <= 0;

                if (y == 8'd239)
                    y <= 0;
                else
                    y <= y + 1;
            end else begin
                x <= x + 1;
            end
        end
    end

endmodule