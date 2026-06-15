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

    // ================= PATTERN (4x4 BLOCKS) =================
    wire [7:0] gx = x >> 2;   // 4-pixel grid
    wire [7:0] gy = y >> 2;

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

            // ================= COLOR (FULL 4-bit RANGE) =================
            data <= {gx[1:0] ^ gy[1:0], gx[0], gy[0]};

            // write enable always safe (frame fill mode)
            we <= 1'b1;

            // ================= X/Y SCAN =================
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