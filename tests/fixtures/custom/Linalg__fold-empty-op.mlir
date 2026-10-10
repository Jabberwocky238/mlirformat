module {
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.linalg.fold_pack_unpack_into_empty
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
  func.func @pack_empty(%arg0: tensor<8x8x32x32xf32>) -> tensor<8x8x32x32xf32> {
    %0 = tensor.empty() : tensor<256x256xf32>
    %pack = linalg.pack %0 inner_dims_pos = [0, 1] inner_tiles = [32, 32] into %arg0 : tensor<256x256xf32> -> tensor<8x8x32x32xf32>
    return %pack : tensor<8x8x32x32xf32>
  }
  func.func @pack_empty_dynamic(%arg0: tensor<?x?x32x32xf32>, %arg1: index, %arg2: index) -> tensor<?x?x32x32xf32> {
    %0 = tensor.empty(%arg1, %arg2) : tensor<?x?xf32>
    %pack = linalg.pack %0 inner_dims_pos = [0, 1] inner_tiles = [32, 32] into %arg0 : tensor<?x?xf32> -> tensor<?x?x32x32xf32>
    return %pack : tensor<?x?x32x32xf32>
  }
  func.func @unpack_empty(%arg0: tensor<256x256xf32>) -> tensor<256x256xf32> {
    %0 = tensor.empty() : tensor<8x8x32x32xf32>
    %unpack = linalg.unpack %0 inner_dims_pos = [0, 1] inner_tiles = [32, 32] into %arg0 : tensor<8x8x32x32xf32> -> tensor<256x256xf32>
    return %unpack : tensor<256x256xf32>
  }
  func.func @unpack_empty_dynamic(%arg0: tensor<?x?xf32>, %arg1: index, %arg2: index) -> tensor<?x?xf32> {
    %0 = tensor.empty(%arg1, %arg2) : tensor<?x?x32x32xf32>
    %unpack = linalg.unpack %0 inner_dims_pos = [0, 1] inner_tiles = [32, 32] into %arg0 : tensor<?x?x32x32xf32> -> tensor<?x?xf32>
    return %unpack : tensor<?x?xf32>
  }
  func.func @pack_padded_empty(%arg0: tensor<8x8x32x32xf32>) -> tensor<8x8x32x32xf32> {
    %cst = arith.constant 1.000000e+00 : f32
    %0 = tensor.empty() : tensor<256x256xf32>
    %pack = linalg.pack %0 padding_value(%cst : f32) inner_dims_pos = [0, 1] inner_tiles = [32, 32] into %arg0 : tensor<256x256xf32> -> tensor<8x8x32x32xf32>
    return %pack : tensor<8x8x32x32xf32>
  }
}

