module {
  func.func @func(%arg0: vector<11xf32>) -> vector<11xf32> {
    %cst = arith.constant dense<true> : vector<11xi1>
    %0 = vector.mask %cst { vector.yield %arg0 : vector<11xf32> } : vector<11xi1> -> vector<11xf32>
    return %0 : vector<11xf32>
  }
}

