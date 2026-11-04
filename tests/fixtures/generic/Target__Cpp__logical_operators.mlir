"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "logical"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "emitc.logical_and"(%arg0, %arg1) : (i32, i32) -> i1
    %1 = "emitc.logical_not"(%arg0) : (i32) -> i1
    %2 = "emitc.logical_or"(%arg0, %arg1) : (i32, i32) -> i1
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

