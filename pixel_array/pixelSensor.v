module PIXEL_SENSOR
    (
    input logic             VBN1,
    input logic             ERASE,
    input logic             EXPOSE,
    output wire[63:0]        VPIXEL
    );

    real             v_erase = 1.2;
    real             lsb = v_erase/255;
    parameter        resolution = 8;

    parameter x = 0;
    parameter y = 0;
    parameter real   dv_pixel = 1.2*(x + y)/20.0;

    real VINTEGRATE = v_erase;

    always @(ERASE) begin
        VINTEGRATE <= v_erase;
    end

    always @(posedge VBN1) begin
        if(EXPOSE) begin
            VINTEGRATE <= VINTEGRATE - dv_pixel*lsb;
        end
    end

    assign VPIXEL = $realtobits(VINTEGRATE);
endmodule
