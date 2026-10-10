module {
  func.func @scf_and_affine(%arg0: memref<10xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    %cst = arith.constant 0.000000e+00 : f32
    %alloc = memref.alloc() : memref<10xf32>
    %alloc_0 = memref.alloc() : memref<10xf32>
    affine.for %arg1 = 0 to 10 {
      %0 = affine.load %arg0[%arg1] : memref<10xf32>
      affine.store %0, %alloc[%arg1] : memref<10xf32>
    }
    affine.for %arg1 = 0 to 10 {
      %0 = affine.load %alloc[%arg1] : memref<10xf32>
      affine.store %0, %alloc_0[%arg1] : memref<10xf32>
    }
    scf.for %arg1 = %c0 to %c10 step %c1 {
      memref.store %cst, %alloc[%arg1] : memref<10xf32>
    }
    affine.for %arg1 = 0 to 10 {
      %0 = affine.load %arg0[%arg1] : memref<10xf32>
      affine.store %0, %alloc[%arg1] : memref<10xf32>
    }
    scf.for %arg1 = %c0 to %c10 step %c1 {
      memref.store %cst, %alloc[%arg1] : memref<10xf32>
    }
    affine.for %arg1 = 0 to 10 {
      %0 = affine.load %alloc[%arg1] : memref<10xf32>
      affine.store %0, %alloc_0[%arg1] : memref<10xf32>
    }
    return
  }
}

