#map = affine_map<(d0) -> (d0 + 2)>
#map1 = affine_map<(d0) -> (d0 - 1)>
module {
  func.func @slice_depth1_loop_nest_with_offsets() {
    %alloc = memref.alloc() : memref<100xf32>
    %cst = arith.constant 7.000000e+00 : f32
    affine.for %arg0 = 0 to 16 {
      %0 = affine.apply #map(%arg0)
      affine.store %cst, %alloc[%0] : memref<100xf32>
    }
    affine.for %arg0 = 4 to 8 {
      %0 = affine.apply #map1(%arg0)
      %1 = affine.load %alloc[%0] : memref<100xf32>
    }
    return
  }
}

