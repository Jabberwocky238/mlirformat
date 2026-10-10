module {
  func.func @scan1d_inc(%arg0: vector<2xi32>, %arg1: vector<i32>) -> (vector<2xi32>, vector<i32>) {
    %dest, %accumulated_value = vector.scan <add>, %arg0, %arg1 {inclusive = true, reduction_dim = 0 : i64} : vector<2xi32>, vector<i32>
    return %dest, %accumulated_value : vector<2xi32>, vector<i32>
  }
}

// -----
module {
  func.func @scan1d_inc_scalable(%arg0: vector<[2]xi32>, %arg1: vector<i32>) -> (vector<[2]xi32>, vector<i32>) {
    %dest, %accumulated_value = vector.scan <add>, %arg0, %arg1 {inclusive = true, reduction_dim = 0 : i64} : vector<[2]xi32>, vector<i32>
    return %dest, %accumulated_value : vector<[2]xi32>, vector<i32>
  }
}

// -----
module {
  func.func @scan1d_exc(%arg0: vector<2xi32>, %arg1: vector<i32>) -> (vector<2xi32>, vector<i32>) {
    %dest, %accumulated_value = vector.scan <add>, %arg0, %arg1 {inclusive = false, reduction_dim = 0 : i64} : vector<2xi32>, vector<i32>
    return %dest, %accumulated_value : vector<2xi32>, vector<i32>
  }
}

// -----
module {
  func.func @scan1d_exc_scalable(%arg0: vector<[2]xi32>, %arg1: vector<i32>) -> (vector<[2]xi32>, vector<i32>) {
    %dest, %accumulated_value = vector.scan <add>, %arg0, %arg1 {inclusive = false, reduction_dim = 0 : i64} : vector<[2]xi32>, vector<i32>
    return %dest, %accumulated_value : vector<[2]xi32>, vector<i32>
  }
}

// -----
module {
  func.func @scan2d_mul_dim0(%arg0: vector<2x3xi32>, %arg1: vector<3xi32>) -> (vector<2x3xi32>, vector<3xi32>) {
    %dest, %accumulated_value = vector.scan <mul>, %arg0, %arg1 {inclusive = true, reduction_dim = 0 : i64} : vector<2x3xi32>, vector<3xi32>
    return %dest, %accumulated_value : vector<2x3xi32>, vector<3xi32>
  }
}

// -----
module {
  func.func @scan2d_mul_dim0_scalable(%arg0: vector<2x[3]xi32>, %arg1: vector<[3]xi32>) -> (vector<2x[3]xi32>, vector<[3]xi32>) {
    %dest, %accumulated_value = vector.scan <mul>, %arg0, %arg1 {inclusive = true, reduction_dim = 0 : i64} : vector<2x[3]xi32>, vector<[3]xi32>
    return %dest, %accumulated_value : vector<2x[3]xi32>, vector<[3]xi32>
  }
}

// -----
module {
  func.func @scan2d_mul_dim1(%arg0: vector<2x3xi32>, %arg1: vector<2xi32>) -> (vector<2x3xi32>, vector<2xi32>) {
    %dest, %accumulated_value = vector.scan <mul>, %arg0, %arg1 {inclusive = true, reduction_dim = 1 : i64} : vector<2x3xi32>, vector<2xi32>
    return %dest, %accumulated_value : vector<2x3xi32>, vector<2xi32>
  }
}

// -----
module {
  func.func @scan2d_mul_dim1_scalable(%arg0: vector<[2]x3xi32>, %arg1: vector<[2]xi32>) -> (vector<[2]x3xi32>, vector<[2]xi32>) {
    %dest, %accumulated_value = vector.scan <mul>, %arg0, %arg1 {inclusive = true, reduction_dim = 1 : i64} : vector<[2]x3xi32>, vector<[2]xi32>
    return %dest, %accumulated_value : vector<[2]x3xi32>, vector<[2]xi32>
  }
}

// -----
module {
  func.func @scan3d_mul_dim1(%arg0: vector<4x2x3xf32>, %arg1: vector<4x3xf32>) -> (vector<4x2x3xf32>, vector<4x3xf32>) {
    %dest, %accumulated_value = vector.scan <mul>, %arg0, %arg1 {inclusive = false, reduction_dim = 1 : i64} : vector<4x2x3xf32>, vector<4x3xf32>
    return %dest, %accumulated_value : vector<4x2x3xf32>, vector<4x3xf32>
  }
}

// -----
module {
  func.func @scan3d_mul_dim1_scalable(%arg0: vector<4x2x[3]xf32>, %arg1: vector<4x[3]xf32>) -> (vector<4x2x[3]xf32>, vector<4x[3]xf32>) {
    %dest, %accumulated_value = vector.scan <mul>, %arg0, %arg1 {inclusive = false, reduction_dim = 1 : i64} : vector<4x2x[3]xf32>, vector<4x[3]xf32>
    return %dest, %accumulated_value : vector<4x2x[3]xf32>, vector<4x[3]xf32>
  }
}

