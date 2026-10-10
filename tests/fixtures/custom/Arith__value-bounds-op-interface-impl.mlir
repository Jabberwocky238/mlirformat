module {
  func.func @arith_addi(%arg0: index) -> index {
    %c5 = arith.constant 5 : index
    %0 = arith.addi %c5, %arg0 : index
    %1 = "test.reify_bound"(%0) <{type = "EQ"}> : (index) -> index
    return %1 : index
  }
}

// -----
module {
  func.func @arith_subi(%arg0: index) -> index {
    %c5 = arith.constant 5 : index
    %0 = arith.subi %c5, %arg0 : index
    %1 = "test.reify_bound"(%0) <{type = "EQ"}> : (index) -> index
    return %1 : index
  }
}

// -----
module {
  func.func @arith_muli(%arg0: index) -> index {
    %c5 = arith.constant 5 : index
    %0 = arith.muli %c5, %arg0 : index
    %1 = "test.reify_bound"(%0) <{type = "EQ"}> : (index) -> index
    return %1 : index
  }
}

// -----
module {
  func.func @arith_muli_non_pure(%arg0: index, %arg1: index) -> index {
    %0 = arith.muli %arg0, %arg1 : index
    %1 = "test.reify_bound"(%0) <{type = "EQ"}> : (index) -> index
    return %1 : index
  }
}

// -----
module {
  func.func @arith_floordivsi(%arg0: index) -> index {
    %c5 = arith.constant 5 : index
    %0 = arith.floordivsi %arg0, %c5 : index
    %1 = "test.reify_bound"(%0) <{type = "EQ"}> : (index) -> index
    return %1 : index
  }
}

// -----
module {
  func.func @arith_floordivsi_non_pure(%arg0: index, %arg1: index) -> index {
    %0 = arith.floordivsi %arg0, %arg1 : index
    %1 = "test.reify_bound"(%0) <{type = "EQ"}> : (index) -> index
    return %1 : index
  }
}

// -----
module {
  func.func @arith_const() -> index {
    %c5 = arith.constant 5 : index
    %0 = "test.reify_bound"(%c5) <{type = "EQ"}> : (index) -> index
    return %0 : index
  }
}

// -----
module {
  func.func @arith_select(%arg0: i1) -> (index, index) {
    %c5 = arith.constant 5 : index
    %c9 = arith.constant 9 : index
    %0 = arith.select %arg0, %c5, %c9 : index
    %1 = "test.reify_bound"(%0) <{type = "LB"}> : (index) -> index
    %2 = "test.reify_bound"(%0) <{type = "UB"}> : (index) -> index
    return %1, %2 : index, index
  }
}

// -----
module {
  func.func @arith_select_elementwise(%arg0: tensor<?xf32>, %arg1: tensor<?xf32>, %arg2: tensor<?xi1>) -> index {
    %0 = arith.select %arg2, %arg0, %arg1 : tensor<?xi1>, tensor<?xf32>
    %1 = "test.reify_bound"(%0) <{dim = 0 : i64, type = "EQ"}> : (tensor<?xf32>) -> index
    return %1 : index
  }
}

