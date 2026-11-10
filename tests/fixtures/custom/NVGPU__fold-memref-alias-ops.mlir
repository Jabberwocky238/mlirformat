module {
  func.func @fold_nvgpu_device_async_copy_zero_sub_idx(%arg0: memref<2x128x768xf16>, %arg1: index, %arg2: index, %arg3: index) {
    %c0 = arith.constant 0 : index
    %alloc = memref.alloc() : memref<5x1x64x64xf16, #gpu.address_space<workgroup>>
    %subview = memref.subview %arg0[%arg1, %arg2, %arg3] [1, 1, 8] [1, 1, 1] : memref<2x128x768xf16> to memref<1x8xf16, strided<[98304, 1], offset: ?>>
    %0 = nvgpu.device_async_copy %subview[%c0, %c0], %alloc[%c0, %c0, %c0, %c0], 8 {bypassL1} : memref<1x8xf16, strided<[98304, 1], offset: ?>> to memref<5x1x64x64xf16, #gpu.address_space<workgroup>>
    return
  }
}

// -----
module {
  func.func @fold_src_nvgpu_device_async_copy(%arg0: memref<2x128x768xf16>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index) {
    %c0 = arith.constant 0 : index
    %alloc = memref.alloc() : memref<5x1x64x64xf16, #gpu.address_space<workgroup>>
    %subview = memref.subview %arg0[%arg1, %arg2, %arg3] [1, 1, 8] [1, 1, 1] : memref<2x128x768xf16> to memref<1x8xf16, strided<[98304, 1], offset: ?>>
    %0 = nvgpu.device_async_copy %subview[%arg4, %arg5], %alloc[%c0, %c0, %c0, %c0], 8 {bypassL1} : memref<1x8xf16, strided<[98304, 1], offset: ?>> to memref<5x1x64x64xf16, #gpu.address_space<workgroup>>
    return
  }
}

// -----
module {
  func.func @fold_src_fold_dest_nvgpu_device_async_copy(%arg0: memref<2x128x768xf16>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index) {
    %c0 = arith.constant 0 : index
    %alloc = memref.alloc() : memref<5x1x64x64xf16, #gpu.address_space<workgroup>>
    %subview = memref.subview %arg0[%arg1, %arg2, %arg3] [1, 1, 8] [1, 1, 1] : memref<2x128x768xf16> to memref<1x8xf16, strided<[98304, 1], offset: ?>>
    %subview_0 = memref.subview %alloc[%arg6, %arg7, %arg8, %arg9] [1, 1, 1, 8] [1, 1, 1, 1] : memref<5x1x64x64xf16, #gpu.address_space<workgroup>> to memref<1x8xf16, strided<[4096, 1], offset: ?>, #gpu.address_space<workgroup>>
    %0 = nvgpu.device_async_copy %subview[%arg4, %arg5], %subview_0[%arg10, %arg11], 8 {bypassL1} : memref<1x8xf16, strided<[98304, 1], offset: ?>> to memref<1x8xf16, strided<[4096, 1], offset: ?>, #gpu.address_space<workgroup>>
    return
  }
}

// -----
#map = affine_map<()[s0] -> (-s0 + 4)>
#map1 = affine_map<()[s0] -> (-s0 + 32)>
module {
  func.func @test_ldmatrix(%arg0: memref<4x32x32xf16, 3>, %arg1: index, %arg2: index, %arg3: index) -> vector<4x2xf16> {
    %c0 = arith.constant 0 : index
    %0 = affine.apply #map()[%arg1]
    %1 = affine.apply #map1()[%arg2]
    %2 = affine.apply #map1()[%arg3]
    %subview = memref.subview %arg0[%arg1, %arg2, %arg3] [%0, %1, %2] [1, 1, 1] : memref<4x32x32xf16, 3> to memref<?x?x?xf16, strided<[1024, 32, 1], offset: ?>, 3>
    %3 = nvgpu.ldmatrix %subview[%c0, %c0, %c0] {numTiles = 4 : i32, transpose = false} : memref<?x?x?xf16, strided<[1024, 32, 1], offset: ?>, 3> -> vector<4x2xf16>
    return %3 : vector<4x2xf16>
  }
}

// -----
module {
  func.func @ldmatrix_expand(%arg0: memref<4096xf16, 3>, %arg1: index, %arg2: index, %arg3: index) -> vector<4x2xf16> {
    %expand_shape = memref.expand_shape %arg0 [[0, 1, 2]] output_shape [4, 32, 32] : memref<4096xf16, 3> into memref<4x32x32xf16, 3>
    %0 = nvgpu.ldmatrix %expand_shape[%arg1, %arg2, %arg3] {numTiles = 4 : i32, transpose = false} : memref<4x32x32xf16, 3> -> vector<4x2xf16>
    return %0 : vector<4x2xf16>
  }
}

