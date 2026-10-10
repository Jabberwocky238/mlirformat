#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
module {
  func.func @dynamic(%arg0: tensor<?x?xf32>, %arg1: tensor<?xf32>, %arg2: index, %arg3: index, %arg4: index, %arg5: index) -> tensor<?x?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?xf32>) outs(%arg0 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.addf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<?x?xf32>
    %extracted_slice = tensor.extract_slice %0[%arg2, %arg3] [%arg4, %arg5] [1, 1] : tensor<?x?xf32> to tensor<?x?xf32>
    return %extracted_slice : tensor<?x?xf32>
  }
  func.func @static(%arg0: tensor<16x8xf32>, %arg1: tensor<8xf32>) -> tensor<4x2xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<16x8xf32>, tensor<8xf32>) outs(%arg0 : tensor<16x8xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.addf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<16x8xf32>
    %extracted_slice = tensor.extract_slice %0[8, 4] [4, 2] [1, 1] : tensor<16x8xf32> to tensor<4x2xf32>
    return %extracted_slice : tensor<4x2xf32>
  }
  func.func @mixed(%arg0: tensor<?x8xf32>, %arg1: tensor<8xf32>, %arg2: index, %arg3: index) -> tensor<?x2xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<?x8xf32>, tensor<8xf32>) outs(%arg0 : tensor<?x8xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.addf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<?x8xf32>
    %extracted_slice = tensor.extract_slice %0[8, %arg2] [%arg3, 2] [1, 1] : tensor<?x8xf32> to tensor<?x2xf32>
    return %extracted_slice : tensor<?x2xf32>
  }
  func.func @dynamic_to_static(%arg0: tensor<?x?xf32>, %arg1: tensor<?xf32>) -> tensor<4x2xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?xf32>) outs(%arg0 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.addf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<?x?xf32>
    %extracted_slice = tensor.extract_slice %0[8, 4] [4, 2] [1, 1] : tensor<?x?xf32> to tensor<4x2xf32>
    return %extracted_slice : tensor<4x2xf32>
  }
  func.func @matmul_slice() -> tensor<2x2xf32> {
    %cst = arith.constant dense<1.000000e+00> : tensor<4x4xf32>
    %cst_0 = arith.constant dense<1.000000e+00> : tensor<4x4xf32>
    %cst_1 = arith.constant dense<[[0.000000e+00, 1.000000e+00, 2.000000e+00, 3.000000e+00], [4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00], [8.000000e+00, 9.000000e+00, 1.000000e+01, 1.100000e+01], [1.200000e+01, 1.300000e+01, 1.400000e+01, 1.500000e+01]]> : tensor<4x4xf32>
    %0 = linalg.matmul ins(%cst, %cst_0 : tensor<4x4xf32>, tensor<4x4xf32>) outs(%cst_1 : tensor<4x4xf32>) -> tensor<4x4xf32>
    %extracted_slice = tensor.extract_slice %0[1, 1] [2, 2] [1, 1] : tensor<4x4xf32> to tensor<2x2xf32>
    return %extracted_slice : tensor<2x2xf32>
  }
  func.func @conv_slice(%arg0: tensor<1x225x225x3xf32>, %arg1: tensor<3x3x3x32xf32>) -> tensor<1x32x32x16xf32> {
    %c112 = arith.constant 112 : index
    %c32 = arith.constant 32 : index
    %c16 = arith.constant 16 : index
    %c8 = arith.constant 8 : index
    %c4 = arith.constant 4 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty() : tensor<1x112x112x32xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<1x112x112x32xf32>) -> tensor<1x112x112x32xf32>
    %2 = linalg.conv_2d_nhwc_hwcf {dilations = dense<1> : tensor<2xi64>, strides = dense<2> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<1x225x225x3xf32>, tensor<3x3x3x32xf32>) outs(%1 : tensor<1x112x112x32xf32>) -> tensor<1x112x112x32xf32>
    %extracted_slice = tensor.extract_slice %2[0, 64, 64, 16] [1, 32, 32, 16] [1, 1, 1, 1] : tensor<1x112x112x32xf32> to tensor<1x32x32x16xf32>
    return %extracted_slice : tensor<1x32x32x16xf32>
  }
  func.func @rank_reducing_slice(%arg0: index) -> tensor<1x1x1x?xf32> {
    %cst = arith.constant 1.000000e+00 : f32
    %0 = tensor.empty(%arg0) : tensor<1x?xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<1x?xf32>) -> tensor<1x?xf32>
    %extracted_slice = tensor.extract_slice %1[0, 0] [1, %arg0] [1, 1] : tensor<1x?xf32> to tensor<?xf32>
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %extracted_slice, %c0 : tensor<?xf32>
    %expanded = tensor.expand_shape %extracted_slice [[0, 1, 2, 3]] output_shape [1, 1, 1, %dim] : tensor<?xf32> into tensor<1x1x1x?xf32>
    return %expanded : tensor<1x1x1x?xf32>
  }
}

