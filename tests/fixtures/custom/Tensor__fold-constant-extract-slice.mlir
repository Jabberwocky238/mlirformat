module {
  func.func @slice_constant(%arg0: tensor<2x1xf32>) -> tensor<1x1xf32> {
    %cst = arith.constant dense<[[1.000000e+01], [1.100000e+01]]> : tensor<2x1xf32>
    %extracted_slice = tensor.extract_slice %cst[0, 0] [1, 1] [1, 1] : tensor<2x1xf32> to tensor<1x1xf32>
    return %extracted_slice : tensor<1x1xf32>
  }
}

// -----
module {
  func.func @slice_constant_3x4(%arg0: tensor<3x4xf32>) -> tensor<2x2xf32> {
    %cst = arith.constant dense<[[1.000000e+01, 9.000000e+00, 8.000000e+00, 7.000000e+00], [1.100000e+01, 1.200000e+01, 1.300000e+01, 1.400000e+01], [1.000000e+00, 3.000000e+00, 5.000000e+00, 7.000000e+00]]> : tensor<3x4xf32>
    %extracted_slice = tensor.extract_slice %cst[0, 0] [2, 2] [1, 1] : tensor<3x4xf32> to tensor<2x2xf32>
    return %extracted_slice : tensor<2x2xf32>
  }
}

// -----
module {
  func.func @slice_constant_3x4_offsets(%arg0: tensor<3x4xf32>) -> tensor<2x2xf32> {
    %cst = arith.constant dense<[[1.000000e+01, 9.000000e+00, 8.000000e+00, 7.000000e+00], [1.100000e+01, 1.200000e+01, 1.300000e+01, 1.400000e+01], [1.000000e+00, 3.000000e+00, 5.000000e+00, 7.000000e+00]]> : tensor<3x4xf32>
    %extracted_slice = tensor.extract_slice %cst[1, 1] [2, 2] [1, 1] : tensor<3x4xf32> to tensor<2x2xf32>
    return %extracted_slice : tensor<2x2xf32>
  }
}

