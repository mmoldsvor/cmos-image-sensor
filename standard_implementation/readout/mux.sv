module mux (
    input logic[$clog2(mux_width)-1:0] select,
    input logic[mux_width-1:0][bus_width-1:0] in,
    output wire[bus_width-1:0] out
);
    parameter mux_width = 8;
    parameter bus_width = 8;

    assign out = in[select];
endmodule