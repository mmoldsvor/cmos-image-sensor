

module pixel_top_tb;
    logic clk =0;
    logic reset =0;
    parameter integer clk_period = 500;
    parameter integer sim_end = clk_period*2400;
    always #clk_period clk=~clk;


    PIXEL_TOP pt0 (clk, reset);

    initial begin

        $dumpfile("pixel_top_tb.vcd");
        $dumpvars(0,pixel_top_tb);

        #sim_end $stop;


     end

endmodule