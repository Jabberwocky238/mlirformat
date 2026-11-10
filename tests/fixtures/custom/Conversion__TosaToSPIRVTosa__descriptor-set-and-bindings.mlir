module {
  func.func @default_interface_var_abi(%arg0: tensor<1xi8>) -> tensor<1xi8> {
    return %arg0 : tensor<1xi8>
  }
}

// -----
module {
  func.func @custom_grapharm_abi(%arg0: tensor<1xi8> {grapharm.interface_var_abi = #spirv.interface_var_abi<(3, 9)>}) -> (tensor<1xi8> {grapharm.interface_var_abi = #spirv.interface_var_abi<(7, 11)>}) {
    return %arg0 : tensor<1xi8>
  }
}

