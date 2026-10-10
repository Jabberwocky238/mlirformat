module {
}

// -----
#map = affine_map<(d0, d1) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d1)>
#map2 = affine_map<(d0, d1) -> (d0 * 10 - d1 + 19)>
#map3 = affine_map<(d0, d1, d2) -> (d0 mod 128 + 1)>
#map4 = affine_map<(d0, d1, d2) -> (d1 floordiv 4 + 1)>
#map5 = affine_map<(d0, d1, d2) -> (d2 ceildiv 4)>
#map6 = affine_map<(d0, d1, d2) -> (d0 mod 128)>
#map7 = affine_map<(d0, d1, d2) -> (d1 floordiv 4)>
#map8 = affine_map<(d0, d1, d2) -> (d2 ceildiv 4 - 1)>
#map9 = affine_map<(d0, d1) -> ((d0 ceildiv 64) * 64)>
#map10 = affine_map<(d0, d1) -> (d0 floordiv 256)>
#map11 = affine_map<(d0, d1) -> ((d0 mod 1024) floordiv 4)>
#map12 = affine_map<(d0, d1) -> (((d1 mod 32) ceildiv 4) * 32)>
#map13 = affine_map<(d0)[s0] -> (d0 * s0)>
#map14 = affine_map<(d0) -> ((d0 mod 147456) floordiv 1152)>
#map15 = affine_map<(d0) -> ((d0 mod 1152) floordiv 384)>
#map16 = affine_map<(d0, d1) -> (d0 * 9216 + d1 * 128)>
#map17 = affine_map<(d0) -> (d0 floordiv 294912)>
#map18 = affine_map<(d0) -> ((d0 mod 294912) floordiv 147456)>
#map19 = affine_map<(d0) -> (((d0 mod 147456) floordiv 1152) floordiv 8)>
#map20 = affine_map<(d0) -> ((d0 mod 384) floordiv 128)>
#map21 = affine_map<(d0) -> ((d0 mod 128) floordiv 128)>
#map22 = affine_map<(d0) -> ((d0 * 100) floordiv 1000)>
module {
  func.func @test() {
    %c0 = arith.constant 0 : index
    %c-1 = arith.constant -1 : index
    %c111 = arith.constant 111 : index
    %alloc = memref.alloc() : memref<9x9xi32>
    %alloc_0 = memref.alloc() : memref<111xi32>
    affine.for %arg0 = -1 to 10 {
      affine.for %arg1 = -1 to 10 {
        %0 = affine.apply #map(%arg0, %arg1)
        %1 = affine.apply #map1(%arg0, %arg1)
        %2 = affine.load %alloc[%0, %1] : memref<9x9xi32>
        %3 = affine.apply #map2(%arg0, %arg1)
        %4 = affine.load %alloc_0[%3] : memref<111xi32>
      }
    }
    affine.for %arg0 = 0 to 10 {
      %0 = affine.load %alloc_0[%c0] : memref<111xi32>
      %1 = affine.load %alloc_0[%c111] : memref<111xi32>
      affine.store %1, %alloc_0[%c-1] : memref<111xi32>
    }
    return
  }
  func.func @test_mod_floordiv_ceildiv() {
    %c0 = arith.constant 0 : index
    %alloc = memref.alloc() : memref<128x64x64xi32>
    affine.for %arg0 = 0 to 256 {
      affine.for %arg1 = 0 to 256 {
        %0 = affine.apply #map3(%arg0, %arg1, %arg1)
        %1 = affine.apply #map4(%arg0, %arg1, %arg1)
        %2 = affine.apply #map5(%arg0, %arg1, %arg1)
        %3 = affine.load %alloc[%0, %1, %2] : memref<128x64x64xi32>
        %4 = affine.apply #map6(%arg0, %arg1, %arg1)
        %5 = affine.apply #map7(%arg0, %arg1, %arg1)
        %6 = affine.apply #map8(%arg0, %arg1, %arg1)
        affine.store %3, %alloc[%4, %5, %6] : memref<128x64x64xi32>
      }
    }
    return
  }
  func.func @test_no_out_of_bounds() {
    %c0 = arith.constant 0 : index
    %alloc = memref.alloc() : memref<257x256xi32>
    %alloc_0 = memref.alloc() : memref<257xi32>
    %alloc_1 = memref.alloc() : memref<1xi32>
    affine.for %arg0 = 0 to 256 {
      affine.for %arg1 = 0 to 256 {
        %0 = affine.apply #map9(%arg0, %arg1)
        %1 = affine.load %alloc[%0, %c0] : memref<257x256xi32>
        %2 = affine.apply #map10(%arg0, %arg0)
        %3 = affine.load %alloc_1[%2] : memref<1xi32>
      }
    }
    return
  }
  func.func @mod_div() {
    %c0 = arith.constant 0 : index
    %alloc = memref.alloc() : memref<128x64x64xi32>
    affine.for %arg0 = 0 to 256 {
      affine.for %arg1 = 0 to 256 {
        %0 = affine.apply #map3(%arg0, %arg1, %arg1)
        %1 = affine.apply #map4(%arg0, %arg1, %arg1)
        %2 = affine.apply #map5(%arg0, %arg1, %arg1)
        %3 = affine.load %alloc[%0, %1, %2] : memref<128x64x64xi32>
        %4 = affine.apply #map6(%arg0, %arg1, %arg1)
        %5 = affine.apply #map7(%arg0, %arg1, %arg1)
        %6 = affine.apply #map8(%arg0, %arg1, %arg1)
        affine.store %3, %alloc[%4, %5, %6] : memref<128x64x64xi32>
      }
    }
    return
  }
  func.func @mod_floordiv_nested() {
    %alloc = memref.alloc() : memref<256x256xi32>
    affine.for %arg0 = 0 to 256 {
      affine.for %arg1 = 0 to 256 {
        %0 = affine.apply #map11(%arg0, %arg1)
        %1 = affine.apply #map12(%arg0, %arg1)
        %2 = affine.load %alloc[%0, %1] : memref<256x256xi32>
      }
    }
    return
  }
  func.func @test_semi_affine_bailout(%arg0: index) {
    %alloc = memref.alloc() : memref<10xi32>
    affine.for %arg1 = 0 to 10 {
      %0 = affine.apply #map13(%arg1)[%arg0]
      %1 = affine.load %alloc[%0] : memref<10xi32>
    }
    return
  }
  func.func @multi_mod_floordiv() {
    %alloc = memref.alloc() : memref<2x2xi32>
    affine.for %arg0 = 0 to 64 {
      %0 = affine.apply #map14(%arg0)
      %1 = affine.apply #map15(%arg0)
      %2 = affine.load %alloc[%0, %1] : memref<2x2xi32>
    }
    return
  }
  func.func @delinearize_mod_floordiv() {
    %c0 = arith.constant 0 : index
    %alloc = memref.alloc() : memref<2x2x3x3x16x1xi32>
    %alloc_0 = memref.alloc() : memref<64x9xi32>
    affine.for %arg0 = 0 to 64 {
      affine.for %arg1 = 0 to 9 {
        %0 = affine.apply #map16(%arg0, %arg1)
        %1 = affine.apply #map17(%0)
        %2 = affine.apply #map18(%0)
        %3 = affine.apply #map19(%0)
        %4 = affine.apply #map15(%0)
        %5 = affine.apply #map20(%0)
        %6 = affine.apply #map21(%0)
        %7 = affine.load %alloc[%1, %2, %4, %5, %3, %6] : memref<2x2x3x3x16x1xi32>
      }
    }
    return
  }
  func.func @zero_d_memref(%arg0: memref<i32>) {
    %c0_i32 = arith.constant 0 : i32
    affine.store %c0_i32, %arg0[] : memref<i32>
    return
  }
  func.func @out_of_bounds() {
    %alloc = memref.alloc() : memref<1xi32>
    %c9_i32 = arith.constant 9 : i32
    affine.for %arg0 = 10 to 11 {
      %0 = affine.apply #map22(%arg0)
      affine.store %c9_i32, %alloc[%0] : memref<1xi32>
    }
    return
  }
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

// -----
#map = affine_map<(d0) -> (d0 mod 4)>
#map1 = affine_map<(d0) -> (d0 mod 4 + 4)>
module {
  func.func @test_mod_bound() {
    %alloc = memref.alloc() : memref<7xf32>
    %alloc_0 = memref.alloc() : memref<6xf32>
    affine.for %arg0 = 0 to 4096 {
      affine.for %arg1 = #map(%arg0) to #map1(%arg0) {
        %0 = affine.load %alloc[%arg1] : memref<7xf32>
        %1 = affine.load %alloc_0[%arg1] : memref<6xf32>
      }
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0 floordiv 4)>
#map1 = affine_map<(d0) -> (d0 floordiv 4 + 4)>
#map2 = affine_map<(d0) -> ((d0 floordiv 4) * 4 + d0 mod 4)>
module {
  func.func @test_floordiv_bound() {
    %alloc = memref.alloc() : memref<1027xf32>
    %alloc_0 = memref.alloc() : memref<1026xf32>
    %alloc_1 = memref.alloc() : memref<4096xf32>
    %c2048 = arith.constant 2048 : index
    affine.for %arg0 = 0 to 4096 {
      affine.for %arg1 = #map(%arg0) to #map1(%arg0) {
        %0 = affine.load %alloc[%arg1] : memref<1027xf32>
        %1 = affine.load %alloc_0[%arg1] : memref<1026xf32>
      }
      affine.for %arg1 = 0 to #map2(%c2048) {
        %0 = affine.load %alloc_1[%arg1] : memref<4096xf32>
      }
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0 - 4)>
#map1 = affine_map<(d0) -> (d0)>
#map2 = affine_map<(d0) -> (d0 + 4)>
module {
  func.func @non_composed_bound_operand(%arg0: memref<1024xf32>) {
    affine.for %arg1 = 4 to 1028 step 4 {
      %0 = affine.apply #map(%arg1)
      affine.for %arg2 = #map1(%0) to #map2(%0) {
        %1 = affine.load %arg0[%arg2] : memref<1024xf32>
      }
    }
    return
  }
  func.func @zero_d_memref() {
    %alloc = memref.alloc() : memref<f32>
    affine.for %arg0 = 0 to 100 {
      %0 = affine.load %alloc[] : memref<f32>
    }
    return
  }
  func.func @affine_parallel(%arg0: memref<2048x2048xf64>) {
    affine.parallel (%arg1) = (0) to (3000) {
      affine.for %arg2 = 0 to 2048 {
        %0 = affine.load %arg0[%arg1, %arg2] : memref<2048x2048xf64>
      }
    }
    return
  }
}

