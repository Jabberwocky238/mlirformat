module {
}

// -----
module {
  func.func @fpowi32(%arg0: f64, %arg1: i32) {
    %0 = math.fpowi %arg0, %arg1 : f64, i32
    return
  }
}

// -----
module {
  func.func @fpowi64(%arg0: f64, %arg1: i64) {
    %0 = math.fpowi %arg0, %arg1 : f64, i64
    return
  }
}

// -----
module {
  func.func @fpowi64_vec(%arg0: vector<2x3xf32>, %arg1: vector<2x3xi64>) {
    %0 = math.fpowi %arg0, %arg1 : vector<2x3xf32>, vector<2x3xi64>
    return
  }
}

