module {
  func.func @uniqueSSAIDs(%arg0: memref<i32>, %arg1: memref<i32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    scf.for %arg2 = %c0 to %c8 step %c1 {
      %0 = memref.load %arg0[] : memref<i32>
      %1 = memref.load %arg1[] : memref<i32>
      %2 = arith.addi %0, %1 : i32
      %3 = arith.subi %0, %1 : i32
    }
    scf.for %arg2 = %c0 to %c8 step %c1 {
      %0 = memref.load %arg0[] : memref<i32>
      %1 = memref.load %arg1[] : memref<i32>
      %2 = arith.addi %0, %1 : i32
      %3 = arith.subi %0, %1 : i32
    }
    return
  }
}

