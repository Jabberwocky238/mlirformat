module {
  func.func @i48_to_i64(%arg0: tensor<1x2x3x4xi48>) -> tensor<1x2x3x4xi48> {
    return %arg0 : tensor<1x2x3x4xi48>
  }
}

// -----
module {
  func.func @i4_to_i8(%arg0: tensor<1xi4>) -> tensor<1xi4> {
    return %arg0 : tensor<1xi4>
  }
}

// -----
module {
  func.func @scalar_tensor_to_rank1_tensor(%arg0: tensor<i8>) -> tensor<i8> {
    return %arg0 : tensor<i8>
  }
}

// -----
module {
  func.func @partially_shaped_tensor_to_unshaped_tensor(%arg0: tensor<1x?xi8>) -> tensor<1x?xi8> {
    return %arg0 : tensor<1x?xi8>
  }
}

// -----
module {
  func.func @unranked_tensor(%arg0: tensor<*xi8>) -> tensor<*xi8> {
    return %arg0 : tensor<*xi8>
  }
}

