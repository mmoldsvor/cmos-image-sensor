module sar_adc_tb;
    logic clk = 0;
    always #10 clk=~clk;

    parameter resolution = 8;
    parameter real reference_voltage = 1.2;

    logic enable;
    real analog_input = 0;
    wire[resolution-1:0] adc_output;

    sar_adc #(.resolution (resolution), .reference_voltage (reference_voltage)) adc0 (clk, reset, enable, analog_input, adc_output, done);

    initial begin
        #5 analog_input = 0.5;
        #5 enable = 1;

        #100 $display ("DONE: %d, ADC: %b: %f", done, adc_output, (adc_output * reference_voltage)/(2**resolution - 1));
        #100 $display ("DONE: %d, ADC: %b: %f", done, adc_output, (adc_output * reference_voltage)/(2**resolution - 1));
        #5 analog_input = 0.2;
        #5 enable = 0;
        #5 enable = 1;
        #100 $display ("DONE: %d, ADC: %b: %f", done, adc_output, (adc_output * reference_voltage)/(2**resolution - 1));
        #100 $display ("DONE: %d, ADC: %b: %f", done, adc_output, (adc_output * reference_voltage)/(2**resolution - 1));

        #1000 $stop;
    end

endmodule