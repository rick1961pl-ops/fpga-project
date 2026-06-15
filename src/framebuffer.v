module framebuffer #(
    parameter WIN_W = 512,
    parameter WIN_H = 256
)(
    input clk,

    // WRITE PORT (CPU / logika)
    input we,
    input [16:0] wr_addr,     // 512×256 = 131072 -> 17 bitów
    input [7:0]  wr_data,

    // READ PORT (VGA)
    input [16:0] rd_addr,
    output reg [7:0] rd_data
);

    // =========================================================
    // BRAM inferred (block RAM)
    // =========================================================
    reg [7:0] mem [0:WIN_W*WIN_H-1];

    // WRITE
    always @(posedge clk) begin
        if (we)
            mem[wr_addr] <= wr_data;
    end

    // READ
    always @(posedge clk) begin
        rd_data <= mem[rd_addr];
    end

endmodule
