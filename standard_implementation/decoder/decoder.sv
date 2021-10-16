module decoder (
    input logic enable,
    input logic[$clog2(width)-1:0] select,
    output logic[width-1:0] out
);
    parameter width = 8;

    assign out = enable ? (1 << select) : 0;
endmodule