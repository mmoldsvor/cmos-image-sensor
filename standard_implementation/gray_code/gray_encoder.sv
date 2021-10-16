module gray_encoder(
    input logic[width-1:0] in,
    output logic[width-1:0] out
);
    parameter width = 8;

    always_comb begin
        out[width-1] = in[width-1];
        for (int i = 0; i < (width - 1); i++) begin
            out[i] = in[i] ^ in[i+1];
        end
    end
endmodule