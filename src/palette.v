module palette (
    input  [3:0] idx,
    output reg [2:0] r,
    output reg [2:0] g,
    output reg [2:0] b
);

    always @(*) begin
        case (idx)
            4'd0: begin r=3'd0; g=3'd0; b=3'd0; end // black
            4'd1: begin r=3'd7; g=3'd0; b=3'd0; end // red
            4'd2: begin r=3'd0; g=3'd7; b=3'd0; end // green
            4'd3: begin r=3'd0; g=3'd0; b=3'd7; end // blue
            4'd4: begin r=3'd7; g=3'd7; b=3'd0; end // yellow
            4'd5: begin r=3'd0; g=3'd7; b=3'd7; end // cyan
            4'd6: begin r=3'd7; g=3'd0; b=3'd7; end // magenta
            4'd7: begin r=3'd7; g=3'd7; b=3'd7; end // white

            default: begin r=3'd0; g=3'd0; b=3'd0; end
        endcase
    end

endmodule