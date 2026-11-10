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

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4xf32>, memref<4x4xf32>) -> (), sym_name = "test_memref_types"}> ({
  ^bb0(%arg0: memref<4xf32>, %arg1: memref<4x4xf32>):
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

