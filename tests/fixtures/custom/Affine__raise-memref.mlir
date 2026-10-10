module {
  func.func @reduce_window_max() {
    %cst = arith.constant 0.000000e+00 : f32
    %alloc = memref.alloc() : memref<1x8x8x64xf32>
    %alloc_0 = memref.alloc() : memref<1x18x18x64xf32>
    affine.for %arg0 = 0 to 1 {
      affine.for %arg1 = 0 to 8 {
        affine.for %arg2 = 0 to 8 {
          affine.for %arg3 = 0 to 64 {
            memref.store %cst, %alloc[%arg0, %arg1, %arg2, %arg3] : memref<1x8x8x64xf32>
          }
        }
      }
    }
    affine.for %arg0 = 0 to 1 {
      affine.for %arg1 = 0 to 8 {
        affine.for %arg2 = 0 to 8 {
          affine.for %arg3 = 0 to 64 {
            affine.for %arg4 = 0 to 1 {
              affine.for %arg5 = 0 to 3 {
                affine.for %arg6 = 0 to 3 {
                  affine.for %arg7 = 0 to 1 {
                    %0 = memref.load %alloc[%arg0, %arg1, %arg2, %arg3] : memref<1x8x8x64xf32>
                    %1 = arith.addi %arg0, %arg4 : index
                    %c2 = arith.constant 2 : index
                    %2 = arith.muli %arg1, %c2 : index
                    %3 = arith.addi %2, %arg5 : index
                    %4 = arith.muli %arg2, %c2 : index
                    %5 = arith.addi %4, %arg6 : index
                    %6 = arith.addi %arg3, %arg7 : index
                    %7 = memref.load %alloc_0[%1, %3, %5, %6] : memref<1x18x18x64xf32>
                    %8 = arith.cmpf ogt, %0, %7 : f32
                    %9 = arith.select %8, %0, %7 : f32
                    memref.store %9, %alloc[%arg0, %arg1, %arg2, %arg3] : memref<1x8x8x64xf32>
                  }
                }
              }
            }
          }
        }
      }
    }
    return
  }
  func.func @symbols(%arg0: index) {
    %alloc = memref.alloc() : memref<1024x1024xf32>
    %alloc_0 = memref.alloc() : memref<1024x1024xf32>
    %alloc_1 = memref.alloc() : memref<1024x1024xf32>
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    affine.for %arg1 = 0 to %arg0 {
      affine.for %arg2 = 0 to %arg0 {
        %0 = memref.load %alloc_1[%arg1, %arg2] : memref<1024x1024xf32>
        %1 = affine.for %arg3 = 0 to %arg0 iter_args(%arg4 = %c1) -> (index) {
          %2 = arith.muli %arg0, %c2 : index
          %3 = arith.addi %2, %c1 : index
          %4 = arith.addi %3, %arg2 : index
          %5 = memref.load %alloc[%arg1, %2] : memref<1024x1024xf32>
          %6 = memref.load %alloc_0[%4, %arg2] : memref<1024x1024xf32>
          %7 = arith.mulf %5, %6 : f32
          %8 = arith.addf %0, %7 : f32
          %9 = arith.addi %arg0, %c1 : index
          %10 = arith.addi %arg4, %c1 : index
          memref.store %8, %alloc_1[%arg1, %9] : memref<1024x1024xf32>
          memref.store %8, %alloc_1[%arg1, %10] : memref<1024x1024xf32>
          %11 = "ab.v"() : () -> index
          memref.store %8, %alloc_1[%arg1, %11] : memref<1024x1024xf32>
          affine.yield %10 : index
        }
      }
    }
    return
  }
  func.func @non_affine(%arg0: index) {
    %alloc = memref.alloc() : memref<1024x1024xf32>
    affine.for %arg1 = 0 to %arg0 {
      affine.for %arg2 = 0 to %arg0 {
        %0 = arith.muli %arg1, %arg2 : index
        %1 = memref.load %alloc[%arg1, %0] : memref<1024x1024xf32>
        memref.store %1, %alloc[%0, %0] : memref<1024x1024xf32>
      }
    }
    return
  }
}

