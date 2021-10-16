module counter(input logic clk,
               input logic reset,
               output wire[width-1:0] out);
    parameter width = 8;

    logic[width-1:0] count = 0;

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
           count <= 0;
        end else begin
            count <= count + 1;
        end
    end

    assign out = count;
endmodule