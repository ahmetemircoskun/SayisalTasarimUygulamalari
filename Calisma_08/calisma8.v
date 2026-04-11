`timescale 1ns/1ps // Zaman ölçeği: 1 ns çözünürlük, 1 ps hassasiyet

// (a) JK Flip-Flop Modülü

module jk_ff(
    input wire J, // J girişi
    input wire K, // K girişi
    input wire clk, // Saat girişi
    input wire rst, // Asenkron reset (aktif yüksek)
    output reg Q, // Q çıkışı
    output Qnot // Q'nun tersi
);

// Pozitif kenarda veya reset aktif iken tetiklenir.
always @(posedge clk or posedge rst) begin
    if (rst) Q <= 1'b0; // Reset: Q=0
    else if (J & ~K) Q <= 1'b1; // Set
    else if (~J & K) Q <= 1'b0; // Reset
    else if (J & K) Q <= ~Q; // Toggle
    // J=K=0 ise Q olduğu gibi kalır
end

assign Qnot 
endmodule


// (b) 4-Bit Asenkron Sekanslı Sayaç

module seq_counter(
    input wire clk, // Saat sinyali
    input wire rst, // Asenkron reset (aktif yüksek)
    output wire [3:0]q, // 4 bitlik çıkış
);

wire [3:0] qnot; // Her flip-flop için ters çıkışlar
reg [3:0] next_state; // Bir sonraki durumu tutar

// Kombinasyonel: mevcut q'ya göre next_state belirleme
always @(*) begin
    case (q)
        4'd14: next_state = 4'd12;
        4'd12: next_state = 4'd10;
        4'd10: next_state = 4'd8;
        4'd8 : next_state = 4'd6;
        4'd6 : next_state = 4'd4;
        4'd4 : next_state = 4'd2;
        4'd2 : next_state = 4'd3;
        4'd3 : next_state = 4'd5;
        4'd5 : next_state = 4'd7;
        4'd7 : next_state = 4'd11;
        4'd11: next_state = 4'd13;
        4'd13: next_state = 4'd14;
        default: next_state = 4'd14; // Reset sonrası başlangıç
    endcase
end

// Her bit için J/K sinyalleri: J=~q & next, K=q & ~next
wire J0 = ~q[0] & next_state[0];
wire K0 = q[0] & ~next_state[0];
wire J1 = ~q[1] & next_state[1];
wire K1 = q[1] & ~next_state[1];
wire J2 = ~q[2] & next_state[2];
wire K2 = q[2] & ~next_state[2];
wire J3 = ~q[3] & next_state[3];
wire K3 = q[3] & ~next_state[3];

// Dört adet JK flip-flop
jk_ff ff0(.J(J0), .K(K0), .clk(clk), .rst(rst), .Q(q[0]), .Qnot(qnot[0]));
jk_ff ff1(.J(J1), .K(K1), .clk(clk), .rst(rst), .Q(q[1]), .Qnot(qnot[1]));
jk_ff ff2(.J(J2), .K(K2), .clk(clk), .rst(rst), .Q(q[2]), .Qnot(qnot[2]));
jk_ff ff3(.J(J3), .K(K3), .clk(clk), .rst(rst), .Q(q[3]), .Qnot(qnot[3]));

endmodule


// Test Bench Modülü

module test;

reg clk; // Saat kaydı
reg rst; // Reset kaydı
wire [3:0] q; // Sayaç çıkışı

// DUT: seq_counter örneği
seq_counter uut (
    .clk(clk),
    .rst(rst),
    .q(q)
);

// Saat dalgası: her 5 ns’de bir toggle → 10 ns periyot
initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end

// Reset uygulama ve simülasyonu sonlandırma
initial begin
    // Konsola başlık yaz
    $display("Time(ns)\tq");
    // q her değiştiğinde zaman ve değeri yaz
    $monitor("%0d\t\t%0b", $time, q);

    rst = 1'b1; // Önce reset aktif
    #20; // 20 ns bekle
    rst = 1'b0; // Reset pasif

    #500; // 500 ns (50 clock) daha çalıştır
    $finish; // Simülasyonu bitir
end

endmodule