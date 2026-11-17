"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf32>) -> vector<2x3x4xf32>, sym_name = "transfer_read_inbounds"}> ({
  ^bb0(%arg0: memref<?x?x?xf32> loc("<stdin>":4:8)):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":5:10)
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":6:10)
    %2 = "vector.transfer_read"(%arg0, %1, %1, %1, %0) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 3, 1, 0>, permutation_map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>}> : (memref<?x?x?xf32>, index, index, index, f32) -> vector<2x3x4xf32> loc("<stdin>":7:10)
    "func.return"(%2) : (vector<2x3x4xf32>) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
