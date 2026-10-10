"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32, f32, f32) -> vector<2x2xf32>, sym_name = "unroll_from_elements_2d"}> ({
  ^bb0(%arg6: f32, %arg7: f32, %arg8: f32, %arg9: f32):
    %2 = "vector.from_elements"(%arg6, %arg7, %arg8, %arg9) : (f32, f32, f32, f32) -> vector<2x2xf32>
    "func.return"(%2) : (vector<2x2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, f32, f32, f32) -> vector<2x1x2xf32>, sym_name = "unroll_from_elements_3d"}> ({
  ^bb0(%arg2: f32, %arg3: f32, %arg4: f32, %arg5: f32):
    %1 = "vector.from_elements"(%arg2, %arg3, %arg4, %arg5) : (f32, f32, f32, f32) -> vector<2x1x2xf32>
    "func.return"(%1) : (vector<2x1x2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, f32) -> vector<2xf32>, sym_name = "negative_unroll_from_elements_1d"}> ({
  ^bb0(%arg0: f32, %arg1: f32):
    %0 = "vector.from_elements"(%arg0, %arg1) : (f32, f32) -> vector<2xf32>
    "func.return"(%0) : (vector<2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

