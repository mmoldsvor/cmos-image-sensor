module gray_counter_tb;
    logic clk = 0;
    logic reset = 0;
    always #5 clk=~clk;
    
    parameter counter_width = 8;

    logic[counter_width-1:0] out;

    gray_counter #(.width(counter_width)) c1(.clk(clk), .reset(reset), .out(out));

    initial begin
        reset = 1;

        #5 reset = 0;
        
        #5 $display("%b", out);
        #5 $display("%b", out);
        #5 $display("%b", out);
        #5 $display("%b", out);
        #5 $display("%b", out);

        #5 $stop;
    end
endmodule