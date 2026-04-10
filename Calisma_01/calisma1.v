/* 
a)
Y = AB + A'BC + BD'

minterm:
Y = A'BC'D' + A'BCD' + A'BCD + ABC'D' + ABC'D + ABCD' + ABCD
Y = ?m(4,6,7,12,13,14,15)

maxterm:
Y = (A+B+C+D)(A+B+C+D')(A+B+C'+D)(A+B+C'+D')
    (A+B'+C+D')(A'+B+C+D)(A'+B+C+D')(A'+B+C'+D)(A'+B+C'+D')
Y = ?M(0,1,2,3,5,8,9,10,11)
*/

// b)
module coskun(a,b,c,d,n49);
input a, b, c, d;
output n49;
wire na, nb, nc, nd, o1, o2, o3, o4, o5, o6, o7, o8, o9;

not(na,a);
not(nb,b);
not(nc,c);
not(nd,d);

or(o1,a,b,c,d);
or(o2,a,b,c,nd);
or(o3,a,b,nc,d);
or(o4,a,b,nc,nd);
or(o5,a,nb,c,nd);
or(o6,na,b,c,d);
or(o7,na,b,c,nd);
or(o8,na,b,nc,d);
or(o9,na,b,nc,nd);

and(n49,o1,o2,o3,o4,o5,o6,o7,o8,o9);

endmodule

// c)
module emir(a,b,c,d,e21);
input a, b, c, d;
output e21;
wire na, nc, nd, a1, a2, a3, a4, a5, a6, a7;

not(na,a);
not(nc,c);
not(nd,d);

and(a1,na,b,nc,nd);
and(a2,na,b,c,nd);
and(a3,na,b,c,d);
and(a4,a,b,nc,nd);
and(a5,a,b,nc,d);
and(a6,a,b,c,nd);
and(a7,a,b,c,d);

or(e21,a1,a2,a3,a4,a5,a6,a7);

endmodule

// d)
module tb();
reg a, b, c, d;
wire e21, n49;

coskun coskun_ornek(a, b, c, d, n49);
emir emir_ornek(a, b, c, d, e21);

initial begin
    a=0; b=0; c=0; d=0; #10;
    a=0; b=0; c=0; d=1; #10;
    a=0; b=0; c=1; d=0; #10;
    a=0; b=0; c=1; d=1; #10;
    a=0; b=1; c=0; d=0; #10;
    a=0; b=1; c=0; d=1; #10;
    a=0; b=1; c=1; d=0; #10;
    a=0; b=1; c=1; d=1; #10;
    a=1; b=0; c=0; d=0; #10;
    a=1; b=0; c=0; d=1; #10;
    a=1; b=0; c=1; d=0; #10;
    a=1; b=0; c=1; d=1; #10;
    a=1; b=1; c=0; d=0; #10;
    a=1; b=1; c=0; d=1; #10;
    a=1; b=1; c=1; d=0; #10;
    a=1; b=1; c=1; d=1; #10;
    $stop;
end

endmodule
