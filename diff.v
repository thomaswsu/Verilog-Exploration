module dff_lab1(input[7:0] d, input clk, output reg[7:0] dff_q); 
    always @(posedge clk) begin
            dff_q <= d;
        end
endmodule