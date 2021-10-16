module decoder_tb;
    logic clk = 0;
    logic reset = 0;
    always #5 clk=~clk;
    
    parameter decoder_width = 8;

    logic enable;
    logic[$clog2(decoder_width)-1:0] select;
    logic[decoder_width-1:0] out;

    decoder #(.width(decoder_width)) d1(.clk(clk), .reset(reset), .enable(enable), .select(select), .out(out));

    initial begin
        reset = 1;
        enable = 0;
        select = 0;

        #5 reset = 0;
        
        #5 $display("%b", out);
        #5 $display("%b", out);
        #5 enable = 1;
        #5 $display("%b", out);
        #5 $display("%b", out);
        #5 select = 0;
        #5 $display("%b", out);
        #5 $display("%b", out);
        #5 select = 1;
        #5 enable = 0;
        #5 $display("%b", out);
        #5 $display("%b", out);
        #5 select = 4;
        #5 $display("%b", out);
        #5 $display("%b", out);
        #5 $stop;
    end

endmodule