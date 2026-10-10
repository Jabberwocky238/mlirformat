"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> vector<4xf32>, sym_name = "inner_func_inlinable"}> ({
  ^bb0(%arg1: f32):
    %1 = "vector.broadcast"(%arg1) : (f32) -> vector<4xf32>
    "func.return"(%1) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> vector<4xf32>, sym_name = "test_inline"}> ({
  ^bb0(%arg0: f32):
    %0 = "func.call"(%arg0) <{callee = @inner_func_inlinable}> : (f32) -> vector<4xf32>
    "func.return"(%0) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

