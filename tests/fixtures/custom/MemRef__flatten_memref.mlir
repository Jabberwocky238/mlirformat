module {
  func.func @load_scalar_from_memref(%arg0: memref<4x8xf32, strided<[8, 1], offset: 100>>) -> f32 {
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %0 = memref.load %arg0[%c1, %c2] : memref<4x8xf32, strided<[8, 1], offset: 100>>
    return %0 : f32
  }
}

// -----
module {
  func.func @load_scalar_from_memref_dynamic_dim(%arg0: memref<?x?xf32, strided<[?, ?], offset: ?>>, %arg1: index, %arg2: index) -> f32 {
    %0 = memref.load %arg0[%arg2, %arg1] : memref<?x?xf32, strided<[?, ?], offset: ?>>
    return %0 : f32
  }
}

// -----
module {
  func.func @load_scalar_from_memref_static_dim(%arg0: memref<8x12xf32, strided<[24, 2], offset: 100>>) -> f32 {
    %c7 = arith.constant 7 : index
    %c10 = arith.constant 10 : index
    %0 = memref.load %arg0[%c7, %c10] : memref<8x12xf32, strided<[24, 2], offset: 100>>
    return %0 : f32
  }
}

// -----
module {
  func.func @store_scalar_from_memref_padded(%arg0: memref<4x8xf32, strided<[18, 2], offset: 100>>, %arg1: index, %arg2: index, %arg3: f32) {
    memref.store %arg3, %arg0[%arg2, %arg1] : memref<4x8xf32, strided<[18, 2], offset: 100>>
    return
  }
}

// -----
module {
  func.func @store_scalar_from_memref_dynamic_dim(%arg0: memref<?x?xf32, strided<[?, ?], offset: ?>>, %arg1: index, %arg2: index, %arg3: f32) {
    memref.store %arg3, %arg0[%arg2, %arg1] : memref<?x?xf32, strided<[?, ?], offset: ?>>
    return
  }
}

// -----
module {
  func.func @load_vector_from_memref(%arg0: memref<4x8xf32>) -> vector<8xf32> {
    %c3 = arith.constant 3 : index
    %c6 = arith.constant 6 : index
    %0 = vector.load %arg0[%c3, %c6] : memref<4x8xf32>, vector<8xf32>
    return %0 : vector<8xf32>
  }
}

// -----
module {
  func.func @load_vector_from_memref_odd(%arg0: memref<3x7xi2>) -> vector<3xi2> {
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    %0 = vector.load %arg0[%c1, %c3] : memref<3x7xi2>, vector<3xi2>
    return %0 : vector<3xi2>
  }
}

// -----
module {
  func.func @load_vector_from_memref_dynamic(%arg0: memref<3x7xi2>, %arg1: index, %arg2: index) -> vector<3xi2> {
    %0 = vector.load %arg0[%arg2, %arg1] : memref<3x7xi2>, vector<3xi2>
    return %0 : vector<3xi2>
  }
}

// -----
module {
  func.func @store_vector_to_memref_odd(%arg0: memref<3x7xi2>, %arg1: vector<3xi2>) {
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    vector.store %arg1, %arg0[%c1, %c3] : memref<3x7xi2>, vector<3xi2>
    return
  }
}

// -----
module {
  func.func @store_vector_to_memref_dynamic(%arg0: memref<3x7xi2>, %arg1: vector<3xi2>, %arg2: index, %arg3: index) {
    vector.store %arg1, %arg0[%arg3, %arg2] : memref<3x7xi2>, vector<3xi2>
    return
  }
}

// -----
module {
  func.func @mask_store_vector_to_memref_odd(%arg0: memref<3x7xi2>, %arg1: vector<3xi2>, %arg2: vector<3xi1>) {
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    vector.maskedstore %arg0[%c1, %c3], %arg2, %arg1 : memref<3x7xi2>, vector<3xi1>, vector<3xi2>
    return
  }
}

// -----
module {
  func.func @mask_store_vector_to_memref_dynamic(%arg0: memref<3x7xi2>, %arg1: vector<3xi2>, %arg2: index, %arg3: index, %arg4: vector<3xi1>) {
    vector.maskedstore %arg0[%arg3, %arg2], %arg4, %arg1 : memref<3x7xi2>, vector<3xi1>, vector<3xi2>
    return
  }
}

// -----
module {
  func.func @mask_load_vector_from_memref_odd(%arg0: memref<3x7xi2>, %arg1: vector<3xi1>, %arg2: vector<3xi2>) -> vector<3xi2> {
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    %0 = vector.maskedload %arg0[%c1, %c3], %arg1, %arg2 : memref<3x7xi2>, vector<3xi1>, vector<3xi2> into vector<3xi2>
    return %0 : vector<3xi2>
  }
}

// -----
module {
  func.func @mask_load_vector_from_memref_dynamic(%arg0: memref<3x7xi2>, %arg1: index, %arg2: index, %arg3: vector<3xi1>, %arg4: vector<3xi2>) -> vector<3xi2> {
    %0 = vector.maskedload %arg0[%arg2, %arg1], %arg3, %arg4 : memref<3x7xi2>, vector<3xi1>, vector<3xi2> into vector<3xi2>
    return %0 : vector<3xi2>
  }
}

// -----
module {
  func.func @transfer_read_memref(%arg0: memref<4x8xi2>, %arg1: vector<8xi2>, %arg2: index, %arg3: index) -> vector<8xi2> {
    %c0_i2 = arith.constant 0 : i2
    %0 = vector.transfer_read %arg0[%arg3, %arg2], %c0_i2 {in_bounds = [true]} : memref<4x8xi2>, vector<8xi2>
    return %0 : vector<8xi2>
  }
}

// -----
module {
  func.func @transfer_read_memref_not_inbound(%arg0: memref<4x8xi2>, %arg1: vector<8xi2>, %arg2: index, %arg3: index) -> vector<8xi2> {
    %c0_i2 = arith.constant 0 : i2
    %0 = vector.transfer_read %arg0[%arg3, %arg2], %c0_i2 : memref<4x8xi2>, vector<8xi2>
    return %0 : vector<8xi2>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0)>
module {
  func.func @transfer_read_memref_non_id(%arg0: memref<4x8xi2>, %arg1: vector<8xi2>, %arg2: index, %arg3: index) -> vector<8xi2> {
    %c0_i2 = arith.constant 0 : i2
    %0 = vector.transfer_read %arg0[%arg3, %arg2], %c0_i2 {in_bounds = [true], permutation_map = #map} : memref<4x8xi2>, vector<8xi2>
    return %0 : vector<8xi2>
  }
}

// -----
module {
  func.func @transfer_write_memref(%arg0: memref<4x8xi2>, %arg1: vector<8xi2>, %arg2: index, %arg3: index) {
    vector.transfer_write %arg1, %arg0[%arg3, %arg2] {in_bounds = [true]} : vector<8xi2>, memref<4x8xi2>
    return
  }
}

// -----
module {
  func.func @negative_transfer_read_strided_memref(%arg0: memref<4x8xf32, strided<[18, 2]>>, %arg1: index, %arg2: index) -> vector<4xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg1, %arg2], %cst {in_bounds = [true]} : memref<4x8xf32, strided<[18, 2]>>, vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @negative_transfer_read_memref_2d_transfer(%arg0: memref<4x8xf32>, %arg1: index, %arg2: index) -> vector<2x4xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg1, %arg2], %cst {in_bounds = [true, true]} : memref<4x8xf32>, vector<2x4xf32>
    return %0 : vector<2x4xf32>
  }
}

// -----
module {
  func.func @alloc() -> memref<4x8xf32> {
    %alloc = memref.alloc() : memref<4x8xf32>
    return %alloc : memref<4x8xf32>
  }
}

// -----
module {
  func.func @alloca() -> memref<4x8xf32> {
    %alloca = memref.alloca() : memref<4x8xf32>
    return %alloca : memref<4x8xf32>
  }
}

// -----
module {
  func.func @alloc_dynamic(%arg0: index) -> memref<?x4xf32> {
    %alloc = memref.alloc(%arg0) : memref<?x4xf32>
    return %alloc : memref<?x4xf32>
  }
}

// -----
module {
  func.func @alloca_dynamic(%arg0: index) -> memref<?x4xf32> {
    %alloca = memref.alloca(%arg0) : memref<?x4xf32>
    return %alloca : memref<?x4xf32>
  }
}

// -----
module {
  func.func @flatten_alloc_strided_row_major() -> memref<4x8xf32, strided<[8, 1]>> {
    %alloc = memref.alloc() : memref<4x8xf32, strided<[8, 1]>>
    return %alloc : memref<4x8xf32, strided<[8, 1]>>
  }
}

// -----
module {
  func.func @flatten_alloc_strided_offset() -> memref<4x8xf32, strided<[8, 1], offset: 50>> {
    %alloc = memref.alloc() : memref<4x8xf32, strided<[8, 1], offset: 50>>
    return %alloc : memref<4x8xf32, strided<[8, 1], offset: 50>>
  }
}

// -----
module {
  func.func @flatten_alloc_strided_padded() -> memref<4x8xf32, strided<[18, 2]>> {
    %alloc = memref.alloc() : memref<4x8xf32, strided<[18, 2]>>
    return %alloc : memref<4x8xf32, strided<[18, 2]>>
  }
}

// -----
module {
  func.func @alloc_multi_dynamic(%arg0: index, %arg1: index) -> memref<?x?xf32> {
    %alloc = memref.alloc(%arg0, %arg1) : memref<?x?xf32>
    return %alloc : memref<?x?xf32>
  }
}

// -----
module {
  func.func @chained_alloc_load() -> vector<8xf32> {
    %c3 = arith.constant 3 : index
    %c6 = arith.constant 6 : index
    %alloc = memref.alloc() : memref<4x8xf32>
    %0 = vector.load %alloc[%c3, %c6] : memref<4x8xf32>, vector<8xf32>
    return %0 : vector<8xf32>
  }
}

// -----
module {
  func.func @load_scalar_from_memref_static_dim_col_major(%arg0: memref<4x8xf32, strided<[1, 4], offset: 100>>, %arg1: index, %arg2: index) -> f32 {
    %0 = memref.load %arg0[%arg2, %arg1] : memref<4x8xf32, strided<[1, 4], offset: 100>>
    return %0 : f32
  }
}

// -----
module {
  func.func @prefetch_from_memref(%arg0: memref<4x8xf32>, %arg1: index, %arg2: index) {
    memref.prefetch %arg0[%arg1, %arg2], read, locality<3>, data : memref<4x8xf32>
    return
  }
}

// -----
module {
  func.func @dma_start_flatten_src_and_dst(%arg0: memref<4x8xf32>, %arg1: memref<2x16xf32, 1>, %arg2: memref<1xi32>, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index) {
    %c0 = arith.constant 0 : index
    memref.dma_start %arg0[%arg4, %arg5], %arg1[%arg6, %arg7], %arg3, %arg2[%c0] : memref<4x8xf32>, memref<2x16xf32, 1>, memref<1xi32>
    return
  }
}

