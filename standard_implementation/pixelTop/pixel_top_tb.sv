`timescale 1 ns / 1 ps

module pixel_top_tb;
    logic clk = 0;
    logic reset = 0;
    parameter integer clk_period = 500;
    parameter integer sim_end = clk_period*25000;

    parameter array_width = 10;
    parameter array_height = 10;
    parameter pixel_count = array_width*array_height;
    parameter counter_width = 8;

    always #clk_period clk=~clk;

    int input_file;
    int output_file;
    int code;
    string str;

    // Read pixel values from file
    logic [pixel_count-1:0][7:0] pixel_values;
    logic [counter_width-1:0] pixel_out;
    logic [pixel_count-1:0][7:0] image_output;

    logic read;

    logic enable;
    logic cont_mode;
    logic cds;
    
    int index;

    pixel_top #(.array_width(array_width), .array_height(array_height), .counter_width(counter_width)) pt1(.system_clk(clk), .reset(reset), .enable(enable), .cont_mode(cont_mode), .cds(cds), .read(read), .pixel_values(pixel_values), .pixel_out(pixel_out));

    initial begin
        input_file = $fopen("pixel_x10_values.txt", "r");

        for (int i = 0; i < pixel_count; i++) begin
            pixel_values[i] = $fgetc (input_file);
            $display("pixel_value: %d", pixel_values[i]);
        end
        
        $fclose(input_file);

        reset = 1;
        cont_mode = 0;
        cds = 1;
        enable = 1;

        #clk_period  reset=0;


        $dumpfile("pixel_top_tb.vcd");
        $dumpvars(0, pixel_top_tb);
        
        #(clk_period*100) enable = 0;
        //#(clk_period*1140) enable = 1;

        #sim_end        
        output_file = $fopen("pixel_x10_output.txt", "wb");
        for (int i = 0; i < pixel_count; i++) begin
            $fwrite(output_file, "%c", image_output[i]);
            $display("output_value: %d", image_output[i]);
        end
        $fclose(output_file);
        $stop;
     end

     always_ff @(posedge clk) begin
        if (read) begin
            image_output[index] = pixel_out;
            index = index + 1;
        end
    end
endmodule