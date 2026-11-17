"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x8xf32>) -> vector<8x4xf32>, sym_name = "transpose4x8xf32"}> ({
  ^bb0(%arg12: vector<4x8xf32> loc("<stdin>":3:8)):
    %12 = "vector.transpose"(%arg12) <{permutation = array<i64: 1, 0>}> : (vector<4x8xf32>) -> vector<8x4xf32> loc("<stdin>":4:11)
    "func.return"(%12) : (vector<8x4xf32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (vector<1x4x8xf32>) -> vector<1x8x4xf32>, sym_name = "transpose021_1x4x8xf32"}> ({
  ^bb0(%arg11: vector<1x4x8xf32> loc("<stdin>":8:8)):
    %11 = "vector.transpose"(%arg11) <{permutation = array<i64: 0, 2, 1>}> : (vector<1x4x8xf32>) -> vector<1x8x4xf32> loc("<stdin>":9:11)
    "func.return"(%11) : (vector<1x8x4xf32>) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (vector<8x8xf32>) -> vector<8x8xf32>, sym_name = "transpose8x8xf32"}> ({
  ^bb0(%arg10: vector<8x8xf32> loc("<stdin>":13:8)):
    %10 = "vector.transpose"(%arg10) <{permutation = array<i64: 1, 0>}> : (vector<8x8xf32>) -> vector<8x8xf32> loc("<stdin>":14:11)
    "func.return"(%10) : (vector<8x8xf32>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (vector<1x8x8xf32>) -> vector<1x8x8xf32>, sym_name = "transpose021_1x8x8xf32"}> ({
  ^bb0(%arg9: vector<1x8x8xf32> loc("<stdin>":18:8)):
    %9 = "vector.transpose"(%arg9) <{permutation = array<i64: 0, 2, 1>}> : (vector<1x8x8xf32>) -> vector<1x8x8xf32> loc("<stdin>":19:10)
    "func.return"(%9) : (vector<1x8x8xf32>) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (vector<8x1x8xf32>) -> vector<1x8x8xf32>, sym_name = "transpose120_8x1x8xf32"}> ({
  ^bb0(%arg8: vector<8x1x8xf32> loc("<stdin>":23:8)):
    %8 = "vector.transpose"(%arg8) <{permutation = array<i64: 1, 2, 0>}> : (vector<8x1x8xf32>) -> vector<1x8x8xf32> loc("<stdin>":24:10)
    "func.return"(%8) : (vector<1x8x8xf32>) -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":22:3)
  "func.func"() <{function_type = (vector<8x8x1xf32>) -> vector<8x1x8xf32>, sym_name = "transpose120_8x8x1xf32"}> ({
  ^bb0(%arg7: vector<8x8x1xf32> loc("<stdin>":28:8)):
    %7 = "vector.transpose"(%arg7) <{permutation = array<i64: 1, 2, 0>}> : (vector<8x8x1xf32>) -> vector<8x1x8xf32> loc("<stdin>":29:10)
    "func.return"(%7) : (vector<8x1x8xf32>) -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":27:3)
  "func.func"() <{function_type = (vector<8x8x1xf32>) -> vector<8x8x1xf32>, sym_name = "transpose102_8x8x1xf32"}> ({
  ^bb0(%arg6: vector<8x8x1xf32> loc("<stdin>":33:8)):
    %6 = "vector.transpose"(%arg6) <{permutation = array<i64: 1, 0, 2>}> : (vector<8x8x1xf32>) -> vector<8x8x1xf32> loc("<stdin>":34:10)
    "func.return"(%6) : (vector<8x8x1xf32>) -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":32:3)
  "func.func"() <{function_type = (vector<8x1x8xf32>) -> vector<8x8x1xf32>, sym_name = "transpose201_8x1x8xf32"}> ({
  ^bb0(%arg5: vector<8x1x8xf32> loc("<stdin>":38:8)):
    %5 = "vector.transpose"(%arg5) <{permutation = array<i64: 2, 0, 1>}> : (vector<8x1x8xf32>) -> vector<8x8x1xf32> loc("<stdin>":39:10)
    "func.return"(%5) : (vector<8x8x1xf32>) -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":37:3)
  "func.func"() <{function_type = (vector<1x8x8xf32>) -> vector<8x1x8xf32>, sym_name = "transpose201_1x8x8xf32"}> ({
  ^bb0(%arg4: vector<1x8x8xf32> loc("<stdin>":43:8)):
    %4 = "vector.transpose"(%arg4) <{permutation = array<i64: 2, 0, 1>}> : (vector<1x8x8xf32>) -> vector<8x1x8xf32> loc("<stdin>":44:10)
    "func.return"(%4) : (vector<8x1x8xf32>) -> () loc("<stdin>":45:5)
  }) : () -> () loc("<stdin>":42:3)
  "func.func"() <{function_type = (vector<8x1x8xf32>) -> vector<8x1x8xf32>, sym_name = "transpose210_8x1x8xf32"}> ({
  ^bb0(%arg3: vector<8x1x8xf32> loc("<stdin>":48:8)):
    %3 = "vector.transpose"(%arg3) <{permutation = array<i64: 2, 1, 0>}> : (vector<8x1x8xf32>) -> vector<8x1x8xf32> loc("<stdin>":49:10)
    "func.return"(%3) : (vector<8x1x8xf32>) -> () loc("<stdin>":50:5)
  }) : () -> () loc("<stdin>":47:3)
  "func.func"() <{function_type = (vector<8x8x1xf32>) -> vector<1x8x8xf32>, sym_name = "transpose210_8x8x1xf32"}> ({
  ^bb0(%arg2: vector<8x8x1xf32> loc("<stdin>":53:8)):
    %2 = "vector.transpose"(%arg2) <{permutation = array<i64: 2, 1, 0>}> : (vector<8x8x1xf32>) -> vector<1x8x8xf32> loc("<stdin>":54:10)
    "func.return"(%2) : (vector<1x8x8xf32>) -> () loc("<stdin>":55:5)
  }) : () -> () loc("<stdin>":52:3)
  "func.func"() <{function_type = (vector<1x8x8xf32>) -> vector<8x8x1xf32>, sym_name = "transpose210_1x8x8xf32"}> ({
  ^bb0(%arg1: vector<1x8x8xf32> loc("<stdin>":58:8)):
    %1 = "vector.transpose"(%arg1) <{permutation = array<i64: 2, 1, 0>}> : (vector<1x8x8xf32>) -> vector<8x8x1xf32> loc("<stdin>":59:10)
    "func.return"(%1) : (vector<8x8x1xf32>) -> () loc("<stdin>":60:5)
  }) : () -> () loc("<stdin>":57:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":64:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func"> loc("<stdin>":65:12)
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_transpose"() <{avx2_lowering_strategy = true, lowering_strategy = 0 : i32}> : () -> () loc("<stdin>":67:9)
      }) : (!transform.op<"func.func">) -> () loc("<stdin>":66:7)
      "transform.yield"() : () -> () loc("<stdin>":69:7)
    }) : () -> () loc("<stdin>":63:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":62:3)
}) : () -> () loc("<stdin>":1:1)
