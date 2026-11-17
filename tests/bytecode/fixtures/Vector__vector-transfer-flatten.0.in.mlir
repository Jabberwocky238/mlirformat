"builtin.module"() ({
  "func.func"() <{function_type = (memref<5x4x3x2xi8, strided<[24, 6, 2, 1], offset: ?>>) -> vector<5x4x3x2xi8>, sym_name = "transfer_read_dims_match_contiguous"}> ({
  ^bb0(%arg1: memref<5x4x3x2xi8, strided<[24, 6, 2, 1], offset: ?>> loc("<stdin>":4:8)):
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:10)
    %4 = "arith.constant"() <{value = 0 : i8}> : () -> i8 loc("<stdin>":6:10)
    %5 = "vector.transfer_read"(%arg1, %3, %3, %3, %3, %4) <{in_bounds = [false, false, false, false], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>}> : (memref<5x4x3x2xi8, strided<[24, 6, 2, 1], offset: ?>>, index, index, index, index, i8) -> vector<5x4x3x2xi8> loc("<stdin>":7:10)
    "func.return"(%5) : (vector<5x4x3x2xi8>) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":3:3)
  "func.func"() <{function_type = (memref<5x4x3x2xi8, strided<[24, 6, 2, 1], offset: ?>>) -> vector<5x4x3x[2]xi8>, sym_name = "transfer_read_dims_match_contiguous_scalable"}> ({
  ^bb0(%arg0: memref<5x4x3x2xi8, strided<[24, 6, 2, 1], offset: ?>> loc("<stdin>":11:8)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":12:10)
    %1 = "arith.constant"() <{value = 0 : i8}> : () -> i8 loc("<stdin>":13:10)
    %2 = "vector.transfer_read"(%arg0, %0, %0, %0, %0, %1) <{in_bounds = [false, false, false, false], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>}> : (memref<5x4x3x2xi8, strided<[24, 6, 2, 1], offset: ?>>, index, index, index, index, i8) -> vector<5x4x3x[2]xi8> loc("<stdin>":14:10)
    "func.return"(%2) : (vector<5x4x3x[2]xi8>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":10:3)
}) : () -> () loc("<stdin>":2:1)
