"builtin.module"() ({
  "func.func"() <{function_type = (i1, i32, i32) -> (), sym_name = "cond"}> ({
  ^bb0(%arg0: i1, %arg1: i32, %arg2: i32):
    %0 = "emitc.conditional"(%arg0, %arg1, %arg2) : (i1, i32, i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

