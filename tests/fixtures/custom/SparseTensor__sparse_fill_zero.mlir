#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
module {
  func.func @fill_zero_after_alloc(%arg0: tensor<100x200xf64, #sparse>, %arg1: tensor<200x300xf64, #sparse>) -> tensor<100x300xf64, #sparse> {
    %0 = tensor.empty() : tensor<100x300xf64, #sparse>
    %cst = arith.constant 0.000000e+00 : f64
    %1 = linalg.fill ins(%cst : f64) outs(%0 : tensor<100x300xf64, #sparse>) -> tensor<100x300xf64, #sparse>
    %2 = linalg.matmul ins(%arg0, %arg1 : tensor<100x200xf64, #sparse>, tensor<200x300xf64, #sparse>) outs(%1 : tensor<100x300xf64, #sparse>) -> tensor<100x300xf64, #sparse>
    return %2 : tensor<100x300xf64, #sparse>
  }
}

