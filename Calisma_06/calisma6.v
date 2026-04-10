module carpim (
    input [1:0] sayiA,
    input [1:0] sayiB,
    output [3:0] sonucC
);

wire t1, t2, t3, t4;

and(sonucC[0], sayiA[0], sayiB[0]);
and(t1, sayiA[1], sayiB[0]);
and(t2, sayiA[0], sayiB[1]);

xor(sonucC[1], t1, t2);

and(t3, t1, t2);
and(t4, sayiA[1], sayiB[1]);

xor(sonucC[2], t3, t4);

and(sonucC[3], t3, t4);

endmodule


module decoder (
    input [3:0] girisD,
    output [15:0] cikisE
);

wire n0, n1, n2, n3;

not(n0, girisD[0]);
not(n1, girisD[1]);
not(n2, girisD[2]);
not(n3, girisD[3]);

and(cikisE[0], n3, n2, n1, n0);
and(cikisE[1], n3, n2, n1, girisD[0]);
and(cikisE[2], n3, n2, girisD[1], n0);
and(cikisE[3], n3, n2, girisD[1], girisD[0]);
and(cikisE[4], n3, girisD[2], n1, n0);
and(cikisE[5], n3, girisD[2], n1, girisD[0]);
and(cikisE[6], n3, girisD[2], girisD[1], n0);
and(cikisE[7], n3, girisD[2], girisD[1], girisD[0]);
and(cikisE[8], girisD[3], n2, n1, n0);
and(cikisE[9], girisD[3], n2, n1, girisD[0]);
and(cikisE[10], girisD[3], n2, girisD[1], n0);
and(cikisE[11], girisD[3], n2, girisD[1], girisD[0]);
and(cikisE[12], girisD[3], girisD[2], n1, n0);
and(cikisE[13], girisD[3], girisD[2], n1, girisD[0]);
and(cikisE[14], girisD[3], girisD[2], girisD[1], n0);
and(cikisE[15], girisD[3], girisD[2], girisD[1], girisD[0]);

endmodule


module segment7 (
    input [15:0] girisF,
    output [6:0] segG
);

or(segG[6], girisF[0], girisF[2], girisF[3], girisF[5], girisF[6], girisF[7], girisF[8], girisF[9]);
or(segG[5], girisF[0], girisF[1], girisF[2], girisF[3], girisF[4], girisF[7], girisF[8], girisF[9]);
or(segG[4], girisF[0], girisF[1], girisF[3], girisF[4], girisF[5], girisF[6], girisF[7], girisF[8], girisF[9]);
or(segG[3], girisF[0], girisF[2], girisF[3], girisF[5], girisF[6], girisF[8], girisF[9]);
or(segG[2], girisF[0], girisF[2], girisF[6], girisF[8]);
or(segG[1], girisF[0], girisF[4], girisF[5], girisF[6], girisF[8], girisF[9]);
or(segG[0], girisF[2], girisF[3], girisF[4], girisF[5], girisF[6], girisF[8], girisF[9]);

endmodule


module carpim_segment7 (
    input [1:0] giris1,
    input [1:0] giris2,
    output [6:0] cikti_segment
);

wire [3:0] araSonuc;
wire [15:0] decoderOut;

carpim carp(giris1, giris2, araSonuc);
decoder decode(araSonuc, decoderOut);
segment7 segModul(decoderOut, cikti_segment);

endmodule


module testmodul;

reg [1:0] giris1;
reg [1:0] giris2;
wire [6:0] segmentSonuc;

carpim_segment7 dut(giris1, giris2, segmentSonuc);

initial begin
    giris1 = 2'b00; giris2 = 2'b00; #10;
    giris1 = 2'b00; giris2 = 2'b01; #10;
    giris1 = 2'b00; giris2 = 2'b10; #10;
    giris1 = 2'b00; giris2 = 2'b11; #10;
    giris1 = 2'b01; giris2 = 2'b00; #10;
    giris1 = 2'b01; giris2 = 2'b01; #10;
    giris1 = 2'b01; giris2 = 2'b10; #10;
    giris1 = 2'b01; giris2 = 2'b11; #10;
    giris1 = 2'b10; giris2 = 2'b00; #10;
    giris1 = 2'b10; giris2 = 2'b01; #10;
    giris1 = 2'b10; giris2 = 2'b10; #10;
    giris1 = 2'b10; giris2 = 2'b11; #10;
    giris1 = 2'b11; giris2 = 2'b00; #10;
    giris1 = 2'b11; giris2 = 2'b01; #10;
    giris1 = 2'b11; giris2 = 2'b10; #10;
    giris1 = 2'b11; giris2 = 2'b11; #10;
    $stop;
end

endmodule