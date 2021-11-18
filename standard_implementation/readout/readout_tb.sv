module readout_tb;
    logic clk = 0;
    logic reset = 0;
    always #5 clk=~clk;
    
    parameter mux_width = 2;
    parameter bus_width = 8;

    logic[$clog2(mux_width)-1:0] select;
    logic[mux_width-1:0][bus_width-1:0] in1;
    logic[mux_width-1:0][bus_width-1:0] in2;
    logic[bus_width-1:0] mux1_out;
    logic[bus_width-1:0] mux2_out;

    logic[bus_width-1:0] sub_out;

    mux #(.mux_width(mux_width)) m1(.select(select), .in(in1), .out(mux1_out));
    mux #(.mux_width(mux_width)) m2(.select(select), .in(in2), .out(mux2_out));
    sub #(.width(bus_width)) s1(.a(mux1_out), .b(mux2_out), .out(sub_out));

    initial begin
        reset = 1;
        in1[0] =  85;
        in2[0] = 157;

        in1[1] = 200;
        in2[1] = 255;
        select = 0;

        #5 reset = 0;

        #5 $display("%d", sub_out);
        #5 $display("%d", sub_out);
        #5 $display("%d", sub_out);
        #5 select = 1;
        #5 $display("%d", sub_out);
        #5 $display("%d", sub_out);

        
        $dumpfile("readout_tb.vcd");
        $dumpvars(0, readout_tb);

        #5 $stop;
    end
endmodule