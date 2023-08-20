module ram_tb ();

    reg clk;
    reg [15:0] data_in;
    reg rd;
    reg wr;
    reg [9:0] address;

    wire [15:0] data_out;

    RAM uut (
        clk, data_in, rd, wr, address, data_out
    );

    initial begin
        $dumpfile("MEM_tb.vcd");
        $dumpvars(0, ram_tb);
        $monitor("%t, | rd = %d | wr = %d | data_in = %d | data_out = %d", $time, rd, wr, data_in, data_out);
    end

    initial begin
        $readmemh("Data.txt", uut.ram);
        #10
        $writememh("OUTPUT.txt",uut.ram);
        #10
        $finish;

    end



    always clk = #5 ~clk;

    
endmodule