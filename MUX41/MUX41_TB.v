`timescale 1ns/1ps

module MUX41_TB ();
    
    reg [15:0] i0;
    reg [15:0] i1;
    reg [15:0] i2;
    reg [15:0] i3;
    reg [1:0] sel;

    wire [15:0] out;

    MUX41 uut(i0, i1, i2, i3, sel ,out);

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0,MUX41_TB);
    end
    initial begin
        i0 = 5;
        i1 = 4;
        i2 = 89;
        i3 = 789;
        
        #5 sel = 0;
        #5 sel = 1;
        #5 sel = 2;
        #5 sel = 3;
        #5 $finish;
    end

endmodule