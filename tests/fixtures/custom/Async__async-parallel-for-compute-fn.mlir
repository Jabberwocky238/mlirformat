module {
  func.func @clone_constant(%arg0: memref<?xf32>, %arg1: index, %arg2: index, %arg3: index) {
    %cst = arith.constant 1.000000e+00 : f32
    scf.parallel (%arg4) = (%arg1) to (%arg2) step (%arg3) {
      memref.store %cst, %arg0[%arg4] : memref<?xf32>
      scf.reduce 
    }
    return
  }
}

// -----
module {
  func.func @sink_constant_step(%arg0: memref<?xf32>, %arg1: index, %arg2: index) {
    %cst = arith.constant 1.000000e+00 : f32
    %c123 = arith.constant 123 : index
    scf.parallel (%arg3) = (%arg1) to (%arg2) step (%c123) {
      memref.store %cst, %arg0[%arg3] : memref<?xf32>
      scf.reduce 
    }
    return
  }
}

// -----
module {
  llvm.func @without_func_dialect() {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %c22 = arith.constant 22 : index
    %c1 = arith.constant 1 : index
    %alloc = memref.alloc() : memref<22xf32>
    %alloc_0 = memref.alloc() : memref<22xf32>
    scf.parallel (%arg0) = (%c0) to (%c22) step (%c1) {
      memref.store %cst, %alloc_0[%arg0] : memref<22xf32>
      scf.reduce 
    }
    llvm.return
  }
}

// -----
module {
  func.func @sink_constant_step(%arg0: memref<?x10xf32>, %arg1: index, %arg2: index) {
    %cst = arith.constant 1.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    scf.parallel (%arg3, %arg4) = (%arg1, %c0) to (%arg2, %c10) step (%c1, %c1) {
      memref.store %cst, %arg0[%arg3, %arg4] : memref<?x10xf32>
      scf.reduce 
    }
    return
  }
}

