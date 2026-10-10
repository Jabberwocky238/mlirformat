module {
  func.func @index_cast(%arg0: tensor<i32>, %arg1: i32) -> (tensor<index>, index) {
    %0 = arith.index_cast %arg0 : tensor<i32> to tensor<index>
    %1 = arith.index_cast %arg1 : i32 to index
    return %0, %1 : tensor<index>, index
  }
}

// -----
module {
  func.func @basic() -> tensor<3x4xf32> {
    %cst = arith.constant dense<7.000000e+00> : tensor<3x4xf32>
    return %cst : tensor<3x4xf32>
  }
}

// -----
module {
  func.func @duplicate_constants() -> (tensor<3x4xf32>, tensor<3x4xf32>) {
    %cst = arith.constant dense<7.000000e+00> : tensor<3x4xf32>
    %cst_0 = arith.constant dense<7.000000e+00> : tensor<3x4xf32>
    return %cst, %cst_0 : tensor<3x4xf32>, tensor<3x4xf32>
  }
}

// -----
module {
  func.func @multiple_constants() -> (tensor<3x4xf32>, tensor<3x4xf32>) {
    %cst = arith.constant dense<7.000000e+00> : tensor<3x4xf32>
    %cst_0 = arith.constant dense<8.000000e+00> : tensor<3x4xf32>
    return %cst, %cst_0 : tensor<3x4xf32>, tensor<3x4xf32>
  }
}

// -----
module {
  func.func @non_tensor() {
    %c7_i32 = arith.constant 7 : i32
    return
  }
}

// -----
module {
  func.func @select(%arg0: i1, %arg1: tensor<f32>, %arg2: tensor<f32>) -> tensor<f32> {
    %0 = arith.select %arg0, %arg1, %arg2 : tensor<f32>
    return %0 : tensor<f32>
  }
}

// -----
module {
  func.func @elementwise_select(%arg0: tensor<5xi1>, %arg1: tensor<5xi32>, %arg2: tensor<5xi32>) -> tensor<5xi32> {
    %0 = arith.select %arg0, %arg1, %arg2 : tensor<5xi1>, tensor<5xi32>
    return %0 : tensor<5xi32>
  }
}

