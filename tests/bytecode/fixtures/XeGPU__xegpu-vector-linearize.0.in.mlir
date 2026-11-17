"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x8x4xf32>, vector<4xf32>) -> vector<2x8x4xf32>, sym_name = "test_vector_insert_2d_idx"}> ({
  ^bb0(%arg0: vector<2x8x4xf32> loc("<stdin>":3:8), %arg1: vector<4xf32> loc("<stdin>":3:34)):
    %0 = "vector.insert"(%arg1, %arg0) <{static_position = array<i64: 0, 3>}> : (vector<4xf32>, vector<2x8x4xf32>) -> vector<2x8x4xf32> loc("<stdin>":4:10)
    "func.return"(%0) : (vector<2x8x4xf32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
