module PIXEL_TOP
    (
        input logic clk,
        input logic reset    
    );
    parameter columns = 16;
    parameter rows = 16;
    parameter width = 4;
    
    parameter resolution = 8;
    parameter reference_voltage = 1.2;
    
    logic done;
    logic erase;
    logic expose;
    logic adc_enable;
    logic anaBias1;

    logic[width:0] decoder_select;
    
    PIXEL_DATA #(.width (width), .rows(rows), .columns(columns)) pd0(clk, reset, done, anaBias1, erase, expose, adc_enable, decoder_select);
    PIXEL_ARRAY #(.width (width), .rows(rows), .columns(columns)) pa0 (clk, anaBias1, reset, adc_enable, erase, expose, decoder_select, done);
endmodule