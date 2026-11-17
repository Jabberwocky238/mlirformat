"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32) -> (vector<1xf32>, vector<1xf32>), sym_name = "extract_from_insert_trailing_unit_dim"}> ({
  ^bb0(%arg0: f32 loc("<stdin>":3:8), %arg1: f32 loc("<stdin>":3:20)):
    %0 = "ub.poison"() <{value = #ub.poison}> : () -> vector<4x1xf32> loc("<stdin>":4:10)
    %1 = "vector.insert"(%arg0, %0) <{static_position = array<i64: 0, 0>}> : (f32, vector<4x1xf32>) -> vector<4x1xf32> loc("<stdin>":5:10)
    %2 = "vector.insert"(%arg1, %1) <{static_position = array<i64: 1, 0>}> : (f32, vector<4x1xf32>) -> vector<4x1xf32> loc("<stdin>":6:10)
    %3 = "vector.extract"(%1) <{static_position = array<i64: 0>}> : (vector<4x1xf32>) -> vector<1xf32> loc("<stdin>":7:10)
    %4 = "vector.extract"(%2) <{static_position = array<i64: 1>}> : (vector<4x1xf32>) -> vector<1xf32> loc("<stdin>":8:10)
    "func.return"(%3, %4) : (vector<1xf32>, vector<1xf32>) -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
