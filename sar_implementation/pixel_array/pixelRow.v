module PIXEL_ROW
    (
        input logic clk, 
        input logic VBN1,
        input logic reset,
        input logic enable,
        input logic ERASE,
        input logic EXPOSE,
        input logic[width:0] decoder_select,
        output logic[resolution-1:0] adc_output,
        output logic done
    );

    parameter width = 2;
    parameter rows = 2;
    parameter resolution = 8;
    parameter reference_voltage = 1.2;

    parameter x = 0;

    logic[2**width-1:0][63:0] in;
    wire real vpixel;

    MUX #(.width (width)) mux0 (decoder_select, in, vpixel);

    genvar i;
    generate 
        for (i = 0; i < rows; i = i + 1) begin
            PIXEL_SENSOR #(.x (x), .y (i)) ps0(VBN1, ERASE, EXPOSE, in[i]);
        end
    endgenerate

    SAR_ADC #(.resolution (resolution), .reference_voltage (reference_voltage)) sa0 (clk, reset, enable, vpixel, adc_output, done);
endmodule