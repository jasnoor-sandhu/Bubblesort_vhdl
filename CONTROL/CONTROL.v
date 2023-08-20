module CONTROL(
    input clk,
    input start,
    input lt,
    output reg rd, wr, operation, clr,preset,
    output reg m3_sel, m5_sel, m6_sel,
    output reg [1:0] m1_sel, m4_sel, m2_sel,
    output reg ln, li, lj, lk, la, lb,
    output [3:0] state_out
);
// output reg state_out

    reg [3:0] state;
    initial begin
        state = 0;
        {rd, wr, operation,clr, preset,m3_sel,m5_sel,m6_sel} = 8'b0;
        m1_sel = 0;
        m4_sel = 0;
        m2_sel = 0;
        {ln,li,lj,lk,la,lb} <= 6'b0;
    end

    always @(*) begin
        case(state)
        0: begin
            {ln,li,lj,lk,la,lb} <= 6'b0;
        end
        1: begin
            clr <= 1;
            m6_sel <= 0;
            lj <= 1;
        end

        2: begin
            clr <=0;
            {ln,li,lj,lk,la,lb} <= 6'b0;
            m1_sel <=1;
            m2_sel <= 0;
            operation <= 0;
        end

        3: begin
            li <= 1;
            m5_sel <= 0;
        end

        4: begin
            {ln,li,lj,lk,la,lb} <= 6'b0;
            m1_sel <= 0;
            m2_sel <= 0;
            operation <= 0;
        end

        5: begin
            la <=1;
            m4_sel <=0;
            rd <= 1;
            m1_sel <= 0;
            m2_sel <= 2;
            operation <= 1;
            lk <= 1;
        end

        6: begin
            la <= 0;
            lk <= 0;
            m4_sel <= 2;
            rd <= 1;
            lb <= 1;
        end

        7: begin
            {ln,li,lj,lk,la,lb} <= 6'b0;
            rd <= 0;
            m1_sel <= 2;
            m2_sel <= 1;
            operation <= 0;
        end

        8: begin
            {ln,li,lj,lk,la,lb} <= 6'b0;
            m4_sel <=0;
            m3_sel <= 1;
            wr <= 1;
        end

        9: begin
            {ln,li,lj,lk,la,lb} <= 6'b0;
            m4_sel <= 2;
            m3_sel <= 0;
            wr <= 1;
        end

        10: begin
            wr <= 0;
            m1_sel <= 0;
            m2_sel <= 2;
            operation <= 1;
            m5_sel <= 1;
            li <= 1;
        end

        11: begin
            li <= 0;
            lj<= 0;
            m1_sel <= 1;
            m2_sel <= 2;
            operation <= 1;
            m6_sel <= 1;
        end

        12: begin
            preset <= 1;
        end

        endcase
    end

    always @(posedge clk) begin
        case(state)

        //RESET STATE
        0: begin
            // {ln,li,lj,lk,la,lb} <= 6'b0;
            if(start) state <= 1;
            else state <= state;
        end

        1: begin
            // clr <= 1;
            // m6_sel <= 0;
            // lj <= 1;
            state <= 2;
        end

        2: begin
            // clr <=0;
            // {ln,li,lj,lk,la,lb} <= 6'b0;
            // m1_sel <=1;
            // m2_sel <= 0;
            // operation <= 0;
            if(lt) state <= 3;
            else state <= 12;
        end

        3: begin
            // li <= 1;
            // m5_sel <= 0;
            state <= 4;
        end

        4: begin
            // {ln,li,lj,lk,la,lb} <= 6'b0;
            // m1_sel <= 0;
            // m2_sel <= 0;
            // operation <= 0;
            if(lt) state <= 5;
            else state <= 11;
        end

        5: begin
            // la <=1;
            // m4_sel <=0;
            // rd <= 1;
            // m1_sel <= 0;
            // m2_sel <= 2;
            // operation <= 1;
            // lk <= 1;
            state <= 6;
        end

        6: begin
            // la <= 0;
            // lk <= 0;
            // m4_sel <= 2;
            // rd <= 1;
            // lb <= 1;
            state <= 7;
        end

        7: begin
            // {ln,li,lj,lk,la,lb} <= 6'b0;
            // rd <= 0;
            // m1_sel <= 2;
            // m2_sel <= 1;
            // operation <= 0;
            if (lt) state <= 8;
            else state <= 10;
        end

        8: begin
            // {ln,li,lj,lk,la,lb} <= 6'b0;
            // m4_sel <=0;
            // m3_sel <= 1;
            // wr <= 1;
            state <= 9;
        end

        9: begin
            // {ln,li,lj,lk,la,lb} <= 6'b0;
            // m4_sel <= 2;
            // m3_sel <= 0;
            // wr <= 1;
            state <= 10;
        end

        10: begin
            // wr <= 0;
            // m1_sel <= 0;
            // m2_sel <= 2;
            // operation <= 1;
            // m5_sel <= 1;
            // li <= 1;
            state <= 4;
        end

        11: begin
            // li <= 0;
            // lj<= 0;
            // m1_sel <= 1;
            // m2_sel <= 2;
            // operation <= 1;
            // m6_sel <= 1;
            state <= 2;
            
        end

        12: begin
            // preset <= 1;
            if(start) state <= state;
            else state <= 0;
        end

        endcase
    end
    // always @(*) begin
    //     state_out <= state;
    // end
    assign state_out = state;



endmodule