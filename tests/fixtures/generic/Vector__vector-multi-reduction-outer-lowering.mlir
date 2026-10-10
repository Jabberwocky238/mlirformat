"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x4xf32>, vector<2xf32>) -> vector<2xf32>, sym_name = "vector_multi_reduction"}> ({
  ^bb0(%arg19: vector<2x4xf32>, %arg20: vector<2xf32>):
    %10 = "vector.multi_reduction"(%arg19, %arg20) <{kind = #vector.kind<mul>, reduction_dims = array<i64: 1>}> : (vector<2x4xf32>, vector<2xf32>) -> vector<2xf32>
    "func.return"(%10) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x4xf32>, vector<2xf32>) -> vector<2xf32>, sym_name = "vector_multi_reduction_min"}> ({
  ^bb0(%arg17: vector<2x4xf32>, %arg18: vector<2xf32>):
    %9 = "vector.multi_reduction"(%arg17, %arg18) <{kind = #vector.kind<minnumf>, reduction_dims = array<i64: 1>}> : (vector<2x4xf32>, vector<2xf32>) -> vector<2xf32>
    "func.return"(%9) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x4xf32>, vector<2xf32>) -> vector<2xf32>, sym_name = "vector_multi_reduction_max"}> ({
  ^bb0(%arg15: vector<2x4xf32>, %arg16: vector<2xf32>):
    %8 = "vector.multi_reduction"(%arg15, %arg16) <{kind = #vector.kind<maxnumf>, reduction_dims = array<i64: 1>}> : (vector<2x4xf32>, vector<2xf32>) -> vector<2xf32>
    "func.return"(%8) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x4xi32>, vector<2xi32>) -> vector<2xi32>, sym_name = "vector_multi_reduction_and"}> ({
  ^bb0(%arg13: vector<2x4xi32>, %arg14: vector<2xi32>):
    %7 = "vector.multi_reduction"(%arg13, %arg14) <{kind = #vector.kind<and>, reduction_dims = array<i64: 1>}> : (vector<2x4xi32>, vector<2xi32>) -> vector<2xi32>
    "func.return"(%7) : (vector<2xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x4xi32>, vector<2xi32>) -> vector<2xi32>, sym_name = "vector_multi_reduction_or"}> ({
  ^bb0(%arg11: vector<2x4xi32>, %arg12: vector<2xi32>):
    %6 = "vector.multi_reduction"(%arg11, %arg12) <{kind = #vector.kind<or>, reduction_dims = array<i64: 1>}> : (vector<2x4xi32>, vector<2xi32>) -> vector<2xi32>
    "func.return"(%6) : (vector<2xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x4xi32>, vector<2xi32>) -> vector<2xi32>, sym_name = "vector_multi_reduction_xor"}> ({
  ^bb0(%arg9: vector<2x4xi32>, %arg10: vector<2xi32>):
    %5 = "vector.multi_reduction"(%arg9, %arg10) <{kind = #vector.kind<xor>, reduction_dims = array<i64: 1>}> : (vector<2x4xi32>, vector<2xi32>) -> vector<2xi32>
    "func.return"(%5) : (vector<2xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x3x4x5xi32>, vector<2x3xi32>) -> vector<2x3xi32>, sym_name = "vector_reduction_outer"}> ({
  ^bb0(%arg7: vector<2x3x4x5xi32>, %arg8: vector<2x3xi32>):
    %4 = "vector.multi_reduction"(%arg7, %arg8) <{kind = #vector.kind<add>, reduction_dims = array<i64: 2, 3>}> : (vector<2x3x4x5xi32>, vector<2x3xi32>) -> vector<2x3xi32>
    "func.return"(%4) : (vector<2x3xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3x4x5xf32>, vector<4xf32>) -> vector<4xf32>, sym_name = "vector_multi_reduction_parallel_middle"}> ({
  ^bb0(%arg5: vector<3x4x5xf32>, %arg6: vector<4xf32>):
    %3 = "vector.multi_reduction"(%arg5, %arg6) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0, 2>}> : (vector<3x4x5xf32>, vector<4xf32>) -> vector<4xf32>
    "func.return"(%3) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf32>, f32) -> f32, sym_name = "vector_reduction_1D"}> ({
  ^bb0(%arg3: vector<2xf32>, %arg4: f32):
    %2 = "vector.multi_reduction"(%arg3, %arg4) <{kind = #vector.kind<maxnumf>, reduction_dims = array<i64: 0>}> : (vector<2xf32>, f32) -> f32
    "func.return"(%2) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x3xf32>, f32) -> f32, sym_name = "vector_multi_reduction_to_scalar"}> ({
  ^bb0(%arg1: vector<2x3xf32>, %arg2: f32):
    %1 = "vector.multi_reduction"(%arg1, %arg2) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0, 1>}> : (vector<2x3xf32>, f32) -> f32
    "func.return"(%1) : (f32) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_multi_reduction"() <{lowering_strategy = 0 : i32}> : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

