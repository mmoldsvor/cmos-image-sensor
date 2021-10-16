module data_path (input logic clk,
                  input logic reset,
                  output logic erase,
                  output logic corr,
                  output logic expose,
                  output logic convert,
                  output logic read,
                  output logic[$clog2(pixel_count)-1:0] pixel_select);

    parameter pixel_count = 4;

    parameter c_erase = 5;
    parameter c_expose = 255;
    parameter c_convert = 255;
    parameter c_read = 4;

    typedef enum {IDLE, ERASE, ERASE_CORR, CORR, EXPOSE, CONVERT, READ} states;
    states state;
    states next_state;
    logic[7:0] counter = 0;

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            next_state <= ERASE;
            erase <= 0;
            corr <= 0;
            expose <= 0;
            counter <= 0;
            read <= 0;
            pixel_select <= 0;
        end else begin
            if (state != next_state) begin        
                counter <= 0;
            end else begin
                counter <= counter + 1;
            end

            state <= next_state;
        end
    end

    always_comb begin
        case (state)
            IDLE: begin
                erase = 0;
                corr = 0;
                expose = 0;
                convert = 0;
                read = 0;
            end
            ERASE: begin
                erase = 1;
                corr = 0;
                expose = 0;
                convert = 0;
                read = 0;
                if (counter == c_erase-1) begin
                    next_state = CORR;
                end
            end
            CORR: begin
                erase = 0;
                corr = 1;
                expose = 0;
                convert = 1;
                read = 0;
                if (counter == c_convert-1) begin
                    next_state = ERASE_CORR;
                end
            end
            ERASE_CORR: begin
                erase = 1;
                corr = 0;
                expose = 0;
                convert = 0;
                read = 0;
                if (counter == c_erase-1) begin
                    next_state = EXPOSE;
                end
            end
            EXPOSE: begin
                erase = 0;
                corr = 0;
                expose = 1;
                convert = 0;
                read = 0;
                if (counter == c_expose-1) begin
                    next_state = CONVERT;
                end
            end
            CONVERT: begin
                erase = 0;
                corr = 0;
                expose = 0;
                convert = 1;
                read = 0;
                if (counter == c_convert-1) begin
                    next_state = READ;
                end
            end
            READ: begin
                erase = 0;
                corr = 0;
                expose = 0;
                convert = 0;
                read = 1;
                if (counter == c_read-1) begin
                    next_state = IDLE;
                end
            end
            default: begin
                next_state = IDLE;
            end
        endcase
        pixel_select = read ? counter : 0;
    end
endmodule