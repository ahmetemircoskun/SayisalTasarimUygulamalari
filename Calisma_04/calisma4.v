// Modul
module emircoskun(A,B,C,D,COS);

input A,B,C,D;
output COS;
wire EC1,EC2,EC3,EC4,EC5;

nand (EC1,A,A);
nand (EC2,D,D);
nand (EC3,C,C);
nand (EC4,EC1,EC2);
nand (EC5,EC2,EC3);
nand (COS,EC4,EC5);

endmodule

// Test
module test_modulu;
reg A,B,C,D;
wire COS;

emircoskun ec_test(A,B,C,D,COS);

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