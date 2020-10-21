module lab1_tb;
    reg[7:0] d;
    reg[3:0] X; 
    reg[3:0] Y;
    reg clk, muxc;
    reg[7:0] a;
    reg[7:0] b;
    wire[7:0] dff_q;
    wire[7:0] q; 
    wire[7:0] Z;

    // Instantiate design under test 

    dff_lab1 DFF_LAB1(.d(d), .clk(clk), .dff_q(dff_q));
    multipler MULTIPLER(.X(X), .Y(Y), .Z(Z));
    multiplexor MULTIPLEXOR(.a(a), .b(b), .muxc(muxc), .q(q));

    initial begin
        // Dump waveforms
        $dumpfile("dump.vcd");
        $dumpvars;

        $display("Reset");
        muxc = 0;
        X = 0;
        Y = 0;
        d = 0;
        clk = 0;
        a = Z;
        d = Z;
        b = dff_q;
        display;

        $display("Test multiplexor 1*1=1");
        muxc = 1;
        X = 1;
        Y = 1;
        a = Z;
        d = Z;
        b = dff_q;
        display;

        $display("Test multiplexor 2*1=2");
        muxc = 1;
        X = 2;
        Y = 1;
        a = Z;
        d = Z;
        b = dff_q;
        display;

        $display("Test multiplexor 2*2=4");
        muxc = 1;
        X = 2;
        Y = 2;
        a = Z;
        b = dff_q;
        display;

        $display("Store \"4\" in D flipflop");
        muxc = 1;
        a = Z;
        d = Z;
        b = dff_q;
        clk = 1;
        display;

        $display("Set q to 0");
        muxc = 1;
        X = 0;
        Y = 0;
        a = Z;
        b = dff_q;
        display;

        $display("Read \"4\" from flipflop");
        muxc = 0;
        clk = 1;
        a = Z;
        b = dff_q;
        display;
    end

    task display;
        #1 $display(" muxc:%d, clk:%d, q:%d", muxc, clk, q);
    endtask

endmodule