"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x3xf32>) -> vector<3x2xf32>, sym_name = "transpose23"}> ({
  ^bb0(%arg5: vector<2x3xf32> loc("<stdin>":3:8)):
    %5 = "vector.transpose"(%arg5) <{permutation = array<i64: 1, 0>}> : (vector<2x3xf32>) -> vector<3x2xf32> loc("<stdin>":4:10)
    "func.return"(%5) : (vector<3x2xf32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (vector<1x8x8xf32>) -> vector<8x1x8xf32>, sym_name = "transpose102_1x8x8xf32"}> ({
  ^bb0(%arg4: vector<1x8x8xf32> loc("<stdin>":8:8)):
    %4 = "vector.transpose"(%arg4) <{permutation = array<i64: 1, 0, 2>}> : (vector<1x8x8xf32>) -> vector<8x1x8xf32> loc("<stdin>":9:10)
    "func.return"(%4) : (vector<8x1x8xf32>) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (vector<8x1x8xf32>) -> vector<1x8x8xf32>, sym_name = "transpose102_8x1x8xf32"}> ({
  ^bb0(%arg3: vector<8x1x8xf32> loc("<stdin>":13:8)):
    %3 = "vector.transpose"(%arg3) <{permutation = array<i64: 1, 0, 2>}> : (vector<8x1x8xf32>) -> vector<1x8x8xf32> loc("<stdin>":14:10)
    "func.return"(%3) : (vector<1x8x8xf32>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (vector<2x1x8x4xf32>) -> vector<1x2x8x4xf32>, sym_name = "transpose1023_2x1x8x4xf32"}> ({
  ^bb0(%arg2: vector<2x1x8x4xf32> loc("<stdin>":18:8)):
    %2 = "vector.transpose"(%arg2) <{permutation = array<i64: 1, 0, 2, 3>}> : (vector<2x1x8x4xf32>) -> vector<1x2x8x4xf32> loc("<stdin>":19:10)
    "func.return"(%2) : (vector<1x2x8x4xf32>) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (vector<2x[3]xf32>) -> vector<[3]x2xf32>, sym_name = "transpose23_scalable"}> ({
  ^bb0(%arg1: vector<2x[3]xf32> loc("<stdin>":23:8)):
    %1 = "vector.transpose"(%arg1) <{permutation = array<i64: 1, 0>}> : (vector<2x[3]xf32>) -> vector<[3]x2xf32> loc("<stdin>":24:10)
    "func.return"(%1) : (vector<[3]x2xf32>) -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":22:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":29:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func"> loc("<stdin>":30:12)
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_transpose"() <{avx2_lowering_strategy = false, lowering_strategy = 0 : i32}> : () -> () loc("<stdin>":32:9)
      }) : (!transform.op<"func.func">) -> () loc("<stdin>":31:7)
      "transform.yield"() : () -> () loc("<stdin>":34:7)
    }) : () -> () loc("<stdin>":28:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":27:3)
}) : () -> () loc("<stdin>":1:1)
