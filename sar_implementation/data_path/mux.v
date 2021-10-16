module MUX
    (
        input logic[width:0] control, 
        input logic[2**width-1:0][63:0] in, 
        output wire real out
    );
    parameter width = 2;

    assign out = (control == 0) ? 0 : $bitstoreal(in[control]);
endmodule