module data_path_tb;
    logic clk = 0;
    logic reset = 0;
    parameter integer clk_period = 500;
    parameter integer sim_end = clk_period*2400;
    always #clk_period clk=~clk;

    data_path dp1(.clk(clk), .reset(reset));

    initial begin
        reset = 1;

        #clk_period  reset=0;

        $dumpfile("data_path_tb.vcd");
        $dumpvars(0,data_path_tb);

        #sim_end $stop;
     end
endmodule