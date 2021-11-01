module pixel_array(input logic clk,
                   input logic reset,
                   input logic erase,
                   input logic expose,
                   input logic convert,
                   input logic read,
                   input logic[$clog2(pixel_count)-1:0] pixel_select,
                   input logic [pixel_count-1:0][7:0] pixel_values,
                   output logic [counter_width-1:0] data_out
                   );

    parameter pixel_count = 4;

    parameter counter_width = 8; 

    logic[pixel_count-1:0] pixel_read;

    logic[counter_width-1:0] counter;
    logic[counter_width-1:0] gray_counter;

    wire[counter_width-1:0] data;

    counter #(.width(counter_width)) gc1(.clk(convert_clk), .reset(reset), .out(counter));
    gray_encoder #(.width(counter_width)) ge1(.in(counter), .out(gray_counter));
    
    decoder #(.width(pixel_count)) d1(.enable(read), .select(pixel_select), .out(pixel_read));
    gray_decoder #(.width(counter_width)) gd1(.in(data), .out(data_out));

    logic expose_clk;
    logic convert_clk;

    genvar i;
    generate
        for (i=0; i < pixel_count; i++) begin
            PIXEL_SENSOR ps1(.VBN1(expose_clk), .RAMP(convert_clk), .RESET(reset), .ERASE(erase), .EXPOSE(expose), .READ(pixel_read[i]), .DATA(data), .pixel_value(pixel_values[i]));    
        end
    endgenerate

    always_comb begin
        expose_clk = clk & expose;
        convert_clk = clk & convert;
    end

    assign data = !read ? gray_counter : 'z;
endmodule