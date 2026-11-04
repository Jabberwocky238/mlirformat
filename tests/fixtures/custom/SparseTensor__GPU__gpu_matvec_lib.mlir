#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>
module {
  func.func @matvec(%arg0: tensor<?x?xf64, #sparse>, %arg1: tensor<?xf64>, %arg2: tensor<?xf64>) -> tensor<?xf64> {
    %0 = linalg.matvec ins(%arg0, %arg1 : tensor<?x?xf64, #sparse>, tensor<?xf64>) outs(%arg2 : tensor<?xf64>) -> tensor<?xf64>
    return %0 : tensor<?xf64>
  }
}

