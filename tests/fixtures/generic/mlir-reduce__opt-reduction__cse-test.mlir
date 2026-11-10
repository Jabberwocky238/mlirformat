"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "cse_on_func"}> ({
  ^bb0(%arg0: i32, %arg1: i32):
    %0 = "arith.addi"(%arg0, %arg1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    %1 = "arith.addi"(%arg0, %arg1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    %2 = "test.op_crash_long"(%0, %0, %1) : (i32, i32, i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

