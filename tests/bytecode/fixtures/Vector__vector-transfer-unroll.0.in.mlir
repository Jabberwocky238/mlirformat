"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x4xf32>) -> vector<4x4xf32>, sym_name = "transfer_read_unroll"}> ({
  ^bb0(%arg0: memref<4x4xf32> loc("<stdin>":4:8)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:10)
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":6:10)
    %2 = "vector.transfer_read"(%arg0, %0, %0, %1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d0, d1)>}> : (memref<4x4xf32>, index, index, f32) -> vector<4x4xf32> loc("<stdin>":7:10)
    "func.return"(%2) : (vector<4x4xf32>) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
