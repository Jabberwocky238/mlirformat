"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> f32, sym_name = "base_test"}> ({
  ^bb0(%arg0: i32):
    %0 = "test.addi"(%arg0, %arg0) : (i32, i32) -> i32
    %1 = "test.cast"(%0) : (i32) -> f32
    "func.return"(%1) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!test.i32) -> f32, sym_name = "base_test"}> ({
  ^bb0(%arg0: !test.i32):
    %0 = "test.addi"(%arg0, %arg0) : (!test.i32, !test.i32) -> !test.i32
    %1 = "test.cast"(%0) : (!test.i32) -> f32
    "func.return"(%1) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

