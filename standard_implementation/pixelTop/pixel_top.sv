module pixel_top(input logic clk,
                 input logic reset,
                 input logic [pixel_count-1:0][7:0] pixel_values,
                 output logic read,
                 output logic [counter_width-1:0] data_out);
    
    parameter array_width = 2;
    parameter array_height = 2;
    parameter counter_width = 8;
    
    parameter pixel_count = array_width * array_height;

    logic erase;
    logic expose;
    logic convert;
    logic[$clog2(pixel_count)-1:0] pixel_select;

    data_path #(.pixel_count(pixel_count)) dp1(.clk(clk), .reset(reset), .erase(erase), .expose(expose), .convert(convert), .read(read), .pixel_select(pixel_select));
    pixel_array #(.pixel_count(pixel_count), .counter_width(counter_width)) pa1(.clk(clk), .reset(reset), .erase(erase), .expose(expose), .convert(convert), .read(read), .pixel_select(pixel_select), .pixel_values(pixel_values), .data_out(data_out));
endmodule