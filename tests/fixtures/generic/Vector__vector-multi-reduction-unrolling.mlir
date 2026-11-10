"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xf32>, f32) -> f32, sym_name = "one_dim_reduction"}> ({
  ^bb0(%arg17: vector<8xf32>, %arg18: f32):
    %11 = "vector.multi_reduction"(%arg17, %arg18) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0>}> : (vector<8xf32>, f32) -> f32
    "func.return"(%11) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf32>, f32, vector<8xi1>) -> f32, sym_name = "one_dim_reduction_masked"}> ({
  ^bb0(%arg14: vector<8xf32>, %arg15: f32, %arg16: vector<8xi1>):
    %9 = "vector.mask"(%arg16) ({
      %10 = "vector.multi_reduction"(%arg14, %arg15) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0>}> : (vector<8xf32>, f32) -> f32
      "vector.yield"(%10) : (f32) -> ()
    }) : (vector<8xi1>) -> f32
    "func.return"(%9) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x3x4xf32>, vector<2x3xf32>) -> vector<2x3xf32>, sym_name = "negative_rank3"}> ({
  ^bb0(%arg12: vector<2x3x4xf32>, %arg13: vector<2x3xf32>):
    %8 = "vector.multi_reduction"(%arg12, %arg13) <{kind = #vector.kind<add>, reduction_dims = array<i64: 2>}> : (vector<2x3x4xf32>, vector<2x3xf32>) -> vector<2x3xf32>
    "func.return"(%8) : (vector<2x3xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x4xf32>, vector<2xf32>) -> vector<2xf32>, sym_name = "inner_reduction_2d"}> ({
  ^bb0(%arg10: vector<2x4xf32>, %arg11: vector<2xf32>):
    %7 = "vector.multi_reduction"(%arg10, %arg11) <{kind = #vector.kind<mul>, reduction_dims = array<i64: 1>}> : (vector<2x4xf32>, vector<2xf32>) -> vector<2xf32>
    "func.return"(%7) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x[4]xf32>, vector<2xf32>, vector<2x[4]xi1>) -> vector<2xf32>, sym_name = "inner_reduction_2d_scalable"}> ({
  ^bb0(%arg7: vector<2x[4]xf32>, %arg8: vector<2xf32>, %arg9: vector<2x[4]xi1>):
    %5 = "vector.mask"(%arg9) ({
      %6 = "vector.multi_reduction"(%arg7, %arg8) <{kind = #vector.kind<add>, reduction_dims = array<i64: 1>}> : (vector<2x[4]xf32>, vector<2xf32>) -> vector<2xf32>
      "vector.yield"(%6) : (vector<2xf32>) -> ()
    }) : (vector<2x[4]xi1>) -> vector<2xf32>
    "func.return"(%5) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x2xf32>, vector<2xf32>) -> vector<2xf32>, sym_name = "inner_parallel_2d"}> ({
  ^bb0(%arg5: vector<4x2xf32>, %arg6: vector<2xf32>):
    %4 = "vector.multi_reduction"(%arg5, %arg6) <{kind = #vector.kind<mul>, reduction_dims = array<i64: 0>}> : (vector<4x2xf32>, vector<2xf32>) -> vector<2xf32>
    "func.return"(%4) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x2xf32>, vector<2xf32>, vector<4x2xi1>) -> vector<2xf32>, sym_name = "inner_parallel_2d_masked"}> ({
  ^bb0(%arg2: vector<4x2xf32>, %arg3: vector<2xf32>, %arg4: vector<4x2xi1>):
    %2 = "vector.mask"(%arg4) ({
      %3 = "vector.multi_reduction"(%arg2, %arg3) <{kind = #vector.kind<mul>, reduction_dims = array<i64: 0>}> : (vector<4x2xf32>, vector<2xf32>) -> vector<2xf32>
      "vector.yield"(%3) : (vector<2xf32>) -> ()
    }) : (vector<4x2xi1>) -> vector<2xf32>
    "func.return"(%2) : (vector<2xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "innerreduction"}> ({
    ^bb0(%arg1: !transform.any_op):
      %1 = "transform.structured.match"(%arg1) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%1) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.multi_reduction_unrolling"() <{lowering_strategy = 1 : i32}> : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "innerparallel"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.multi_reduction_unrolling"() <{lowering_strategy = 0 : i32}> : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

