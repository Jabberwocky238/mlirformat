"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xf32>, f32) -> f32, sym_name = "one_dim_reduction"}> ({
  ^bb0(%arg17: vector<8xf32> loc("<stdin>":3:8), %arg18: f32 loc("<stdin>":3:31)):
    %11 = "vector.multi_reduction"(%arg17, %arg18) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0>}> : (vector<8xf32>, f32) -> f32 loc("<stdin>":4:11)
    "func.return"(%11) : (f32) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (vector<8xf32>, f32, vector<8xi1>) -> f32, sym_name = "one_dim_reduction_masked"}> ({
  ^bb0(%arg14: vector<8xf32> loc("<stdin>":8:8), %arg15: f32 loc("<stdin>":8:31), %arg16: vector<8xi1> loc("<stdin>":8:44)):
    %9 = "vector.mask"(%arg16) ({
      %10 = "vector.multi_reduction"(%arg14, %arg15) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0>}> : (vector<8xf32>, f32) -> f32 loc("<stdin>":10:13)
      "vector.yield"(%10) : (f32) -> () loc("<stdin>":11:7)
    }) : (vector<8xi1>) -> f32 loc("<stdin>":9:10)
    "func.return"(%9) : (f32) -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (vector<2x3x4xf32>, vector<2x3xf32>) -> vector<2x3xf32>, sym_name = "negative_rank3"}> ({
  ^bb0(%arg12: vector<2x3x4xf32> loc("<stdin>":16:8), %arg13: vector<2x3xf32> loc("<stdin>":16:35)):
    %8 = "vector.multi_reduction"(%arg12, %arg13) <{kind = #vector.kind<add>, reduction_dims = array<i64: 2>}> : (vector<2x3x4xf32>, vector<2x3xf32>) -> vector<2x3xf32> loc("<stdin>":17:10)
    "func.return"(%8) : (vector<2x3xf32>) -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":15:3)
  "func.func"() <{function_type = (vector<2x4xf32>, vector<2xf32>) -> vector<2xf32>, sym_name = "inner_reduction_2d"}> ({
  ^bb0(%arg10: vector<2x4xf32> loc("<stdin>":21:8), %arg11: vector<2xf32> loc("<stdin>":21:33)):
    %7 = "vector.multi_reduction"(%arg10, %arg11) <{kind = #vector.kind<mul>, reduction_dims = array<i64: 1>}> : (vector<2x4xf32>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":22:10)
    "func.return"(%7) : (vector<2xf32>) -> () loc("<stdin>":23:5)
  }) : () -> () loc("<stdin>":20:3)
  "func.func"() <{function_type = (vector<2x[4]xf32>, vector<2xf32>, vector<2x[4]xi1>) -> vector<2xf32>, sym_name = "inner_reduction_2d_scalable"}> ({
  ^bb0(%arg7: vector<2x[4]xf32> loc("<stdin>":26:8), %arg8: vector<2xf32> loc("<stdin>":26:34), %arg9: vector<2x[4]xi1> loc("<stdin>":26:56)):
    %5 = "vector.mask"(%arg9) ({
      %6 = "vector.multi_reduction"(%arg7, %arg8) <{kind = #vector.kind<add>, reduction_dims = array<i64: 1>}> : (vector<2x[4]xf32>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":28:12)
      "vector.yield"(%6) : (vector<2xf32>) -> () loc("<stdin>":29:7)
    }) : (vector<2x[4]xi1>) -> vector<2xf32> loc("<stdin>":27:10)
    "func.return"(%5) : (vector<2xf32>) -> () loc("<stdin>":31:5)
  }) : () -> () loc("<stdin>":25:3)
  "func.func"() <{function_type = (vector<4x2xf32>, vector<2xf32>) -> vector<2xf32>, sym_name = "inner_parallel_2d"}> ({
  ^bb0(%arg5: vector<4x2xf32> loc("<stdin>":34:8), %arg6: vector<2xf32> loc("<stdin>":34:32)):
    %4 = "vector.multi_reduction"(%arg5, %arg6) <{kind = #vector.kind<mul>, reduction_dims = array<i64: 0>}> : (vector<4x2xf32>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":35:10)
    "func.return"(%4) : (vector<2xf32>) -> () loc("<stdin>":36:5)
  }) : () -> () loc("<stdin>":33:3)
  "func.func"() <{function_type = (vector<4x2xf32>, vector<2xf32>, vector<4x2xi1>) -> vector<2xf32>, sym_name = "inner_parallel_2d_masked"}> ({
  ^bb0(%arg2: vector<4x2xf32> loc("<stdin>":39:8), %arg3: vector<2xf32> loc("<stdin>":39:32), %arg4: vector<4x2xi1> loc("<stdin>":39:54)):
    %2 = "vector.mask"(%arg4) ({
      %3 = "vector.multi_reduction"(%arg2, %arg3) <{kind = #vector.kind<mul>, reduction_dims = array<i64: 0>}> : (vector<4x2xf32>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":41:12)
      "vector.yield"(%3) : (vector<2xf32>) -> () loc("<stdin>":42:7)
    }) : (vector<4x2xi1>) -> vector<2xf32> loc("<stdin>":40:10)
    "func.return"(%2) : (vector<2xf32>) -> () loc("<stdin>":44:5)
  }) : () -> () loc("<stdin>":38:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "innerreduction"}> ({
    ^bb0(%arg1: !transform.any_op loc("<stdin>":48:10)):
      %1 = "transform.structured.match"(%arg1) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func"> loc("<stdin>":49:12)
      "transform.apply_patterns"(%1) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.multi_reduction_unrolling"() <{lowering_strategy = 1 : i32}> : () -> () loc("<stdin>":51:9)
      }) : (!transform.op<"func.func">) -> () loc("<stdin>":50:7)
      "transform.yield"() : () -> () loc("<stdin>":53:7)
    }) : () -> () loc("<stdin>":47:5)
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "innerparallel"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":56:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func"> loc("<stdin>":57:12)
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.multi_reduction_unrolling"() <{lowering_strategy = 0 : i32}> : () -> () loc("<stdin>":59:9)
      }) : (!transform.op<"func.func">) -> () loc("<stdin>":58:7)
      "transform.yield"() : () -> () loc("<stdin>":61:7)
    }) : () -> () loc("<stdin>":55:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":46:3)
}) : () -> () loc("<stdin>":1:1)
