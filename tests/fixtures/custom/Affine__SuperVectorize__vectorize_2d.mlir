#map = affine_map<(d0) -> (d0)>
module {
  func.func @vec2d(%arg0: memref<?x?x?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %dim = memref.dim %arg0, %c0 : memref<?x?x?xf32>
    %dim_0 = memref.dim %arg0, %c1 : memref<?x?x?xf32>
    %dim_1 = memref.dim %arg0, %c2 : memref<?x?x?xf32>
    affine.for %arg1 = 0 to %dim {
      affine.for %arg2 = 0 to %dim_0 {
        affine.for %arg3 = 0 to %dim_1 {
          %0 = affine.load %arg0[%arg1, %arg2, %arg3] : memref<?x?x?xf32>
        }
      }
    }
    affine.for %arg1 = 0 to %dim {
      affine.for %arg2 = 0 to %dim_0 {
        affine.for %arg3 = 0 to %dim_1 {
          %0 = affine.load %arg0[%arg2, %arg3, %arg1] : memref<?x?x?xf32>
        }
      }
    }
    return
  }
  func.func @vector_add_2d(%arg0: index, %arg1: index) -> f32 {
    %alloc = memref.alloc(%arg0, %arg1) : memref<?x?xf32>
    %alloc_0 = memref.alloc(%arg0, %arg1) : memref<?x?xf32>
    %alloc_1 = memref.alloc(%arg0, %arg1) : memref<?x?xf32>
    %cst = arith.constant 1.000000e+00 : f32
    %cst_2 = arith.constant 2.000000e+00 : f32
    affine.for %arg2 = 0 to %arg0 {
      affine.for %arg3 = 0 to %arg1 {
        affine.store %cst, %alloc[%arg2, %arg3] : memref<?x?xf32>
      }
    }
    affine.for %arg2 = 0 to %arg0 {
      affine.for %arg3 = 0 to %arg1 {
        affine.store %cst_2, %alloc_0[%arg2, %arg3] : memref<?x?xf32>
      }
    }
    affine.for %arg2 = 0 to %arg0 {
      affine.for %arg3 = 0 to %arg1 {
        %1 = affine.load %alloc[%arg2, %arg3] : memref<?x?xf32>
        %2 = affine.load %alloc_0[%arg2, %arg3] : memref<?x?xf32>
        %3 = arith.addf %1, %2 : f32
        %4 = arith.addf %3, %cst : f32
        %5 = arith.addf %3, %cst_2 : f32
        %6 = arith.addf %5, %4 : f32
        affine.store %6, %alloc_1[%arg2, %arg3] : memref<?x?xf32>
      }
    }
    %c7 = arith.constant 7 : index
    %c42 = arith.constant 42 : index
    %0 = affine.load %alloc_1[%c7, %c42] : memref<?x?xf32>
    return %0 : f32
  }
  func.func @vectorize_matmul(%arg0: memref<?x?xf32>, %arg1: memref<?x?xf32>, %arg2: memref<?x?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = memref.dim %arg0, %c0 : memref<?x?xf32>
    %dim_0 = memref.dim %arg0, %c1 : memref<?x?xf32>
    %dim_1 = memref.dim %arg2, %c1 : memref<?x?xf32>
    affine.for %arg3 = #map(%c0) to #map(%dim) {
      affine.for %arg4 = #map(%c0) to #map(%dim_1) {
        %cst = arith.constant 0.000000e+00 : f32
        affine.store %cst, %arg2[%arg3, %arg4] : memref<?x?xf32>
      }
    }
    affine.for %arg3 = #map(%c0) to #map(%dim) {
      affine.for %arg4 = #map(%c0) to #map(%dim_1) {
        affine.for %arg5 = #map(%c0) to #map(%dim_0) {
          %0 = affine.load %arg1[%arg5, %arg4] : memref<?x?xf32>
          %1 = affine.load %arg0[%arg3, %arg5] : memref<?x?xf32>
          %2 = arith.mulf %1, %0 : f32
          %3 = affine.load %arg2[%arg3, %arg4] : memref<?x?xf32>
          %4 = arith.addf %3, %2 : f32
          affine.store %4, %arg2[%arg3, %arg4] : memref<?x?xf32>
        }
      }
    }
    return
  }
}

