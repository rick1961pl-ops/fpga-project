module demo_shift_vsync #(
    parameter SIZE = 512*256
)(
    input clk,
    input rst_n,
    input vsync,

    input [7:0] rd_data,   // <<< DODANE

    output reg we,
    output reg [16:0] addr,
    output reg [7:0] data
);

    reg vsync_d;
    reg busy;
    reg [16:0] i;
    reg [7:0] first;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            vsync_d <= 0;
            busy <= 0;
            i <= 0;
            we <= 0;
        end else begin

            vsync_d <= vsync;

            // start 1 frame
            if (vsync && !vsync_d && !busy) begin
                busy <= 1;
                i <= 0;
                addr <= 0;
                first <= rd_data; // <<< REAL READ
            end

            if (busy) begin
                we <= 1;

                addr <= i + 1;
                data <= rd_data; // <<< SHIFT DATA

                if (i < SIZE-2)
                    i <= i + 1;
                else begin
                    addr <= SIZE-1;
                    data <= first;

                    busy <= 0;
                    we <= 0;
                end
            end else begin
                we <= 0;
            end
        end
    end

endmodule