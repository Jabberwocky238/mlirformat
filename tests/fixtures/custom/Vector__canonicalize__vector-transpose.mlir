module {
  func.func @transpose_scalar_broadcast1(%arg0: vector<1xf32>) -> vector<1x8xf32> {
    %0 = vector.broadcast %arg0 : vector<1xf32> to vector<8x1xf32>
    %1 = vector.transpose %0, [1, 0] : vector<8x1xf32> to vector<1x8xf32>
    return %1 : vector<1x8xf32>
  }
}

// -----
module {
  func.func @transpose_scalar_broadcast2(%arg0: f32) -> vector<1x8xf32> {
    %0 = vector.broadcast %arg0 : f32 to vector<8x1xf32>
    %1 = vector.transpose %0, [1, 0] : vector<8x1xf32> to vector<1x8xf32>
    return %1 : vector<1x8xf32>
  }
}

// -----
module {
  func.func @broadcast_transpose_scalar_to_broadcast(%arg0: i8) -> vector<2x3x4xi8> {
    %0 = vector.broadcast %arg0 : i8 to vector<3x4x2xi8>
    %1 = vector.transpose %0, [2, 0, 1] : vector<3x4x2xi8> to vector<2x3x4xi8>
    return %1 : vector<2x3x4xi8>
  }
}

// -----
module {
  func.func @broadcast_transpose_ones_to_broadcast(%arg0: vector<1x1x1xi8>) -> vector<2x3x4xi8> {
    %0 = vector.broadcast %arg0 : vector<1x1x1xi8> to vector<3x4x2xi8>
    %1 = vector.transpose %0, [2, 0, 1] : vector<3x4x2xi8> to vector<2x3x4xi8>
    return %1 : vector<2x3x4xi8>
  }
}

// -----
module {
  func.func @broadcast_transpose_partial_ones_to_broadcast(%arg0: vector<1xi8>) -> vector<8x1xi8> {
    %0 = vector.broadcast %arg0 : vector<1xi8> to vector<1x8xi8>
    %1 = vector.transpose %0, [1, 0] : vector<1x8xi8> to vector<8x1xi8>
    return %1 : vector<8x1xi8>
  }
}

// -----
module {
  func.func @broadcast_transpose_mixed_example(%arg0: vector<4x1x1x7xi8>) -> vector<3x2x4x5x6x7xi8> {
    %0 = vector.broadcast %arg0 : vector<4x1x1x7xi8> to vector<2x3x4x5x6x7xi8>
    %1 = vector.transpose %0, [1, 0, 2, 3, 4, 5] : vector<2x3x4x5x6x7xi8> to vector<3x2x4x5x6x7xi8>
    return %1 : vector<3x2x4x5x6x7xi8>
  }
}

// -----
module {
  func.func @broadcast_transpose_final_group(%arg0: vector<4x7x1x1xi8>) -> vector<4x7x2x3xi8> {
    %0 = vector.broadcast %arg0 : vector<4x7x1x1xi8> to vector<4x7x3x2xi8>
    %1 = vector.transpose %0, [0, 1, 3, 2] : vector<4x7x3x2xi8> to vector<4x7x2x3xi8>
    return %1 : vector<4x7x2x3xi8>
  }
}

// -----
module {
  func.func @negative_broadcast_transpose_square(%arg0: vector<4x1xi8>) -> vector<4x4xi8> {
    %0 = vector.broadcast %arg0 : vector<4x1xi8> to vector<4x4xi8>
    %1 = vector.transpose %0, [1, 0] : vector<4x4xi8> to vector<4x4xi8>
    return %1 : vector<4x4xi8>
  }
}

// -----
module {
  func.func @negative_broadcast_transpose_hypercube(%arg0: vector<1x1x4xi8>) -> vector<4x4x4x4xi8> {
    %0 = vector.broadcast %arg0 : vector<1x1x4xi8> to vector<4x4x4x4xi8>
    %1 = vector.transpose %0, [1, 0, 3, 2] : vector<4x4x4x4xi8> to vector<4x4x4x4xi8>
    return %1 : vector<4x4x4x4xi8>
  }
}

// -----
module {
  func.func @negative_broadcast_transpose_102(%arg0: vector<3x1x3xi8>) -> vector<3x3x3xi8> {
    %0 = vector.broadcast %arg0 : vector<3x1x3xi8> to vector<3x3x3xi8>
    %1 = vector.transpose %0, [1, 0, 2] : vector<3x3x3xi8> to vector<3x3x3xi8>
    return %1 : vector<3x3x3xi8>
  }
}

// -----
module {
  func.func @negative_broadcast_transpose_021(%arg0: vector<3x1x3xi8>) -> vector<3x3x3xi8> {
    %0 = vector.broadcast %arg0 : vector<3x1x3xi8> to vector<3x3x3xi8>
    %1 = vector.transpose %0, [0, 2, 1] : vector<3x3x3xi8> to vector<3x3x3xi8>
    return %1 : vector<3x3x3xi8>
  }
}

// -----
module {
  func.func @shape_cast_of_transpose(%arg0: vector<1x4x4x1x1xi8>) -> vector<4x4xi8> {
    %0 = vector.transpose %arg0, [1, 0, 3, 4, 2] : vector<1x4x4x1x1xi8> to vector<4x1x1x1x4xi8>
    %1 = vector.shape_cast %0 : vector<4x1x1x1x4xi8> to vector<4x4xi8>
    return %1 : vector<4x4xi8>
  }
}

// -----
module {
  func.func @shape_cast_of_transpose_scalable(%arg0: vector<1x[4]x4x1x1xi8>) -> vector<[4]x4xi8> {
    %0 = vector.transpose %arg0, [1, 0, 3, 4, 2] : vector<1x[4]x4x1x1xi8> to vector<[4]x1x1x1x4xi8>
    %1 = vector.shape_cast %0 : vector<[4]x1x1x1x4xi8> to vector<[4]x4xi8>
    return %1 : vector<[4]x4xi8>
  }
}

// -----
module {
  func.func @negative_shape_cast_of_transpose(%arg0: vector<1x4x4x1xi8>) -> vector<4x4xi8> {
    %0 = vector.transpose %arg0, [0, 2, 1, 3] : vector<1x4x4x1xi8> to vector<1x4x4x1xi8>
    %1 = vector.shape_cast %0 : vector<1x4x4x1xi8> to vector<4x4xi8>
    return %1 : vector<4x4xi8>
  }
}

// -----
module {
  func.func @transpose_of_shape_cast(%arg0: vector<2x3x1x1xi8>) -> vector<6x1x1xi8> {
    %0 = vector.shape_cast %arg0 : vector<2x3x1x1xi8> to vector<6x1x1xi8>
    %1 = vector.transpose %0, [0, 2, 1] : vector<6x1x1xi8> to vector<6x1x1xi8>
    return %1 : vector<6x1x1xi8>
  }
}

// -----
module {
  func.func @transpose_of_shape_cast_scalable(%arg0: vector<[2]x3x1x1xi8>) -> vector<[6]x1x1xi8> {
    %0 = vector.shape_cast %arg0 : vector<[2]x3x1x1xi8> to vector<[6]x1x1xi8>
    %1 = vector.transpose %0, [0, 2, 1] : vector<[6]x1x1xi8> to vector<[6]x1x1xi8>
    return %1 : vector<[6]x1x1xi8>
  }
}

// -----
module {
  func.func @negative_transpose_of_shape_cast_scalable_unit(%arg0: vector<[1]x4x1xi8>) -> vector<4x[1]xi8> {
    %0 = vector.shape_cast %arg0 : vector<[1]x4x1xi8> to vector<[1]x4xi8>
    %1 = vector.transpose %0, [1, 0] : vector<[1]x4xi8> to vector<4x[1]xi8>
    return %1 : vector<4x[1]xi8>
  }
}

// -----
module {
  func.func @negative_transpose_of_shape_cast(%arg0: vector<6xi8>) -> vector<2x3xi8> {
    %0 = vector.shape_cast %arg0 : vector<6xi8> to vector<3x2xi8>
    %1 = vector.transpose %0, [1, 0] : vector<3x2xi8> to vector<2x3xi8>
    return %1 : vector<2x3xi8>
  }
}

// -----
module {
  func.func @transpose_1D_identity(%arg0: vector<4xf32>) -> vector<4xf32> {
    %0 = vector.transpose %arg0, [0] : vector<4xf32> to vector<4xf32>
    return %0 : vector<4xf32>
  }
}

// -----
module {
  func.func @transpose_2D_identity(%arg0: vector<4x3xf32>) -> vector<4x3xf32> {
    %0 = vector.transpose %arg0, [0, 1] : vector<4x3xf32> to vector<4x3xf32>
    return %0 : vector<4x3xf32>
  }
}

// -----
module {
  func.func @transpose_shape_and_order_preserving(%arg0: vector<6x1x1x4xi8>) -> vector<6x1x1x4xi8> {
    %0 = vector.transpose %arg0, [0, 2, 1, 3] : vector<6x1x1x4xi8> to vector<6x1x1x4xi8>
    return %0 : vector<6x1x1x4xi8>
  }
}

// -----
module {
  func.func @negative_transpose_fold(%arg0: vector<2x2xi8>) -> vector<2x2xi8> {
    %0 = vector.transpose %arg0, [1, 0] : vector<2x2xi8> to vector<2x2xi8>
    return %0 : vector<2x2xi8>
  }
}

