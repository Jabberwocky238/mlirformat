"builtin.module"() ({
  "func.func"() <{function_type = (vector<2xf32>) -> (f32, f32), sym_name = "negative_unroll_to_elements_1d"}> ({
  ^bb0(%arg0: vector<2xf32>):
    %0:2 = "vector.to_elements"(%arg0) : (vector<2xf32>) -> (f32, f32)
    "func.return"(%0#0, %0#1) : (f32, f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x2xf32>) -> (f32, f32, f32, f32), sym_name = "unroll_to_elements_2d"}> ({
  ^bb0(%arg0: vector<2x2xf32>):
    %0:4 = "vector.to_elements"(%arg0) : (vector<2x2xf32>) -> (f32, f32, f32, f32)
    "func.return"(%0#0, %0#1, %0#2, %0#3) : (f32, f32, f32, f32) -> ()
  }) : () -> ()
}) : () -> ()

