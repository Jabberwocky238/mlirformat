#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
module {
  func.func @drop_outermost_unit_dims(%arg0: tensor<1x1x42xf32>) -> tensor<1x1x42xf32> {
    %0 = tensor.empty() : tensor<1x1x42xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0 : tensor<1x1x42xf32>) outs(%0 : tensor<1x1x42xf32>) {
    ^bb0(%in: f32, %out: f32):
      %2 = arith.addf %in, %out : f32
      linalg.yield %2 : f32
    } -> tensor<1x1x42xf32>
    return %1 : tensor<1x1x42xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
module {
  func.func @drop_unit_dims_encoded_operand(%arg0: tensor<1x1x42xf32>, %arg1: tensor<1x1x42xf32, #test.tensor_encoding<"encoding">>) -> tensor<1x1x42xf32> {
    %0 = tensor.empty() : tensor<1x1x42xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : tensor<1x1x42xf32>, tensor<1x1x42xf32, #test.tensor_encoding<"encoding">>) outs(%0 : tensor<1x1x42xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %2 = arith.addf %in, %in_0 : f32
      linalg.yield %2 : f32
    } -> tensor<1x1x42xf32>
    return %1 : tensor<1x1x42xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
module {
  func.func @drop_unit_dims_encoded_result(%arg0: tensor<1x1x42xf32>, %arg1: tensor<1x1x42xf32>) -> tensor<1x1x42xf32, #test.tensor_encoding<"encoding">> {
    %0 = tensor.empty() : tensor<1x1x42xf32, #test.tensor_encoding<"encoding">>
    %1 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : tensor<1x1x42xf32>, tensor<1x1x42xf32>) outs(%0 : tensor<1x1x42xf32, #test.tensor_encoding<"encoding">>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %2 = arith.addf %in, %in_0 : f32
      linalg.yield %2 : f32
    } -> tensor<1x1x42xf32, #test.tensor_encoding<"encoding">>
    return %1 : tensor<1x1x42xf32, #test.tensor_encoding<"encoding">>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
module {
  func.func @drop_unit_dims_encoded_operand_and_result(%arg0: tensor<1x1x42xf32>, %arg1: tensor<1x1x42xf32, #test.tensor_encoding<"encoding1">>) -> tensor<1x1x42xf32, #test.tensor_encoding<"encoding2">> {
    %0 = tensor.empty() : tensor<1x1x42xf32, #test.tensor_encoding<"encoding2">>
    %1 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : tensor<1x1x42xf32>, tensor<1x1x42xf32, #test.tensor_encoding<"encoding1">>) outs(%0 : tensor<1x1x42xf32, #test.tensor_encoding<"encoding2">>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %2 = arith.addf %in, %in_0 : f32
      linalg.yield %2 : f32
    } -> tensor<1x1x42xf32, #test.tensor_encoding<"encoding2">>
    return %1 : tensor<1x1x42xf32, #test.tensor_encoding<"encoding2">>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
module {
  func.func @drop_unit_dims_two_encoded_operands(%arg0: tensor<1x1x42xf32, #test.tensor_encoding<"encoding1">>, %arg1: tensor<1x1x42xf32, #test.tensor_encoding<"encoding2">>) -> tensor<1x1x42xf32> {
    %0 = tensor.empty() : tensor<1x1x42xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : tensor<1x1x42xf32, #test.tensor_encoding<"encoding1">>, tensor<1x1x42xf32, #test.tensor_encoding<"encoding2">>) outs(%0 : tensor<1x1x42xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %2 = arith.addf %in, %in_0 : f32
      linalg.yield %2 : f32
    } -> tensor<1x1x42xf32>
    return %1 : tensor<1x1x42xf32>
  }
}

