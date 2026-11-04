"builtin.module"() ({
  "func.func"() <{function_type = (!test.i32, f32) -> (), sym_name = "base_test"}> ({
  ^bb0(%arg0: !test.i32, %arg1: f32):
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, f32) -> (), sym_name = "base_test"}> ({
  ^bb0(%arg0: i32, %arg1: f32):
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

