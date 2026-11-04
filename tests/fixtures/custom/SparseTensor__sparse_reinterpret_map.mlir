#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 4 : compressed, d0 mod 2 : dense, d1 mod 4 : dense) }>
module {
  func.func @mul(%arg0: tensor<32x32xf32>, %arg1: tensor<32x32xf32>, %arg2: tensor<32x32xf32, #sparse>) -> tensor<32x32xf32, #sparse> {
    %0 = linalg.generic {doc = "X(i,j) *= A(i,j) * B(j,i)", indexing_maps = [#map, #map1, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<32x32xf32>, tensor<32x32xf32>) outs(%arg2 : tensor<32x32xf32, #sparse>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.mulf %1, %out : f32
      linalg.yield %2 : f32
    } -> tensor<32x32xf32, #sparse>
    return %0 : tensor<32x32xf32, #sparse>
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>
module {
  func.func @sparse_foreach_reinterpret_map(%arg0: tensor<2x4xf64, #sparse>) -> tensor<2x4xf64, #sparse> {
    %0 = bufferization.alloc_tensor() : tensor<2x4xf64, #sparse>
    %1 = sparse_tensor.foreach in %arg0 init(%0) : tensor<2x4xf64, #sparse>, tensor<2x4xf64, #sparse> -> tensor<2x4xf64, #sparse> do {
    ^bb0(%arg1: index, %arg2: index, %arg3: f64, %arg4: tensor<2x4xf64, #sparse>):
      %inserted = tensor.insert %arg3 into %arg4[%arg1, %arg2] : tensor<2x4xf64, #sparse>
      sparse_tensor.yield %inserted : tensor<2x4xf64, #sparse>
    }
    %2 = sparse_tensor.load %1 hasInserts : tensor<2x4xf64, #sparse>
    return %2 : tensor<2x4xf64, #sparse>
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>
module {
  func.func @sparse_assemble_reinterpret_map(%arg0: tensor<?xf64>, %arg1: tensor<?xindex>, %arg2: tensor<?xindex>) -> tensor<2x4xf64, #sparse> {
    %0 = sparse_tensor.assemble (%arg1, %arg2), %arg0 : (tensor<?xindex>, tensor<?xindex>), tensor<?xf64> to tensor<2x4xf64, #sparse>
    return %0 : tensor<2x4xf64, #sparse>
  }
  func.func @sparse_disassemble_reinterpret_map(%arg0: tensor<2x4xf64, #sparse>, %arg1: tensor<?xf64>, %arg2: tensor<?xindex>, %arg3: tensor<?xindex>) -> (tensor<?xf64>, tensor<?xindex>, tensor<?xindex>) {
    %ret_levels:2, %ret_values, %lvl_lens:2, %val_len = sparse_tensor.disassemble %arg0 : tensor<2x4xf64, #sparse> out_lvls(%arg2, %arg3 : tensor<?xindex>, tensor<?xindex>) out_vals(%arg1 : tensor<?xf64>) -> (tensor<?xindex>, tensor<?xindex>), tensor<?xf64>, (index, index), index
    return %ret_values, %ret_levels#0, %ret_levels#1 : tensor<?xf64>, tensor<?xindex>, tensor<?xindex>
  }
}

