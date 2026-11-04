module {
  func.func @fold_div_index_neg_rhs() -> index {
    %c0 = arith.constant 0 : index
    %0 = shape.div %c0, %c0 : index, index -> index
    return %0 : index
  }
}

