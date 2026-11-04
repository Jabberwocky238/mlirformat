#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func @sparse_nop(%arg0: tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse> {
    return %arg0 : tensor<?xf64, #sparse>
  }
}

