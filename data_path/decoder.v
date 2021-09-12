module DECODER
    (
        input logic clk, 
        input logic enable, 
        input logic[width-1:0] in, 
        output logic[2**width-1:0] out
    );
    parameter width = 8;

    always @(posedge clk) begin
        if (enable && in) begin
            out <= 1 << in;
        end
        else
            out <= 0;
    end
endmodule