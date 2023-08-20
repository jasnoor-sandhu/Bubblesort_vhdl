`timescale 1ns/1ps

module REG16_TB();

    reg clk;
    reg rst;
    reg ld;
    reg [15:0] data_in;

    wire [15:0] q;
    
    REG16 uut(
        clk,
        rst,
        ld,
        data_in,
        q
    );

    initial begin
        $dumpfile("reg16tb_wave.vcd");
        $dumpvars(0,REG16_TB);
    end
    
    initial begin
        clk = 0;
        rst = 1;
        ld = 0;
        data_in = 0;

        #3 rst = 0;
        #2
        #5
        ld = 1;
        data_in = 5;
        #5 ld = 0;
        #10 data_in = 8;
        #10 ld = 1;
        #10 $finish; 
    end

    always clk = #5 ~clk;


endmodule