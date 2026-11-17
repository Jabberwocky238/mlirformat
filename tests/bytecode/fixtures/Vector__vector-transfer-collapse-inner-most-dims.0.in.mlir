"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x1x8x1xf32, strided<[3072, 8, 1, 1], offset: ?>>) -> vector<1x8x1xf32>, sym_name = "contiguous_inner_most"}> ({
  ^bb0(%arg3: memref<1x1x8x1xf32, strided<[3072, 8, 1, 1], offset: ?>> loc("<stdin>":4:8)):
    %9 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:10)
    %10 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":6:11)
    %11 = "vector.transfer_read"(%arg3, %9, %9, %9, %9, %10) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = affine_map<(d0, d1, d2, d3) -> (d1, d2, d3)>}> : (memref<1x1x8x1xf32, strided<[3072, 8, 1, 1], offset: ?>>, index, index, index, index, f32) -> vector<1x8x1xf32> loc("<stdin>":7:11)
    "func.return"(%11) : (vector<1x8x1xf32>) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":3:3)
  "func.func"() <{function_type = (memref<1x1x8x1xf32, strided<[3072, 8, 1, 1], offset: ?>>) -> vector<1x[8]x1xf32>, sym_name = "contiguous_inner_most_scalable_inner_dim"}> ({
  ^bb0(%arg2: memref<1x1x8x1xf32, strided<[3072, 8, 1, 1], offset: ?>> loc("<stdin>":11:8)):
    %6 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":12:10)
    %7 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":13:10)
    %8 = "vector.transfer_read"(%arg2, %6, %6, %6, %6, %7) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = affine_map<(d0, d1, d2, d3) -> (d1, d2, d3)>}> : (memref<1x1x8x1xf32, strided<[3072, 8, 1, 1], offset: ?>>, index, index, index, index, f32) -> vector<1x[8]x1xf32> loc("<stdin>":14:10)
    "func.return"(%8) : (vector<1x[8]x1xf32>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":10:3)
  "func.func"() <{function_type = (memref<1x1x8x?xf32, strided<[3072, 8, 1, 1], offset: ?>>) -> vector<1x8x1xf32>, sym_name = "negative_dynamic_trailing_dim"}> ({
  ^bb0(%arg1: memref<1x1x8x?xf32, strided<[3072, 8, 1, 1], offset: ?>> loc("<stdin>":18:8)):
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":19:10)
    %4 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":20:10)
    %5 = "vector.transfer_read"(%arg1, %3, %3, %3, %3, %4) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = affine_map<(d0, d1, d2, d3) -> (d1, d2, d3)>}> : (memref<1x1x8x?xf32, strided<[3072, 8, 1, 1], offset: ?>>, index, index, index, index, f32) -> vector<1x8x1xf32> loc("<stdin>":21:10)
    "func.return"(%5) : (vector<1x8x1xf32>) -> () loc("<stdin>":22:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (memref<1x1x8x1xf32, strided<[3072, 8, 1, 1], offset: ?>>) -> vector<1x8x[1]xf32>, sym_name = "negative_scalable_one_trailing_dim"}> ({
  ^bb0(%arg0: memref<1x1x8x1xf32, strided<[3072, 8, 1, 1], offset: ?>> loc("<stdin>":25:8)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":26:10)
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":27:10)
    %2 = "vector.transfer_read"(%arg0, %0, %0, %0, %0, %1) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = affine_map<(d0, d1, d2, d3) -> (d1, d2, d3)>}> : (memref<1x1x8x1xf32, strided<[3072, 8, 1, 1], offset: ?>>, index, index, index, index, f32) -> vector<1x8x[1]xf32> loc("<stdin>":28:10)
    "func.return"(%2) : (vector<1x8x[1]xf32>) -> () loc("<stdin>":29:5)
  }) : () -> () loc("<stdin>":24:3)
}) : () -> () loc("<stdin>":2:1)
