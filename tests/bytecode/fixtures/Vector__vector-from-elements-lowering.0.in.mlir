"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32, f32, f32) -> vector<2x2xf32>, sym_name = "unroll_from_elements_2d"}> ({
  ^bb0(%arg6: f32 loc("<stdin>":3:8), %arg7: f32 loc("<stdin>":3:20), %arg8: f32 loc("<stdin>":3:32), %arg9: f32 loc("<stdin>":3:44)):
    %2 = "vector.from_elements"(%arg6, %arg7, %arg8, %arg9) : (f32, f32, f32, f32) -> vector<2x2xf32> loc("<stdin>":4:10)
    "func.return"(%2) : (vector<2x2xf32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (f32, f32, f32, f32) -> vector<2x1x2xf32>, sym_name = "unroll_from_elements_3d"}> ({
  ^bb0(%arg2: f32 loc("<stdin>":8:8), %arg3: f32 loc("<stdin>":8:20), %arg4: f32 loc("<stdin>":8:32), %arg5: f32 loc("<stdin>":8:44)):
    %1 = "vector.from_elements"(%arg2, %arg3, %arg4, %arg5) : (f32, f32, f32, f32) -> vector<2x1x2xf32> loc("<stdin>":9:10)
    "func.return"(%1) : (vector<2x1x2xf32>) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (f32, f32) -> vector<2xf32>, sym_name = "negative_unroll_from_elements_1d"}> ({
  ^bb0(%arg0: f32 loc("<stdin>":13:8), %arg1: f32 loc("<stdin>":13:20)):
    %0 = "vector.from_elements"(%arg0, %arg1) : (f32, f32) -> vector<2xf32> loc("<stdin>":14:10)
    "func.return"(%0) : (vector<2xf32>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
}) : () -> () loc("<stdin>":1:1)
