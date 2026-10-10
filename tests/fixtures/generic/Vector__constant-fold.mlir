"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x4xf16>) -> vector<4x4xf16>, sym_name = "fold_extract_transpose_negative"}> ({
  ^bb0(%arg0: vector<4x4xf16>):
    %0 = "arith.constant"() <{value = dense<0.000000e+00> : vector<1x4x4xf16>}> : () -> vector<1x4x4xf16>
    %1 = "vector.insert"(%arg0, %0) <{static_position = array<i64: 0>}> : (vector<4x4xf16>, vector<1x4x4xf16>) -> vector<1x4x4xf16>
    %2 = "vector.transpose"(%1) <{permutation = array<i64: 0, 2, 1>}> : (vector<1x4x4xf16>) -> vector<1x4x4xf16>
    %3 = "vector.extract"(%2) <{static_position = array<i64: 0>}> : (vector<1x4x4xf16>) -> vector<4x4xf16>
    "func.return"(%3) : (vector<4x4xf16>) -> ()
  }) : () -> ()
}) : () -> ()

