module MUX41 (
    input [15:0] i0,
    input [15:0] i1,
    input [15:0] i2,
    input [15:0] i3,
    input [1:0] sel,
    output reg [15:0] out
);

always@(*)begin
    case(sel)
        0 : out <= i0;
        1 : out <= i1;
        2 : out <= i2;
        3 : out <= i3;
        default : out <= 0;

    endcase
end
    
endmodule