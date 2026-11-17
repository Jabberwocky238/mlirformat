"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, index) -> vector<17xf32>, sym_name = "transfer_read_write_1d"}> ({
  ^bb0(%arg2: memref<?xf32> loc("<stdin>":4:8), %arg3: index loc("<stdin>":4:30)):
    %2 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32 loc("<stdin>":5:10)
    %3 = "vector.transfer_read"(%arg2, %arg3, %2) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (memref<?xf32>, index, f32) -> vector<17xf32> loc("<stdin>":6:10)
    "vector.transfer_write"(%3, %arg2, %arg3) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (vector<17xf32>, memref<?xf32>, index) -> () loc("<stdin>":7:5)
    "func.return"(%3) : (vector<17xf32>) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":3:3)
  "func.func"() <{function_type = (memref<?xf32>, index) -> vector<[17]xf32>, sym_name = "transfer_read_write_1d_scalable"}> ({
  ^bb0(%arg0: memref<?xf32> loc("<stdin>":11:8), %arg1: index loc("<stdin>":11:30)):
    %0 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32 loc("<stdin>":12:10)
    %1 = "vector.transfer_read"(%arg0, %arg1, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (memref<?xf32>, index, f32) -> vector<[17]xf32> loc("<stdin>":13:10)
    "vector.transfer_write"(%1, %arg0, %arg1) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (vector<[17]xf32>, memref<?xf32>, index) -> () loc("<stdin>":14:5)
    "func.return"(%1) : (vector<[17]xf32>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":10:3)
}) : () -> () loc("<stdin>":2:1)
