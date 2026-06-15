module renderer (
    input clk,
    input rst_n,

    output reg we,
    output reg [16:0] addr,
    output reg [7:0] data
);

    reg [8:0] x;
    reg [7:0] y;

    always @(posedge clk) begin
        if (!rst_n) begin
            x <= 0;
            y <= 0;
            we <= 0;
        end else begin

            addr <= {y, x};

            data <= {x[5], y[5], x[4] ^ y[4], 5'b0};

            we <= 1'b1;

            if (x == 9'd511) begin
                x <= 0;
                y <= y + 1;
            end else begin
                x <= x + 1;
            end

            if (y == 8'd255)
                y <= 0;

        end
    end

endmodule