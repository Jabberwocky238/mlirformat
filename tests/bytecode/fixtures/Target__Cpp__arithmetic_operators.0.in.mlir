"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "add_int"}> ({
  ^bb0(%arg12: i32 loc("<stdin>":3:8), %arg13: i32 loc("<stdin>":3:21)):
    %6 = "emitc.add"(%arg12, %arg13) : (i32, i32) -> i32 loc("<stdin>":4:10)
    "func.return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (!emitc.ptr<f32>, i32) -> (), sym_name = "add_pointer"}> ({
  ^bb0(%arg10: !emitc.ptr<f32> loc("<stdin>":8:8), %arg11: i32 loc("<stdin>":8:33)):
    %5 = "emitc.add"(%arg10, %arg11) : (!emitc.ptr<f32>, i32) -> !emitc.ptr<f32> loc("<stdin>":9:10)
    "func.return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "div_int"}> ({
  ^bb0(%arg8: i32 loc("<stdin>":13:8), %arg9: i32 loc("<stdin>":13:20)):
    %4 = "emitc.div"(%arg8, %arg9) : (i32, i32) -> i32 loc("<stdin>":14:10)
    "func.return"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "mul_int"}> ({
  ^bb0(%arg6: i32 loc("<stdin>":18:8), %arg7: i32 loc("<stdin>":18:20)):
    %3 = "emitc.mul"(%arg6, %arg7) : (i32, i32) -> i32 loc("<stdin>":19:10)
    "func.return"() : () -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "rem"}> ({
  ^bb0(%arg4: i32 loc("<stdin>":23:8), %arg5: i32 loc("<stdin>":23:20)):
    %2 = "emitc.rem"(%arg4, %arg5) : (i32, i32) -> i32 loc("<stdin>":24:10)
    "func.return"() : () -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":22:3)
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "sub_int"}> ({
  ^bb0(%arg2: i32 loc("<stdin>":28:8), %arg3: i32 loc("<stdin>":28:20)):
    %1 = "emitc.sub"(%arg2, %arg3) : (i32, i32) -> i32 loc("<stdin>":29:10)
    "func.return"() : () -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":27:3)
  "func.func"() <{function_type = (!emitc.ptr<f32>, !emitc.ptr<f32>) -> (), sym_name = "sub_pointer"}> ({
  ^bb0(%arg0: !emitc.ptr<f32> loc("<stdin>":33:8), %arg1: !emitc.ptr<f32> loc("<stdin>":33:32)):
    %0 = "emitc.sub"(%arg0, %arg1) : (!emitc.ptr<f32>, !emitc.ptr<f32>) -> !emitc.opaque<"ptrdiff_t"> loc("<stdin>":34:10)
    "func.return"() : () -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":32:3)
}) : () -> () loc("<stdin>":1:1)
