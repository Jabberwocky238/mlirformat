module {
  func.func @no_crash_index_reduction(%arg0: index, %arg1: index) -> (index, index) {
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c6 = arith.constant 6 : index
    %0:2 = scf.parallel (%arg2, %arg3) = (%c1, %c3) to (%c2, %c6) step (%c1, %c3) init (%arg0, %arg1) -> (index, index) {
      scf.reduce(%arg2, %arg3 : index, index) {
      ^bb0(%arg4: index, %arg5: index):
        %1 = arith.addi %arg4, %arg5 : index
        scf.reduce.return %1 : index
      }, {
      ^bb0(%arg4: index, %arg5: index):
        %1 = arith.muli %arg4, %arg5 : index
        scf.reduce.return %1 : index
      }
    }
    return %0#0, %0#1 : index, index
  }
}

