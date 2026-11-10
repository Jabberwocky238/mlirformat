#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (d0 + 6)>
module {
  func.func @inner_loop_dep_bounds(%arg0: memref<32xf32>) {
    %cst = arith.constant 1.000000e+00 : f32
    affine.for %arg1 = 0 to 6 step 32 {
      affine.for %arg2 = #map(%arg1) to #map1(%arg1) {
        affine.store %cst, %arg0[%arg2] : memref<32xf32>
      }
    }
    return
  }
  func.func @inner_loop_dep_upper_bound(%arg0: memref<64xf32>) {
    %cst = arith.constant 1.000000e+00 : f32
    affine.for %arg1 = 0 to 64 step 32 {
      affine.for %arg2 = 0 to #map1(%arg1) {
        affine.store %cst, %arg0[%arg2] : memref<64xf32>
      }
    }
    return
  }
}

