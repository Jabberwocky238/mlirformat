module {
  func.func @entry() -> i32 {
    %cst = arith.constant dense<123> : vector<[4]x[4]xi32>
    vector.print str "TILE BEGIN\0A"
    vector.print %cst : vector<[4]x[4]xi32>
    vector.print str "TILE END\0A"
    %c0_i32 = arith.constant 0 : i32
    return %c0_i32 : i32
  }
}

