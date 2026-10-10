module {
  func.func @loop_simple(%arg0: memref<?x?xf32>, %arg1: memref<?x?x?xf32>) {
    %c0 = arith.constant 0 : index
    %dim = memref.dim %arg0, %c0 : memref<?x?xf32>
    affine.for %arg2 = 0 to %dim {
      affine.for %arg3 = 0 to %dim {
        %0 = affine.load %arg0[%c0, %arg2] : memref<?x?xf32>
        %1 = affine.load %arg0[%c0, %arg2 * 8 + %arg3] : memref<?x?xf32>
        %2 = affine.load %arg0[%arg2, %c0] : memref<?x?xf32>
        %3 = affine.load %arg0[%arg2, %arg3 * 8] : memref<?x?xf32>
        %4 = affine.load %arg0[%arg3, %arg2 * 4] : memref<?x?xf32>
      }
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0 * -2)>
#map1 = affine_map<(d0) -> (d0 * 2)>
module {
  func.func @loop_unsimplified(%arg0: memref<100xf32>) {
    affine.for %arg1 = 0 to 100 {
      %0 = affine.load %arg0[0] : memref<100xf32>
      %1 = affine.apply #map(%arg1)
      %2 = affine.apply #map1(%arg1)
      %3 = affine.load %arg0[(%1 + %2) floordiv 2] : memref<100xf32>
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0 * 16)>
#map1 = affine_map<(d0) -> (d0 * 16 + 16)>
#map2 = affine_map<(d0) -> (d0)>
#map3 = affine_map<(d0) -> (d0 + 1)>
module {
  func.func @tiled(%arg0: memref<*xf32>) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<1x224x224x64xf32>
    %cast = memref.cast %arg0 : memref<*xf32> to memref<64xf32>
    affine.for %arg1 = 0 to 4 {
      affine.for %arg2 = 0 to 224 {
        affine.for %arg3 = 0 to 14 {
          %alloc_0 = memref.alloc() : memref<1x16x1x16xf32>
          affine.for %arg4 = #map(%arg1) to #map1(%arg1) {
            affine.for %arg5 = #map(%arg3) to #map1(%arg3) {
              %0 = affine.load %cast[%arg4] : memref<64xf32>
              affine.store %0, %alloc_0[0, %arg1 * -16 + %arg4, 0, %arg3 * -16 + %arg5] : memref<1x16x1x16xf32>
            }
          }
          affine.for %arg4 = #map(%arg1) to #map1(%arg1) {
            affine.for %arg5 = #map2(%arg2) to #map3(%arg2) {
              affine.for %arg6 = #map(%arg3) to #map1(%arg3) {
                %0 = affine.load %alloc_0[0, %arg1 * -16 + %arg4, -%arg2 + %arg5, %arg3 * -16 + %arg6] : memref<1x16x1x16xf32>
                affine.store %0, %alloc[0, %arg5, %arg6, %arg4] : memref<1x224x224x64xf32>
              }
            }
          }
          memref.dealloc %alloc_0 : memref<1x16x1x16xf32>
        }
      }
    }
    return
  }
}

