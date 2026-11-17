"builtin.module"() ({
  "func.func"() <{function_type = (vector<3x2x4xf32>, vector<2x4xf32>) -> vector<2x4xf32>, sym_name = "inner_reduction_to_inner_parallel"}> ({
  ^bb0(%arg8: vector<3x2x4xf32> loc("<stdin>":3:8), %arg9: vector<2x4xf32> loc("<stdin>":3:34)):
    %5 = "vector.multi_reduction"(%arg8, %arg9) <{kind = #vector.kind<mul>, reduction_dims = array<i64: 0>}> : (vector<3x2x4xf32>, vector<2x4xf32>) -> vector<2x4xf32> loc("<stdin>":4:10)
    "func.return"(%5) : (vector<2x4xf32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (vector<3x2x4xf32>, vector<3x2xf32>) -> vector<3x2xf32>, sym_name = "inner_parallel_to_inner_reduction"}> ({
  ^bb0(%arg6: vector<3x2x4xf32> loc("<stdin>":8:8), %arg7: vector<3x2xf32> loc("<stdin>":8:34)):
    %4 = "vector.multi_reduction"(%arg6, %arg7) <{kind = #vector.kind<mul>, reduction_dims = array<i64: 2>}> : (vector<3x2x4xf32>, vector<3x2xf32>) -> vector<3x2xf32> loc("<stdin>":9:10)
    "func.return"(%4) : (vector<3x2xf32>) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (vector<3x4x5xf32>, vector<4xf32>) -> vector<4xf32>, sym_name = "transpose_parallel_middle"}> ({
  ^bb0(%arg4: vector<3x4x5xf32> loc("<stdin>":13:8), %arg5: vector<4xf32> loc("<stdin>":13:34)):
    %3 = "vector.multi_reduction"(%arg4, %arg5) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0, 2>}> : (vector<3x4x5xf32>, vector<4xf32>) -> vector<4xf32> loc("<stdin>":14:10)
    "func.return"(%3) : (vector<4xf32>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (vector<8xf32>, f32) -> f32, sym_name = "negative_one_dim"}> ({
  ^bb0(%arg2: vector<8xf32> loc("<stdin>":18:8), %arg3: f32 loc("<stdin>":18:30)):
    %2 = "vector.multi_reduction"(%arg2, %arg3) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0>}> : (vector<8xf32>, f32) -> f32 loc("<stdin>":19:10)
    "func.return"(%2) : (f32) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "innerreduction"}> ({
    ^bb0(%arg1: !transform.any_op loc("<stdin>":24:10)):
      %1 = "transform.structured.match"(%arg1) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func"> loc("<stdin>":25:12)
      "transform.apply_patterns"(%1) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.reorder_multi_reduction_dims"() <{lowering_strategy = 1 : i32}> : () -> () loc("<stdin>":27:9)
      }) : (!transform.op<"func.func">) -> () loc("<stdin>":26:7)
      "transform.yield"() : () -> () loc("<stdin>":29:7)
    }) : () -> () loc("<stdin>":23:5)
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "innerparallel"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":32:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func"> loc("<stdin>":33:12)
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.reorder_multi_reduction_dims"() <{lowering_strategy = 0 : i32}> : () -> () loc("<stdin>":35:9)
      }) : (!transform.op<"func.func">) -> () loc("<stdin>":34:7)
      "transform.yield"() : () -> () loc("<stdin>":37:7)
    }) : () -> () loc("<stdin>":31:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":22:3)
}) : () -> () loc("<stdin>":1:1)
