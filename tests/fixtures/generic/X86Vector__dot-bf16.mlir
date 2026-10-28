"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf32>, vector<8xbf16>, vector<8xbf16>) -> vector<4xf32>, sym_name = "avx512bf16_dot_128"}> ({
  ^bb0(%arg6: vector<4xf32>, %arg7: vector<8xbf16>, %arg8: vector<8xbf16>):
    %2 = "x86vector.avx512.dot"(%arg6, %arg7, %arg8) : (vector<4xf32>, vector<8xbf16>, vector<8xbf16>) -> vector<4xf32>
    "func.return"(%2) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf32>, vector<16xbf16>, vector<16xbf16>) -> vector<8xf32>, sym_name = "avx512bf16_dot_256"}> ({
  ^bb0(%arg3: vector<8xf32>, %arg4: vector<16xbf16>, %arg5: vector<16xbf16>):
    %1 = "x86vector.avx512.dot"(%arg3, %arg4, %arg5) : (vector<8xf32>, vector<16xbf16>, vector<16xbf16>) -> vector<8xf32>
    "func.return"(%1) : (vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<16xf32>, vector<32xbf16>, vector<32xbf16>) -> vector<16xf32>, sym_name = "avx512bf16_dot_512"}> ({
  ^bb0(%arg0: vector<16xf32>, %arg1: vector<32xbf16>, %arg2: vector<32xbf16>):
    %0 = "x86vector.avx512.dot"(%arg0, %arg1, %arg2) : (vector<16xf32>, vector<32xbf16>, vector<32xbf16>) -> vector<16xf32>
    "func.return"(%0) : (vector<16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

