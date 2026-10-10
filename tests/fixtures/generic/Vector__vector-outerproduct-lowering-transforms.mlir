"builtin.module"() ({
  "func.func"() <{function_type = (vector<2xf32>, vector<3xf32>) -> vector<2x3xf32>, sym_name = "outerproduct_noacc"}> ({
  ^bb0(%arg19: vector<2xf32>, %arg20: vector<3xf32>):
    %8 = "vector.outerproduct"(%arg19, %arg20) <{kind = #vector.kind<add>}> : (vector<2xf32>, vector<3xf32>) -> vector<2x3xf32>
    "func.return"(%8) : (vector<2x3xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf32>, vector<3xf32>, vector<2x3xf32>) -> vector<2x3xf32>, sym_name = "outerproduct_acc"}> ({
  ^bb0(%arg16: vector<2xf32>, %arg17: vector<3xf32>, %arg18: vector<2x3xf32>):
    %7 = "vector.outerproduct"(%arg16, %arg17, %arg18) <{kind = #vector.kind<add>}> : (vector<2xf32>, vector<3xf32>, vector<2x3xf32>) -> vector<2x3xf32>
    "func.return"(%7) : (vector<2x3xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xi32>, vector<3xi32>) -> vector<2x3xi32>, sym_name = "outerproduct_noacc_int"}> ({
  ^bb0(%arg14: vector<2xi32>, %arg15: vector<3xi32>):
    %6 = "vector.outerproduct"(%arg14, %arg15) <{kind = #vector.kind<add>}> : (vector<2xi32>, vector<3xi32>) -> vector<2x3xi32>
    "func.return"(%6) : (vector<2x3xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xi32>, vector<3xi32>, vector<2x3xi32>) -> vector<2x3xi32>, sym_name = "outerproduct_acc_int"}> ({
  ^bb0(%arg11: vector<2xi32>, %arg12: vector<3xi32>, %arg13: vector<2x3xi32>):
    %5 = "vector.outerproduct"(%arg11, %arg12, %arg13) <{kind = #vector.kind<add>}> : (vector<2xi32>, vector<3xi32>, vector<2x3xi32>) -> vector<2x3xi32>
    "func.return"(%5) : (vector<2x3xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<16xf32>, f32) -> vector<16xf32>, sym_name = "axpy_fp"}> ({
  ^bb0(%arg9: vector<16xf32>, %arg10: f32):
    %4 = "vector.outerproduct"(%arg9, %arg10) <{kind = #vector.kind<add>}> : (vector<16xf32>, f32) -> vector<16xf32>
    "func.return"(%4) : (vector<16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<16xf32>, f32, vector<16xf32>) -> vector<16xf32>, sym_name = "axpy_fp_add"}> ({
  ^bb0(%arg6: vector<16xf32>, %arg7: f32, %arg8: vector<16xf32>):
    %3 = "vector.outerproduct"(%arg6, %arg7, %arg8) <{kind = #vector.kind<add>}> : (vector<16xf32>, f32, vector<16xf32>) -> vector<16xf32>
    "func.return"(%3) : (vector<16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<16xi32>, i32) -> vector<16xi32>, sym_name = "axpy_int"}> ({
  ^bb0(%arg4: vector<16xi32>, %arg5: i32):
    %2 = "vector.outerproduct"(%arg4, %arg5) <{kind = #vector.kind<add>}> : (vector<16xi32>, i32) -> vector<16xi32>
    "func.return"(%2) : (vector<16xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<16xi32>, i32, vector<16xi32>) -> vector<16xi32>, sym_name = "axpy_int_add"}> ({
  ^bb0(%arg1: vector<16xi32>, %arg2: i32, %arg3: vector<16xi32>):
    %1 = "vector.outerproduct"(%arg1, %arg2, %arg3) <{kind = #vector.kind<add>}> : (vector<16xi32>, i32, vector<16xi32>) -> vector<16xi32>
    "func.return"(%1) : (vector<16xi32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_outerproduct"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_broadcast"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

