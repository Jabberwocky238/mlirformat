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
  func.func @arith_muli_integer(%arg0: i32) -> index {
    %c7_i32 = arith.constant 7 : i32
    %0 = arith.muli %arg0, %c7_i32 : i32
    %1 = "test.reify_bound"(%0) <{allow_integer_type, type = "EQ"}> : (i32) -> index
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
  func.func @arith_ceildivsi(%arg0: index) -> index {
    %c5 = arith.constant 5 : index
    %0 = arith.ceildivsi %arg0, %c5 : index
    %1 = "test.reify_bound"(%0) <{type = "EQ"}> : (index) -> index
    return %1 : index
  }
}

// -----
module {
  func.func @arith_divui_constant() -> index {
    %c7 = arith.constant 7 : index
    %c5 = arith.constant 5 : index
    %0 = arith.divui %c7, %c5 : index
    %1 = "test.reify_bound"(%0) <{type = "EQ"}> : (index) -> index
    return %1 : index
  }
}

// -----
module {
  func.func @arith_divui_positive_lhs() -> index {
    %c7 = arith.constant 7 : index
    %c5 = arith.constant 5 : index
    %c1 = arith.constant 1 : index
    %0 = arith.maxsi %c7, %c1 : index
    %1 = arith.divui %0, %c5 : index
    %2 = "test.reify_bound"(%1) <{constant, type = "LB"}> : (index) -> index
    return %2 : index
  }
}

// -----
module {
  func.func @arith_divsi_negative_positive() -> index {
    %c-7 = arith.constant -7 : index
    %c5 = arith.constant 5 : index
    %0 = arith.divsi %c-7, %c5 : index
    %1 = "test.reify_bound"(%0) <{type = "EQ"}> : (index) -> index
    return %1 : index
  }
}

// -----
module {
  func.func @arith_divsi_negative_lhs() -> index {
    %c2 = arith.constant 2 : index
    %c-7 = arith.constant -7 : index
    %c-5 = arith.constant -5 : index
    %0 = arith.minsi %c-5, %c-7 : index
    %1 = arith.divsi %0, %c2 : index
    %2 = "test.reify_bound"(%1) <{constant, type = "UB"}> : (index) -> index
    return %2 : index
  }
}

// -----
module {
  func.func @arith_remsi_positive_positive() -> (index, index) {
    %c7 = arith.constant 7 : index
    %c5 = arith.constant 5 : index
    %0 = arith.remsi %c7, %c5 : index
    %1 = "test.reify_bound"(%0) <{type = "LB"}> : (index) -> index
    %2 = "test.reify_bound"(%0) <{type = "UB"}> : (index) -> index
    return %1, %2 : index, index
  }
}

// -----
module {
  func.func @arith_remsi_negative_positive() -> (index, index) {
    %c-7 = arith.constant -7 : index
    %c5 = arith.constant 5 : index
    %0 = arith.remsi %c-7, %c5 : index
    %1 = "test.reify_bound"(%0) <{type = "LB"}> : (index) -> index
    %2 = "test.reify_bound"(%0) <{type = "UB"}> : (index) -> index
    return %1, %2 : index, index
  }
}

// -----
module {
  func.func @arith_remsi_positive_negative() -> (index, index) {
    %c7 = arith.constant 7 : index
    %c-5 = arith.constant -5 : index
    %0 = arith.remsi %c7, %c-5 : index
    %1 = "test.reify_bound"(%0) <{type = "LB"}> : (index) -> index
    %2 = "test.reify_bound"(%0) <{type = "UB"}> : (index) -> index
    return %1, %2 : index, index
  }
}

// -----
module {
  func.func @arith_remsi_negative_negative() -> (index, index) {
    %c-7 = arith.constant -7 : index
    %c-5 = arith.constant -5 : index
    %0 = arith.remsi %c-7, %c-5 : index
    %1 = "test.reify_bound"(%0) <{type = "LB"}> : (index) -> index
    %2 = "test.reify_bound"(%0) <{type = "UB"}> : (index) -> index
    return %1, %2 : index, index
  }
}

// -----
module {
  func.func @arith_remsi_positive_lhs_symbolic_positive_rhs(%arg0: index) -> index {
    %c1 = arith.constant 1 : index
    %c7 = arith.constant 7 : index
    %0 = arith.maxsi %arg0, %c1 : index
    %1 = arith.remsi %c7, %0 : index
    %2 = "test.reify_bound"(%1) <{constant, type = "LB"}> : (index) -> index
    return %2 : index
  }
}

// -----
module {
  func.func @arith_remsi_negative_lhs_symbolic_positive_rhs(%arg0: index) -> index {
    %c1 = arith.constant 1 : index
    %c-7 = arith.constant -7 : index
    %0 = arith.maxsi %arg0, %c1 : index
    %1 = arith.remsi %c-7, %0 : index
    %2 = "test.reify_bound"(%1) <{constant, type = "UB"}> : (index) -> index
    return %2 : index
  }
}

// -----
module {
  func.func @arith_remui_constant() -> (index, index) {
    %c7 = arith.constant 7 : index
    %c5 = arith.constant 5 : index
    %0 = arith.remui %c7, %c5 : index
    %1 = "test.reify_bound"(%0) <{type = "LB"}> : (index) -> index
    %2 = "test.reify_bound"(%0) <{type = "UB"}> : (index) -> index
    return %1, %2 : index, index
  }
}

// -----
module {
  func.func @arith_remui_symbolic_dividend(%arg0: index) -> index {
    %c5 = arith.constant 5 : index
    %0 = arith.remui %arg0, %c5 : index
    %1 = "test.reify_bound"(%0) <{constant, type = "UB"}> : (index) -> index
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
  func.func @arith_addi_integer_constant() -> index {
    %c5_i32 = arith.constant 5 : i32
    %c7_i32 = arith.constant 7 : i32
    %0 = arith.addi %c5_i32, %c7_i32 : i32
    %1 = "test.reify_bound"(%0) <{allow_integer_type, constant, type = "EQ"}> : (i32) -> index
    return %1 : index
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

// -----
module {
  func.func @arith_minsi(%arg0: index) -> index {
    %c4 = arith.constant 4 : index
    %0 = arith.minsi %arg0, %c4 : index
    %1 = "test.reify_bound"(%0) <{type = "UB"}> : (index) -> index
    return %1 : index
  }
}

// -----
module {
  func.func @arith_maxsi(%arg0: index) -> index {
    %c4 = arith.constant 4 : index
    %0 = arith.maxsi %arg0, %c4 : index
    %1 = "test.reify_bound"(%0) <{type = "LB"}> : (index) -> index
    return %1 : index
  }
}

// -----
module {
  func.func @arith_extsi_const() -> index {
    %c-5_i32 = arith.constant -5 : i32
    %0 = arith.extsi %c-5_i32 : i32 to i64
    %1 = "test.reify_bound"(%0) <{allow_integer_type, constant, type = "EQ"}> : (i64) -> index
    return %1 : index
  }
}

// -----
module {
  func.func @arith_minui() -> index {
    %c4 = arith.constant 4 : index
    %c10 = arith.constant 10 : index
    %0 = arith.minui %c10, %c4 : index
    %1 = "test.reify_bound"(%0) <{type = "UB"}> : (index) -> index
    return %1 : index
  }
}

// -----
module {
  func.func @arith_maxui() -> index {
    %c4 = arith.constant 4 : index
    %c10 = arith.constant 10 : index
    %0 = arith.maxui %c10, %c4 : index
    %1 = "test.reify_bound"(%0) <{type = "LB"}> : (index) -> index
    return %1 : index
  }
}

// -----
module {
  func.func @arith_maxui_unknown_operand(%arg0: index) -> index {
    %c4 = arith.constant 4 : index
    %0 = arith.maxui %arg0, %c4 : index
    %1 = "test.reify_bound"(%0) <{constant, type = "LB"}> : (index) -> index
    return %1 : index
  }
}

// -----
module {
  func.func @arith_minui_wraparound() -> index {
    %c-1_i8 = arith.constant -1 : i8
    %c10_i8 = arith.constant 10 : i8
    %0 = arith.minui %c-1_i8, %c10_i8 : i8
    %1 = "test.reify_bound"(%0) <{allow_integer_type, type = "UB"}> : (i8) -> index
    return %1 : index
  }
}

// -----
module {
  func.func @arith_maxui_wraparound() -> index {
    %c-1_i8 = arith.constant -1 : i8
    %c10_i8 = arith.constant 10 : i8
    %0 = arith.maxui %c-1_i8, %c10_i8 : i8
    %1 = "test.reify_bound"(%0) <{allow_integer_type, type = "LB"}> : (i8) -> index
    return %1 : index
  }
}

// -----
module {
  func.func @arith_maxui_addi() -> index {
    %c4 = arith.constant 4 : index
    %c10 = arith.constant 10 : index
    %0 = arith.addi %c4, %c10 : index
    %1 = arith.maxui %0, %c4 : index
    %2 = "test.reify_bound"(%1) <{constant, type = "LB"}> : (index) -> index
    return %2 : index
  }
}

// -----
module {
  func.func @arith_minui_nonneg_symbolic(%arg0: index) -> index {
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %0 = arith.maxsi %arg0, %c0 : index
    %1 = arith.minui %0, %c4 : index
    %2 = "test.reify_bound"(%1) <{constant, type = "UB"}> : (index) -> index
    return %2 : index
  }
}

// -----
module {
  func.func @arith_minui_negative_symbolic(%arg0: index) -> index {
    %c-1 = arith.constant -1 : index
    %c4 = arith.constant 4 : index
    %0 = arith.minsi %arg0, %c-1 : index
    %1 = arith.minui %0, %c4 : index
    %2 = "test.reify_bound"(%1) <{constant, type = "UB"}> : (index) -> index
    return %2 : index
  }
}

// -----
module {
  func.func @arith_maxui_nonneg_symbolic(%arg0: index) -> index {
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %0 = arith.maxsi %arg0, %c0 : index
    %1 = arith.maxui %0, %c4 : index
    %2 = "test.reify_bound"(%1) <{constant, type = "LB"}> : (index) -> index
    return %2 : index
  }
}

// -----
module {
  func.func @arith_maxui_negative_symbolic(%arg0: index) -> index {
    %c-1 = arith.constant -1 : index
    %c4 = arith.constant 4 : index
    %0 = arith.minsi %arg0, %c-1 : index
    %1 = arith.maxui %0, %c4 : index
    %2 = "test.reify_bound"(%1) <{constant, type = "LB"}> : (index) -> index
    return %2 : index
  }
}

