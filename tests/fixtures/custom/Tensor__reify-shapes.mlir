#map = affine_map<(d0) -> (-d0 + 256)>
module {
  func.func @concat_reification(%arg0: tensor<4x7x3xf32>, %arg1: tensor<4x4x3xf32>, %arg2: tensor<?x?x?xf32>) -> (tensor<4x11x3xf32>, tensor<?x?x?xf32>) {
    %concat = tensor.concat dim(1) %arg0, %arg1 : (tensor<4x7x3xf32>, tensor<4x4x3xf32>) -> tensor<4x11x3xf32>
    %concat_0 = tensor.concat dim(2) %arg0, %arg2 : (tensor<4x7x3xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    return %concat, %concat_0 : tensor<4x11x3xf32>, tensor<?x?x?xf32>
  }
  func.func @pad_reification(%arg0: f32, %arg1: index, %arg2: tensor<64x?x64xf32>) -> tensor<1x?x64xf32> {
    %0 = affine.apply #map(%arg1)
    %extracted_slice = tensor.extract_slice %arg2[0, 0, 0] [1, %arg1, 64] [1, 1, 1] : tensor<64x?x64xf32> to tensor<1x?x64xf32>
    %padded = tensor.pad %extracted_slice low[0, 0, 0] high[0, %0, 0] {
    ^bb0(%arg3: index, %arg4: index, %arg5: index):
      tensor.yield %arg0 : f32
    } : tensor<1x?x64xf32> to tensor<1x?x64xf32>
    return %padded : tensor<1x?x64xf32>
  }
}

