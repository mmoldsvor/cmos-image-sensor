module PIXEL_ARRAY
    (
    input logic clk, 
    input logic VBN1,
    input logic reset,
    input logic enable,
    input logic ERASE,
    input logic EXPOSE,
    input logic[width-1:0] decoder_select,
    output logic row_done
    );
    parameter rows = 3;
    parameter columns = 3;
    parameter width = 2;
    parameter resolution = 8;
    parameter reference_voltage = 1.2;


    wire[columns-1:0][resolution-1:0] adc_output;
    logic[columns-1:0] done;

    genvar i;
    generate 
        for (i = 0; i < columns; i = i + 1) begin
            PIXEL_ROW #(.width (width), .x (i), .rows (rows)) pr0(clk, VBN1, reset, enable, ERASE, EXPOSE, decoder_select, adc_output[i], done[i]);
        end
    endgenerate

    always @(done) begin
        row_done <= (done == 2**columns-1);
    end

    always_ff @(posedge row_done) begin
        $write ("%d, ", decoder_select);
        foreach (adc_output[k]) begin
            $write ("%f ", (adc_output[k] * reference_voltage)/(2**resolution - 1));
        end
        $write ("\n");
    end
endmodule