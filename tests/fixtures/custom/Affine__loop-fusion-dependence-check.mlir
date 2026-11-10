module {
}

// -----
module {
  func.func @can_fuse_rar_dependence() {
    %alloc = memref.alloc() : memref<10xf32>
    %alloc_0 = memref.alloc() : memref<10xf32>
    %alloc_1 = memref.alloc() : memref<10xf32>
    %cst = arith.constant 7.000000e+00 : f32
    affine.for %arg0 = 0 to 10 {
      %0 = affine.load %alloc[%arg0] : memref<10xf32>
      affine.store %cst, %alloc_0[%arg0] : memref<10xf32>
    }
    affine.for %arg0 = 0 to 10 {
      %0 = affine.load %alloc[%arg0] : memref<10xf32>
      %1 = affine.load %alloc_1[%arg0] : memref<10xf32>
    }
    affine.for %arg0 = 0 to 10 {
      %0 = affine.load %alloc_0[%arg0] : memref<10xf32>
      affine.store %cst, %alloc_1[%arg0] : memref<10xf32>
    }
    return
  }
}

// -----
module {
  func.func @can_fuse_different_memrefs() {
    %alloc = memref.alloc() : memref<10xf32>
    %alloc_0 = memref.alloc() : memref<10xf32>
    %alloc_1 = memref.alloc() : memref<10xf32>
    %alloc_2 = memref.alloc() : memref<10xf32>
    %cst = arith.constant 7.000000e+00 : f32
    affine.for %arg0 = 0 to 10 {
      %0 = affine.load %alloc[%arg0] : memref<10xf32>
      affine.store %cst, %alloc_0[%arg0] : memref<10xf32>
    }
    affine.for %arg0 = 0 to 10 {
      affine.store %cst, %alloc_2[%arg0] : memref<10xf32>
      %0 = affine.load %alloc_1[%arg0] : memref<10xf32>
    }
    affine.for %arg0 = 0 to 10 {
      %0 = affine.load %alloc_0[%arg0] : memref<10xf32>
      affine.store %cst, %alloc_1[%arg0] : memref<10xf32>
    }
    return
  }
}

