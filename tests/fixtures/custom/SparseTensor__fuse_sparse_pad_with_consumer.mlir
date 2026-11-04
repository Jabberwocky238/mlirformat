#map = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
module {
  func.func @padded_mul(%arg0: tensor<4x4xf32, #sparse>, %arg1: tensor<8x8xf32>) -> tensor<8x8xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty() : tensor<8x8xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<8x8xf32>) -> tensor<8x8xf32>
    %padded = tensor.pad %arg0 low[2, 2] high[2, 2] {
    ^bb0(%arg2: index, %arg3: index):
      tensor.yield %cst : f32
    } : tensor<4x4xf32, #sparse> to tensor<8x8xf32, #sparse>
    %2 = linalg.generic {doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%padded, %arg1 : tensor<8x8xf32, #sparse>, tensor<8x8xf32>) outs(%1 : tensor<8x8xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %3 = arith.mulf %in, %in_0 : f32
      linalg.yield %3 : f32
    } -> tensor<8x8xf32>
    return %2 : tensor<8x8xf32>
  }
}

