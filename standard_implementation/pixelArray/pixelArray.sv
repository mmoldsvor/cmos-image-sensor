module pixel_array(input logic clk,
                   input logic reset,
                   input logic cds,
                   input logic erase,
                   input logic corr, 
                   input logic expose,
                   input logic convert,
                   input logic read,
                   input logic[$clog2(pixel_count)-1:0] pixel_select,
                   input logic [pixel_count-1:0][7:0] pixel_values,
                   output wire [counter_width-1:0] pixel_out
                   );

    parameter pixel_count = 4;

    parameter counter_width = 8; 

    logic[pixel_count-1:0] pixel_read;

    logic[counter_width-1:0] counter;
    counter #(.width(counter_width)) c1(.clk(convert_clk), .reset(reset), .out(counter));
    decoder #(.width(pixel_count)) d1(.enable(read), .select(pixel_select), .out(pixel_read));

    wire[counter_width-1:0] data_out;
    wire[pixel_count-1:0][counter_width-1:0] data_bus;
    mux #(.mux_width(pixel_count), .bus_width(counter_width)) m1(.select(pixel_select), .in(data_bus), .out(data_out));

    wire[counter_width-1:0] corr_out;
    wire[pixel_count-1:0][counter_width-1:0] corr_bus;
    mux #(.mux_width(pixel_count), .bus_width(counter_width)) m2(.select(pixel_select), .in(corr_bus), .out(corr_out));

    wire[counter_width-1:0] sub_out;
    sub #(.width(counter_width)) s1(.a(data_out), .b(corr_out), .out(sub_out));

    logic expose_clk;
    logic convert_clk;

    genvar i;
    generate
        for (i=0; i < pixel_count; i++) begin
            PIXEL_SENSOR ps1(.VBN1(expose_clk), .RAMP(convert_clk), .RESET(reset), .ERASE(erase), .CORR(corr), .EXPOSE(expose), .READ(pixel_read[i]), .CDS(cds), .DATA(data_bus[i]), .DATA_CORR(corr_bus[i]), .pixel_value(pixel_values[i]));    
            
            assign data_bus[i] = !read ? counter : 'z;
            assign corr_bus[i] = cds ? (!read ? counter : 'z) : 255;
        end
    endgenerate

    always_comb begin
        expose_clk = clk & expose;
        convert_clk = clk & convert;
    end
    
    assign pixel_out = 255 - sub_out;
endmodule