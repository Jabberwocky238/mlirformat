#map = affine_map<(d0) -> (d0 mod 12)>
#map1 = affine_map<(d0) -> (d0 mod 16)>
module {
  func.func @vec_affine_apply(%arg0: memref<8x12x16xf32>, %arg1: memref<8x24x48xf32>) {
    affine.for %arg2 = 0 to 8 {
      affine.for %arg3 = 0 to 24 {
        affine.for %arg4 = 0 to 48 {
          %0 = affine.apply #map(%arg3)
          %1 = affine.apply #map1(%arg4)
          %2 = affine.load %arg0[%arg2, %0, %1] : memref<8x12x16xf32>
          affine.store %2, %arg1[%arg2, %arg3, %arg4] : memref<8x24x48xf32>
        }
      }
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0 mod 16 + 1)>
module {
  func.func @vec_affine_apply_2(%arg0: memref<8x12x16xf32>, %arg1: memref<8x24x48xf32>) {
    affine.for %arg2 = 0 to 8 {
      affine.for %arg3 = 0 to 12 {
        affine.for %arg4 = 0 to 48 {
          %0 = affine.apply #map(%arg4)
          %1 = affine.load %arg0[%arg2, %arg3, %0] : memref<8x12x16xf32>
          affine.store %1, %arg1[%arg2, %arg3, %arg4] : memref<8x24x48xf32>
        }
      }
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0 mod 12)>
#map1 = affine_map<(d0) -> (d0 mod 16)>
module {
  func.func @no_vec_affine_apply(%arg0: memref<8x12x16xi32>, %arg1: memref<8x24x48xi32>) {
    affine.for %arg2 = 0 to 8 {
      affine.for %arg3 = 0 to 24 {
        affine.for %arg4 = 0 to 48 {
          %0 = affine.apply #map(%arg3)
          %1 = affine.apply #map1(%arg4)
          %2 = affine.load %arg0[%arg2, %0, %1] : memref<8x12x16xi32>
          %3 = arith.index_cast %2 : i32 to index
          %4 = affine.apply #map1(%3)
          %5 = arith.index_cast %4 : index to i32
          affine.store %5, %arg1[%arg2, %arg3, %arg4] : memref<8x24x48xi32>
        }
      }
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0 mod 16)>
module {
  func.func @affine_map_with_expr(%arg0: memref<8x12x16xf32>, %arg1: memref<8x24x48xf32>) {
    affine.for %arg2 = 0 to 8 {
      affine.for %arg3 = 0 to 12 {
        affine.for %arg4 = 0 to 48 {
          %0 = affine.apply #map(%arg4)
          %1 = affine.load %arg0[%arg2, %arg3, %0 + 1] : memref<8x12x16xf32>
          affine.store %1, %arg1[%arg2, %arg3, %arg4] : memref<8x24x48xf32>
        }
      }
    }
    return
  }
}

// -----
module {
  func.func @affine_map_with_expr_2(%arg0: memref<8x12x16xf32>, %arg1: memref<8x24x48xf32>, %arg2: index) {
    affine.for %arg3 = 0 to 8 {
      affine.for %arg4 = 0 to 12 {
        affine.for %arg5 = 0 to 48 {
          %0 = affine.load %arg0[%arg3, %arg4, %arg2 + 1] : memref<8x12x16xf32>
          affine.store %0, %arg1[%arg3, %arg4, %arg5] : memref<8x24x48xf32>
        }
      }
    }
    return
  }
}

