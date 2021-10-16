module pixel_top(input logic clk,
                 input logic reset);
    
    parameter array_width = 2;
    parameter array_height = 2;
    parameter pixel_count = array_width * array_height;

    logic erase;
    logic expose;
    logic convert;
    logic read;
    logic[$clog2(pixel_count)-1:0] pixel_select;

    data_path #(.pixel_count(pixel_count)) dp1(.clk(clk), .reset(reset), .erase(erase), .expose(expose), .convert(convert), .read(read), .pixel_select(pixel_select));
    pixel_array #(.pixel_count(pixel_count)) pa1(.clk(clk), .reset(reset), .erase(erase), .expose(expose), .convert(convert), .read(read), .pixel_select(pixel_select));
endmodule