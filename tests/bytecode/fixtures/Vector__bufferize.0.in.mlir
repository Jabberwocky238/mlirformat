"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, index, index, f32) -> vector<5x6xf32>, sym_name = "transfer_read"}> ({
  ^bb0(%arg0: tensor<?x?xf32> loc("<stdin>":4:8), %arg1: index loc("<stdin>":4:32), %arg2: index loc("<stdin>":4:46), %arg3: f32 loc("<stdin>":4:60)):
    %0 = "vector.transfer_read"(%arg0, %arg1, %arg2, %arg3) <{in_bounds = [true, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d0, d1)>}> : (tensor<?x?xf32>, index, index, f32) -> vector<5x6xf32> loc("<stdin>":5:10)
    "func.return"(%0) : (vector<5x6xf32>) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
