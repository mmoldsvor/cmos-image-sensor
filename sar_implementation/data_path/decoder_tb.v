module decoder_tb;
    logic clk = 0;
    always #10 clk=~clk;

    parameter width = 3;

    logic enable;
    logic[width-1:0] in;
    wire[2**width-1:0] out;


    decoder #(.width (width)) d0 (clk, enable, in, out);

    initial begin
        #5 enable = 1;
        #20 in = 1;
        #20 in = 2;
        #20 in = 3;
        #20 in = 4;
        #20 in = 5;
        #20 in = 6;
        #20 in = 7;
        #20 in = 8;
        #20 in = 9;

        #20 $stop;
    end

endmodule