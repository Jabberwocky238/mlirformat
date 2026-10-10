module {
}

// -----
module {
  func.func @valid_to_tile() {
    %alloc = memref.alloc() : memref<64xf32>
    affine.for %arg0 = 0 to 64 {
      %0 = affine.load %alloc[%arg0] : memref<64xf32>
      %1 = arith.addf %0, %0 : f32
      affine.store %1, %alloc[%arg0] : memref<64xf32>
    }
    return
  }
}

// -----
module {
  func.func @illegal_loop_with_diag_dependence() {
    %alloc = memref.alloc() : memref<64x64xf32>
    affine.for %arg0 = 0 to 64 {
      affine.for %arg1 = 0 to 64 {
        %0 = affine.load %alloc[%arg1, %arg0] : memref<64x64xf32>
        %1 = affine.load %alloc[%arg0, %arg1 - 1] : memref<64x64xf32>
        %2 = arith.addf %0, %1 : f32
        affine.store %2, %alloc[%arg0, %arg1] : memref<64x64xf32>
      }
    }
    return
  }
}

