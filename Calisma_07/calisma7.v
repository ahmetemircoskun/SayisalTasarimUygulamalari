module t_flip_flop(
    input T,
    input clk,
    input reset,
    output reg Q,
    output Qnot
);

assign Qnot = ~Q;

always @(posedge clk or posedge reset) begin
    if (reset)
        Q <= 1'b0;
    else if (T)
        Q <= ~Q;
end

endmodule


module sifir_dokuz_sayici(
    input clk,
    input reset,
    output [3:0] sayac
);

wire q0, q1, q2, q3;

t_flip_flop ff0(1'b1, clk, reset, q0, );
t_flip_flop ff1(q0, clk, reset, q1, );
t_flip_flop ff2(q0 & q1, clk, reset, q2, );
t_flip_flop ff3(q0 & q1 & q2, clk, reset, q3, );

assign sayac = {q3,q2,q1,q0};

endmodule


module kontrolcu(
    input clk,
    input harici_reset,
    output [3:0] sayac
);

wire reset_aktif;
wire [3:0] gecici_sayac;

assign reset_aktif = harici_reset | (gecici_sayac == 4'd9);
sifir_dokuz_sayici sayici1(clk, reset_aktif, gecici_sayac);
assign sayac = gecici_sayac;

endmodule


module test;

reg clk = 0;
reg harici_reset = 1;
wire [3:0] sayac;

kontrolcu dut(clk, harici_reset, sayac);

always #5 clk = ~clk;

initial begin
    $display("Zaman\tSayac");
    $monitor("%g\t%d", $time, sayac);

    #12 harici_reset = 0; // Başlangıçta kısa süre reset
    #300 $finish;
end

endmodule