module pixel_top_tb;
    logic clk = 0;
    logic reset = 0;
    parameter integer clk_period = 500;
    parameter integer sim_end = clk_period*25000;

    parameter array_width = 100;
    parameter array_height = 100;
    parameter pixel_count = array_width*array_height;
    parameter counter_width = 8;

    always #clk_period clk=~clk;

    int input_file;
    int output_file;
    int code;
    string str;

    // Read pixel values from file
    logic [pixel_count-1:0][7:0] pixel_values;
    logic [counter_width-1:0] data_out;

    logic read;


    pixel_top #(.array_width(array_width), .array_height(array_height), .counter_width(counter_width)) pt1(.clk(clk), .reset(reset), .read(read), .pixel_values(pixel_values), .data_out(data_out));

    initial begin
        input_file = $fopen("pixel_values.txt", "r");
        output_file = $fopen("pixel_output.txt", "wb");

        for (int i = 0; i < pixel_count; i++) begin
            pixel_values[i] = $fgetc (input_file);
            $display("pixel_value: %d", pixel_values[i]);
        end
        
        $fclose(input_file);

        reset = 1;

        #clk_period  reset=0;

        $dumpfile("pixel_top_tb.vcd");
        $dumpvars(0, pixel_top_tb);

        #sim_end $stop;
        $fclose(output_file);
     end

     always_ff @(posedge clk) begin
        if (read) begin
            $fwrite(output_file, "%c", 255-data_out);
        end
    end
endmodule