module mux (
    input logic clk,
    input logic reset,
    input logic[2:0] select,
    input logic[bus_width-1:0] in1,
    input logic[bus_width-1:0] in2,
    input logic[bus_width-1:0] in3,
    input logic[bus_width-1:0] in4,
    output wire[bus_width-1:0] out
);
    parameter mux_width = 4;
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