"builtin.module"() ({
  "func.func"() <{function_type = (i1, f32) -> (), sym_name = "test_if"}> ({
  ^bb0(%arg4: i1 loc("<stdin>":3:8), %arg5: f32 loc("<stdin>":3:19)):
    "scf.if"(%arg4) ({
      %8 = "emitc.call_opaque"(%arg5) <{callee = "func_const"}> : (f32) -> i32 loc("<stdin>":5:12)
      "scf.yield"() : () -> () loc("<stdin>":6:7)
    }, {
    }) : (i1) -> () loc("<stdin>":4:5)
    "func.return"() : () -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (i1, f32) -> (), sym_name = "test_if_else"}> ({
  ^bb0(%arg2: i1 loc("<stdin>":12:8), %arg3: f32 loc("<stdin>":12:19)):
    "scf.if"(%arg2) ({
      %7 = "emitc.call_opaque"(%arg3) <{callee = "func_true"}> : (f32) -> i32 loc("<stdin>":14:12)
      "scf.yield"() : () -> () loc("<stdin>":15:7)
    }, {
      %6 = "emitc.call_opaque"(%arg3) <{callee = "func_false"}> : (f32) -> i32 loc("<stdin>":17:12)
      "scf.yield"() : () -> () loc("<stdin>":18:7)
    }) : (i1) -> () loc("<stdin>":13:5)
    "func.return"() : () -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":11:3)
  "func.func"() <{function_type = (i1, f32) -> (i32, f64), sym_name = "test_if_yield"}> ({
  ^bb0(%arg0: i1 loc("<stdin>":23:8), %arg1: f32 loc("<stdin>":23:19)):
    %0 = "arith.constant"() <{value = 0 : i8}> : () -> i8 loc("<stdin>":24:10)
    %1:2 = "scf.if"(%arg0) ({
      %4 = "emitc.call_opaque"(%arg1) <{callee = "func_true_1"}> : (f32) -> i32 loc("<stdin>":26:12)
      %5 = "emitc.call_opaque"(%arg1) <{callee = "func_true_2"}> : (f32) -> f64 loc("<stdin>":27:12)
      "scf.yield"(%4, %5) : (i32, f64) -> () loc("<stdin>":28:7)
    }, {
      %2 = "emitc.call_opaque"(%arg1) <{callee = "func_false_1"}> : (f32) -> i32 loc("<stdin>":30:12)
      %3 = "emitc.call_opaque"(%arg1) <{callee = "func_false_2"}> : (f32) -> f64 loc("<stdin>":31:12)
      "scf.yield"(%2, %3) : (i32, f64) -> () loc("<stdin>":32:7)
    }) : (i1) -> (i32, f64) loc("<stdin>":25:12)
    "func.return"(%1#0, %1#1) : (i32, f64) -> () loc("<stdin>":34:5)
  }) : () -> () loc("<stdin>":22:3)
}) : () -> () loc("<stdin>":1:1)
