module REG16(
    input clk,
    input rst,
    input ld,
    input [15:0] data_in,
    output reg [15:0] q
);

initial begin
    q = 0;
end

always @(posedge clk) begin
    if(rst) q <= 0;
    else begin
        if(ld) q <= data_in;
        else q <= q;
    end
end

endmodule