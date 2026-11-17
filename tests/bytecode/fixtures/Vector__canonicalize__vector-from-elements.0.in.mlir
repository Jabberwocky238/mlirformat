"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32) -> (f32, f32, f32, f32, f32, f32, f32), sym_name = "extract_scalar_from_from_elements"}> ({
  ^bb0(%arg0: f32 loc("<stdin>":3:8), %arg1: f32 loc("<stdin>":3:20)):
    %0 = "vector.from_elements"(%arg0) : (f32) -> vector<f32> loc("<stdin>":4:10)
    %1 = "vector.extract"(%0) <{static_position = array<i64>}> : (vector<f32>) -> f32 loc("<stdin>":5:10)
    %2 = "vector.from_elements"(%arg0) : (f32) -> vector<1xf32> loc("<stdin>":6:10)
    %3 = "vector.extract"(%2) <{static_position = array<i64: 0>}> : (vector<1xf32>) -> f32 loc("<stdin>":7:10)
    %4 = "vector.from_elements"(%arg0, %arg1, %arg0, %arg0, %arg1) : (f32, f32, f32, f32, f32) -> vector<5xf32> loc("<stdin>":8:10)
    %5 = "vector.extract"(%4) <{static_position = array<i64: 4>}> : (vector<5xf32>) -> f32 loc("<stdin>":9:10)
    %6 = "vector.from_elements"(%arg0, %arg0, %arg0, %arg1, %arg1, %arg1) : (f32, f32, f32, f32, f32, f32) -> vector<2x3xf32> loc("<stdin>":10:10)
    %7 = "vector.extract"(%6) <{static_position = array<i64: 0, 0>}> : (vector<2x3xf32>) -> f32 loc("<stdin>":11:10)
    %8 = "vector.extract"(%6) <{static_position = array<i64: 0, 1>}> : (vector<2x3xf32>) -> f32 loc("<stdin>":12:10)
    %9 = "vector.extract"(%6) <{static_position = array<i64: 1, 1>}> : (vector<2x3xf32>) -> f32 loc("<stdin>":13:10)
    %10 = "vector.extract"(%6) <{static_position = array<i64: 1, 2>}> : (vector<2x3xf32>) -> f32 loc("<stdin>":14:11)
    "func.return"(%1, %3, %5, %7, %8, %9, %10) : (f32, f32, f32, f32, f32, f32, f32) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
