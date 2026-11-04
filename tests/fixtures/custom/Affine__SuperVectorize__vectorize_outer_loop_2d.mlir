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
}

