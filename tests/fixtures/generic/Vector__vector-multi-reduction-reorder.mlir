"builtin.module"() ({
  "func.func"() <{function_type = (vector<3x2x4xf32>, vector<2x4xf32>) -> vector<2x4xf32>, sym_name = "inner_reduction_to_inner_parallel"}> ({
  ^bb0(%arg8: vector<3x2x4xf32>, %arg9: vector<2x4xf32>):
    %5 = "vector.multi_reduction"(%arg8, %arg9) <{kind = #vector.kind<mul>, reduction_dims = array<i64: 0>}> : (vector<3x2x4xf32>, vector<2x4xf32>) -> vector<2x4xf32>
    "func.return"(%5) : (vector<2x4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3x2x4xf32>, vector<3x2xf32>) -> vector<3x2xf32>, sym_name = "inner_parallel_to_inner_reduction"}> ({
  ^bb0(%arg6: vector<3x2x4xf32>, %arg7: vector<3x2xf32>):
    %4 = "vector.multi_reduction"(%arg6, %arg7) <{kind = #vector.kind<mul>, reduction_dims = array<i64: 2>}> : (vector<3x2x4xf32>, vector<3x2xf32>) -> vector<3x2xf32>
    "func.return"(%4) : (vector<3x2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3x4x5xf32>, vector<4xf32>) -> vector<4xf32>, sym_name = "transpose_parallel_middle"}> ({
  ^bb0(%arg4: vector<3x4x5xf32>, %arg5: vector<4xf32>):
    %3 = "vector.multi_reduction"(%arg4, %arg5) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0, 2>}> : (vector<3x4x5xf32>, vector<4xf32>) -> vector<4xf32>
    "func.return"(%3) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf32>, f32) -> f32, sym_name = "negative_one_dim"}> ({
  ^bb0(%arg2: vector<8xf32>, %arg3: f32):
    %2 = "vector.multi_reduction"(%arg2, %arg3) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0>}> : (vector<8xf32>, f32) -> f32
    "func.return"(%2) : (f32) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "innerreduction"}> ({
    ^bb0(%arg1: !transform.any_op):
      %1 = "transform.structured.match"(%arg1) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%1) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.reorder_multi_reduction_dims"() <{lowering_strategy = 1 : i32}> : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "innerparallel"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.reorder_multi_reduction_dims"() <{lowering_strategy = 0 : i32}> : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

