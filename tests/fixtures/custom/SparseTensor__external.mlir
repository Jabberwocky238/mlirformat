module {
}

// -----
module {
  func.func @nop(%arg0: tensor<100xf32>) -> tensor<100xf32> {
    return %arg0 : tensor<100xf32>
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
module {
  func.func @sparse_in(%arg0: tensor<64x64xf32, #sparse>) -> tensor<64x64xf32> {
    %0 = sparse_tensor.convert %arg0 : tensor<64x64xf32, #sparse> to tensor<64x64xf32>
    return %0 : tensor<64x64xf32>
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
module {
  func.func @sparse_in2(%arg0: tensor<100xf32>, %arg1: tensor<64x64xf32, #sparse>) -> tensor<64x64xf32> {
    %0 = sparse_tensor.convert %arg1 : tensor<64x64xf32, #sparse> to tensor<64x64xf32>
    return %0 : tensor<64x64xf32>
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
module {
  func.func @sparse_out(%arg0: tensor<64x64xf32>) -> tensor<64x64xf32, #sparse> {
    %0 = sparse_tensor.convert %arg0 : tensor<64x64xf32> to tensor<64x64xf32, #sparse>
    return %0 : tensor<64x64xf32, #sparse>
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
module {
  func.func @sparse_out2(%arg0: tensor<64x64xf32>) -> (tensor<64x64xf32>, tensor<64x64xf32, #sparse>) {
    %0 = sparse_tensor.convert %arg0 : tensor<64x64xf32> to tensor<64x64xf32, #sparse>
    return %arg0, %0 : tensor<64x64xf32>, tensor<64x64xf32, #sparse>
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
module {
  func.func @sparse_inout(%arg0: tensor<64x64xf32, #sparse>) -> tensor<64x64xf32, #sparse> {
    return %arg0 : tensor<64x64xf32, #sparse>
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>
module {
  func.func @sparse_inout_coo_soa(%arg0: tensor<64x64xf32, #sparse>) -> tensor<64x64xf32, #sparse> {
    return %arg0 : tensor<64x64xf32, #sparse>
  }
}

