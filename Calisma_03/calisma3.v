// Minterm
module emir(e49,A,B,C,D);

input A,B,C,D;
output e49;
wire notA, notB, notC, notD;
wire e1, e2, e3;

not (notA,A);
not (notB,B);
not (notC,C);
not (notD,D);

and (e1,notA,D);
and (e2,notB,notD);
and (e3,A,C,notD);

or (e49,e1,e2,e3);
endmodule

// Maxterm
module coskun(n00,A,B,C,D);

input A,B,C,D;
output n00;
wire notA,notB,notC,notD;
wire e1,e2,e3;

not (notA,A);
not (notB,B);
not (notC,C);
not (notD,D);

or (e1,notB,C,D);
or (e2,A,notB,D);
or (e3,notA,notD);

and (n00,e1,e2,e3);

endmodule

// Test
module test;
reg A,B,C,D;
wire e49,n00;

emir minterm(e49,A,B,C,D);
coskun maxterm(n00,A,B,C,D);

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