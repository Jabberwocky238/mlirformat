module {
  func.func @unsupported_result_integer(%arg0: i64) -> i64 {
    %0 = arith.extsi %arg0 : i64 to i128
    %1 = arith.muli %0, %0 : i128
    %2 = arith.trunci %1 : i128 to i64
    return %2 : i64
  }
}

// -----
module {
  func.func @unsupported_result_vector(%arg0: vector<4xi64>) -> vector<4xi64> {
    %0 = arith.extsi %arg0 : vector<4xi64> to vector<4xi128>
    %1 = arith.muli %0, %0 : vector<4xi128>
    %2 = arith.trunci %1 : vector<4xi128> to vector<4xi64>
    return %2 : vector<4xi64>
  }
}

// -----
module {
  func.func @unsupported_return_type(%arg0: vector<4xi64>) -> vector<4xi128> {
    %0 = arith.extsi %arg0 : vector<4xi64> to vector<4xi128>
    return %0 : vector<4xi128>
  }
}

// -----
module {
  func.func @unsupported_argument_type(%arg0: vector<4xi128>) -> vector<4xi64> {
    %0 = arith.trunci %arg0 : vector<4xi128> to vector<4xi64>
    return %0 : vector<4xi64>
  }
}

// -----
module {
  func.func @unsupported_vector(%arg0: vector<2xi1>) {
    %cst = arith.constant dense<0> : vector<2xi64>
    %0 = vector.mask %arg0 { vector.multi_reduction <xor>, %cst, %cst [] : vector<2xi64> to vector<2xi64> } : vector<2xi1> -> vector<2xi64>
    return
  }
}

