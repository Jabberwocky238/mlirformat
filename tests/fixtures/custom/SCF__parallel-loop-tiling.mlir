module {
  func.func @parallel_loop(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: memref<?x?xf32>, %arg7: memref<?x?xf32>, %arg8: memref<?x?xf32>, %arg9: memref<?x?xf32>) {
    scf.parallel (%arg10, %arg11) = (%arg0, %arg1) to (%arg2, %arg3) step (%arg4, %arg5) {
      %0 = memref.load %arg7[%arg10, %arg11] : memref<?x?xf32>
      %1 = memref.load %arg8[%arg10, %arg11] : memref<?x?xf32>
      %2 = arith.addf %0, %1 : f32
      memref.store %2, %arg9[%arg10, %arg11] : memref<?x?xf32>
      scf.reduce 
    }
    return
  }
}

// -----
module {
  func.func @static_loop_with_step() {
    %c0 = arith.constant 0 : index
    %c3 = arith.constant 3 : index
    %c22 = arith.constant 22 : index
    %c24 = arith.constant 24 : index
    scf.parallel (%arg0, %arg1) = (%c0, %c0) to (%c22, %c24) step (%c3, %c3) {
      scf.reduce 
    }
    return
  }
}

// -----
module {
  func.func @tile_nested_innermost() {
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    scf.parallel (%arg0, %arg1) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) {
      scf.parallel (%arg2, %arg3) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) {
        scf.reduce 
      }
      scf.reduce 
    }
    scf.parallel (%arg0, %arg1) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) {
      scf.reduce 
    }
    return
  }
}

// -----
module {
  func.func @tile_nested_in_non_ploop() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    scf.for %arg0 = %c0 to %c2 step %c1 {
      scf.for %arg1 = %c0 to %c2 step %c1 {
        scf.parallel (%arg2, %arg3) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) {
          scf.reduce 
        }
      }
    }
    return
  }
}

