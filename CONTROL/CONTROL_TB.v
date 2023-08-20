`timescale 1ns/1ps

module control_tb();

reg clk;
reg start;
reg lt;
wire rd, wr, operation, clr,preset;
wire m3_sel, m5_sel, m6_sel;
wire [1:0] m1_sel, m4_sel, m2_sel;
wire ln, li, lj, lk, la, lb;
wire [3:0] state_out;

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0,control_tb);
end

CONTROL uut(clk, start,lt,
            rd, wr, operation, clr, preset,
            m3_sel, m5_sel, m6_sel,
            m1_sel, m4_sel, m2_sel,
            ln, li, lj, lk, la, lb,
            state_out
);

initial begin
    clk = 0;
    start = 0;
    lt = 0;

    #2 start = 1; lt = 1;
    #80
    lt = 0;
    #150
    $finish;

end

always clk =#5 ~clk;
endmodule