module {
  func.func @addf_rank0(%arg0: tensor<f32>, %arg1: tensor<f32>) -> tensor<f32> {
    %0 = arith.addf %arg0, %arg1 : tensor<f32>
    return %0 : tensor<f32>
  }
}

// -----
module {
  func.func @addf_rank1(%arg0: tensor<?xf32>, %arg1: tensor<?xf32>) -> tensor<?xf32> {
    %0 = arith.addf %arg0, %arg1 : tensor<?xf32>
    return %0 : tensor<?xf32>
  }
}

// -----
module {
  func.func @exp(%arg0: tensor<f32>) -> tensor<f32> {
    %0 = math.exp %arg0 : tensor<f32>
    return %0 : tensor<f32>
  }
}

// -----
module {
  func.func @select(%arg0: tensor<i1>, %arg1: tensor<i32>, %arg2: tensor<i32>) -> tensor<i32> {
    %0 = arith.select %arg0, %arg1, %arg2 : tensor<i1>, tensor<i32>
    return %0 : tensor<i32>
  }
}

// -----
module {
  func.func @cmpf(%arg0: tensor<f32>, %arg1: tensor<f32>) -> tensor<i1> {
    %0 = arith.cmpf olt, %arg0, %arg1 : tensor<f32>
    return %0 : tensor<i1>
  }
}

// -----
module {
  func.func @cmpf(%arg0: tensor<4x?x?x8x2x?xf32>, %arg1: tensor<4x?x?x8x2x?xf32>) -> tensor<4x?x?x8x2x?xi1> {
    %0 = arith.cmpf olt, %arg0, %arg1 : tensor<4x?x?x8x2x?xf32>
    return %0 : tensor<4x?x?x8x2x?xi1>
  }
}

// -----
module {
  func.func @scalar_plus_tensor(%arg0: f32, %arg1: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = "test.elementwise_mappable"(%arg0, %arg1) : (f32, tensor<?x?xf32>) -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
}

// -----
module {
  func.func @scalar_tensor_scalar(%arg0: f32, %arg1: tensor<?x?xf32>, %arg2: f32) -> tensor<?x?xf32> {
    %0 = "test.elementwise_mappable"(%arg0, %arg1) : (f32, tensor<?x?xf32>) -> tensor<?x?xf32>
    %1 = "test.elementwise_mappable"(%arg2, %0) : (f32, tensor<?x?xf32>) -> tensor<?x?xf32>
    return %1 : tensor<?x?xf32>
  }
  func.func @negative_scalar_only_eltwise(%arg0: f32, %arg1: f32) -> f32 {
    %0 = arith.addf %arg0, %arg1 : f32
    return %0 : f32
  }
}

