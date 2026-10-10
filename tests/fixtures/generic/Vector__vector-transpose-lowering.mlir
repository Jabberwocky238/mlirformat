"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x3xf32>) -> vector<3x2xf32>, sym_name = "transpose23"}> ({
  ^bb0(%arg5: vector<2x3xf32>):
    %5 = "vector.transpose"(%arg5) <{permutation = array<i64: 1, 0>}> : (vector<2x3xf32>) -> vector<3x2xf32>
    "func.return"(%5) : (vector<3x2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1x8x8xf32>) -> vector<8x1x8xf32>, sym_name = "transpose102_1x8x8xf32"}> ({
  ^bb0(%arg4: vector<1x8x8xf32>):
    %4 = "vector.transpose"(%arg4) <{permutation = array<i64: 1, 0, 2>}> : (vector<1x8x8xf32>) -> vector<8x1x8xf32>
    "func.return"(%4) : (vector<8x1x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8x1x8xf32>) -> vector<1x8x8xf32>, sym_name = "transpose102_8x1x8xf32"}> ({
  ^bb0(%arg3: vector<8x1x8xf32>):
    %3 = "vector.transpose"(%arg3) <{permutation = array<i64: 1, 0, 2>}> : (vector<8x1x8xf32>) -> vector<1x8x8xf32>
    "func.return"(%3) : (vector<1x8x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x1x8x4xf32>) -> vector<1x2x8x4xf32>, sym_name = "transpose1023_2x1x8x4xf32"}> ({
  ^bb0(%arg2: vector<2x1x8x4xf32>):
    %2 = "vector.transpose"(%arg2) <{permutation = array<i64: 1, 0, 2, 3>}> : (vector<2x1x8x4xf32>) -> vector<1x2x8x4xf32>
    "func.return"(%2) : (vector<1x2x8x4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x[3]xf32>) -> vector<[3]x2xf32>, sym_name = "transpose23_scalable"}> ({
  ^bb0(%arg1: vector<2x[3]xf32>):
    %1 = "vector.transpose"(%arg1) <{permutation = array<i64: 1, 0>}> : (vector<2x[3]xf32>) -> vector<[3]x2xf32>
    "func.return"(%1) : (vector<[3]x2xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_transpose"() <{avx2_lowering_strategy = false, lowering_strategy = 0 : i32}> : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x4xf32>) -> vector<4x2xf32>, sym_name = "transpose"}> ({
  ^bb0(%arg2: vector<2x4xf32>):
    %2 = "vector.transpose"(%arg2) <{permutation = array<i64: 1, 0>}> : (vector<2x4xf32>) -> vector<4x2xf32>
    "func.return"(%2) : (vector<4x2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x[4]xf32>) -> vector<[4]x2xf32>, sym_name = "transpose_scalable"}> ({
  ^bb0(%arg1: vector<2x[4]xf32>):
    %1 = "vector.transpose"(%arg1) <{permutation = array<i64: 1, 0>}> : (vector<2x[4]xf32>) -> vector<[4]x2xf32>
    "func.return"(%1) : (vector<[4]x2xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_transpose"() <{avx2_lowering_strategy = false, lowering_strategy = 2 : i32}> : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<16x16xf32>) -> vector<16x16xf32>, sym_name = "transpose_shuffle16x16xf32"}> ({
  ^bb0(%arg2: vector<16x16xf32>):
    %2 = "vector.transpose"(%arg2) <{permutation = array<i64: 1, 0>}> : (vector<16x16xf32>) -> vector<16x16xf32>
    "func.return"(%2) : (vector<16x16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<16x[16]xf32>) -> vector<[16]x16xf32>, sym_name = "transpose_shuffle16x16xf32_scalable"}> ({
  ^bb0(%arg1: vector<16x[16]xf32>):
    %1 = "vector.transpose"(%arg1) <{permutation = array<i64: 1, 0>}> : (vector<16x[16]xf32>) -> vector<[16]x16xf32>
    "func.return"(%1) : (vector<[16]x16xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_transpose"() <{avx2_lowering_strategy = false, lowering_strategy = 3 : i32}> : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x16x16xf32>) -> vector<1x16x16xf32>, sym_name = "transpose021_shuffle16x16xf32"}> ({
  ^bb0(%arg2: vector<1x16x16xf32>):
    %2 = "vector.transpose"(%arg2) <{permutation = array<i64: 0, 2, 1>}> : (vector<1x16x16xf32>) -> vector<1x16x16xf32>
    "func.return"(%2) : (vector<1x16x16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1x16x[16]xf32>) -> vector<1x[16]x16xf32>, sym_name = "transpose021_shuffle16x16xf32_scalable"}> ({
  ^bb0(%arg1: vector<1x16x[16]xf32>):
    %1 = "vector.transpose"(%arg1) <{permutation = array<i64: 0, 2, 1>}> : (vector<1x16x[16]xf32>) -> vector<1x[16]x16xf32>
    "func.return"(%1) : (vector<1x[16]x16xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_transpose"() <{avx2_lowering_strategy = false, lowering_strategy = 3 : i32}> : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x1xf32>) -> vector<1x4xf32>, sym_name = "transpose10_4x1xf32"}> ({
  ^bb0(%arg5: vector<4x1xf32>):
    %5 = "vector.transpose"(%arg5) <{permutation = array<i64: 1, 0>}> : (vector<4x1xf32>) -> vector<1x4xf32>
    "func.return"(%5) : (vector<1x4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[4]x1xf32>) -> vector<1x[4]xf32>, sym_name = "transpose10_nx4x1xf32"}> ({
  ^bb0(%arg4: vector<[4]x1xf32>):
    %4 = "vector.transpose"(%arg4) <{permutation = array<i64: 1, 0>}> : (vector<[4]x1xf32>) -> vector<1x[4]xf32>
    "func.return"(%4) : (vector<1x[4]xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1x4xf32>) -> vector<4x1xf32>, sym_name = "transpose10_1x4xf32"}> ({
  ^bb0(%arg3: vector<1x4xf32>):
    %3 = "vector.transpose"(%arg3) <{permutation = array<i64: 1, 0>}> : (vector<1x4xf32>) -> vector<4x1xf32>
    "func.return"(%3) : (vector<4x1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1x[4]xf32>) -> vector<[4]x1xf32>, sym_name = "transpose10_1xnx4xf32"}> ({
  ^bb0(%arg2: vector<1x[4]xf32>):
    %2 = "vector.transpose"(%arg2) <{permutation = array<i64: 1, 0>}> : (vector<1x[4]xf32>) -> vector<[4]x1xf32>
    "func.return"(%2) : (vector<[4]x1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x[1]xf32>) -> vector<[1]x4xf32>, sym_name = "transpose10_4x1xf32_scalable"}> ({
  ^bb0(%arg1: vector<4x[1]xf32>):
    %1 = "vector.transpose"(%arg1) <{permutation = array<i64: 1, 0>}> : (vector<4x[1]xf32>) -> vector<[1]x4xf32>
    "func.return"(%1) : (vector<[1]x4xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_transpose"() <{avx2_lowering_strategy = false, lowering_strategy = 0 : i32}> : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

