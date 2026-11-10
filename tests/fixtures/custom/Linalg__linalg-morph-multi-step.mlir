module {
  func.func @unary_ops(%arg0: tensor<16x8xf32>, %arg1: tensor<16x8xf32>) -> tensor<16x8xf32> {
    %0 = linalg.exp ins(%arg0 : tensor<16x8xf32>) outs(%arg1 : tensor<16x8xf32>) -> tensor<16x8xf32>
    %1 = linalg.log ins(%0 : tensor<16x8xf32>) outs(%arg1 : tensor<16x8xf32>) -> tensor<16x8xf32>
    %2 = linalg.abs ins(%1 : tensor<16x8xf32>) outs(%arg1 : tensor<16x8xf32>) -> tensor<16x8xf32>
    %3 = linalg.ceil ins(%2 : tensor<16x8xf32>) outs(%arg1 : tensor<16x8xf32>) -> tensor<16x8xf32>
    %4 = linalg.floor ins(%3 : tensor<16x8xf32>) outs(%arg1 : tensor<16x8xf32>) -> tensor<16x8xf32>
    %5 = linalg.negf ins(%4 : tensor<16x8xf32>) outs(%arg1 : tensor<16x8xf32>) -> tensor<16x8xf32>
    %6 = linalg.reciprocal ins(%5 : tensor<16x8xf32>) outs(%arg1 : tensor<16x8xf32>) -> tensor<16x8xf32>
    %7 = linalg.round ins(%6 : tensor<16x8xf32>) outs(%arg1 : tensor<16x8xf32>) -> tensor<16x8xf32>
    %8 = linalg.sqrt ins(%7 : tensor<16x8xf32>) outs(%arg1 : tensor<16x8xf32>) -> tensor<16x8xf32>
    %9 = linalg.rsqrt ins(%8 : tensor<16x8xf32>) outs(%arg1 : tensor<16x8xf32>) -> tensor<16x8xf32>
    %10 = linalg.square ins(%9 : tensor<16x8xf32>) outs(%arg1 : tensor<16x8xf32>) -> tensor<16x8xf32>
    %11 = linalg.tanh ins(%10 : tensor<16x8xf32>) outs(%arg1 : tensor<16x8xf32>) -> tensor<16x8xf32>
    %12 = linalg.erf ins(%11 : tensor<16x8xf32>) outs(%arg1 : tensor<16x8xf32>) -> tensor<16x8xf32>
    return %12 : tensor<16x8xf32>
  }
}

// -----
module {
  func.func @binary_ops_int(%arg0: tensor<?x?xi32>, %arg1: tensor<?x?xi32>, %arg2: tensor<?x?xi32>) -> tensor<?x?xi32> {
    %0 = linalg.add ins(%arg0, %arg1 : tensor<?x?xi32>, tensor<?x?xi32>) outs(%arg2 : tensor<?x?xi32>) -> tensor<?x?xi32>
    %1 = linalg.sub ins(%0, %arg1 : tensor<?x?xi32>, tensor<?x?xi32>) outs(%arg2 : tensor<?x?xi32>) -> tensor<?x?xi32>
    %2 = linalg.mul ins(%1, %arg1 : tensor<?x?xi32>, tensor<?x?xi32>) outs(%arg2 : tensor<?x?xi32>) -> tensor<?x?xi32>
    %3 = linalg.div ins(%2, %arg1 : tensor<?x?xi32>, tensor<?x?xi32>) outs(%arg2 : tensor<?x?xi32>) -> tensor<?x?xi32>
    %4 = linalg.div_unsigned ins(%3, %arg1 : tensor<?x?xi32>, tensor<?x?xi32>) outs(%arg2 : tensor<?x?xi32>) -> tensor<?x?xi32>
    %5 = linalg.max ins(%4, %arg1 : tensor<?x?xi32>, tensor<?x?xi32>) outs(%arg2 : tensor<?x?xi32>) -> tensor<?x?xi32>
    %6 = linalg.min ins(%5, %arg1 : tensor<?x?xi32>, tensor<?x?xi32>) outs(%arg2 : tensor<?x?xi32>) -> tensor<?x?xi32>
    return %6 : tensor<?x?xi32>
  }
}

// -----
module {
  func.func @binary_ops_float(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.add ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %1 = linalg.sub ins(%0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %2 = linalg.mul ins(%1, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %3 = linalg.div ins(%2, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %4 = linalg.max ins(%3, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %5 = linalg.min ins(%4, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %6 = linalg.powf ins(%5, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %6 : tensor<?x?xf32>
  }
}

// -----
module {
  func.func @binary_ops_complex(%arg0: tensor<?x?xcomplex<f32>>, %arg1: tensor<?x?xcomplex<f32>>, %arg2: tensor<?x?xcomplex<f32>>) -> tensor<?x?xcomplex<f32>> {
    %0 = linalg.add ins(%arg0, %arg1 : tensor<?x?xcomplex<f32>>, tensor<?x?xcomplex<f32>>) outs(%arg2 : tensor<?x?xcomplex<f32>>) -> tensor<?x?xcomplex<f32>>
    %1 = linalg.sub ins(%0, %arg1 : tensor<?x?xcomplex<f32>>, tensor<?x?xcomplex<f32>>) outs(%arg2 : tensor<?x?xcomplex<f32>>) -> tensor<?x?xcomplex<f32>>
    %2 = linalg.mul ins(%1, %arg1 : tensor<?x?xcomplex<f32>>, tensor<?x?xcomplex<f32>>) outs(%arg2 : tensor<?x?xcomplex<f32>>) -> tensor<?x?xcomplex<f32>>
    %3 = linalg.div ins(%2, %arg1 : tensor<?x?xcomplex<f32>>, tensor<?x?xcomplex<f32>>) outs(%arg2 : tensor<?x?xcomplex<f32>>) -> tensor<?x?xcomplex<f32>>
    return %3 : tensor<?x?xcomplex<f32>>
  }
}

// -----
module {
  func.func @binary_ops_bool(%arg0: tensor<?x?xi1>, %arg1: tensor<?x?xi1>, %arg2: tensor<?x?xi1>) -> tensor<?x?xi1> {
    %0 = linalg.add ins(%arg0, %arg1 : tensor<?x?xi1>, tensor<?x?xi1>) outs(%arg2 : tensor<?x?xi1>) -> tensor<?x?xi1>
    %1 = linalg.mul ins(%0, %arg1 : tensor<?x?xi1>, tensor<?x?xi1>) outs(%arg2 : tensor<?x?xi1>) -> tensor<?x?xi1>
    return %1 : tensor<?x?xi1>
  }
}

