module {
  func.func @parallel_many_dims() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c4 = arith.constant 4 : index
    %c5 = arith.constant 5 : index
    %c6 = arith.constant 6 : index
    %c7 = arith.constant 7 : index
    %c8 = arith.constant 8 : index
    %c9 = arith.constant 9 : index
    %c10 = arith.constant 10 : index
    %c11 = arith.constant 11 : index
    %c12 = arith.constant 12 : index
    %c13 = arith.constant 13 : index
    %c14 = arith.constant 14 : index
    %c15 = arith.constant 15 : index
    %c26 = arith.constant 26 : index
    scf.parallel (%arg0, %arg1, %arg2, %arg3, %arg4) = (%c0, %c3, %c6, %c9, %c12) to (%c2, %c5, %c8, %c26, %c14) step (%c1, %c4, %c7, %c10, %c13) {
      %0 = "magic.op"(%arg0, %arg1, %arg2, %arg3, %arg4) : (index, index, index, index, index) -> index
      scf.reduce 
    }
    return
  }
}

