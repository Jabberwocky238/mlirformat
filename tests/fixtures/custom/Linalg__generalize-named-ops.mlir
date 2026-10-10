module {
  func.func @generalize_matmul_buffer(%arg0: memref<16x8xf32>, %arg1: memref<8x32xf32>, %arg2: memref<16x32xf32>) {
    linalg.matmul ins(%arg0, %arg1 : memref<16x8xf32>, memref<8x32xf32>) outs(%arg2 : memref<16x32xf32>)
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @matmul_bcast_a(%arg0: memref<5xf32>, %arg1: memref<5x7xf32>, %arg2: memref<3x7xf32>) {
    linalg.matmul indexing_maps = [#map, #map1, #map2] ins(%arg0, %arg1 : memref<5xf32>, memref<5x7xf32>) outs(%arg2 : memref<3x7xf32>)
    return
  }
}

// -----
module {
  func.func @generalize_matmul_tensor(%arg0: tensor<16x8xf32>, %arg1: tensor<8x32xf32>, %arg2: tensor<16x32xf32>) -> tensor<16x32xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<16x8xf32>, tensor<8x32xf32>) outs(%arg2 : tensor<16x32xf32>) -> tensor<16x32xf32>
    return %0 : tensor<16x32xf32>
  }
}

// -----
module {
  func.func @generalize_matmul_tensor_complex(%arg0: tensor<16x8xcomplex<f32>>, %arg1: tensor<8x32xcomplex<f32>>, %arg2: tensor<16x32xcomplex<f32>>) -> tensor<16x32xcomplex<f32>> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<16x8xcomplex<f32>>, tensor<8x32xcomplex<f32>>) outs(%arg2 : tensor<16x32xcomplex<f32>>) -> tensor<16x32xcomplex<f32>>
    return %0 : tensor<16x32xcomplex<f32>>
  }
}

// -----
module {
  func.func @depthwise_conv_2d_nhwc_hwcm(%arg0: memref<2x4x5x2xf32>, %arg1: memref<2x2x2x3xf32>, %arg2: memref<2x3x4x2x3xf32>) {
    linalg.depthwise_conv_2d_nhwc_hwcm {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : memref<2x4x5x2xf32>, memref<2x2x2x3xf32>) outs(%arg2 : memref<2x3x4x2x3xf32>)
    return
  }
}

// -----
module {
  func.func @depthwise_conv_2d_nhwc_hwcm(%arg0: memref<2x4x5x2xf32>, %arg1: memref<2x2x2x3xf32>, %arg2: memref<2x2x3x2x3xf32>) {
    linalg.depthwise_conv_2d_nhwc_hwcm {dilations = dense<2> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : memref<2x4x5x2xf32>, memref<2x2x2x3xf32>) outs(%arg2 : memref<2x2x3x2x3xf32>)
    return
  }
}

// -----
module {
  func.func @depthwise_conv_2d_nhwc_hwc(%arg0: memref<1x113x113x96xf32>, %arg1: memref<3x3x96xf32>, %arg2: memref<1x56x56x96xf32>) {
    linalg.depthwise_conv_2d_nhwc_hwc {dilations = dense<1> : vector<2xi64>, strides = dense<2> : vector<2xi64>} ins(%arg0, %arg1 : memref<1x113x113x96xf32>, memref<3x3x96xf32>) outs(%arg2 : memref<1x56x56x96xf32>)
    return
  }
}

// -----
module {
  func.func @conv_1d_nwc_wcf(%arg0: memref<?x?x?xf32>, %arg1: memref<?x?x?xf32>, %arg2: memref<?x?x?xf32>) {
    linalg.conv_1d_nwc_wcf {dilations = dense<1> : tensor<1xi64>, strides = dense<1> : tensor<1xi64>} ins(%arg0, %arg1 : memref<?x?x?xf32>, memref<?x?x?xf32>) outs(%arg2 : memref<?x?x?xf32>)
    return
  }
}

// -----
module {
  func.func @conv_1d_ncw_fcw(%arg0: memref<?x?x?xf32>, %arg1: memref<?x?x?xf32>, %arg2: memref<?x?x?xf32>) {
    linalg.conv_1d_ncw_fcw {dilations = dense<1> : tensor<1xi64>, strides = dense<1> : tensor<1xi64>} ins(%arg0, %arg1 : memref<?x?x?xf32>, memref<?x?x?xf32>) outs(%arg2 : memref<?x?x?xf32>)
    return
  }
}

// -----
module {
  func.func @conv_2d_ngchw_gfchw_q(%arg0: memref<?x?x?x?x?xi8>, %arg1: memref<?x?x?x?x?xi8>, %arg2: i32, %arg3: i32, %arg4: memref<?x?x?x?x?xi32>) {
    linalg.conv_2d_ngchw_gfchw_q {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1, %arg2, %arg3 : memref<?x?x?x?x?xi8>, memref<?x?x?x?x?xi8>, i32, i32) outs(%arg4 : memref<?x?x?x?x?xi32>)
    return
  }
}

// -----
module {
  func.func @generalize_fill(%arg0: memref<?x?xf32>, %arg1: f32) {
    linalg.fill ins(%arg1 : f32) outs(%arg0 : memref<?x?xf32>)
    return
  }
}

// -----
module {
  func.func @generalize_batch_matm_vec(%arg0: memref<?x?x?xi8>, %arg1: memref<?x?xi8>, %arg2: memref<?x?xf32>) {
    linalg.batch_matvec ins(%arg0, %arg1 : memref<?x?x?xi8>, memref<?x?xi8>) outs(%arg2 : memref<?x?xf32>)
    return
  }
}

// -----
module {
  func.func @generalize_batch_vecmat(%arg0: memref<?x?xi8>, %arg1: memref<?x?x?xi8>, %arg2: memref<?x?xf32>) {
    linalg.batch_vecmat ins(%arg0, %arg1 : memref<?x?xi8>, memref<?x?x?xi8>) outs(%arg2 : memref<?x?xf32>)
    return
  }
}

// -----
module {
  func.func @batch_reduce_gemm(%arg0: memref<7x8x9xf32>, %arg1: memref<7x9x8xf32>, %arg2: memref<8x8xf32>) {
    linalg.batch_reduce_matmul ins(%arg0, %arg1 : memref<7x8x9xf32>, memref<7x9x8xf32>) outs(%arg2 : memref<8x8xf32>)
    return
  }
}

// -----
module {
  func.func @generalize_batch_reduce_gemm_bf16(%arg0: memref<7x8x9xbf16>, %arg1: memref<7x9x8xbf16>, %arg2: memref<8x8xf32>) {
    linalg.batch_reduce_matmul ins(%arg0, %arg1 : memref<7x8x9xbf16>, memref<7x9x8xbf16>) outs(%arg2 : memref<8x8xf32>)
    return
  }
}

// -----
module {
  func.func @generalize_linalg_map(%arg0: memref<1x8x8x8xf32>, %arg1: memref<1x8x8x8xf32>, %arg2: memref<1x8x8x8xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    linalg.map { arith.addf } ins(%arg0, %arg1 : memref<1x8x8x8xf32>, memref<1x8x8x8xf32>) outs(%arg2 : memref<1x8x8x8xf32>)
    return
  }
}

// -----
module {
  func.func @generalize_add(%arg0: memref<7x14x21xf32>, %arg1: memref<7x14x21xf32>, %arg2: memref<7x14x21xf32>) {
    linalg.add ins(%arg0, %arg1 : memref<7x14x21xf32>, memref<7x14x21xf32>) outs(%arg2 : memref<7x14x21xf32>)
    return
  }
}

// -----
module {
  func.func @generalize_sub(%arg0: memref<7x14x21xf32>, %arg1: memref<7x14x21xf32>, %arg2: memref<7x14x21xf32>) {
    linalg.sub ins(%arg0, %arg1 : memref<7x14x21xf32>, memref<7x14x21xf32>) outs(%arg2 : memref<7x14x21xf32>)
    return
  }
}

// -----
module {
  func.func @generalize_mul(%arg0: memref<7x14x21xf32>, %arg1: memref<7x14x21xf32>, %arg2: memref<7x14x21xf32>) {
    linalg.mul ins(%arg0, %arg1 : memref<7x14x21xf32>, memref<7x14x21xf32>) outs(%arg2 : memref<7x14x21xf32>)
    return
  }
}

// -----
module {
  func.func @generalize_div(%arg0: memref<7x14x21xf32>, %arg1: memref<7x14x21xf32>, %arg2: memref<7x14x21xf32>) {
    linalg.div ins(%arg0, %arg1 : memref<7x14x21xf32>, memref<7x14x21xf32>) outs(%arg2 : memref<7x14x21xf32>)
    return
  }
}

// -----
module {
  func.func @generalize_divu(%arg0: memref<7x14x21xi32>, %arg1: memref<7x14x21xi32>, %arg2: memref<7x14x21xi32>) {
    linalg.div_unsigned ins(%arg0, %arg1 : memref<7x14x21xi32>, memref<7x14x21xi32>) outs(%arg2 : memref<7x14x21xi32>)
    return
  }
}

// -----
module {
  func.func @generalize_exp(%arg0: memref<7x14x21xf32>, %arg1: memref<7x14x21xf32>) {
    linalg.exp ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    return
  }
}

// -----
module {
  func.func @generalize_log(%arg0: memref<7x14x21xf32>, %arg1: memref<7x14x21xf32>) {
    linalg.log ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    return
  }
}

// -----
module {
  func.func @generalize_abs(%arg0: memref<7x14x21xf32>, %arg1: memref<7x14x21xf32>) {
    linalg.abs ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    return
  }
}

// -----
module {
  func.func @generalize_ceil(%arg0: memref<7x14x21xf32>, %arg1: memref<7x14x21xf32>) {
    linalg.ceil ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    return
  }
}

// -----
module {
  func.func @generalize_floor(%arg0: memref<7x14x21xf32>, %arg1: memref<7x14x21xf32>) {
    linalg.floor ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    return
  }
}

// -----
module {
  func.func @generalize_negf(%arg0: memref<7x14x21xf32>, %arg1: memref<7x14x21xf32>) {
    linalg.negf ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    return
  }
}

// -----
module {
  func.func @generalize_reciprocal(%arg0: memref<7x14x21xf32>, %arg1: memref<7x14x21xf32>) {
    linalg.reciprocal ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    return
  }
}

// -----
module {
  func.func @generalize_round(%arg0: memref<7x14x21xf32>, %arg1: memref<7x14x21xf32>) {
    linalg.round ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    return
  }
}

// -----
module {
  func.func @generalize_sqrt(%arg0: memref<7x14x21xf32>, %arg1: memref<7x14x21xf32>) {
    linalg.sqrt ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    return
  }
}

// -----
module {
  func.func @generalize_rsqrt(%arg0: memref<7x14x21xf32>, %arg1: memref<7x14x21xf32>) {
    linalg.rsqrt ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    return
  }
}

// -----
module {
  func.func @generalize_square(%arg0: memref<7x14x21xf32>, %arg1: memref<7x14x21xf32>) {
    linalg.square ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    return
  }
}

// -----
module {
  func.func @generalize_tanh(%arg0: memref<7x14x21xf32>, %arg1: memref<7x14x21xf32>) {
    linalg.tanh ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    return
  }
}

// -----
module {
  func.func @generalize_erf(%arg0: memref<7x14x21xf32>, %arg1: memref<7x14x21xf32>) {
    linalg.erf ins(%arg0 : memref<7x14x21xf32>) outs(%arg1 : memref<7x14x21xf32>)
    return
  }
}

// -----
module {
  func.func @generalize_max(%arg0: memref<7x14x21xf32>, %arg1: memref<7x14x21xf32>, %arg2: memref<7x14x21xf32>) {
    linalg.max ins(%arg0, %arg1 : memref<7x14x21xf32>, memref<7x14x21xf32>) outs(%arg2 : memref<7x14x21xf32>)
    return
  }
}

// -----
module {
  func.func @generalize_min(%arg0: memref<7x14x21xf32>, %arg1: memref<7x14x21xf32>, %arg2: memref<7x14x21xf32>) {
    linalg.min ins(%arg0, %arg1 : memref<7x14x21xf32>, memref<7x14x21xf32>) outs(%arg2 : memref<7x14x21xf32>)
    return
  }
}

// -----
module {
  func.func @generalize_powf(%arg0: memref<7x14x21xf32>, %arg1: memref<7x14x21xf32>, %arg2: memref<7x14x21xf32>) {
    linalg.powf ins(%arg0, %arg1 : memref<7x14x21xf32>, memref<7x14x21xf32>) outs(%arg2 : memref<7x14x21xf32>)
    return
  }
}

// -----
module {
  func.func @generalize_select(%arg0: memref<7x14x21xi1>, %arg1: memref<7x14x21xf32>, %arg2: memref<7x14x21xf32>, %arg3: memref<7x14x21xf32>) {
    linalg.select ins(%arg0, %arg1, %arg2 : memref<7x14x21xi1>, memref<7x14x21xf32>, memref<7x14x21xf32>) outs(%arg3 : memref<7x14x21xf32>)
    return
  }
}

// -----
module {
  func.func @fill_tensor(%arg0: f32, %arg1: vector<2x4xf32>) -> (tensor<f32>, tensor<vector<2x4xf32>>) {
    %0 = tensor.empty() : tensor<f32>
    %1 = linalg.fill ins(%arg0 : f32) outs(%0 : tensor<f32>) -> tensor<f32>
    %2 = tensor.empty() : tensor<vector<2x4xf32>>
    %3 = linalg.fill ins(%arg1 : vector<2x4xf32>) outs(%2 : tensor<vector<2x4xf32>>) -> tensor<vector<2x4xf32>>
    return %1, %3 : tensor<f32>, tensor<vector<2x4xf32>>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d2, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @matmul_transpose_a_explicit(%arg0: memref<5x3xf32>, %arg1: memref<5x7xf32>, %arg2: memref<3x7xf32>) {
    linalg.matmul indexing_maps = [#map, #map1, #map2] ins(%arg0, %arg1 : memref<5x3xf32>, memref<5x7xf32>) outs(%arg2 : memref<3x7xf32>)
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @matmul_transpose_b_explicit(%arg0: memref<3x5xf32>, %arg1: memref<7x5xf32>, %arg2: memref<3x7xf32>) {
    linalg.matmul indexing_maps = [#map, #map1, #map2] ins(%arg0, %arg1 : memref<3x5xf32>, memref<7x5xf32>) outs(%arg2 : memref<3x7xf32>)
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d2, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @matmul_transpose_a_b_explicit(%arg0: memref<5x3xf32>, %arg1: memref<7x5xf32>, %arg2: memref<3x7xf32>) {
    linalg.matmul indexing_maps = [#map, #map1, #map2] ins(%arg0, %arg1 : memref<5x3xf32>, memref<7x5xf32>) outs(%arg2 : memref<3x7xf32>)
    return
  }
}

// -----
module {
  func.func @batch_matmul(%arg0: tensor<2x3x5xf32>, %arg1: tensor<2x5x7xf32>, %arg2: tensor<2x3x7xf32>) -> tensor<2x3x7xf32> {
    %0 = linalg.batch_matmul ins(%arg0, %arg1 : tensor<2x3x5xf32>, tensor<2x5x7xf32>) outs(%arg2 : tensor<2x3x7xf32>) -> tensor<2x3x7xf32>
    return %0 : tensor<2x3x7xf32>
  }
}

// -----
module {
  func.func @batch_reduce_matmul(%arg0: tensor<2x3x5xf32>, %arg1: tensor<2x5x7xf32>, %arg2: tensor<3x7xf32>) -> tensor<3x7xf32> {
    %0 = linalg.batch_reduce_matmul ins(%arg0, %arg1 : tensor<2x3x5xf32>, tensor<2x5x7xf32>) outs(%arg2 : tensor<3x7xf32>) -> tensor<3x7xf32>
    return %0 : tensor<3x7xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @contract_matmul(%arg0: memref<3x5xf32>, %arg1: memref<5x7xf32>, %arg2: memref<3x7xf32>) {
    linalg.contract indexing_maps = [#map, #map1, #map2] ins(%arg0, %arg1 : memref<3x5xf32>, memref<5x7xf32>) outs(%arg2 : memref<3x7xf32>)
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d2, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @contract_matmul_transpose_a_b(%arg0: memref<5x3xf32>, %arg1: memref<7x5xf32>, %arg2: memref<3x7xf32>) {
    linalg.contract indexing_maps = [#map, #map1, #map2] ins(%arg0, %arg1 : memref<5x3xf32>, memref<7x5xf32>) outs(%arg2 : memref<3x7xf32>)
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
module {
  func.func @contract_batch_matmul(%arg0: memref<9x3x5xf32>, %arg1: memref<9x5x7xf32>, %arg2: memref<9x3x7xf32>) {
    linalg.contract indexing_maps = [#map, #map1, #map2] ins(%arg0, %arg1 : memref<9x3x5xf32>, memref<9x5x7xf32>) outs(%arg2 : memref<9x3x7xf32>)
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d1, d2)>
module {
  func.func @contract_batch_reduce_matmul(%arg0: memref<9x3x5xf32>, %arg1: memref<9x5x7xf32>, %arg2: memref<3x7xf32>) {
    linalg.contract indexing_maps = [#map, #map1, #map2] ins(%arg0, %arg1 : memref<9x3x5xf32>, memref<9x5x7xf32>) outs(%arg2 : memref<3x7xf32>)
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d3, d1)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d1, d2)>
module {
  func.func @contract_batch_reduce_matmul_permute_m_with_k_and_k_with_n(%arg0: memref<9x5x3xf32>, %arg1: memref<9x7x5xf32>, %arg2: memref<3x7xf32>) {
    linalg.contract indexing_maps = [#map, #map1, #map2] ins(%arg0, %arg1 : memref<9x5x3xf32>, memref<9x7x5xf32>) outs(%arg2 : memref<3x7xf32>)
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
module {
  func.func @contract_dot(%arg0: memref<9xf32>, %arg1: memref<9xf32>, %arg2: memref<f32>) {
    linalg.contract indexing_maps = [#map, #map, #map1] ins(%arg0, %arg1 : memref<9xf32>, memref<9xf32>) outs(%arg2 : memref<f32>)
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @contract_matmul_bcast_a_b(%arg0: memref<5xf32>, %arg1: memref<5xf32>, %arg2: memref<3x7xf32>) {
    linalg.contract indexing_maps = [#map, #map, #map1] ins(%arg0, %arg1 : memref<5xf32>, memref<5xf32>) outs(%arg2 : memref<3x7xf32>)
    return
  }
}

