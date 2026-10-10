module {
  func.func @fold_one_loop(%arg0: memref<?xi32>, %arg1: index, %arg2: index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    scf.for %arg3 = %c0 to %arg1 step %c1 {
      %0 = arith.addi %arg2, %arg3 : index
      %1 = arith.muli %0, %c4 : index
      %2 = memref.load %arg0[%1] : memref<?xi32>
      %3 = arith.muli %2, %2 : i32
      memref.store %3, %arg0[%1] : memref<?xi32>
    }
    return
  }
  func.func @fold_one_loop2(%arg0: memref<?xi32>, %arg1: index, %arg2: index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c10 = arith.constant 10 : index
    scf.for %arg3 = %c0 to %c10 step %c1 {
      scf.for %arg4 = %c0 to %arg1 step %c1 {
        %0 = arith.addi %arg2, %arg4 : index
        %1 = arith.muli %0, %c4 : index
        %2 = memref.load %arg0[%1] : memref<?xi32>
        %3 = arith.muli %2, %2 : i32
        memref.store %3, %arg0[%1] : memref<?xi32>
      }
    }
    return
  }
  func.func @fold_two_loops(%arg0: memref<?xi32>, %arg1: index, %arg2: index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c10 = arith.constant 10 : index
    scf.for %arg3 = %c0 to %c10 step %c1 {
      scf.for %arg4 = %arg3 to %arg1 step %c1 {
        %0 = arith.addi %arg2, %arg4 : index
        %1 = arith.muli %0, %c4 : index
        %2 = memref.load %arg0[%1] : memref<?xi32>
        %3 = arith.muli %2, %2 : i32
        memref.store %3, %arg0[%1] : memref<?xi32>
      }
    }
    return
  }
  func.func @fold_only_first_add(%arg0: memref<?xi32>, %arg1: index, %arg2: index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    scf.for %arg3 = %c0 to %arg1 step %c1 {
      %0 = arith.addi %arg2, %arg3 : index
      %1 = arith.addi %arg2, %c4 : index
      %2 = arith.muli %0, %1 : index
      %3 = memref.load %arg0[%2] : memref<?xi32>
      %4 = arith.muli %3, %3 : i32
      memref.store %4, %arg0[%2] : memref<?xi32>
    }
    return
  }
}

