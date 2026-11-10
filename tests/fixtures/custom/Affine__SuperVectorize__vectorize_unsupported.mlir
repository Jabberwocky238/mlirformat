module {
  func.func @unparallel_loop_reduction_unsupported(%arg0: memref<256x512xf32>, %arg1: memref<256xf32>) {
    %cst = arith.constant 1.000000e+00 : f32
    %0 = affine.for %arg2 = 0 to 512 iter_args(%arg3 = %cst) -> (f32) {
      %1 = arith.addf %arg3, %arg3 : f32
      affine.yield %1 : f32
    }
    return
  }
}

// -----
#map = affine_map<(d0)[s0] -> (d0 floordiv s0)>
#map1 = affine_map<(d0)[s0] -> (d0 mod s0)>
module {
  func.func @iv_mapped_to_multiple_indices_unsupported(%arg0: index) -> memref<2x2xf32> {
    %c2 = arith.constant 2 : index
    %cst = arith.constant 1.000000e+00 : f32
    %alloc = memref.alloc() : memref<2x2xf32>
    affine.for %arg1 = 0 to 4 {
      %0 = affine.apply #map(%arg1)[%c2]
      %1 = affine.apply #map1(%arg1)[%c2]
      affine.store %cst, %alloc[%0, %1] : memref<2x2xf32>
    }
    return %alloc : memref<2x2xf32>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (d0 + 1)>
module {
  func.func @store_broadcast_perm_map_unsupported(%arg0: memref<4x4xf32>, %arg1: memref<4xf32>) {
    affine.for %arg2 = 0 to 4 {
      affine.for %arg3 = #map(%arg2) to #map1(%arg2) {
        %0 = affine.load %arg0[%arg3, %arg3] : memref<4x4xf32>
        affine.store %0, %arg1[%arg3] : memref<4xf32>
      }
    }
    return
  }
}

// -----
module {
  func.func @reduction_loop_dynamic_bound_vectorized(%arg0: memref<1024xf32>) {
    %c10 = arith.constant 10 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = affine.for %arg1 = 0 to %c10 iter_args(%arg2 = %cst) -> (f32) {
      %1 = affine.load %arg0[%arg1] : memref<1024xf32>
      %2 = arith.addf %arg2, %1 : f32
      affine.yield %2 : f32
    }
    return
  }
}

