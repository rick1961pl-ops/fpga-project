// wypełnienie framebuffer

module palette (
    input  [3:0] idx,
    output reg [2:0] r,
    output reg [2:0] g,
    output reg [2:0] b
);

    always @(*) begin
        case (idx)
            4'd0: begin r=0; g=0; b=0; end
            4'd1: begin r=7; g=0; b=0; end
            4'd2: begin r=0; g=7; b=0; end
            4'd3: begin r=0; g=0; b=7; end
            4'd4: begin r=7; g=7; b=0; end
            4'd5: begin r=0; g=7; b=7; end
            4'd6: begin r=7; g=0; b=7; end
            default: begin r=5; g=5; b=5; end
        endcase
    end

endmodule
