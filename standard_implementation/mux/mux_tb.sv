module mux_tb;
    logic clk = 0;
    logic reset = 0;
    always #5 clk=~clk;
    
    parameter mux_width = 2;
    parameter bus_width = 8;

    logic[$clog2(mux_width)-1:0] select;
    logic[mux_width-1:0][bus_width-1:0] in;
    logic[bus_width-1:0] out;

    mux #(.mux_width(mux_width)) c1(.clk(clk), .reset(reset), .select(select), .in(in), .out(out));

    initial begin
        reset = 1;
        in[0] =  85;
        in[1] = 157;
        select = 0;

        #5 reset = 0;

        #5 $display("%b", out);
        #5 $display("%b", out);
        #5 $display("%b", out);
        #5 select = 1;
        #5 $display("%b", out);
        #5 $display("%b", out);

        #5 $stop;
    end
endmodule