#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed, d1 : compressed, d2 : compressed, d3 : dense) }>
module {
  func.func @fuse_concat_with_extract(%arg0: tensor<128x32x32x1xf32, #sparse>, %arg1: tensor<128x32x32x1xf32, #sparse>, %arg2: tensor<128x32x32x1xf32, #sparse>) -> (tensor<128x32x32x1xf32, #sparse>, tensor<128x32x32x1xf32, #sparse>, tensor<128x32x32x1xf32, #sparse>) {
    %concat = tensor.concat dim(3) %arg0, %arg1, %arg2 : (tensor<128x32x32x1xf32, #sparse>, tensor<128x32x32x1xf32, #sparse>, tensor<128x32x32x1xf32, #sparse>) -> tensor<128x32x32x3xf32, #sparse>
    %extracted_slice = tensor.extract_slice %concat[0, 0, 0, 0] [128, 32, 32, 1] [1, 1, 1, 1] : tensor<128x32x32x3xf32, #sparse> to tensor<128x32x32x1xf32, #sparse>
    %extracted_slice_0 = tensor.extract_slice %concat[0, 0, 0, 1] [128, 32, 32, 1] [1, 1, 1, 1] : tensor<128x32x32x3xf32, #sparse> to tensor<128x32x32x1xf32, #sparse>
    %extracted_slice_1 = tensor.extract_slice %concat[0, 0, 0, 2] [128, 32, 32, 1] [1, 1, 1, 1] : tensor<128x32x32x3xf32, #sparse> to tensor<128x32x32x1xf32, #sparse>
    return %extracted_slice, %extracted_slice_0, %extracted_slice_1 : tensor<128x32x32x1xf32, #sparse>, tensor<128x32x32x1xf32, #sparse>, tensor<128x32x32x1xf32, #sparse>
  }
}

