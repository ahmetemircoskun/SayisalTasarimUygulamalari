// Minterm
module emir(em49,A,B,C,D);

input A,C,B,D;
output em49;
wire m1,m2,m3,m4,m5;
wire notA,notB,notC,notD;

not(notA,A);
not(notB,B);
not(notC,C);
not(notD,D);

and(m1,notA,notB,notC,notD);
and(m2,notA,notB,notC,D);
and(m3,A,B,notC,notD);
and(m4,A,B,notC,D);
and(m5,A,notB,C,D);

or(em49,m1,m2,m3,m4,m5);

endmodule

// Maxterm
module coskun(n00,A,B,C,D);

input A,C,B,D;
output n00;
wire M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11;
wire notA,notB,notC,notD;

not(notA,A);
not(notB,B);
not(notC,C);
not(notD,D);

or(M1,A,B,notC,D);
or(M2,A,B,notC,notD);
or(M3,A,notB,C,D);
or(M4,A,notB,C,notD);
or(M5,A,notB,notC,D);
or(M6,A,notB,notC,notD);
or(M7,notA,B,C,D);
or(M8,notA,B,C,notD);
or(M9,notA,B,notC,D);
or(M10,notA,notB,notC,D);
or(M11,notA,notB,notC,notD);

and(n00,M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11);

endmodule

// Test
module test;
reg A,B,C,D;
wire em49,n00;

emir min(em49,A,B,C,D);
coskun max(n00,A,B,C,D);

initial begin
    A=0; B=0; C=0; D=0; #10;
    A=0; B=0; C=0; D=1; #10;
    A=0; B=0; C=1; D=0; #10;
    A=0; B=0; C=1; D=1; #10;
    A=0; B=1; C=0; D=0; #10;
    A=0; B=1; C=0; D=1; #10;
    A=0; B=1; C=1; D=0; #10;
    A=0; B=1; C=1; D=1; #10;
    A=1; B=0; C=0; D=0; #10;
    A=1; B=0; C=0; D=1; #10;
    A=1; B=0; C=1; D=0; #10;
    A=1; B=0; C=1; D=1; #10;
    A=1; B=1; C=0; D=0; #10;
    A=1; B=1; C=0; D=1; #10;
    A=1; B=1; C=1; D=0; #10;
    A=1; B=1; C=1; D=1; #10;
    $finish;
end
endmodule