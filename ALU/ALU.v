module ALU (
    input [15:0] op1,
    input [15:0] op2,
    input operation,
    output reg lt,
    output reg [15:0] result

);

//operation : 0-> compare, 1-> add
// lt : (op1<op2)? 1:0;

always @(*) begin
    if(operation) begin
        result = op1 + op2;
        lt = 1'bz;
    end
    else begin
        result = 16'bz;
        lt = (op1<op2);
    end
end


endmodule