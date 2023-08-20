module ram_tb ();

    reg clk;
    reg [15:0] data_in;
    reg rd;
    reg wr;
    reg [9:0] address;

    wire [15:0] data_out;
    reg [15:0] data_out_reg;

    RAM uut (
        clk, data_in, rd, wr, address, data_out
    );

    initial begin
        $dumpfile("MEM_tb.vcd");
        $dumpvars(0, ram_tb);
        $monitor("%t, | rd = %d | wr = %d | data_in = %d | data_out = %d", $time, rd, wr, data_in, data_out);
    end

    initial begin
        clk = 0;
        rd = 0;
        wr = 0;
        address = 0;
        data_in = 0;

        #30
        wr = 1;
        address = 1;
        data_in = 1;
        #10 
        address = 2;
        data_in = 2;
        #10
        wr = 0;
        #10
        rd = 1;
        address = 1;
        #10
        address = 2;

        #20
        $finish;

    end



    always clk = #5 ~clk;

    
endmodule