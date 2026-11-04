#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 64, crdWidth = 64 }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 32, crdWidth = 32 }>
module {
  func.func @sparse_convert(%arg0: tensor<?xf32, #sparse>) -> tensor<?xf32, #sparse1> {
    %0 = sparse_tensor.convert %arg0 : tensor<?xf32, #sparse> to tensor<?xf32, #sparse1>
    return %0 : tensor<?xf32, #sparse1>
  }
  func.func @sparse_convert_value(%arg0: tensor<?xf32, #sparse1>) -> tensor<?xf64, #sparse1> {
    %0 = sparse_tensor.convert %arg0 : tensor<?xf32, #sparse1> to tensor<?xf64, #sparse1>
    return %0 : tensor<?xf64, #sparse1>
  }
}

