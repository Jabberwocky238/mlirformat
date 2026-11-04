"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x8xf32>) -> vector<8x4xf32>, sym_name = "transpose4x8xf32"}> ({
  ^bb0(%arg12: vector<4x8xf32>):
    %12 = "vector.transpose"(%arg12) <{permutation = array<i64: 1, 0>}> : (vector<4x8xf32>) -> vector<8x4xf32>
    "func.return"(%12) : (vector<8x4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1x4x8xf32>) -> vector<1x8x4xf32>, sym_name = "transpose021_1x4x8xf32"}> ({
  ^bb0(%arg11: vector<1x4x8xf32>):
    %11 = "vector.transpose"(%arg11) <{permutation = array<i64: 0, 2, 1>}> : (vector<1x4x8xf32>) -> vector<1x8x4xf32>
    "func.return"(%11) : (vector<1x8x4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8x8xf32>) -> vector<8x8xf32>, sym_name = "transpose8x8xf32"}> ({
  ^bb0(%arg10: vector<8x8xf32>):
    %10 = "vector.transpose"(%arg10) <{permutation = array<i64: 1, 0>}> : (vector<8x8xf32>) -> vector<8x8xf32>
    "func.return"(%10) : (vector<8x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1x8x8xf32>) -> vector<1x8x8xf32>, sym_name = "transpose021_1x8x8xf32"}> ({
  ^bb0(%arg9: vector<1x8x8xf32>):
    %9 = "vector.transpose"(%arg9) <{permutation = array<i64: 0, 2, 1>}> : (vector<1x8x8xf32>) -> vector<1x8x8xf32>
    "func.return"(%9) : (vector<1x8x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8x1x8xf32>) -> vector<1x8x8xf32>, sym_name = "transpose120_8x1x8xf32"}> ({
  ^bb0(%arg8: vector<8x1x8xf32>):
    %8 = "vector.transpose"(%arg8) <{permutation = array<i64: 1, 2, 0>}> : (vector<8x1x8xf32>) -> vector<1x8x8xf32>
    "func.return"(%8) : (vector<1x8x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8x8x1xf32>) -> vector<8x1x8xf32>, sym_name = "transpose120_8x8x1xf32"}> ({
  ^bb0(%arg7: vector<8x8x1xf32>):
    %7 = "vector.transpose"(%arg7) <{permutation = array<i64: 1, 2, 0>}> : (vector<8x8x1xf32>) -> vector<8x1x8xf32>
    "func.return"(%7) : (vector<8x1x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8x8x1xf32>) -> vector<8x8x1xf32>, sym_name = "transpose102_8x8x1xf32"}> ({
  ^bb0(%arg6: vector<8x8x1xf32>):
    %6 = "vector.transpose"(%arg6) <{permutation = array<i64: 1, 0, 2>}> : (vector<8x8x1xf32>) -> vector<8x8x1xf32>
    "func.return"(%6) : (vector<8x8x1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8x1x8xf32>) -> vector<8x8x1xf32>, sym_name = "transpose201_8x1x8xf32"}> ({
  ^bb0(%arg5: vector<8x1x8xf32>):
    %5 = "vector.transpose"(%arg5) <{permutation = array<i64: 2, 0, 1>}> : (vector<8x1x8xf32>) -> vector<8x8x1xf32>
    "func.return"(%5) : (vector<8x8x1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1x8x8xf32>) -> vector<8x1x8xf32>, sym_name = "transpose201_1x8x8xf32"}> ({
  ^bb0(%arg4: vector<1x8x8xf32>):
    %4 = "vector.transpose"(%arg4) <{permutation = array<i64: 2, 0, 1>}> : (vector<1x8x8xf32>) -> vector<8x1x8xf32>
    "func.return"(%4) : (vector<8x1x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8x1x8xf32>) -> vector<8x1x8xf32>, sym_name = "transpose210_8x1x8xf32"}> ({
  ^bb0(%arg3: vector<8x1x8xf32>):
    %3 = "vector.transpose"(%arg3) <{permutation = array<i64: 2, 1, 0>}> : (vector<8x1x8xf32>) -> vector<8x1x8xf32>
    "func.return"(%3) : (vector<8x1x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8x8x1xf32>) -> vector<1x8x8xf32>, sym_name = "transpose210_8x8x1xf32"}> ({
  ^bb0(%arg2: vector<8x8x1xf32>):
    %2 = "vector.transpose"(%arg2) <{permutation = array<i64: 2, 1, 0>}> : (vector<8x8x1xf32>) -> vector<1x8x8xf32>
    "func.return"(%2) : (vector<1x8x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1x8x8xf32>) -> vector<8x8x1xf32>, sym_name = "transpose210_1x8x8xf32"}> ({
  ^bb0(%arg1: vector<1x8x8xf32>):
    %1 = "vector.transpose"(%arg1) <{permutation = array<i64: 2, 1, 0>}> : (vector<1x8x8xf32>) -> vector<8x8x1xf32>
    "func.return"(%1) : (vector<8x8x1xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_transpose"() <{avx2_lowering_strategy = true, lowering_strategy = 0 : i32}> : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

