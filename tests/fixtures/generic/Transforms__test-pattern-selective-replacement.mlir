"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "test1"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "test.cast"(%arg0, %arg1) : (i32, i32) -> i32
    %1 = "arith.addi"(%0, %0) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    "test.return"(%0, %1) : (i32, i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

