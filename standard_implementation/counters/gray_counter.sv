module gray_counter(input logic clk,
               input logic reset,
               input logic enable,
               output wire[width-1:0] out);
    parameter width = 8;

    logic[width-1:0] count;
    logic[width-1:0] gray_count;

    always_comb begin
        gray_count[width-1] = count[width-1];
        for (int i = 0; i < (width - 1); i++) begin
            gray_count[i] = count[i] ^ count[i+1];
        end
    end

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
           count <= 0;
        end else begin
            count <= count + 1;
        end
    end

    assign out = enable ? gray_count: 'Z;
endmodule