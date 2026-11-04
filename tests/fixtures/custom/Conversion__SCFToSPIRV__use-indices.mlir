module {
  func.func @forward() {
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    scf.for %arg0 = %c0 to %c32 step %c1 {
      %0 = index.add %arg0, %arg0
    }
    return
  }
}

