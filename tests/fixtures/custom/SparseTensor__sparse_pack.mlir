#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton), crdWidth = 32 }>
module {
  func.func @sparse_pack(%arg0: tensor<6xf64>, %arg1: tensor<2xindex>, %arg2: tensor<6x2xi32>) -> tensor<100x100xf64, #sparse> {
    %0 = sparse_tensor.assemble (%arg1, %arg2), %arg0 : (tensor<2xindex>, tensor<6x2xi32>), tensor<6xf64> to tensor<100x100xf64, #sparse>
    return %0 : tensor<100x100xf64, #sparse>
  }
  func.func @sparse_unpack(%arg0: tensor<100x100xf64, #sparse>, %arg1: tensor<6xf64>, %arg2: tensor<2xindex>, %arg3: tensor<6x2xi32>) -> (tensor<6xf64>, tensor<2xindex>, tensor<6x2xi32>) {
    %ret_levels:2, %ret_values, %lvl_lens:2, %val_len = sparse_tensor.disassemble %arg0 : tensor<100x100xf64, #sparse> out_lvls(%arg2, %arg3 : tensor<2xindex>, tensor<6x2xi32>) out_vals(%arg1 : tensor<6xf64>) -> (tensor<2xindex>, tensor<6x2xi32>), tensor<6xf64>, (index, index), index
    return %ret_values, %ret_levels#0, %ret_levels#1 : tensor<6xf64>, tensor<2xindex>, tensor<6x2xi32>
  }
}

