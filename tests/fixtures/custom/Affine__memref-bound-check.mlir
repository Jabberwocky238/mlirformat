module {
}

// -----
#map = affine_map<(d0, d1) -> ((d0 * 72 + d1) floordiv 2304 + (d1 mod 9) floordiv 3)>
#map1 = affine_map<(d0, d1) -> ((d0 * 72 + d1) mod 2304 - (((d0 * 72 + d1) mod 2304) floordiv 1152) * 1151 - (((d0 * 72 + d1) mod 1152) floordiv 9) * 9 - ((d1 mod 9) floordiv 3) * 3)>
#map2 = affine_map<(d0, d1) -> ((((d0 * 72 + d1) mod 1152) floordiv 9) floordiv 8)>
module {
  func.func @test_complex_mod_floordiv(%arg0: memref<4x4x16x1xf32>) {
    %c0 = arith.constant 0 : index
    %alloc = memref.alloc() : memref<1x2x3x3x16x1xf32>
    affine.for %arg1 = 0 to 64 {
      affine.for %arg2 = 0 to 9 {
        %0 = affine.apply #map(%arg1, %arg2)
        %1 = affine.apply #map1(%arg1, %arg2)
        %2 = affine.apply #map2(%arg1, %arg2)
        %3 = affine.load %arg0[%0, %c0, %2, %c0] : memref<4x4x16x1xf32>
      }
    }
    return
  }
}

