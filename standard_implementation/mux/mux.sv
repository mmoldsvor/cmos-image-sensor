module mux (
    input logic clk,
    input logic reset,
    input logic[$clog2(mux_width)-1:0] select,
    input logic[mux_width-1:0][bus_width-1:0] in,
    output wire[bus_width-1:0] out
);
    parameter mux_width = 8;
    parameter bus_width = 8;

    logic[bus_width] intermediate_out;
    
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            intermediate_out <= 0;
        end else begin
            intermediate_out <= in[select];
        end
    end

    assign out = intermediate_out;

endmodule