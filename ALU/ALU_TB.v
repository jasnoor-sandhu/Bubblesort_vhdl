`timescale 1ns/1ps

module ALU_TB ();
    
    reg [15:0] op1;
    reg [15:0] op2;
    reg operation;

    wire lt;
    wire [15:0] result;

    ALU uut(op1, op2, operation, lt, result);

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, ALU_TB);
    end

    initial begin
        op1 = 34;
        op2 = 45;
        operation = 1;
        #5 operation = 0;
        #5
        operation = 1;
        op1 = 55;
        #5 operation = 0;
        #5 $finish;

    end
    

endmodule