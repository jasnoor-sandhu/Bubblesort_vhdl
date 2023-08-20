module RAM(
    input clk,
    input [15:0] data_in,
    input rd,
    input wr,
    input [9:0] address,
    output [15:0] data_out
);

    //1k memory with word size of 16 bits.
    reg [15:0] ram [0:1023];

    always @(posedge clk) begin
        if(wr)
        ram[address] <= data_in;
    end
    assign data_out = (rd) ? ram[address] : 16'bzzzzzzzzzzzzzzzz;
    

endmodule