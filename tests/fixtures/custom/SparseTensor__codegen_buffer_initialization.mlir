#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func @empty_sparse_vector(%arg0: index) -> tensor<?xf64, #sparse> {
    %0 = tensor.empty(%arg0) : tensor<?xf64, #sparse>
    %1 = sparse_tensor.load %0 : tensor<?xf64, #sparse>
    return %1 : tensor<?xf64, #sparse>
  }
}

