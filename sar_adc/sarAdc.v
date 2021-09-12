module SAR_ADC
    (
        input logic clk,
        input logic reset,
        input logic enable,
        input real analog_input,
        output logic[resolution-1:0] adc_output,
        output logic done
    );

    parameter                resolution = 8;
    parameter real           reference_voltage = 1.2;

    wire[resolution-1:0]     dac_value;

    logic                    compare;
    real                     dac_output;

    SAR #(.resolution(resolution)) s1(clk, reset, enable, compare, dac_value, adc_output, done);

    always @(dac_value) begin
        dac_output = (dac_value * reference_voltage)/(2**resolution - 1);
        compare = analog_input > dac_output;
    end
endmodule