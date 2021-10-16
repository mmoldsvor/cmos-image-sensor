module decoder (
    input logic clk,
    input logic reset,
    input logic enable,
    input logic[$clog2(width)-1:0] select,
    output logic[width-1:0] out
);
    parameter width = 8;

    logic[width-1:0] intermediate_out;

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            intermediate_out <= 0;
        end else begin
            intermediate_out <= 1 << select;
        end
    end

    assign out = enable ? intermediate_out : 0;
endmodule