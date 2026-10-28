"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xf32>) -> vector<8xbf16>, sym_name = "avx512bf16_cvt_packed_f32_to_bf16_256"}> ({
  ^bb0(%arg1: vector<8xf32>):
    %1 = "x86vector.avx512.cvt.packed.f32_to_bf16"(%arg1) : (vector<8xf32>) -> vector<8xbf16>
    "func.return"(%1) : (vector<8xbf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<16xf32>) -> vector<16xbf16>, sym_name = "avx512bf16_cvt_packed_f32_to_bf16_512"}> ({
  ^bb0(%arg0: vector<16xf32>):
    %0 = "x86vector.avx512.cvt.packed.f32_to_bf16"(%arg0) : (vector<16xf32>) -> vector<16xbf16>
    "func.return"(%0) : (vector<16xbf16>) -> ()
  }) : () -> ()
}) : () -> ()

