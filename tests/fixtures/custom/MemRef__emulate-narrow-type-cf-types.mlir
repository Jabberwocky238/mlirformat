module {
  func.func @cf_br_block_arg_arith_i4(%arg0: i4) -> i4 {
    cf.br ^bb1(%arg0 : i4)
  ^bb1(%0: i4):  // pred: ^bb0
    return %0 : i4
  }
}

// -----
module {
  func.func @cf_br_block_arg_vector_i4(%arg0: vector<8xi4>) -> vector<8xi4> {
    cf.br ^bb1(%arg0 : vector<8xi4>)
  ^bb1(%0: vector<8xi4>):  // pred: ^bb0
    return %0 : vector<8xi4>
  }
}

