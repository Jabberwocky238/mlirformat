module {
  func.func @extract_from_collapse_shape(%arg0: tensor<1x1x8xi8>) -> (i8, i8) {
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %collapsed = tensor.collapse_shape %arg0 [[0, 1, 2]] : tensor<1x1x8xi8> into tensor<8xi8>
    %extracted = tensor.extract %collapsed[%c0] : tensor<8xi8>
    %extracted_0 = tensor.extract %collapsed[%c1] : tensor<8xi8>
    return %extracted, %extracted_0 : i8, i8
  }
}

// -----
module {
  func.func @extract_from_static_shape(%arg0: tensor<2x6x32xf32>, %arg1: index, %arg2: index) -> f32 {
    %collapsed = tensor.collapse_shape %arg0 [[0, 1], [2]] : tensor<2x6x32xf32> into tensor<12x32xf32>
    %extracted = tensor.extract %collapsed[%arg1, %arg2] : tensor<12x32xf32>
    return %extracted : f32
  }
}

