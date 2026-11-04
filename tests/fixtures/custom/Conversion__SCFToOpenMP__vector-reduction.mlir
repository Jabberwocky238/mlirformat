module {
  func.func @vector_and_reduction() {
    %0 = vector.constant_mask [1] : vector<2xi1>
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %1 = scf.parallel (%arg0) = (%c0) to (%c2) step (%c1) init (%0) -> vector<2xi1> {
      %2 = vector.constant_mask [1] : vector<2xi1>
      scf.reduce(%2 : vector<2xi1>) {
      ^bb0(%arg1: vector<2xi1>, %arg2: vector<2xi1>):
        %3 = arith.andi %arg1, %arg2 : vector<2xi1>
        scf.reduce.return %3 : vector<2xi1>
      }
    }
    return
  }
}

