module pixel_top_tb;
    logic clk = 0;
    always #10 clk=~clk;


    PIXEL_TOP pt0 (clk, reset);

    initial begin

        #10000 $stop;
    end

endmodule