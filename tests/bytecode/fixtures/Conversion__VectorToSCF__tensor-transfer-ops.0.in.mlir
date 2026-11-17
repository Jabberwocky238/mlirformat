"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, index, index) -> vector<4x9xf32>, sym_name = "transfer_read_2d"}> ({
  ^bb0(%arg0: tensor<?x?xf32> loc("<stdin>":4:8), %arg1: index loc("<stdin>":4:32), %arg2: index loc("<stdin>":4:46)):
    %0 = "arith.constant"() <{value = -4.200000e+01 : f32}> : () -> f32 loc("<stdin>":5:10)
    %1 = "vector.transfer_read"(%arg0, %arg1, %arg2, %0) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d0, d1)>}> : (tensor<?x?xf32>, index, index, f32) -> vector<4x9xf32> loc("<stdin>":6:10)
    "func.return"(%1) : (vector<4x9xf32>) -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
