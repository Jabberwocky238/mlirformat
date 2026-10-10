module {
  func.func @parallel_insert_slice(%arg0: index) {
    %c0 = arith.constant 0 : index
    %alloc = memref.alloc() : memref<2xf32>
    scf.forall (%arg1) in (%arg0) {
      %alloc_0 = memref.alloc() : memref<2xf32>
      %0 = memref.load %alloc[%c0] : memref<2xf32>
      linalg.fill ins(%0 : f32) outs(%alloc_0 : memref<2xf32>)
    }
    return
  }
}

// -----
module {
  func.func @reduce(%arg0: memref<100xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = scf.parallel (%arg1) = (%c0) to (%c1) step (%c1) init (%cst) -> f32 {
      %1 = memref.load %arg0[%arg1] : memref<100xf32>
      scf.reduce(%1 : f32) {
      ^bb0(%arg2: f32, %arg3: f32):
        %alloc = memref.alloc() : memref<2xf32>
        memref.store %arg2, %alloc[%c0] : memref<2xf32>
        memref.store %arg3, %alloc[%c1] : memref<2xf32>
        %2 = memref.load %alloc[%c0] : memref<2xf32>
        %3 = memref.load %alloc[%c1] : memref<2xf32>
        %4 = arith.addf %2, %3 : f32
        scf.reduce.return %4 : f32
      }
    }
    return
  }
}

