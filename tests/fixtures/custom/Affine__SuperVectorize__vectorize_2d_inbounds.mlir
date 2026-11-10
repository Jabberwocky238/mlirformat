module {
  func.func @copy(%arg0: memref<512x512xf32>, %arg1: memref<512x512xf32>) {
    affine.for %arg2 = 0 to 512 {
      affine.for %arg3 = 0 to 512 {
        %0 = affine.load %arg0[%arg2, %arg3] : memref<512x512xf32>
        affine.store %0, %arg1[%arg2, %arg3] : memref<512x512xf32>
      }
    }
    return
  }
  func.func @matmul(%arg0: memref<512x512xf32>, %arg1: memref<512x512xf32>, %arg2: memref<512x512xf32>) {
    linalg.matmul ins(%arg0, %arg1 : memref<512x512xf32>, memref<512x512xf32>) outs(%arg2 : memref<512x512xf32>)
    return
  }
}

