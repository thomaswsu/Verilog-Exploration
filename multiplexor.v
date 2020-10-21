module multiplexor(input[7:0] a, input[7:0] b, input muxc, output[7:0] q);
    assign q = a ? muxc : b;
endmodule