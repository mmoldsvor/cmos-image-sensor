module pixel_array(input logic clk,
                   input logic reset,
                   input logic erase,
                   input logic corr,
                   input logic expose,
                   input logic convert,
                   input logic read,
                   input logic[$clog2(pixel_count)-1:0] pixel_select
                   );

    parameter pixel_count = 4;

    parameter counter_width = 8; 

    logic[pixel_count-1:0] pixel_read;

    logic[counter_width-1:0] counter;
    logic[counter_width-1:0] gray_counter;
    
    wire[counter_width-1:0] data;

    counter #(.width(counter_width)) c1(.clk(convert_clk), .reset(reset), .out(counter));
    gray_encoder #(.width(counter_width)) ge1(.in(counter), .out(gray_counter));
    
    decoder #(.width(pixel_count)) d1(.enable(read), .select(pixel_select), .out(pixel_read));
    
    logic expose_clk;
    logic convert_clk;

    // genvar i;
    // generate
    //     for (i=0; i < pixel_count; i++) begin
    //         PIXEL_SENSOR #(.dv_pixel(0.2*i)) ps1(.VBN1(expose_clk), .RAMP(convert_clk), .RESET(reset), .ERASE(erase), .CORR(corr), .EXPOSE(expose), .READ(pixel_read[i]), .DATA(data));
    //     end
    // endgenerate
    PIXEL_SENSOR ps1[pixel_count-1:0](.VBN1(expose_clk), .RAMP(convert_clk), .RESET(reset), .ERASE(erase), .CORR(corr), .EXPOSE(expose), .READ(pixel_read), .DATA(data));

    always_comb begin
        expose_clk = clk & expose;
        convert_clk = clk & convert;
    end

    assign data = !read ? gray_counter : 'z;
endmodule