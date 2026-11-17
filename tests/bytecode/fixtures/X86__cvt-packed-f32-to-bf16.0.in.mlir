"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xf32>) -> vector<8xbf16>, sym_name = "avx512bf16_cvt_packed_f32_to_bf16_256"}> ({
  ^bb0(%arg1: vector<8xf32> loc("<stdin>":3:8)):
    %1 = "x86.avx512.cvt.packed.f32_to_bf16"(%arg1) : (vector<8xf32>) -> vector<8xbf16> loc("<stdin>":4:10)
    "func.return"(%1) : (vector<8xbf16>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (vector<16xf32>) -> vector<16xbf16>, sym_name = "avx512bf16_cvt_packed_f32_to_bf16_512"}> ({
  ^bb0(%arg0: vector<16xf32> loc("<stdin>":8:8)):
    %0 = "x86.avx512.cvt.packed.f32_to_bf16"(%arg0) : (vector<16xf32>) -> vector<16xbf16> loc("<stdin>":9:10)
    "func.return"(%0) : (vector<16xbf16>) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
}) : () -> () loc("<stdin>":1:1)
