// 2x1 Modul
module mux2x1 (
    input wire A,
    input wire B,
    input wire S,
    output wire Y
);

wire notS, and1, and2;

not (notS, S);
and (and1, notS, A);
and (and2, S, B);
or (Y, and1, and2);

endmodule


// 4x1 Modul
module mux4x1 (
    input wire A,
    input wire B,
    input wire C,
    input wire D,
    input wire [1:0] shift,
    output wire Y
);

wire w1, w2;

mux2x1 m1 (.A(A), .B(B), .S(shift[0]), .Y(w1));
mux2x1 m2 (.A(C), .B(D), .S(shift[0]), .Y(w2));
mux2x1 m3 (.A(w1), .B(w2), .S(shift[1]), .Y(Y));

endmodule


// Kaydirma Modulu
module kaydirici(
    input wire [1:0] shift,
    input wire [7:0] I,
    output wire [7:0] out
);

    mux4x1 m0 (.A(I[0]), .B(I[7]), .C(I[6]), .D(I[5]), .shift(shift), .Y(out[0]));
    mux4x1 m1 (.A(I[1]), .B(I[0]), .C(I[7]), .D(I[6]), .shift(shift), .Y(out[1]));
    mux4x1 m2 (.A(I[2]), .B(I[1]), .C(I[0]), .D(I[7]), .shift(shift), .Y(out[2]));
    mux4x1 m3 (.A(I[3]), .B(I[2]), .C(I[1]), .D(I[0]), .shift(shift), .Y(out[3]));
    mux4x1 m4 (.A(I[4]), .B(I[3]), .C(I[2]), .D(I[1]), .shift(shift), .Y(out[4]));
    mux4x1 m5 (.A(I[5]), .B(I[4]), .C(I[3]), .D(I[2]), .shift(shift), .Y(out[5]));
    mux4x1 m6 (.A(I[6]), .B(I[5]), .C(I[4]), .D(I[3]), .shift(shift), .Y(out[6]));
    mux4x1 m7 (.A(I[7]), .B(I[6]), .C(I[5]), .D(I[4]), .shift(shift), .Y(out[7]));

endmodule


// Test
module test_kaydirici;

reg [7:0] I;
reg [1:0] shift;
wire [7:0] out;

kaydirici kaydirici_ornegi(
    .I(I),
    .shift(shift),
    .out(out)
);

initial begin
    I = 8'b01101010;
    shift = 2'b11; #10;
end

endmodule