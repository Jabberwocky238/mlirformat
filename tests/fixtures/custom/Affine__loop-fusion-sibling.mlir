module {
  func.func @disjoint_stores(%arg0: memref<8xf32>) {
    %alloc = memref.alloc() : memref<16xf32>
    affine.for %arg1 = 0 to 8 {
      %0 = affine.load %arg0[%arg1] : memref<8xf32>
      affine.store %0, %alloc[%arg1] : memref<16xf32>
    }
    affine.for %arg1 = 0 to 8 {
      %0 = affine.load %arg0[%arg1] : memref<8xf32>
      %1 = arith.negf %0 : f32
      affine.store %1, %alloc[%arg1 + 8] : memref<16xf32>
    }
    return
  }
}

