module {
  func.func @integer_attr_unsupported_type() {
    %c1_i32 = arith.constant 1 : i32
    return
  }
}

// -----
module {
  func.func @vector_unsupported_elem_type() {
    %cst = arith.constant dense<42> : vector<3xi32>
    return
  }
}

// -----
module {
  func.func @scalable_vector_unsupported_elem_type(%arg0: vector<[3]xi32>) {
    return
  }
}

// -----
module {
  func.func @dense_elem_unsupported_type() -> tensor<10xi32> {
    %cst = arith.constant dense<42> : tensor<10xi32>
    return %cst : tensor<10xi32>
  }
}

