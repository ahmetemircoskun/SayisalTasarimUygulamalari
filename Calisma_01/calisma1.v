/* 
a)
Y = AB + A'BC + BD'

Mintermler:
Y = A'BC'D' + A'BCD' + A'BCD + ABC'D' + ABC'D + ABCD' + ABCD
Y = m(4,6,7,12,13,14,15)

Maxtermler:
Y = (A+B+C+D)(A+B+C+D')(A+B+C'+D)(A+B+C'+D')
    (A+B'+C+D')(A'+B+C+D)(A'+B+C+D')(A'+B+C'+D)(A'+B+C'+D')
Y = M(0,1,2,3,5,8,9,10,11)
*/

// b) Maxterm Modülü (POS)
module coskun(a, b, c, d, n49);
    input a, b, c, d;
    output n49;
    wire na, nb, nc, nd;
    wire o1, o2, o3, o4, o5, o6, o7, o8, o9;

    not(na, a);
    not(nb, b);
    not(nc, c);
    not(nd, d);

    or(o1, a, b, c, d);      // M0
    or(o2, a, b, c, nd);     // M1
    or(o3, a, b, nc, d);     // M2
    or(o4, a, b, nc, nd);    // M3
    or(o5, a, nb, c, nd);    // M5
    or(o6, na, b, c, d);     // M8
    or(o7, na, b, c, nd);    // M9
    or(o8, na, b, nc, d);    // M10
    or(o9, na, b, nc, nd);   // M11

    and(n49, o1, o2, o3, o4, o5, o6, o7, o8, o9);
endmodule

// c) Minterm Modülü (SOP)
module emir(a, b, c, d, e21);
    input a, b, c, d;
    output e21;
    wire na, nb, nc, nd; // nb ve nc eklendi
    wire a1, a2, a3, a4, a5, a6, a7;

    not(na, a);
    not(nb, b);
    not(nc, c);
    not(nd, d);

    and(a1, na, b, nc, nd); // m4
    and(a2, na, b, c, nd);  // m6
    and(a3, na, b, c, d);   // m7
    and(a4, a, b, nc, nd);  // m12
    and(a5, a, b, nc, d);   // m13
    and(a6, a, b, c, nd);   // m14
    and(a7, a, b, c, d);    // m15

    or(e21, a1, a2, a3, a4, a5, a6, a7);
endmodule

// d) Test Bench
module tb();
    reg a, b, c, d;
    wire e21, n49;

    // Modül çağırma
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
