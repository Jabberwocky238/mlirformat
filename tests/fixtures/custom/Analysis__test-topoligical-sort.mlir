module {
  func.func @single_element() {
    return {test_to_sort}
  }
}

// -----
module {
  func.func @simple_region(%arg0: i1) {
    %c42_i32 = arith.constant {test_to_sort} 42 : i32
    scf.if %arg0 {
      %0 = arith.addi %c42_i32, %c42_i32 : i32
      %1 = arith.subi %c42_i32, %0 {test_to_sort} : i32
    } {test_to_sort}
    return
  }
}

// -----
module {
  func.func @multi_region(%arg0: i1) {
    scf.if %arg0 {
      %c42_i32 = arith.constant {test_to_sort} 42 : i32
    }
    scf.if %arg0 {
      %c24_i32 = arith.constant {test_to_sort} 24 : i32
    }
    return
  }
}

