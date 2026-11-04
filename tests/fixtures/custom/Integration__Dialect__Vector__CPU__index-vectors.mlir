module {
  func.func @entry() {
    %cst = arith.constant dense<[0, 1, 2, 3]> : vector<4xindex>
    %cst_0 = arith.constant dense<[0, 1]> : vector<2xindex>
    %c2 = arith.constant 2 : index
    %0 = vector.broadcast %cst : vector<4xindex> to vector<2x4xindex>
    %1 = vector.broadcast %cst_0 : vector<2xindex> to vector<4x2xindex>
    %2 = vector.transpose %1, [1, 0] : vector<4x2xindex> to vector<2x4xindex>
    %3 = vector.broadcast %c2 : index to vector<2x4xindex>
    %4 = arith.addi %0, %2 : vector<2x4xindex>
    vector.print %0 : vector<2x4xindex>
    vector.print %2 : vector<2x4xindex>
    vector.print %3 : vector<2x4xindex>
    vector.print %4 : vector<2x4xindex>
    return
  }
}

