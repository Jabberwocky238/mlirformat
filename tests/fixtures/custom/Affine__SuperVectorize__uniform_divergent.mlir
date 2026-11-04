module {
  func.func @uniform_arg(%arg0: memref<512xf32>, %arg1: f32) {
    affine.for %arg2 = 0 to 512 {
      %0 = affine.load %arg0[%arg2] : memref<512xf32>
      %1 = arith.addf %0, %arg1 : f32
    }
    return
  }
}

// -----
module {
  func.func @multi_use_uniform_arg(%arg0: memref<512xf32>, %arg1: f32) {
    affine.for %arg2 = 0 to 512 {
      %0 = affine.load %arg0[%arg2] : memref<512xf32>
      %1 = arith.addf %0, %arg1 : f32
      %2 = arith.addf %0, %arg1 : f32
    }
    return
  }
}

// -----
module {
  func.func @uniform_load(%arg0: memref<?x?xf32>, %arg1: memref<?x?xf32>) {
    %c0 = arith.constant 0 : index
    %dim = memref.dim %arg0, %c0 : memref<?x?xf32>
    affine.for %arg2 = 0 to %dim {
      %0 = affine.load %arg0[%arg2, %arg2] : memref<?x?xf32>
      affine.for %arg3 = 0 to %dim {
        %1 = affine.load %arg0[%arg2, %arg3] : memref<?x?xf32>
        %2 = arith.addf %0, %1 : f32
      }
    }
    return
  }
}

