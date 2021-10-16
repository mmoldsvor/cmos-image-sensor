module data_path (input logic clk,
                  input logic reset,
                  output logic erase,
                  output logic expose,
                  output logic convert,
                  output logic read,
                  output logic[$clog2(pixel_count)-1:0] pixel_select);

    parameter pixel_count = 4;

    parameter c_erase = 5;
    parameter c_expose = 255;
    parameter c_convert = 255;
    parameter c_read = 5;

    typedef enum {IDLE, ERASE, EXPOSE, CONVERT, READ} states;
    states state;
    states next_state;
    logic[8-1:0] counter = 0;

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            next_state <= ERASE;
            erase <= 0;
            expose <= 0;
            counter <= 0;
            read <= 0;
            pixel_select <= 0;
        end else begin
            state <= next_state;
        end
        counter <= counter + 1;
    end

    always_comb begin
        case (state)
            IDLE: begin
                erase = 0;
                expose = 0;
                convert = 0;
                read = 0;
            end
            ERASE: begin
                erase = 1;
                expose = 0;
                convert = 0;
                read = 0;
                if (counter == c_erase) begin
                    next_state = EXPOSE;
                    counter = 0;
                end
            end
            EXPOSE: begin
                erase = 0;
                expose = 1;
                convert = 0;
                read = 0;
                if (counter == c_expose) begin
                    next_state = CONVERT;
                    counter = 0;
                end
            end
            CONVERT: begin
                erase = 0;
                expose = 0;
                convert = 1;
                read = 0;
                if (counter == c_convert) begin
                    next_state = READ;
                    counter = 0;
                end
            end
            READ: begin
                erase = 0;
                expose = 0;
                convert = 0;
                read = 1;
                pixel_select = counter;
                if (counter == c_read) begin
                    next_state = IDLE;
                    counter = 0;
                end
            end
            default: begin
                next_state = IDLE;
            end
        endcase
    end
endmodule