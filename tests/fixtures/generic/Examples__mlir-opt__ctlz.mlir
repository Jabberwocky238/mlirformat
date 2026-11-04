"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "main"}> ({
  ^bb0(%arg0: i32):
    %0 = "math.ctlz"(%arg0) : (i32) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

