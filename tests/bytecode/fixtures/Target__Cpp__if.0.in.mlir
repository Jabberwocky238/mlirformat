"builtin.module"() ({
  "func.func"() <{function_type = (i1, f32) -> (), sym_name = "test_if"}> ({
  ^bb0(%arg4: i1 loc("<stdin>":3:8), %arg5: f32 loc("<stdin>":3:19)):
    "emitc.if"(%arg4) ({
      %9 = "emitc.call_opaque"(%arg5) <{callee = "func_const"}> : (f32) -> i32 loc("<stdin>":5:12)
      "emitc.yield"() : () -> () loc("<stdin>":6:7)
    }, {
    }) : (i1) -> () loc("<stdin>":4:5)
    "func.return"() : () -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (i1, f32) -> (), sym_name = "test_if_else"}> ({
  ^bb0(%arg2: i1 loc("<stdin>":12:8), %arg3: f32 loc("<stdin>":12:19)):
    "emitc.if"(%arg2) ({
      %8 = "emitc.call_opaque"(%arg3) <{callee = "func_true"}> : (f32) -> i32 loc("<stdin>":14:12)
      "emitc.yield"() : () -> () loc("<stdin>":15:7)
    }, {
      %7 = "emitc.call_opaque"(%arg3) <{callee = "func_false"}> : (f32) -> i32 loc("<stdin>":17:12)
      "emitc.yield"() : () -> () loc("<stdin>":18:7)
    }) : (i1) -> () loc("<stdin>":13:5)
    "func.return"() : () -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":11:3)
  "func.func"() <{function_type = (i1, f32) -> (), sym_name = "test_if_yield"}> ({
  ^bb0(%arg0: i1 loc("<stdin>":23:8), %arg1: f32 loc("<stdin>":23:19)):
    %0 = "emitc.constant"() <{value = 0 : i8}> : () -> i8 loc("<stdin>":24:10)
    %1 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32> loc("<stdin>":25:10)
    %2 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<f64> loc("<stdin>":26:10)
    "emitc.if"(%arg0) ({
      %5 = "emitc.call_opaque"(%arg1) <{callee = "func_true_1"}> : (f32) -> i32 loc("<stdin>":28:12)
      %6 = "emitc.call_opaque"(%arg1) <{callee = "func_true_2"}> : (f32) -> f64 loc("<stdin>":29:12)
      "emitc.assign"(%1, %5) : (!emitc.lvalue<i32>, i32) -> () loc("<stdin>":30:7)
      "emitc.assign"(%2, %6) : (!emitc.lvalue<f64>, f64) -> () loc("<stdin>":31:7)
      "emitc.yield"() : () -> () loc("<stdin>":32:7)
    }, {
      %3 = "emitc.call_opaque"(%arg1) <{callee = "func_false_1"}> : (f32) -> i32 loc("<stdin>":34:12)
      %4 = "emitc.call_opaque"(%arg1) <{callee = "func_false_2"}> : (f32) -> f64 loc("<stdin>":35:12)
      "emitc.assign"(%1, %3) : (!emitc.lvalue<i32>, i32) -> () loc("<stdin>":36:7)
      "emitc.assign"(%2, %4) : (!emitc.lvalue<f64>, f64) -> () loc("<stdin>":37:7)
      "emitc.yield"() : () -> () loc("<stdin>":38:7)
    }) : (i1) -> () loc("<stdin>":27:5)
    "func.return"() : () -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":22:3)
}) : () -> () loc("<stdin>":1:1)
