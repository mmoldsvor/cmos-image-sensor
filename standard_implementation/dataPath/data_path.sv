`timescale 1 ns / 1 ps

module data_path (input logic clk,
                  input logic reset,
                  input logic enable,
                  input logic cont_mode,
                  input logic cds,
                  output logic erase,
                  output logic corr,
                  output logic expose,
                  output logic convert,
                  output logic read,
                  output logic idle,
                  output logic[$clog2(pixel_count)-1:0] pixel_select
    );

    parameter pixel_count = 4;

    parameter c_erase = 5;
    parameter c_expose = 255;
    parameter c_convert = 255;
    parameter c_read = pixel_count;

    logic[3:0] state;
    logic[3:0] next_state;
    logic[15:0] counter = 0;

    always_ff @(posedge clk) begin
        if (state != next_state) begin        
            counter <= 0;
        end else begin
            counter <= counter + 1;
        end

        state <= next_state;
    end

    always_comb begin
        case (state)
            0: begin
                erase = 0;
                expose = 0;
                corr = 0;
                convert = 0;
                read = 0;
                idle = 1;
                if (enable) begin
                    next_state = 1;
                end
            end
            1: begin
                erase = 1;
                expose = 0;
                corr = 0;
                convert = 0;
                read = 0;
                idle = 0;
                if (counter == c_erase-1) begin
                    if (cds) begin
                        corr = 1;
                        next_state = 3;
                    end else begin
                        next_state = 2;
                    end
                end
            end
            3: begin
                erase = 0;
                expose = 0;
                convert = 1;
                read = 0;
                idle = 0;
                if (counter == c_convert-1) begin
                    if (corr) begin
                        next_state = 2;
                    end else begin
                        next_state = 4;
                    end
                end
            end
            2: begin
                erase = 0;
                expose = 1;
                corr = 0;
                convert = 0;
                read = 0;
                idle = 0;
                if (counter == c_expose-1) begin
                    next_state = 3;
                end
            end
            4: begin
                erase = 0;
                expose = 0;
                convert = 0;
                read = 1;
                idle = 0;
                if (counter == c_read-1) begin
                    if (cont_mode) begin
                        next_state = 1;
                    end else begin
                        next_state = 0;
                    end
                end
            end
            default: begin
                next_state = 0;
            end
        endcase
        pixel_select = read ? counter : 0;
    end
endmodule