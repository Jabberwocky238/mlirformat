#map = affine_map<(d0)[s0] -> (d0 + s0)>
#map1 = affine_map<(d0)[s0, s1] -> (d0 * s1 + s0)>
#map2 = affine_map<() -> (4)>
#map3 = affine_map<()[s0] -> (s0)>
#map4 = affine_map<(d0, d1)[s0] -> (d0 * 16 + d1 + s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "memref_subview"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x16x4xf32, strided<[64, 4, 1]>>
    %3 = "memref.subview"(%2, %0, %0, %0, %arg0, %arg1, %arg2, %1, %1, %1) <{operandSegmentSizes = array<i32: 1, 3, 3, 3>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_strides = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>}> : (memref<8x16x4xf32, strided<[64, 4, 1]>>, index, index, index, index, index, index, index, index, index) -> memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
    %4 = "memref.alloc"(%arg2) <{operandSegmentSizes = array<i32: 0, 1>}> : (index) -> memref<64xf32, #map>
    %5 = "memref.subview"(%4, %1, %arg0, %1) <{operandSegmentSizes = array<i32: 1, 1, 1, 1>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: -9223372036854775808>}> : (memref<64xf32, #map>, index, index, index) -> memref<?xf32, #map1>
    %6 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x22xf32, strided<[22, 1]>>
    %7 = "memref.subview"(%6, %0, %1, %arg0, %arg1, %1, %0) <{operandSegmentSizes = array<i32: 1, 2, 2, 2>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: -9223372036854775808, -9223372036854775808>}> : (memref<64x22xf32, strided<[22, 1]>>, index, index, index, index, index, index) -> memref<?x?xf32, strided<[?, ?], offset: ?>>
    %8 = "memref.subview"(%2) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 2, 0>, static_sizes = array<i64: 4, 4, 4>, static_strides = array<i64: 1, 1, 1>}> : (memref<8x16x4xf32, strided<[64, 4, 1]>>) -> memref<4x4x4xf32, strided<[64, 4, 1], offset: 8>>
    %9 = "memref.alloc"(%arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32>
    %10 = "memref.subview"(%9) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 4, 4>, static_strides = array<i64: 1, 1>}> : (memref<?x?xf32>) -> memref<4x4xf32, strided<[?, 1]>>
    %11 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x4xf32>
    %12 = "memref.subview"(%11, %arg1, %arg1, %arg2, %arg2) <{operandSegmentSizes = array<i32: 1, 2, 0, 2>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 4, 4>, static_strides = array<i64: -9223372036854775808, -9223372036854775808>}> : (memref<16x4xf32>, index, index, index, index) -> memref<4x4xf32, strided<[?, ?], offset: ?>>
    %13 = "memref.subview"(%11, %arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 4, 4>, static_strides = array<i64: 2, 2>}> : (memref<16x4xf32>, index, index) -> memref<4x4xf32, strided<[8, 2], offset: ?>>
    %14 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x9x1x4x1xf32, strided<[36, 36, 4, 4, 1]>>
    %15 = "memref.subview"(%14, %arg1, %arg1, %arg1, %arg1, %arg1, %arg2, %arg2, %arg2, %arg2, %arg2) <{operandSegmentSizes = array<i32: 1, 5, 0, 5>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 1, 9, 1, 4, 1>, static_strides = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808, -9223372036854775808, -9223372036854775808>}> : (memref<1x9x1x4x1xf32, strided<[36, 36, 4, 4, 1]>>, index, index, index, index, index, index, index, index, index, index) -> memref<9x4xf32, strided<[?, ?], offset: ?>>
    %16 = "memref.subview"(%14, %arg1, %arg1, %arg1, %arg1, %arg1, %arg2, %arg2, %arg2, %arg2, %arg2) <{operandSegmentSizes = array<i32: 1, 5, 0, 5>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 1, 9, 1, 4, 1>, static_strides = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808, -9223372036854775808, -9223372036854775808>}> : (memref<1x9x1x4x1xf32, strided<[36, 36, 4, 4, 1]>>, index, index, index, index, index, index, index, index, index, index) -> memref<1x9x4xf32, strided<[?, ?, ?], offset: ?>>
    %17 = "memref.alloc"(%arg1, %arg2, %0, %1, %arg1, %arg0, %arg0, %arg2, %arg2) <{operandSegmentSizes = array<i32: 2, 7>}> : (index, index, index, index, index, index, index, index, index) -> memref<1x?x5x1x?x1xf32, strided<[?, ?, ?, ?, ?, ?], offset: ?>>
    %18 = "memref.subview"(%17, %arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 0, 2, 0>, static_offsets = array<i64: 0, 0, 0, 0, 0, 0>, static_sizes = array<i64: 1, -9223372036854775808, 5, 1, -9223372036854775808, 1>, static_strides = array<i64: 1, 1, 1, 1, 1, 1>}> : (memref<1x?x5x1x?x1xf32, strided<[?, ?, ?, ?, ?, ?], offset: ?>>, index, index) -> memref<?x5x?xf32, strided<[?, ?, ?], offset: ?>>
    %19 = "memref.subview"(%17, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 6, 2, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808, -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 1, -9223372036854775808, 5, 1, -9223372036854775808, 1>, static_strides = array<i64: 1, 1, 1, 1, 1, 1>}> : (memref<1x?x5x1x?x1xf32, strided<[?, ?, ?, ?, ?, ?], offset: ?>>, index, index, index, index, index, index, index, index) -> memref<?x5x?x1xf32, strided<[?, ?, ?, ?], offset: ?>>
    %20 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x8xf32>
    %21 = "memref.subview"(%20) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 1, 8>, static_strides = array<i64: 1, 1>}> : (memref<1x8xf32>) -> memref<8xf32>
    %22 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x16x4xf32>
    %23 = "memref.subview"(%22) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 0>, static_sizes = array<i64: 1, 16, 4>, static_strides = array<i64: 1, 1, 1>}> : (memref<8x16x4xf32>) -> memref<16x4xf32>
    %24 = "memref.subview"(%22) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 3, 4, 1>, static_sizes = array<i64: 1, 6, 3>, static_strides = array<i64: 1, 1, 1>}> : (memref<8x16x4xf32>) -> memref<6x3xf32, strided<[4, 1], offset: 209>>
    %25 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<f32>
    %26 = "memref.subview"(%25) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64>, static_sizes = array<i64>, static_strides = array<i64>}> : (memref<f32>) -> memref<f32>
    %27 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<5x3xf32>
    %28 = "memref.subview"(%27) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 2, 0>, static_sizes = array<i64: 3, 3>, static_strides = array<i64: 1, 1>}> : (memref<5x3xf32>) -> memref<3x3xf32, strided<[3, 1], offset: 6>>
    %29 = "memref.subview"(%27) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 1, 0>, static_sizes = array<i64: 1, 3>, static_strides = array<i64: 1, 1>}> : (memref<5x3xf32>) -> memref<3xf32, strided<[1], offset: 3>>
    %30 = "memref.subview"(%27) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 1, 1>, static_sizes = array<i64: 1, 1>, static_strides = array<i64: 1, 1>}> : (memref<5x3xf32>) -> memref<f32, #map2>
    %31 = "memref.subview"(%27, %arg0) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 1>, static_sizes = array<i64: 1, 1>, static_strides = array<i64: 1, 1>}> : (memref<5x3xf32>, index) -> memref<f32, #map3>
    %32 = "memref.alloc"(%arg0, %arg0) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32>
    %33 = "memref.subview"(%32, %arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: 0, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, 1>, static_strides = array<i64: 1, 1>}> : (memref<?x?xf32>, index, index) -> memref<?xf32, #map1>
    %34 = "arith.constant"() <{value = 8 : index}> : () -> index
    %35 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x16xf32>
    %36 = "memref.subview"(%35, %34) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 8>, static_sizes = array<i64: 8, 8>, static_strides = array<i64: 1, 1>}> : (memref<16x16xf32>, index) -> memref<8x8xf32, #map4>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

