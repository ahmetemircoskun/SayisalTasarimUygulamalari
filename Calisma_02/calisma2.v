// Minterm
module emir(em49,A,B,C,D);
    
input A,B,C,D;
output em49;
wire m0,m1,m11,m12,m13;
wire notA,notB,notC,notD;

not(notA,A);
not(notB,B);
not(notC,C);
not(notD,D);

and(m0,notA,notB,notC,notD);  // 0000 (0)
and(m1,notA,notB,notC,D);     // 0001 (1)
and(m11,A,notB,C,D);          // 1011 (11)
and(m12,A,B,notC,notD);       // 1100 (12)
and(m13,A,B,notC,D);          // 1101 (13)

or(em49,m0,m1,m11,m12,m13);

endmodule

// Maxterm
module coskun(n00,A,B,C,D);
input A,B,C,D;
output n00;
wire M2,M3,M4,M5,M6,M7,M8,M9,M10,M14,M15;
wire notA,notB,notC,notD;

not(notA,A);
not(notB,B);
not(notC,C);
not(notD,D);

or(M2,A,B,notC,D);            // 0010 (2)
or(M3,A,B,notC,notD);         // 0011 (3)
or(M4,A,notB,C,D);            // 0100 (4)
or(M5,A,notB,C,notD);         // 0101 (5)
or(M6,A,notB,notC,D);         // 0110 (6)
or(M7,A,notB,notC,notD);      // 0111 (7)
or(M8,notA,B,C,D);            // 1000 (8)
or(M9,notA,B,C,notD);         // 1001 (9)
or(M10,notA,B,notC,D);        // 1010 (10)
or(M14,notA,notB,notC,D);     // 1110 (14)
or(M15,notA,notB,notC,notD);  // 1111 (15)

and(n00,M2,M3,M4,M5,M6,M7,M8,M9,M10,M14,M15);

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
