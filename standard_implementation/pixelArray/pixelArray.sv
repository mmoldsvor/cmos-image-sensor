module pixel_array(input logic clk,
                   input logic reset,
                   input logic erase,
                   input logic expose,
                   input logic convert,
                   input logic read,
                   input logic[$clog2(pixel_count)-1:0] pixel_select
                   );

    parameter pixel_count = 4;

    parameter counter_width = 8; 

    wire[counter_width-1:0] data; 
    logic[pixel_count-1:0] pixel_read;

    gray_counter #(.width(counter_width)) gc1(.clk(convert_clk), .reset(reset), .enable(!read), .out(data));
    decoder #(.width(pixel_count)) d1(.clk(clk), .reset(reset), .enable(read), .select(pixel_select), .out(pixel_read));
    
    logic expose_clk;
    logic convert_clk;

    genvar i;
    generate
        for (i=0; i < pixel_count; i++) begin
            PIXEL_SENSOR #(.dv_pixel(0.05*i)) ps1(.VBN1(expose_clk), .RAMP(convert_clk), .RESET(reset), .ERASE(erase), .EXPOSE(expose), .READ(pixel_read[i]), .DATA(data));
        end
    endgenerate

    always_comb begin
        expose_clk = clk & expose;
        convert_clk = clk & convert;
    end
endmodule