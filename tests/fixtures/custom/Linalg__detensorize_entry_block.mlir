#map = affine_map<() -> ()>
module {
  func.func @main(%arg0: tensor<f32>) -> tensor<f32> {
    %0 = tensor.empty() : tensor<f32>
    %1 = linalg.generic {indexing_maps = [#map, #map], iterator_types = []} ins(%arg0 : tensor<f32>) outs(%0 : tensor<f32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<f32>
    cf.br ^bb1(%1 : tensor<f32>)
  ^bb1(%2: tensor<f32>):  // pred: ^bb0
    return %2 : tensor<f32>
  }
}

