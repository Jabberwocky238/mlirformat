module {
}

// -----
module {
  func.func @ipowi(%arg0: i64, %arg1: i64) {
    %0 = math.ipowi %arg0, %arg1 : i64
    return
  }
}

// -----
module {
  func.func @ipowi(%arg0: i8, %arg1: i8) {
    %0 = math.ipowi %arg0, %arg1 : i8
    return
  }
}

// -----
module {
  func.func @ipowi_vec(%arg0: vector<2x3xi64>, %arg1: vector<2x3xi64>) {
    %0 = math.ipowi %arg0, %arg1 : vector<2x3xi64>
    return
  }
}

// -----
module {
  func.func @ipowi_index(%arg0: index, %arg1: index) {
    %0 = math.ipowi %arg0, %arg1 : index
    return
  }
}

