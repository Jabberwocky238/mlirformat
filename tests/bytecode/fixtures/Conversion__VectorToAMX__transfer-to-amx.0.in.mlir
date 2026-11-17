"builtin.module"() ({
  "func.func"() <{function_type = (memref<64x32x16x2xf16>, memref<64x16x32x2xf16>, memref<64x64xf32>, index) -> (), sym_name = "transfers_static_dims"}> ({
  ^bb0(%arg0: memref<64x32x16x2xf16> loc("<stdin>":8:8), %arg1: memref<64x16x32x2xf16> loc("<stdin>":8:39), %arg2: memref<64x64xf32> loc("<stdin>":8:70), %arg3: index loc("<stdin>":8:96)):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f16}> : () -> f16 loc("<stdin>":9:10)
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":10:10)
    %2 = "vector.transfer_read"(%arg0, %arg3, %arg3, %arg3, %arg3, %0) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = affine_map<(d0, d1, d2, d3) -> (d1, d2, d3)>}> : (memref<64x32x16x2xf16>, index, index, index, index, f16) -> vector<4x8x2xf16> loc("<stdin>":11:10)
    %3 = "vector.transfer_read"(%arg1, %arg3, %arg3, %arg3, %arg3, %0) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = affine_map<(d0, d1, d2, d3) -> (d1, d2, d3)>}> : (memref<64x16x32x2xf16>, index, index, index, index, f16) -> vector<8x16x2xf16> loc("<stdin>":12:10)
    %4 = "vector.transfer_read"(%arg2, %arg3, %arg3, %1) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d0, d1)>}> : (memref<64x64xf32>, index, index, f32) -> vector<4x16xf32> loc("<stdin>":13:10)
    %5 = "vector.contract"(%2, %3, %4) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d2, d1, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d1)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x8x2xf16>, vector<8x16x2xf16>, vector<4x16xf32>) -> vector<4x16xf32> loc("<stdin>":14:10)
    "vector.transfer_write"(%5, %arg2, %arg3, %arg3) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = affine_map<(d0, d1) -> (d0, d1)>}> : (vector<4x16xf32>, memref<64x64xf32>, index, index) -> () loc("<stdin>":15:5)
    "func.return"() : () -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":7:3)
}) : () -> () loc("<stdin>":6:1)
