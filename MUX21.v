module MUX21(
    input [15:0] i0,
    input [15:0] i1,
    input sel,
    output [15:0] out
);
    assign out = sel? i1:i0;

endmodule