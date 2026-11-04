"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "add_int"}> ({
  ^bb0(%arg12: i32, %arg13: i32):
    %6 = "emitc.add"(%arg12, %arg13) : (i32, i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!emitc.ptr<f32>, i32) -> (), sym_name = "add_pointer"}> ({
  ^bb0(%arg10: !emitc.ptr<f32>, %arg11: i32):
    %5 = "emitc.add"(%arg10, %arg11) : (!emitc.ptr<f32>, i32) -> !emitc.ptr<f32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "div_int"}> ({
  ^bb0(%arg8: i32, %arg9: i32):
    %4 = "emitc.div"(%arg8, %arg9) : (i32, i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "mul_int"}> ({
  ^bb0(%arg6: i32, %arg7: i32):
    %3 = "emitc.mul"(%arg6, %arg7) : (i32, i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "rem"}> ({
  ^bb0(%arg4: i32, %arg5: i32):
    %2 = "emitc.rem"(%arg4, %arg5) : (i32, i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "sub_int"}> ({
  ^bb0(%arg2: i32, %arg3: i32):
    %1 = "emitc.sub"(%arg2, %arg3) : (i32, i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!emitc.ptr<f32>, !emitc.ptr<f32>) -> (), sym_name = "sub_pointer"}> ({
  ^bb0(%arg0: !emitc.ptr<f32>, %arg1: !emitc.ptr<f32>):
    %0 = "emitc.sub"(%arg0, %arg1) : (!emitc.ptr<f32>, !emitc.ptr<f32>) -> !emitc.opaque<"ptrdiff_t">
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

