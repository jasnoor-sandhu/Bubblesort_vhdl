module bubblesort (
    input clk,
    input start,
    output complete,
    output [3:0] state_out
);

    // data_n1 => length of array to be sorted.
    reg [15:0] data_n1;
    reg rst;
    initial begin
        data_n1 = 16'd7;
        rst = 0;    
    end

    // wires
    wire rd, wr, operation, clr,preset;
    wire m3_sel, m5_sel, m6_sel;
    wire [1:0] m1_sel, m4_sel, m2_sel;
    wire ln, li, lj, lk, la, lb;
    wire [15:0] data_in, data_out, result;
    wire [15:0] address;
    wire [15:0] op1, op2;
    wire lt;
    wire [15:0] m5_out, m6_out;
    wire [15:0] n_out, i_out, j_out, k_out, a_out, b_out;

    //END of Code block
    reg eoc;
    initial begin
        eoc = 0;
    end

    //Instansiating modules
    RAM MEM(clk, data_in ,rd, wr, address[9:0], data_out);
    ALU alu(op1, op2, operation, lt, result);
    CONTROL CU(clk, start,lt,
            rd, wr, operation, clr, preset,
            m3_sel, m5_sel, m6_sel,
            m1_sel, m4_sel, m2_sel,
            ln, li, lj, lk, la, lb,
            state_out
    );

    // registers
    REG16 n1(clk,rst,1'b1, data_n1, n_out);
    REG16 i(clk,rst,li, m5_out, i_out);
    REG16 j(clk,rst,lj, m6_out, j_out);
    REG16 k(clk,rst,lk, result, k_out);
    REG16 a(clk,rst,la, data_out, a_out);
    REG16 b(clk,rst,lb, data_out, b_out);


    // MUX
    MUX41 m1(i_out, j_out,a_out, 16'b0, m1_sel,op1);
    MUX41 m2(n_out, b_out, 16'd1 , 16'b0, m2_sel, op2);
    MUX21 m3(a_out, b_out, m3_sel, data_in);
    MUX41 m4(i_out, j_out, k_out, 16'b0, m4_sel, address);
    MUX21 m5(16'b0, result, m5_sel, m5_out);
    MUX21 m6(16'b0, result, m6_sel, m6_out);

    //EOC Block
    always @(*) begin
        if(clr) eoc <= 0;
        else if (preset) eoc<=1;
        else eoc <= eoc;
    end
    assign complete = eoc;

endmodule