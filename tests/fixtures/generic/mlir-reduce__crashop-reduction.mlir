"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "simple1"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32) -> (), sym_name = "simple2"}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: i32):
    %0 = "test.op_crash_long"(%arg0, %arg1, %arg2) : (i32, i32, i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "simple5"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

