module {
  func.func @entry() {
    %cst = arith.constant dense<[1, 2, 3, 4]> : vector<4xi8>
    vector.print %cst : vector<4xi8>
    %res1, %res2 = vector.deinterleave %cst : vector<4xi8> -> vector<2xi8>
    vector.print %res1 : vector<2xi8>
    vector.print %res2 : vector<2xi8>
    return
  }
}

