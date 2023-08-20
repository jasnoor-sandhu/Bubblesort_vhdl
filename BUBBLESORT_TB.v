`timescale 1ns/1ps

module bubblesort_tb ();
    reg clk;
    reg start;
    wire complete;
    wire [3:0] state_out;

    bubblesort UUT(clk, start, complete, state_out);
    
    initial begin
        $dumpfile("wave_bub.vcd");
        $dumpvars(0,bubblesort_tb);
    end

    initial begin

        //Replace "Data.txt" with the file containing unsorted elements.
        $readmemh("Data.txt",UUT.MEM.ram);

        clk = 0;
        start = 0;

        #10
        start = 1;

        //provide sufficient time to complete the sorting
        #4000
        //Getting output in "out.txt" file
        $writememh("out.txt",UUT.MEM.ram);
        #10
        $finish;
    end
    // giving clock of Timeperiod = 10 ns
    always clk = #5 ~clk;
endmodule