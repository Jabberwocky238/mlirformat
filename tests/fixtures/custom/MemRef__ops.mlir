#map = affine_map<(d0, d1)[s0] -> (d0 + s0, d1)>
module {
  func.func @alloc() {
    %alloc = memref.alloc() : memref<1024x64xf32, 1>
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %alloc_0 = memref.alloc(%c0, %c1) : memref<?x?xf32, 1>
    %alloc_1 = memref.alloc()[%c0] : memref<2x4xf32, #map, 1>
    %alloc_2 = memref.alloc(%c1)[%c0] : memref<2x?xf32, #map, 1>
    %alloc_3 = memref.alloc() : memref<2xi32>
    return
  }
  func.func @alloca() {
    %alloca = memref.alloca() : memref<1024x64xf32, 1>
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %alloca_0 = memref.alloca(%c0, %c1) : memref<?x?xf32, 1>
    %alloca_1 = memref.alloca()[%c0] : memref<2x4xf32, #map, 1>
    %alloca_2 = memref.alloca(%c1)[%c0] : memref<2x?xf32, #map, 1>
    %alloca_3 = memref.alloca() {alignment = 64 : i64} : memref<2xi32>
    return
  }
  func.func @dealloc() {
    %alloc = memref.alloc() : memref<1024x64xf32>
    memref.dealloc %alloc : memref<1024x64xf32>
    return
  }
  func.func @load_store() {
    %alloc = memref.alloc() : memref<1024x64xf32, 1>
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = memref.load %alloc[%c0, %c1] : memref<1024x64xf32, 1>
    memref.store %0, %alloc[%c0, %c1] : memref<1024x64xf32, 1>
    return
  }
  func.func @dma_ops() {
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c16 = arith.constant 16 : index
    %alloc = memref.alloc() : memref<256xf32>
    %alloc_0 = memref.alloc() : memref<256xf32, 1>
    %alloc_1 = memref.alloc() : memref<1xf32>
    %c256 = arith.constant 256 : index
    memref.dma_start %alloc[%c0], %alloc_0[%c0], %c256, %alloc_1[%c0] : memref<256xf32>, memref<256xf32, 1>, memref<1xf32>
    memref.dma_wait %alloc_1[%c0], %c256 : memref<1xf32>
    memref.dma_start %alloc[%c0], %alloc_0[%c0], %c256, %alloc_1[%c0], %c32, %c16 : memref<256xf32>, memref<256xf32, 1>, memref<1xf32>
    memref.dma_wait %alloc_1[%c0], %c256 : memref<1xf32>
    return
  }
  func.func @memref_reinterpret_cast(%arg0: memref<?xf32>) -> memref<10x?xf32, strided<[?, 1], offset: ?>> {
    %c0 = arith.constant 0 : index
    %c10 = arith.constant 10 : index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%c0], sizes: [10, %c10], strides: [%c10, 1] : memref<?xf32> to memref<10x?xf32, strided<[?, 1], offset: ?>>
    return %reinterpret_cast : memref<10x?xf32, strided<[?, 1], offset: ?>>
  }
  func.func @memref_reinterpret_cast_static_to_dynamic_sizes(%arg0: memref<?xf32>) -> memref<10x?xf32, strided<[?, 1], offset: ?>> {
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [1], sizes: [10, 10], strides: [1, 1] : memref<?xf32> to memref<10x?xf32, strided<[?, 1], offset: ?>>
    return %reinterpret_cast : memref<10x?xf32, strided<[?, 1], offset: ?>>
  }
  func.func @memref_reinterpret_cast_dynamic_offset(%arg0: memref<?xf32>, %arg1: index) -> memref<10x?xf32, strided<[?, 1], offset: ?>> {
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%arg1], sizes: [10, 10], strides: [1, 1] : memref<?xf32> to memref<10x?xf32, strided<[?, 1], offset: ?>>
    return %reinterpret_cast : memref<10x?xf32, strided<[?, 1], offset: ?>>
  }
  func.func @memref_reshape(%arg0: memref<*xf32>, %arg1: memref<1xi32>, %arg2: memref<2xi32>, %arg3: memref<?xi32>) -> memref<*xf32> {
    %reshape = memref.reshape %arg0(%arg1) : (memref<*xf32>, memref<1xi32>) -> memref<?xf32>
    %reshape_0 = memref.reshape %reshape(%arg2) : (memref<?xf32>, memref<2xi32>) -> memref<?x?xf32>
    %reshape_1 = memref.reshape %reshape_0(%arg3) : (memref<?x?xf32>, memref<?xi32>) -> memref<*xf32>
    return %reshape_1 : memref<*xf32>
  }
  memref.global @memref0 : memref<2xf32>
  memref.global constant @memref1 : memref<2xf32> = dense<[0.000000e+00, 1.000000e+00]>
  memref.global @memref2 : memref<2xf32> = uninitialized
  memref.global "private" @memref3 : memref<2xf32> = uninitialized
  memref.global "private" constant @memref4 : memref<2xf32> = uninitialized
  memref.global "private" constant @memref5 : memref<1xf16, 42 : i32> = dense<1.000000e+00>
  func.func @read_global_memref() {
    %0 = memref.get_global @memref0 : memref<2xf32>
    return
  }
  func.func @memref_copy() {
    %alloc = memref.alloc() : memref<2xf32>
    %cast = memref.cast %alloc : memref<2xf32> to memref<*xf32>
    %alloc_0 = memref.alloc() : memref<2xf32>
    %cast_1 = memref.cast %alloc : memref<2xf32> to memref<*xf32>
    memref.copy %cast, %cast_1 : memref<*xf32> to memref<*xf32>
    return
  }
  func.func @memref_dealloc() {
    %alloc = memref.alloc() : memref<2xf32>
    %cast = memref.cast %alloc : memref<2xf32> to memref<*xf32>
    memref.dealloc %cast : memref<*xf32>
    return
  }
  func.func @memref_alloca_scope() {
    memref.alloca_scope  {
    }
    return
  }
  func.func @memref_cast(%arg0: memref<4xf32>, %arg1: memref<?xf32>, %arg2: memref<64x16x4xf32, strided<[64, 4, 1]>>, %arg3: memref<4x1x8xf32, strided<[32, 16, 1]>>, %arg4: memref<4x?x8xf32, strided<[32, 8, 1]>>) {
    %cast = memref.cast %arg0 : memref<4xf32> to memref<?xf32>
    %cast_0 = memref.cast %arg1 : memref<?xf32> to memref<4xf32>
    %cast_1 = memref.cast %arg2 : memref<64x16x4xf32, strided<[64, 4, 1]>> to memref<64x16x4xf32, strided<[?, ?, ?], offset: ?>>
    %cast_2 = memref.cast %cast_1 : memref<64x16x4xf32, strided<[?, ?, ?], offset: ?>> to memref<64x16x4xf32, strided<[64, 4, 1]>>
    %cast_3 = memref.cast %cast_0 : memref<4xf32> to memref<*xf32>
    %cast_4 = memref.cast %cast_3 : memref<*xf32> to memref<4xf32>
    %cast_5 = memref.cast %arg3 : memref<4x1x8xf32, strided<[32, 16, 1]>> to memref<4x?x8xf32, strided<[32, 8, 1]>>
    %cast_6 = memref.cast %arg4 : memref<4x?x8xf32, strided<[32, 8, 1]>> to memref<4x1x8xf32, strided<[32, 16, 1]>>
    %cast_7 = memref.cast %cast_3 : memref<*xf32> to memref<*xf32>
    return
  }
  func.func private @unranked_memref_roundtrip(memref<*xf32, 4>)
  func.func @load_store_prefetch(%arg0: memref<4x4xi32>, %arg1: index) {
    %0 = memref.load %arg0[%arg1, %arg1] : memref<4x4xi32>
    %1 = memref.load %arg0[%arg1, %arg1] : memref<4x4xi32>
    memref.prefetch %arg0[%arg1, %arg1], write, locality<1>, data : memref<4x4xi32>
    memref.prefetch %arg0[%arg1, %arg1], read, locality<3>, instr : memref<4x4xi32>
    return
  }
  func.func @zero_dim_no_idx(%arg0: memref<i32>, %arg1: memref<i32>, %arg2: memref<i32>) {
    %0 = memref.load %arg0[] : memref<i32>
    memref.store %0, %arg1[] : memref<i32>
    return
  }
  func.func @load_store_alignment(%arg0: memref<4xi32>) {
    %c0 = arith.constant 0 : index
    %0 = memref.load %arg0[%c0] {alignment = 16 : i64} : memref<4xi32>
    memref.store %0, %arg0[%c0] {alignment = 16 : i64} : memref<4xi32>
    return
  }
  func.func @load_invariant(%arg0: memref<4xi32>) {
    %c0 = arith.constant 0 : index
    %0 = memref.load %arg0[%c0] {invariant = true} : memref<4xi32>
    return
  }
  func.func @memref_view(%arg0: index, %arg1: index, %arg2: index) {
    %alloc = memref.alloc() : memref<2048xi8>
    %view = memref.view %alloc[%arg2][%arg0, %arg1] : memref<2048xi8> to memref<?x?xf32>
    %view_0 = memref.view %alloc[%arg2][%arg1] : memref<2048xi8> to memref<4x?xf32>
    %c0 = arith.constant 0 : index
    %view_1 = memref.view %alloc[%c0][] : memref<2048xi8> to memref<64x4xf32>
    return
  }
  func.func @assume_alignment(%arg0: memref<4x4xf16>) {
    %assume_align = memref.assume_alignment %arg0, 16 : memref<4x4xf16>
    return
  }
  func.func @distinct_objects(%arg0: memref<?xf16>, %arg1: memref<?xf32>, %arg2: memref<?xf64>) -> (memref<?xf16>, memref<?xf32>, memref<?xf64>) {
    %0:3 = memref.distinct_objects %arg0, %arg1, %arg2 : memref<?xf16>, memref<?xf32>, memref<?xf64>
    return %0#0, %0#1, %0#2 : memref<?xf16>, memref<?xf32>, memref<?xf64>
  }
  func.func @expand_collapse_shape_static(%arg0: memref<3x4x5xf32>, %arg1: tensor<3x4x5xf32>, %arg2: tensor<3x?x5xf32>, %arg3: memref<30x20xf32, strided<[4000, 2], offset: 100>>, %arg4: memref<1x5xf32, strided<[5, 1], offset: ?>>, %arg5: memref<f32>, %arg6: memref<3x4x5xf32, strided<[240, 60, 10]>>, %arg7: memref<1x2049xi64, strided<[?, ?], offset: ?>>, %arg8: memref<1x1x1024xi8, strided<[40960, 4096, 1]>>, %arg9: memref<24x1x1x1024xi8, strided<[40960, 40960, 4096, 1]>>) {
    %collapse_shape = memref.collapse_shape %arg0 [[0, 1], [2]] : memref<3x4x5xf32> into memref<12x5xf32>
    %expand_shape = memref.expand_shape %collapse_shape [[0, 1], [2]] output_shape [3, 4, 5] : memref<12x5xf32> into memref<3x4x5xf32>
    %collapse_shape_0 = memref.collapse_shape %arg0 [[0], [1, 2]] : memref<3x4x5xf32> into memref<3x20xf32>
    %expand_shape_1 = memref.expand_shape %collapse_shape_0 [[0], [1, 2]] output_shape [3, 4, 5] : memref<3x20xf32> into memref<3x4x5xf32>
    %collapse_shape_2 = memref.collapse_shape %arg0 [[0, 1, 2]] : memref<3x4x5xf32> into memref<60xf32>
    %expand_shape_3 = memref.expand_shape %collapse_shape_2 [[0, 1, 2]] output_shape [3, 4, 5] : memref<60xf32> into memref<3x4x5xf32>
    %expand_shape_4 = memref.expand_shape %arg5 [] output_shape [1, 1] : memref<f32> into memref<1x1xf32>
    %expand_shape_5 = memref.expand_shape %arg3 [[0], [1, 2]] output_shape [30, 4, 5] : memref<30x20xf32, strided<[4000, 2], offset: 100>> into memref<30x4x5xf32, strided<[4000, 10, 2], offset: 100>>
    %expand_shape_6 = memref.expand_shape %arg3 [[0, 1], [2]] output_shape [2, 15, 20] : memref<30x20xf32, strided<[4000, 2], offset: 100>> into memref<2x15x20xf32, strided<[60000, 4000, 2], offset: 100>>
    %expand_shape_7 = memref.expand_shape %arg4 [[0], [1, 2]] output_shape [1, 1, 5] : memref<1x5xf32, strided<[5, 1], offset: ?>> into memref<1x1x5xf32, strided<[5, 5, 1], offset: ?>>
    %collapse_shape_8 = memref.collapse_shape %arg6 [[0, 1], [2]] : memref<3x4x5xf32, strided<[240, 60, 10]>> into memref<12x5xf32, strided<[60, 10]>>
    %collapse_shape_9 = memref.collapse_shape %arg7 [[0, 1]] : memref<1x2049xi64, strided<[?, ?], offset: ?>> into memref<2049xi64, strided<[?], offset: ?>>
    %collapse_shape_10 = memref.collapse_shape %arg8 [[0, 1, 2]] : memref<1x1x1024xi8, strided<[40960, 4096, 1]>> into memref<1024xi8, strided<[1]>>
    %collapse_shape_11 = memref.collapse_shape %arg9 [[0], [1, 2, 3]] : memref<24x1x1x1024xi8, strided<[40960, 40960, 4096, 1]>> into memref<24x1024xi8, strided<[40960, 1]>>
    %expand_shape_12 = memref.expand_shape %arg0 [[0, 1], [2], [3, 4]] output_shape [1, 3, 4, 1, 5] : memref<3x4x5xf32> into memref<1x3x4x1x5xf32>
    %collapse_shape_13 = memref.collapse_shape %expand_shape_12 [[0, 1], [2], [3, 4]] : memref<1x3x4x1x5xf32> into memref<3x4x5xf32>
    %expanded = tensor.expand_shape %arg1 [[0, 1], [2], [3, 4]] output_shape [1, 3, 4, 1, 5] : tensor<3x4x5xf32> into tensor<1x3x4x1x5xf32>
    %collapsed = tensor.collapse_shape %expanded [[0, 1], [2], [3, 4]] : tensor<1x3x4x1x5xf32> into tensor<3x4x5xf32>
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg2, %c1 : tensor<3x?x5xf32>
    %expanded_14 = tensor.expand_shape %arg2 [[0, 1], [2], [3, 4]] output_shape [1, 3, %dim, 1, 5] : tensor<3x?x5xf32> into tensor<1x3x?x1x5xf32>
    %collapsed_15 = tensor.collapse_shape %expanded_14 [[0], [1, 2], [3, 4]] : tensor<1x3x?x1x5xf32> into tensor<1x?x5xf32>
    return
  }
  func.func @expand_collapse_shape_dynamic(%arg0: memref<?x?x?xf32>, %arg1: memref<?x?x?xf32, strided<[?, ?, 1]>>, %arg2: memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>, %arg3: memref<?x42xf32, strided<[42, 1]>>, %arg4: index, %arg5: index, %arg6: index, %arg7: memref<4x?x4xf32>, %arg8: memref<1x1x18x?xf32, strided<[?, ?, ?, 1], offset: ?>>, %arg9: memref<3x3x1x96xf32, strided<[288, 96, 96, 1], offset: 864>>) {
    %collapse_shape = memref.collapse_shape %arg0 [[0, 1], [2]] : memref<?x?x?xf32> into memref<?x?xf32>
    %expand_shape = memref.expand_shape %collapse_shape [[0, 1], [2]] output_shape [%arg4, 4, %arg5] : memref<?x?xf32> into memref<?x4x?xf32>
    %collapse_shape_0 = memref.collapse_shape %arg1 [[0, 1], [2]] : memref<?x?x?xf32, strided<[?, ?, 1]>> into memref<?x?xf32, strided<[?, 1]>>
    %expand_shape_1 = memref.expand_shape %collapse_shape_0 [[0, 1], [2]] output_shape [%arg4, 4, %arg5] : memref<?x?xf32, strided<[?, 1]>> into memref<?x4x?xf32, strided<[?, ?, 1]>>
    %collapse_shape_2 = memref.collapse_shape %arg2 [[0, 1], [2]] : memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>> into memref<?x?xf32, strided<[?, 1], offset: ?>>
    %expand_shape_3 = memref.expand_shape %collapse_shape_2 [[0, 1], [2]] output_shape [%arg4, 4, %arg5] : memref<?x?xf32, strided<[?, 1], offset: ?>> into memref<?x4x?xf32, strided<[?, ?, 1], offset: ?>>
    %collapse_shape_4 = memref.collapse_shape %arg3 [[0, 1]] : memref<?x42xf32, strided<[42, 1]>> into memref<?xf32, strided<[1]>>
    %expand_shape_5 = memref.expand_shape %collapse_shape_4 [[0, 1]] output_shape [%arg6, 42] : memref<?xf32, strided<[1]>> into memref<?x42xf32>
    %expand_shape_6 = memref.expand_shape %arg7 [[0, 1], [2], [3, 4]] output_shape [2, 2, %arg4, 2, 2] : memref<4x?x4xf32> into memref<2x2x?x2x2xf32>
    %collapse_shape_7 = memref.collapse_shape %arg8 [[0, 1], [2], [3]] : memref<1x1x18x?xf32, strided<[?, ?, ?, 1], offset: ?>> into memref<1x18x?xf32, strided<[?, ?, 1], offset: ?>>
    %collapse_shape_8 = memref.collapse_shape %arg9 [[0], [1, 2, 3]] : memref<3x3x1x96xf32, strided<[288, 96, 96, 1], offset: 864>> into memref<3x288xf32, strided<[288, 1], offset: 864>>
    return
  }
  func.func @expand_collapse_shape_zero_dim(%arg0: memref<1x1xf32>, %arg1: memref<f32>) -> (memref<f32>, memref<1x1xf32>) {
    %collapse_shape = memref.collapse_shape %arg0 [] : memref<1x1xf32> into memref<f32>
    %expand_shape = memref.expand_shape %collapse_shape [] output_shape [1, 1] : memref<f32> into memref<1x1xf32>
    return %collapse_shape, %expand_shape : memref<f32>, memref<1x1xf32>
  }
  func.func @collapse_shape_to_dynamic(%arg0: memref<?x?x?x4x?xf32>) -> memref<?x?x?xf32> {
    %collapse_shape = memref.collapse_shape %arg0 [[0], [1], [2, 3, 4]] : memref<?x?x?x4x?xf32> into memref<?x?x?xf32>
    return %collapse_shape : memref<?x?x?xf32>
  }
}

// -----
module {
  func.func @expand_collapse_shape_transposed_layout(%arg0: memref<?x?xf32, strided<[1, 10]>>, %arg1: memref<4x5x6xf32, strided<[1, ?, 1000]>>, %arg2: index, %arg3: index) {
    %expand_shape = memref.expand_shape %arg0 [[0], [1, 2]] output_shape [%arg2, %arg3, 5] : memref<?x?xf32, strided<[1, 10]>> into memref<?x?x5xf32, strided<[1, 50, 10]>>
    %collapse_shape = memref.collapse_shape %expand_shape [[0], [1, 2]] : memref<?x?x5xf32, strided<[1, 50, 10]>> into memref<?x?xf32, strided<[1, 10]>>
    %expand_shape_0 = memref.expand_shape %arg1 [[0, 1], [2], [3, 4]] output_shape [2, 2, 5, 2, 3] : memref<4x5x6xf32, strided<[1, ?, 1000]>> into memref<2x2x5x2x3xf32, strided<[2, 1, ?, 3000, 1000]>>
    %collapse_shape_1 = memref.collapse_shape %expand_shape_0 [[0, 1], [2], [3, 4]] : memref<2x2x5x2x3xf32, strided<[2, 1, ?, 3000, 1000]>> into memref<4x5x6xf32, strided<[1, ?, 1000]>>
    return
  }
}

// -----
module {
  func.func @rank(%arg0: memref<4x4x?xf32>) {
    %0 = memref.rank %arg0 : memref<4x4x?xf32>
    %1 = memref.rank %arg0 : memref<4x4x?xf32>
    return
  }
}

// -----
module {
  func.func @atomic_rmw(%arg0: memref<10xf32>, %arg1: f32, %arg2: index) {
    %0 = memref.atomic_rmw addf %arg1, %arg0[%arg2] : (f32, memref<10xf32>) -> f32
    return
  }
  func.func @generic_atomic_rmw(%arg0: memref<1x2xf32>, %arg1: index, %arg2: index) {
    %0 = memref.generic_atomic_rmw %arg0[%arg1, %arg2] : memref<1x2xf32> {
    ^bb0(%arg3: f32):
      %cst = arith.constant 1.000000e+00 : f32
      %1 = arith.addf %cst, %arg3 : f32
      memref.atomic_yield %1 : f32
    } {index_attr = 8 : index}
    return
  }
}

// -----
module {
  func.func @extract_strided_metadata(%arg0: memref<10x?xf32>) -> memref<?x?xf32, strided<[?, ?], offset: ?>> {
    %base_buffer, %offset, %sizes:2, %strides:2 = memref.extract_strided_metadata %arg0 : memref<10x?xf32> -> memref<f32>, index, index, index, index, index
    %reinterpret_cast = memref.reinterpret_cast %base_buffer to offset: [%offset], sizes: [%sizes#0, %sizes#1], strides: [%strides#0, %strides#1] : memref<f32> to memref<?x?xf32, strided<[?, ?], offset: ?>>
    return %reinterpret_cast : memref<?x?xf32, strided<[?, ?], offset: ?>>
  }
}

// -----
#map = affine_map<(d0, d1)[s0] -> (d1 * s0 + d0)>
module {
  func.func @memref_realloc_ss(%arg0: memref<2xf32>) -> memref<4xf32> {
    %0 = memref.realloc %arg0 : memref<2xf32> to memref<4xf32>
    return %0 : memref<4xf32>
  }
  func.func @memref_realloc_sd(%arg0: memref<2xf32>, %arg1: index) -> memref<?xf32> {
    %0 = memref.realloc %arg0(%arg1) : memref<2xf32> to memref<?xf32>
    return %0 : memref<?xf32>
  }
  func.func @memref_realloc_ds(%arg0: memref<?xf32>) -> memref<4xf32> {
    %0 = memref.realloc %arg0 : memref<?xf32> to memref<4xf32>
    return %0 : memref<4xf32>
  }
  func.func @memref_realloc_dd(%arg0: memref<?xf32>, %arg1: index) -> memref<?xf32> {
    %0 = memref.realloc %arg0(%arg1) : memref<?xf32> to memref<?xf32>
    return %0 : memref<?xf32>
  }
  func.func @memref_extract_aligned_pointer(%arg0: memref<?xf32>) -> index {
    %intptr = memref.extract_aligned_pointer_as_index %arg0 : memref<?xf32> -> index
    return %intptr : index
  }
  func.func @memref_memory_space_cast(%arg0: memref<?xf32>) -> memref<?xf32, 1> {
    %memspacecast = memref.memory_space_cast %arg0 : memref<?xf32> to memref<?xf32, 1>
    return %memspacecast : memref<?xf32, 1>
  }
  func.func @memref_transpose_map(%arg0: memref<?x?xf32>) -> memref<?x?xf32, #map> {
    %transpose = memref.transpose %arg0 (d0, d1) -> (d1, d0) : memref<?x?xf32> to memref<?x?xf32, #map>
    return %transpose : memref<?x?xf32, #map>
  }
}

