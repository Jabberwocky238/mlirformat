module {
  func.func @collapse_to_single() {
    %c3 = arith.constant 3 : index
    %c7 = arith.constant 7 : index
    %c11 = arith.constant 11 : index
    %c29 = arith.constant 29 : index
    %c3_0 = arith.constant 3 : index
    %c4 = arith.constant 4 : index
    scf.parallel (%arg0, %arg1) = (%c3, %c7) to (%c11, %c29) step (%c3_0, %c4) {
      %0 = "magic.op"(%arg0, %arg1) : (index, index) -> index
      scf.reduce 
    }
    return
  }
}

