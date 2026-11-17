"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf32>) -> (f32, f32, f32, f32), sym_name = "to_elements_of_shape_cast_folds"}> ({
  ^bb0(%arg0: vector<4xf32> loc("<stdin>":3:8)):
    %0 = "vector.shape_cast"(%arg0) : (vector<4xf32>) -> vector<2x2xf32> loc("<stdin>":4:10)
    %1:4 = "vector.to_elements"(%0) : (vector<2x2xf32>) -> (f32, f32, f32, f32) loc("<stdin>":5:12)
    "func.return"(%1#0, %1#1, %1#2, %1#3) : (f32, f32, f32, f32) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
