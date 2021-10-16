module SAR
    (
        input clk, 
        input reset, 
        input enable, 
        input compare, 
        output logic[resolution-1:0] dac_value, 
        output logic[resolution-1:0] adc_value, 
        output logic done
    );
    parameter resolution = 8;

    typedef enum {IDLE, BINARY_SEARCH, DAC, DONE} states;
    states state;

    int count = 0;

    logic[resolution-1:0] intermediate_value;

    always_ff @(posedge enable) begin
        dac_value = 0;
        intermediate_value = 0;
        count = 0;
        done = 0;
        state <= BINARY_SEARCH;
    end

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            dac_value = 0;
            intermediate_value = 0;
            count = 0;
            done <= 0;
            adc_value <= 0;
            state <= BINARY_SEARCH;
        end
        else begin
            case(state)
                BINARY_SEARCH: begin
                    if (compare || count == 0)
                        intermediate_value <= intermediate_value + (1 << (resolution - count - 1));
                    else
                        intermediate_value <= intermediate_value - (1 << (resolution - count)) + (1 << (resolution - count - 1));

                    count = count + 1;
                    if (count >= resolution) 
                        state <= DONE;
                    else
                        state <= DAC;
                end
                DONE: begin
                    adc_value <= intermediate_value;
                    done <= 1;
                    state <= IDLE;
                end
            endcase
        end
    end

    always_ff @(negedge clk) begin
        if (state == DAC) begin
            dac_value = intermediate_value;
            state <= BINARY_SEARCH;
        end
    end
endmodule