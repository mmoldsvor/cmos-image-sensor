/* Generated by Yosys 0.9 (git sha1 1979e0b1, gcc 10.3.0-1ubuntu1~20.10 -fPIC -Os) */

(* dynports =  1  *)
(* top =  1  *)
(* src = "decoder.sv:1" *)
module decoder(enable, select, out);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire _06_;
  wire _07_;
  wire _08_;
  wire _09_;
  wire _10_;
  wire _11_;
  wire _12_;
  (* src = "decoder.sv:2" *)
  wire _13_;
  wire _14_;
  wire _15_;
  wire _16_;
  wire _17_;
  wire _18_;
  wire _19_;
  wire _20_;
  wire _21_;
  (* src = "decoder.sv:4" *)
  wire _22_;
  (* src = "decoder.sv:4" *)
  wire _23_;
  (* src = "decoder.sv:4" *)
  wire _24_;
  (* src = "decoder.sv:4" *)
  wire _25_;
  (* src = "decoder.sv:4" *)
  wire _26_;
  (* src = "decoder.sv:4" *)
  wire _27_;
  (* src = "decoder.sv:4" *)
  wire _28_;
  (* src = "decoder.sv:4" *)
  wire _29_;
  (* src = "decoder.sv:3" *)
  wire _30_;
  (* src = "decoder.sv:3" *)
  wire _31_;
  (* src = "decoder.sv:3" *)
  wire _32_;
  (* src = "decoder.sv:2" *)
  input enable;
  (* src = "decoder.sv:4" *)
  output [7:0] out;
  (* src = "decoder.sv:3" *)
  input [2:0] select;
  IVX1_CV _33_ (
    .A(_31_),
    .Y(_14_)
  );
  IVX1_CV _34_ (
    .A(_32_),
    .Y(_15_)
  );
  NRX1_CV _35_ (
    .A(_31_),
    .B(_30_),
    .Y(_16_)
  );
  ANX1_CV _36_ (
    .A(_15_),
    .B(_13_),
    .Y(_17_)
  );
  ANX1_CV _37_ (
    .A(_16_),
    .B(_17_),
    .Y(_22_)
  );
  ANX1_CV _38_ (
    .A(_14_),
    .B(_30_),
    .Y(_18_)
  );
  ANX1_CV _39_ (
    .A(_17_),
    .B(_18_),
    .Y(_23_)
  );
  NRX1_CV _40_ (
    .A(_14_),
    .B(_30_),
    .Y(_19_)
  );
  ANX1_CV _41_ (
    .A(_17_),
    .B(_19_),
    .Y(_24_)
  );
  ANX1_CV _42_ (
    .A(_31_),
    .B(_30_),
    .Y(_20_)
  );
  ANX1_CV _43_ (
    .A(_17_),
    .B(_20_),
    .Y(_25_)
  );
  ANX1_CV _44_ (
    .A(_32_),
    .B(_13_),
    .Y(_21_)
  );
  ANX1_CV _45_ (
    .A(_16_),
    .B(_21_),
    .Y(_26_)
  );
  ANX1_CV _46_ (
    .A(_18_),
    .B(_21_),
    .Y(_27_)
  );
  ANX1_CV _47_ (
    .A(_19_),
    .B(_21_),
    .Y(_28_)
  );
  ANX1_CV _48_ (
    .A(_20_),
    .B(_21_),
    .Y(_29_)
  );
  assign _31_ = select[1];
  assign _30_ = select[0];
  assign _32_ = select[2];
  assign _13_ = enable;
  assign out[0] = _22_;
  assign out[1] = _23_;
  assign out[2] = _24_;
  assign out[3] = _25_;
  assign out[4] = _26_;
  assign out[5] = _27_;
  assign out[6] = _28_;
  assign out[7] = _29_;
endmodule
