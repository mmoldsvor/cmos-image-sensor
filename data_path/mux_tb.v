module TEST_TB;
    logic clk = 0;
    always #10 clk=~clk;

    parameter width = 2;

    logic[width-1:0] control;
    logic[2**width-1:0][63:0] in;
    wire real out;

    MUX #(.width (width)) mux0(control, in, out);

    initial begin
        in[0] = $realtobits(1.2);
        in[1] = $realtobits(2.5);
        in[2] = $realtobits(0.4);
        in[3] = $realtobits(5.5);
        control = 1;

        #20 $display("%d, %f", control, out);
        control = 3;
        #20 $display("%d, %f", control, out);
        control = 0;
        #20 $display("%d, %f", control, out);

        #100 $stop;
    end

endmodule