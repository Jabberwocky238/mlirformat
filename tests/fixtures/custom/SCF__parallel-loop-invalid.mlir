module {
  func.func @parallel_loop(%arg0: index, %arg1: index, %arg2: index) {
    scf.parallel (%arg3) = (%arg0) to (%arg1) step (%arg2) {
      scf.reduce 
    }
    return
  }
}

