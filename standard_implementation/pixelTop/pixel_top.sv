module pixel_top(input logic system_clk,
                 input logic reset,
                 input logic enable,
                 input logic cont_mode,
                 input logic cds,
                 input logic [pixel_count-1:0][7:0] pixel_values,
                 output logic read,
                 output logic [counter_width-1:0] pixel_out
    );
    
    parameter array_width = 2;
    parameter array_height = 2;
    parameter counter_width = 8;
    
    parameter pixel_count = array_width * array_height;

    logic erase;
    logic corr;
    logic expose;
    logic convert;
    logic idle;
    logic[$clog2(pixel_count)-1:0] pixel_select;

    wire clk;

    data_path #(.pixel_count(pixel_count)) dp1(.clk(system_clk), .reset(reset), .enable(enable), .cont_mode(cont_mode), .cds(cds), .erase(erase), .corr(corr), .expose(expose), .convert(convert), .read(read), .idle(idle), .pixel_select(pixel_select));
    pixel_array #(.pixel_count(pixel_count), .counter_width(counter_width)) pa1(.clk(clk), .reset(reset), .cds(cds), .erase(erase), .corr(corr), .expose(expose), .convert(convert), .read(read), .pixel_select(pixel_select), .pixel_values(pixel_values), .pixel_out(pixel_out));

    assign clk = !idle ? system_clk : 0;
endmodule