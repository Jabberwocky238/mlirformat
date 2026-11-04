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

