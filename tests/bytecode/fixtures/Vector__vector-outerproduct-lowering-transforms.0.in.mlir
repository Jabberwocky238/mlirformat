"builtin.module"() ({
  "func.func"() <{function_type = (vector<2xf32>, vector<3xf32>) -> vector<2x3xf32>, sym_name = "outerproduct_noacc"}> ({
  ^bb0(%arg19: vector<2xf32> loc("<stdin>":3:8), %arg20: vector<3xf32> loc("<stdin>":3:31)):
    %8 = "vector.outerproduct"(%arg19, %arg20) <{kind = #vector.kind<add>}> : (vector<2xf32>, vector<3xf32>) -> vector<2x3xf32> loc("<stdin>":4:10)
    "func.return"(%8) : (vector<2x3xf32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (vector<2xf32>, vector<3xf32>, vector<2x3xf32>) -> vector<2x3xf32>, sym_name = "outerproduct_acc"}> ({
  ^bb0(%arg16: vector<2xf32> loc("<stdin>":8:8), %arg17: vector<3xf32> loc("<stdin>":8:31), %arg18: vector<2x3xf32> loc("<stdin>":8:54)):
    %7 = "vector.outerproduct"(%arg16, %arg17, %arg18) <{kind = #vector.kind<add>}> : (vector<2xf32>, vector<3xf32>, vector<2x3xf32>) -> vector<2x3xf32> loc("<stdin>":9:10)
    "func.return"(%7) : (vector<2x3xf32>) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (vector<2xi32>, vector<3xi32>) -> vector<2x3xi32>, sym_name = "outerproduct_noacc_int"}> ({
  ^bb0(%arg14: vector<2xi32> loc("<stdin>":13:8), %arg15: vector<3xi32> loc("<stdin>":13:31)):
    %6 = "vector.outerproduct"(%arg14, %arg15) <{kind = #vector.kind<add>}> : (vector<2xi32>, vector<3xi32>) -> vector<2x3xi32> loc("<stdin>":14:10)
    "func.return"(%6) : (vector<2x3xi32>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (vector<2xi32>, vector<3xi32>, vector<2x3xi32>) -> vector<2x3xi32>, sym_name = "outerproduct_acc_int"}> ({
  ^bb0(%arg11: vector<2xi32> loc("<stdin>":18:8), %arg12: vector<3xi32> loc("<stdin>":18:31), %arg13: vector<2x3xi32> loc("<stdin>":18:54)):
    %5 = "vector.outerproduct"(%arg11, %arg12, %arg13) <{kind = #vector.kind<add>}> : (vector<2xi32>, vector<3xi32>, vector<2x3xi32>) -> vector<2x3xi32> loc("<stdin>":19:10)
    "func.return"(%5) : (vector<2x3xi32>) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (vector<16xf32>, f32) -> vector<16xf32>, sym_name = "axpy_fp"}> ({
  ^bb0(%arg9: vector<16xf32> loc("<stdin>":23:8), %arg10: f32 loc("<stdin>":23:31)):
    %4 = "vector.outerproduct"(%arg9, %arg10) <{kind = #vector.kind<add>}> : (vector<16xf32>, f32) -> vector<16xf32> loc("<stdin>":24:10)
    "func.return"(%4) : (vector<16xf32>) -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":22:3)
  "func.func"() <{function_type = (vector<16xf32>, f32, vector<16xf32>) -> vector<16xf32>, sym_name = "axpy_fp_add"}> ({
  ^bb0(%arg6: vector<16xf32> loc("<stdin>":28:8), %arg7: f32 loc("<stdin>":28:31), %arg8: vector<16xf32> loc("<stdin>":28:43)):
    %3 = "vector.outerproduct"(%arg6, %arg7, %arg8) <{kind = #vector.kind<add>}> : (vector<16xf32>, f32, vector<16xf32>) -> vector<16xf32> loc("<stdin>":29:10)
    "func.return"(%3) : (vector<16xf32>) -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":27:3)
  "func.func"() <{function_type = (vector<16xi32>, i32) -> vector<16xi32>, sym_name = "axpy_int"}> ({
  ^bb0(%arg4: vector<16xi32> loc("<stdin>":33:8), %arg5: i32 loc("<stdin>":33:31)):
    %2 = "vector.outerproduct"(%arg4, %arg5) <{kind = #vector.kind<add>}> : (vector<16xi32>, i32) -> vector<16xi32> loc("<stdin>":34:10)
    "func.return"(%2) : (vector<16xi32>) -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":32:3)
  "func.func"() <{function_type = (vector<16xi32>, i32, vector<16xi32>) -> vector<16xi32>, sym_name = "axpy_int_add"}> ({
  ^bb0(%arg1: vector<16xi32> loc("<stdin>":38:8), %arg2: i32 loc("<stdin>":38:31), %arg3: vector<16xi32> loc("<stdin>":38:43)):
    %1 = "vector.outerproduct"(%arg1, %arg2, %arg3) <{kind = #vector.kind<add>}> : (vector<16xi32>, i32, vector<16xi32>) -> vector<16xi32> loc("<stdin>":39:10)
    "func.return"(%1) : (vector<16xi32>) -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":37:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":44:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":45:12)
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_outerproduct"() : () -> () loc("<stdin>":47:9)
      }) : (!transform.any_op) -> () loc("<stdin>":46:7)
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_broadcast"() : () -> () loc("<stdin>":50:9)
      }) : (!transform.any_op) -> () loc("<stdin>":49:7)
      "transform.yield"() : () -> () loc("<stdin>":52:7)
    }) : () -> () loc("<stdin>":43:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":42:3)
}) : () -> () loc("<stdin>":1:1)
