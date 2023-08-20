`timescale 1ns/1ps

module mux21_tb ();

reg [15:0] i0;
reg [15:0] i1;
reg sel;

wire [15:0] out;

MUX21 uut(i0, i1, sel, out);

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,mux21_tb);
end



initial begin

    i0 = 567;
    i1 = 22;
    
    #5 sel = 1;
    #5 sel = 0;
    #10 $finish;
end

    
endmodule