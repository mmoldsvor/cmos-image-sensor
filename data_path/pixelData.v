module PIXEL_DATA
    (
        input logic clk,
        input logic reset,
        input logic done,
        output logic anaBias1,
        output logic erase,
        output logic expose,
        output logic adc_enable,
        output logic[width-1:0] decoder_select
    );
    parameter columns = 2;
    parameter rows = 2;
    parameter width = 2;

    int row_count = 0;
    logic decoder_enable = 1;

    wire[2**width-1:0] decoder_out;
    DECODER #(.width (width)) d0 (clk, decoder_enable, decoder_select, decoder_out);

    typedef enum {IDLE, ERASE, EXPOSE, START, CONVERT, NEXT, DONE} states;
    states state = IDLE;
    
    integer             exposure_counter;
    parameter integer   c_expose = 255;

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin

        end
        else begin
            case(state)
                IDLE: begin
                    erase <= 0;
                    expose <= 0;
                    decoder_select <= row_count;
                    state <= ERASE;
                end
                ERASE: begin
                    erase <= 1;
                    state <= EXPOSE;
                end
                EXPOSE: begin
                    erase <= 0;
                    expose <= 1;
                    if (exposure_counter == c_expose) begin 
                        state <= START;
                    end
                end
                START: begin
                    expose <= 0;
                    adc_enable <= 1;
                    state <= CONVERT;
                end
                CONVERT: begin
                    if (done) begin
                        adc_enable <= 0;
                        state <= NEXT;
                    end
                end
                NEXT: begin
                    row_count = row_count + 1;
                    decoder_select <= row_count;
                    if (row_count >= rows) begin
                        state <= DONE;
                    end
                    else begin
                        state <= START;
                    end
                end
                DONE: begin
                    //$display ("DONE");
                end
            endcase
            if(state == IDLE)
                exposure_counter = 0;
            else if(state == EXPOSE)
                exposure_counter = exposure_counter + 1;
        end
    end

    assign anaBias1 = expose ? clk : 0;
endmodule