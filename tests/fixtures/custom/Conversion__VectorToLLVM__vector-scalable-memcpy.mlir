module {
  func.func @vector_scalable_memcopy(%arg0: memref<?xf32>, %arg1: memref<?xf32>, %arg2: index) {
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %vscale = vector.vscale
    %c4_vscale = arith.muli %c4, %vscale : index
    scf.for %arg3 = %c0 to %arg2 step %c4_vscale {
      %0 = vector.load %arg0[%arg3] : memref<?xf32>, vector<[4]xf32>
      vector.store %0, %arg1[%arg3] : memref<?xf32>, vector<[4]xf32>
    }
    return
  }
}

