module {
  func.func @optimize_128x32xf16_32x128xf16(%arg0: memref<128x128xf16>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index) -> (vector<4x2xf16>, vector<4x2xf16>) {
    %alloc = memref.alloc() : memref<128x32xf16, 3>
    %alloc_0 = memref.alloc() : memref<32x128xf16, 3>
    %0 = nvgpu.device_async_copy %arg0[%arg1, %arg2], %alloc[%arg3, %arg4], 8 : memref<128x128xf16> to memref<128x32xf16, 3>
    %1 = nvgpu.device_async_create_group %0
    nvgpu.device_async_wait %1 {numGroups = 1 : i32}
    %2 = nvgpu.ldmatrix %alloc[%arg5, %arg6] {numTiles = 4 : i32, transpose = false} : memref<128x32xf16, 3> -> vector<4x2xf16>
    %3 = nvgpu.device_async_copy %arg0[%arg1, %arg2], %alloc_0[%arg3, %arg4], 8 : memref<128x128xf16> to memref<32x128xf16, 3>
    %4 = nvgpu.device_async_create_group %0
    nvgpu.device_async_wait %1 {numGroups = 1 : i32}
    %5 = nvgpu.ldmatrix %alloc_0[%arg5, %arg6] {numTiles = 4 : i32, transpose = false} : memref<32x128xf16, 3> -> vector<4x2xf16>
    return %2, %5 : vector<4x2xf16>, vector<4x2xf16>
  }
}

// -----
module {
  func.func @optimize_64x16xf32_16x64xf32(%arg0: memref<128x128xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index) -> (vector<4x1xf32>, vector<4x1xf32>, f32, vector<4xf32>, f32) {
    %alloc = memref.alloc() : memref<64x16xf32, 3>
    %alloc_0 = memref.alloc() : memref<16x64xf32, 3>
    %0 = nvgpu.device_async_copy %arg0[%arg1, %arg2], %alloc[%arg3, %arg4], 4 : memref<128x128xf32> to memref<64x16xf32, 3>
    %1 = nvgpu.device_async_create_group %0
    nvgpu.device_async_wait %1 {numGroups = 1 : i32}
    %2 = nvgpu.ldmatrix %alloc[%arg5, %arg6] {numTiles = 4 : i32, transpose = false} : memref<64x16xf32, 3> -> vector<4x1xf32>
    %3 = memref.load %alloc[%arg5, %arg6] : memref<64x16xf32, 3>
    %4 = vector.load %alloc[%arg5, %arg6] : memref<64x16xf32, 3>, vector<4xf32>
    vector.store %4, %alloc[%arg5, %arg6] : memref<64x16xf32, 3>, vector<4xf32>
    memref.store %3, %alloc[%arg5, %arg6] : memref<64x16xf32, 3>
    %5 = nvgpu.device_async_copy %arg0[%arg1, %arg2], %alloc_0[%arg3, %arg4], 4 : memref<128x128xf32> to memref<16x64xf32, 3>
    %6 = nvgpu.device_async_create_group %0
    nvgpu.device_async_wait %1 {numGroups = 1 : i32}
    %7 = nvgpu.ldmatrix %alloc_0[%arg5, %arg6] {numTiles = 4 : i32, transpose = false} : memref<16x64xf32, 3> -> vector<4x1xf32>
    %8 = memref.load %alloc_0[%arg5, %arg6] : memref<16x64xf32, 3>
    return %2, %7, %3, %4, %8 : vector<4x1xf32>, vector<4x1xf32>, f32, vector<4xf32>, f32
  }
}

// -----
module {
  func.func @small_column_size_f64(%arg0: memref<32x32xf64>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index) -> f64 {
    %alloc = memref.alloc() : memref<32x4xf64, 3>
    %0 = nvgpu.device_async_copy %arg0[%arg1, %arg2], %alloc[%arg3, %arg4], 2 : memref<32x32xf64> to memref<32x4xf64, 3>
    %1 = nvgpu.device_async_create_group %0
    nvgpu.device_async_wait %1 {numGroups = 1 : i32}
    %2 = memref.load %alloc[%arg5, %arg6] : memref<32x4xf64, 3>
    return %2 : f64
  }
  func.func @too_small_column_size_f16(%arg0: memref<128x128xf16>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index) -> vector<1x2xf16> {
    %alloc = memref.alloc() : memref<128x8xf16, 3>
    %0 = nvgpu.device_async_copy %arg0[%arg1, %arg2], %alloc[%arg3, %arg4], 8 : memref<128x128xf16> to memref<128x8xf16, 3>
    %1 = nvgpu.device_async_create_group %0
    nvgpu.device_async_wait %1 {numGroups = 1 : i32}
    %2 = nvgpu.ldmatrix %alloc[%arg5, %arg6] {numTiles = 1 : i32, transpose = false} : memref<128x8xf16, 3> -> vector<1x2xf16>
    return %2 : vector<1x2xf16>
  }
}

// -----
module {
  func.func @abort_if_subview(%arg0: memref<128x128xf16>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index) -> vector<1x2xf16> {
    %alloc = memref.alloc() : memref<128x32xf16, 3>
    %subview = memref.subview %alloc[0, 0] [64, 32] [1, 1] : memref<128x32xf16, 3> to memref<64x32xf16, 3>
    %0 = nvgpu.device_async_copy %arg0[%arg1, %arg2], %alloc[%arg3, %arg4], 8 : memref<128x128xf16> to memref<128x32xf16, 3>
    %1 = nvgpu.device_async_create_group %0
    nvgpu.device_async_wait %1 {numGroups = 1 : i32}
    %2 = nvgpu.ldmatrix %subview[%arg5, %arg6] {numTiles = 1 : i32, transpose = false} : memref<64x32xf16, 3> -> vector<1x2xf16>
    return %2 : vector<1x2xf16>
  }
}

// -----
module {
  func.func @test_0_d() -> memref<i32, #gpu.address_space<workgroup>> {
    %alloc = memref.alloc() : memref<i32, #gpu.address_space<workgroup>>
    return %alloc : memref<i32, #gpu.address_space<workgroup>>
  }
}

