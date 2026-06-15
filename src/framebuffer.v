// bufor obrazu

module framebuffer (
    input clk,

    input we,
    input [16:0] wr_addr,
    input [3:0]  wr_data,

    input [16:0] rd_addr,
    output reg [3:0] rd_data
);

    reg [3:0] mem [0:320*240-1];

    always @(posedge clk) begin
        if (we)
            mem[wr_addr] <= wr_data;

        rd_data <= mem[rd_addr];
    end

endmodule
