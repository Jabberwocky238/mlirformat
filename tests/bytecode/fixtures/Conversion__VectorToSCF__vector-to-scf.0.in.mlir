"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>) -> (), sym_name = "vector_transfer_ops_0d"}> ({
  ^bb0(%arg0: memref<f32> loc("<stdin>":4:8)):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":5:10)
    %1 = "vector.transfer_read"(%arg0, %0) <{in_bounds = [], operandSegmentSizes = array<i32: 1, 0, 1, 0>, permutation_map = affine_map<() -> ()>}> : (memref<f32>, f32) -> vector<f32> loc("<stdin>":6:10)
    "vector.transfer_write"(%1, %arg0) <{in_bounds = [], operandSegmentSizes = array<i32: 1, 1, 0, 0>, permutation_map = affine_map<() -> ()>}> : (vector<f32>, memref<f32>) -> () loc("<stdin>":7:5)
    "func.return"() : () -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
