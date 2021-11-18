module sub (
    input logic[width-1:0] a,
    input logic[width-1:0] b,
    output wire[width-1:0] out
);

    parameter width = 8;

    assign out = b - a;
endmodule