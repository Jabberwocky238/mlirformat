"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xf32>, vector<4x8xf32>, vector<[2]x[4]x8xf32>, vector<2x3x4x5xi32>, f32, vector<8xf32>, vector<2x4xi32>) -> (f32, vector<8xf32>, vector<8xf32>, vector<2x4xi32>), sym_name = "negative_flattening_cases"}> ({
  ^bb0(%arg15: vector<8xf32>, %arg16: vector<4x8xf32>, %arg17: vector<[2]x[4]x8xf32>, %arg18: vector<2x3x4x5xi32>, %arg19: f32, %arg20: vector<8xf32>, %arg21: vector<2x4xi32>):
    %9 = "vector.multi_reduction"(%arg15, %arg19) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0>}> : (vector<8xf32>, f32) -> f32
    %10 = "vector.multi_reduction"(%arg17, %arg20) <{kind = #vector.kind<mul>, reduction_dims = array<i64: 0, 1>}> : (vector<[2]x[4]x8xf32>, vector<8xf32>) -> vector<8xf32>
    %11 = "vector.multi_reduction"(%arg16, %arg20) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0>}> : (vector<4x8xf32>, vector<8xf32>) -> vector<8xf32>
    %12 = "vector.multi_reduction"(%arg18, %arg21) <{kind = #vector.kind<add>, reduction_dims = array<i64: 1, 3>}> : (vector<2x3x4x5xi32>, vector<2x4xi32>) -> vector<2x4xi32>
    "func.return"(%9, %10, %11, %12) : (f32, vector<8xf32>, vector<8xf32>, vector<2x4xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x4xf32>, f32) -> f32, sym_name = "vector_multi_reduction_flattening"}> ({
  ^bb0(%arg13: vector<2x4xf32>, %arg14: f32):
    %8 = "vector.multi_reduction"(%arg13, %arg14) <{kind = #vector.kind<mul>, reduction_dims = array<i64: 0, 1>}> : (vector<2x4xf32>, f32) -> f32
    "func.return"(%8) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x3x4xi32>, vector<2xi32>) -> vector<2xi32>, sym_name = "vector_multi_reduction_parallel_dim_innerreduction"}> ({
  ^bb0(%arg11: vector<2x3x4xi32>, %arg12: vector<2xi32>):
    %7 = "vector.multi_reduction"(%arg11, %arg12) <{kind = #vector.kind<add>, reduction_dims = array<i64: 1, 2>}> : (vector<2x3x4xi32>, vector<2xi32>) -> vector<2xi32>
    "func.return"(%7) : (vector<2xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x3x4x5x6xi32>, vector<2x3x4xi32>) -> vector<2x3x4xi32>, sym_name = "output_shapecast_multiple_parallel"}> ({
  ^bb0(%arg9: vector<2x3x4x5x6xi32>, %arg10: vector<2x3x4xi32>):
    %6 = "vector.multi_reduction"(%arg9, %arg10) <{kind = #vector.kind<mul>, reduction_dims = array<i64: 3, 4>}> : (vector<2x3x4x5x6xi32>, vector<2x3x4xi32>) -> vector<2x3x4xi32>
    "func.return"(%6) : (vector<2x3x4xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3x4x2xi32>, vector<2xi32>) -> vector<2xi32>, sym_name = "vector_multi_reduction_parallel_dim_innerparallel"}> ({
  ^bb0(%arg7: vector<3x4x2xi32>, %arg8: vector<2xi32>):
    %5 = "vector.multi_reduction"(%arg7, %arg8) <{kind = #vector.kind<mul>, reduction_dims = array<i64: 0, 1>}> : (vector<3x4x2xi32>, vector<2xi32>) -> vector<2xi32>
    "func.return"(%5) : (vector<2xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x[8]xf32>, f32) -> f32, sym_name = "single_scalable_dim"}> ({
  ^bb0(%arg5: vector<4x[8]xf32>, %arg6: f32):
    %4 = "vector.multi_reduction"(%arg5, %arg6) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0, 1>}> : (vector<4x[8]xf32>, f32) -> f32
    "func.return"(%4) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x4xf32>, f32, vector<2x4xi1>) -> f32, sym_name = "masked_multi_reduction"}> ({
  ^bb0(%arg2: vector<2x4xf32>, %arg3: f32, %arg4: vector<2x4xi1>):
    %2 = "vector.mask"(%arg4) ({
      %3 = "vector.multi_reduction"(%arg2, %arg3) <{kind = #vector.kind<mul>, reduction_dims = array<i64: 0, 1>}> : (vector<2x4xf32>, f32) -> f32
      "vector.yield"(%3) : (f32) -> ()
    }) : (vector<2x4xi1>) -> f32
    "func.return"(%2) : (f32) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "innerreduction"}> ({
    ^bb0(%arg1: !transform.any_op):
      %1 = "transform.structured.match"(%arg1) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%1) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.multi_reduction_flattening"() <{lowering_strategy = 1 : i32}> : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "innerparallel"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.multi_reduction_flattening"() <{lowering_strategy = 0 : i32}> : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

