module {
}

// -----
module {
}

// -----
module {
  func.func @conv_1d(%arg0: tensor<?xf32>, %arg1: tensor<?xf32>, %arg2: tensor<?xf32>) -> tensor<?xf32> {
    %0 = linalg.conv_1d ins(%arg0, %arg1 : tensor<?xf32>, tensor<?xf32>) outs(%arg2 : tensor<?xf32>) -> tensor<?xf32>
    return %0 : tensor<?xf32>
  }
}

// -----
module {
  func.func @conv_1d_nwc_wcf(%arg0: tensor<?x?x?xf32>, %arg1: tensor<?x?x?xf32>, %arg2: tensor<?x?x?xf32>) -> tensor<?x?x?xf32> {
    %0 = linalg.conv_1d_nwc_wcf {dilations = dense<3> : tensor<1xi64>, strides = dense<2> : tensor<1xi64>} ins(%arg0, %arg1 : tensor<?x?x?xf32>, tensor<?x?x?xf32>) outs(%arg2 : tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    return %0 : tensor<?x?x?xf32>
  }
}

// -----
module {
  func.func @conv_1d_ncw_fcw(%arg0: tensor<?x?x?xf32>, %arg1: tensor<?x?x?xf32>, %arg2: tensor<?x?x?xf32>) -> tensor<?x?x?xf32> {
    %0 = linalg.conv_1d_ncw_fcw {dilations = dense<3> : tensor<1xi64>, strides = dense<2> : tensor<1xi64>} ins(%arg0, %arg1 : tensor<?x?x?xf32>, tensor<?x?x?xf32>) outs(%arg2 : tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    return %0 : tensor<?x?x?xf32>
  }
}

// -----
module {
}

// -----
module {
}

// -----
module {
  func.func @conv_2d(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.conv_2d ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
}

// -----
module {
  func.func @conv_2d_nhwc_hwcf(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<?x?x?x?xf32>, %arg2: tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32> {
    %0 = linalg.conv_2d_nhwc_hwcf {dilations = dense<2> : tensor<2xi64>, strides = dense<3> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) outs(%arg2 : tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    return %0 : tensor<?x?x?x?xf32>
  }
}

// -----
module {
  func.func @conv_2d_nhwc_hwcf_i1(%arg0: tensor<?x?x?x?xi1>, %arg1: tensor<?x?x?x?xi1>, %arg2: tensor<?x?x?x?xi1>) -> tensor<?x?x?x?xi1> {
    %0 = linalg.conv_2d_nhwc_hwcf {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<?x?x?x?xi1>, tensor<?x?x?x?xi1>) outs(%arg2 : tensor<?x?x?x?xi1>) -> tensor<?x?x?x?xi1>
    return %0 : tensor<?x?x?x?xi1>
  }
}

// -----
module {
  func.func @conv_2d_nhwc_hwcf_q(%arg0: tensor<?x?x?x?xi8>, %arg1: tensor<?x?x?x?xi8>, %arg2: tensor<?x?x?x?xi32>, %arg3: i32, %arg4: i32) -> tensor<?x?x?x?xi32> {
    %0 = linalg.conv_2d_nhwc_hwcf_q {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1, %arg3, %arg4 : tensor<?x?x?x?xi8>, tensor<?x?x?x?xi8>, i32, i32) outs(%arg2 : tensor<?x?x?x?xi32>) -> tensor<?x?x?x?xi32>
    return %0 : tensor<?x?x?x?xi32>
  }
}

// -----
module {
  func.func @conv_2d_nhwc_fhwc(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<?x?x?x?xf32>, %arg2: tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32> {
    %0 = linalg.conv_2d_nhwc_fhwc {dilations = dense<1> : tensor<2xi64>, strides = dense<2> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) outs(%arg2 : tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    return %0 : tensor<?x?x?x?xf32>
  }
}

// -----
module {
  func.func @conv_2d_nhwc_fhwc_q(%arg0: tensor<?x?x?x?xi8>, %arg1: tensor<?x?x?x?xi8>, %arg2: tensor<?x?x?x?xi32>, %arg3: i32, %arg4: i32) -> tensor<?x?x?x?xi32> {
    %0 = linalg.conv_2d_nhwc_fhwc_q {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1, %arg3, %arg4 : tensor<?x?x?x?xi8>, tensor<?x?x?x?xi8>, i32, i32) outs(%arg2 : tensor<?x?x?x?xi32>) -> tensor<?x?x?x?xi32>
    return %0 : tensor<?x?x?x?xi32>
  }
}

// -----
module {
  func.func @conv_2d_nchw_fchw(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<?x?x?x?xf32>, %arg2: tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32> {
    %0 = linalg.conv_2d_nchw_fchw {dilations = dense<[1, 2]> : tensor<2xi64>, strides = dense<[3, 4]> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) outs(%arg2 : tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    return %0 : tensor<?x?x?x?xf32>
  }
}

// -----
module {
  func.func @conv_2d_nchw_fchw_q(%arg0: tensor<?x?x?x?xi8>, %arg1: tensor<?x?x?x?xi8>, %arg2: tensor<?x?x?x?xi32>, %arg3: i32, %arg4: i32) -> tensor<?x?x?x?xi32> {
    %0 = linalg.conv_2d_nchw_fchw_q {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1, %arg3, %arg4 : tensor<?x?x?x?xi8>, tensor<?x?x?x?xi8>, i32, i32) outs(%arg2 : tensor<?x?x?x?xi32>) -> tensor<?x?x?x?xi32>
    return %0 : tensor<?x?x?x?xi32>
  }
}

// -----
module {
  func.func @conv_2d_ngchw_fgchw(%arg0: tensor<?x?x?x?x?xf32>, %arg1: tensor<?x?x?x?x?xf32>, %arg2: tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32> {
    %0 = linalg.conv_2d_ngchw_fgchw {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>) outs(%arg2 : tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>
    return %0 : tensor<?x?x?x?x?xf32>
  }
}

// -----
module {
  func.func @conv_2d_ngchw_gfchw(%arg0: tensor<?x?x?x?x?xf32>, %arg1: tensor<?x?x?x?x?xf32>, %arg2: tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32> {
    %0 = linalg.conv_2d_ngchw_gfchw {dilations = dense<2> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>) outs(%arg2 : tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>
    return %0 : tensor<?x?x?x?x?xf32>
  }
}

// -----
module {
  func.func @conv_2d_ngchw_gfchw_q(%arg0: tensor<?x?x?x?x?xi8>, %arg1: tensor<?x?x?x?x?xi8>, %arg2: tensor<?x?x?x?x?xi32>, %arg3: i32, %arg4: i32) -> tensor<?x?x?x?x?xi32> {
    %0 = linalg.conv_2d_ngchw_gfchw_q {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1, %arg3, %arg4 : tensor<?x?x?x?x?xi8>, tensor<?x?x?x?x?xi8>, i32, i32) outs(%arg2 : tensor<?x?x?x?x?xi32>) -> tensor<?x?x?x?x?xi32>
    return %0 : tensor<?x?x?x?x?xi32>
  }
}

// -----
module {
  func.func @conv_2d_nhwgc_gfhwc(%arg0: tensor<?x?x?x?x?xf32>, %arg1: tensor<?x?x?x?x?xf32>, %arg2: tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32> {
    %0 = linalg.conv_2d_nhwgc_gfhwc {dilations = dense<1> : tensor<2xi64>, strides = dense<2> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>) outs(%arg2 : tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>
    return %0 : tensor<?x?x?x?x?xf32>
  }
}

// -----
module {
  func.func @conv_2d_nhwgc_gfhwc_q(%arg0: tensor<?x?x?x?x?xi8>, %arg1: tensor<?x?x?x?x?xi8>, %arg2: tensor<?x?x?x?x?xi32>, %arg3: i32, %arg4: i32) -> tensor<?x?x?x?x?xi32> {
    %0 = linalg.conv_2d_nhwgc_gfhwc_q {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1, %arg3, %arg4 : tensor<?x?x?x?x?xi8>, tensor<?x?x?x?x?xi8>, i32, i32) outs(%arg2 : tensor<?x?x?x?x?xi32>) -> tensor<?x?x?x?x?xi32>
    return %0 : tensor<?x?x?x?x?xi32>
  }
}

// -----
module {
}

// -----
module {
}

// -----
module {
  func.func @conv_3d(%arg0: tensor<?x?x?xf32>, %arg1: tensor<?x?x?xf32>, %arg2: tensor<?x?x?xf32>) -> tensor<?x?x?xf32> {
    %0 = linalg.conv_3d ins(%arg0, %arg1 : tensor<?x?x?xf32>, tensor<?x?x?xf32>) outs(%arg2 : tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    return %0 : tensor<?x?x?xf32>
  }
}

// -----
module {
  func.func @conv_3d_ndhwc_dhwcf(%arg0: tensor<?x?x?x?x?xf32>, %arg1: tensor<?x?x?x?x?xf32>, %arg2: tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32> {
    %0 = linalg.conv_3d_ndhwc_dhwcf {dilations = dense<2> : tensor<3xi64>, strides = dense<3> : tensor<3xi64>} ins(%arg0, %arg1 : tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>) outs(%arg2 : tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>
    return %0 : tensor<?x?x?x?x?xf32>
  }
}

// -----
module {
  func.func @conv_3d_ndhwc_dhwcf_q(%arg0: tensor<?x?x?x?x?xi8>, %arg1: tensor<?x?x?x?x?xi8>, %arg2: tensor<?x?x?x?x?xi32>, %arg3: i32, %arg4: i32) -> tensor<?x?x?x?x?xi32> {
    %0 = linalg.conv_3d_ndhwc_dhwcf_q {dilations = dense<1> : tensor<3xi64>, strides = dense<1> : tensor<3xi64>} ins(%arg0, %arg1, %arg3, %arg4 : tensor<?x?x?x?x?xi8>, tensor<?x?x?x?x?xi8>, i32, i32) outs(%arg2 : tensor<?x?x?x?x?xi32>) -> tensor<?x?x?x?x?xi32>
    return %0 : tensor<?x?x?x?x?xi32>
  }
}

// -----
module {
  func.func @conv_3d_ncdhw_fcdhw(%arg0: tensor<?x?x?x?x?xf32>, %arg1: tensor<?x?x?x?x?xf32>, %arg2: tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32> {
    %0 = linalg.conv_3d_ncdhw_fcdhw {dilations = dense<[1, 2, 3]> : tensor<3xi64>, strides = dense<[4, 5, 6]> : tensor<3xi64>} ins(%arg0, %arg1 : tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>) outs(%arg2 : tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>
    return %0 : tensor<?x?x?x?x?xf32>
  }
}

// -----
module {
}

// -----
module {
}

// -----
module {
  func.func @depthwise_conv_1d_ncw_cw(%arg0: tensor<?x?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?x?xf32>) -> tensor<?x?x?xf32> {
    %0 = linalg.depthwise_conv_1d_ncw_cw {dilations = dense<3> : tensor<1xi64>, strides = dense<2> : tensor<1xi64>} ins(%arg0, %arg1 : tensor<?x?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    return %0 : tensor<?x?x?xf32>
  }
}

// -----
module {
  func.func @depthwise_conv_1d_nwc_wc_static(%arg0: tensor<1x25x8xi8>, %arg1: tensor<3x8xi8>, %arg2: tensor<1x10x8xi32>) -> tensor<1x10x8xi32> {
    %0 = linalg.depthwise_conv_1d_nwc_wc {dilations = dense<3> : tensor<1xi64>, strides = dense<2> : tensor<1xi64>} ins(%arg0, %arg1 : tensor<1x25x8xi8>, tensor<3x8xi8>) outs(%arg2 : tensor<1x10x8xi32>) -> tensor<1x10x8xi32>
    return %0 : tensor<1x10x8xi32>
  }
}

// -----
module {
  func.func @depthwise_conv_1d_nwc_wcm(%arg0: tensor<?x?x?xf32>, %arg1: tensor<?x?x?xf32>, %arg2: tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32> {
    %0 = linalg.depthwise_conv_1d_nwc_wcm {dilations = dense<1> : tensor<1xi64>, strides = dense<1> : tensor<1xi64>} ins(%arg0, %arg1 : tensor<?x?x?xf32>, tensor<?x?x?xf32>) outs(%arg2 : tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    return %0 : tensor<?x?x?x?xf32>
  }
}

// -----
module {
}

// -----
module {
}

// -----
module {
  func.func @depthwise_conv_2d_nchw_chw(%arg0: tensor<?x?x?x?xf16>, %arg1: tensor<?x?x?xf16>, %arg2: tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32> {
    %0 = linalg.depthwise_conv_2d_nchw_chw {dilations = dense<[2, 3]> : vector<2xi64>, strides = dense<[4, 5]> : vector<2xi64>} ins(%arg0, %arg1 : tensor<?x?x?x?xf16>, tensor<?x?x?xf16>) outs(%arg2 : tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    return %0 : tensor<?x?x?x?xf32>
  }
}

// -----
module {
  func.func @depthwise_conv_2d_nhwc_hwc(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<?x?x?xf32>, %arg2: tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32> {
    %0 = linalg.depthwise_conv_2d_nhwc_hwc {dilations = dense<1> : tensor<2xi64>, strides = dense<2> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<?x?x?x?xf32>, tensor<?x?x?xf32>) outs(%arg2 : tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    return %0 : tensor<?x?x?x?xf32>
  }
}

// -----
module {
  func.func @depthwise_conv_2d_nhwc_hwc_q(%arg0: tensor<?x?x?x?xi8>, %arg1: tensor<?x?x?xi8>, %arg2: tensor<?x?x?x?xi32>, %arg3: i32, %arg4: i32) -> tensor<?x?x?x?xi32> {
    %0 = linalg.depthwise_conv_2d_nhwc_hwc_q {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1, %arg3, %arg4 : tensor<?x?x?x?xi8>, tensor<?x?x?xi8>, i32, i32) outs(%arg2 : tensor<?x?x?x?xi32>) -> tensor<?x?x?x?xi32>
    return %0 : tensor<?x?x?x?xi32>
  }
}

// -----
module {
  func.func @depthwise_conv_2d_nhwc_hwcm(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<?x?x?x?xf32>, %arg2: tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32> {
    %0 = linalg.depthwise_conv_2d_nhwc_hwcm {dilations = dense<[1, 2]> : tensor<2xi64>, strides = dense<[3, 1]> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) outs(%arg2 : tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>
    return %0 : tensor<?x?x?x?x?xf32>
  }
}

// -----
module {
  func.func @depthwise_conv_2d_nhwc_hwcm_q(%arg0: tensor<?x?x?x?xi8>, %arg1: tensor<?x?x?x?xi8>, %arg2: tensor<?x?x?x?x?xi32>, %arg3: i32, %arg4: i32) -> tensor<?x?x?x?x?xi32> {
    %0 = linalg.depthwise_conv_2d_nhwc_hwcm_q {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1, %arg3, %arg4 : tensor<?x?x?x?xi8>, tensor<?x?x?x?xi8>, i32, i32) outs(%arg2 : tensor<?x?x?x?x?xi32>) -> tensor<?x?x?x?x?xi32>
    return %0 : tensor<?x?x?x?x?xi32>
  }
}

// -----
module {
}

// -----
module {
}

// -----
module {
  func.func @depthwise_conv_3d_ndhwc_dhwc(%arg0: tensor<?x?x?x?x?xf32>, %arg1: tensor<?x?x?x?xf32>, %arg2: tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32> {
    %0 = linalg.depthwise_conv_3d_ndhwc_dhwc {dilations = dense<2> : tensor<3xi64>, strides = dense<3> : tensor<3xi64>} ins(%arg0, %arg1 : tensor<?x?x?x?x?xf32>, tensor<?x?x?x?xf32>) outs(%arg2 : tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>
    return %0 : tensor<?x?x?x?x?xf32>
  }
}

// -----
module {
  func.func @depthwise_conv_3d_ncdhw_cdhw(%arg0: tensor<?x?x?x?x?xf32>, %arg1: tensor<?x?x?x?xf32>, %arg2: tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32> {
    %0 = linalg.depthwise_conv_3d_ncdhw_cdhw {dilations = dense<[1, 2, 3]> : tensor<3xi64>, strides = dense<[4, 5, 6]> : tensor<3xi64>} ins(%arg0, %arg1 : tensor<?x?x?x?x?xf32>, tensor<?x?x?x?xf32>) outs(%arg2 : tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>
    return %0 : tensor<?x?x?x?x?xf32>
  }
}

// -----
module {
  func.func @depthwise_conv_3d_ndhwc_dhwcm(%arg0: tensor<?x?x?x?x?xf32>, %arg1: tensor<?x?x?x?x?xf32>, %arg2: tensor<?x?x?x?x?x?xf32>) -> tensor<?x?x?x?x?x?xf32> {
    %0 = linalg.depthwise_conv_3d_ndhwc_dhwcm {dilations = dense<1> : tensor<3xi64>, strides = dense<1> : tensor<3xi64>} ins(%arg0, %arg1 : tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>) outs(%arg2 : tensor<?x?x?x?x?x?xf32>) -> tensor<?x?x?x?x?x?xf32>
    return %0 : tensor<?x?x?x?x?x?xf32>
  }
}

// -----
module {
}

// -----
module {
}

// -----
module {
  func.func @pooling_nhwc_max(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32> {
    %0 = linalg.pooling_nhwc_max {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<?x?x?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    return %0 : tensor<?x?x?x?xf32>
  }
}

// -----
module {
  func.func @pooling_nhwc_max_i1(%arg0: tensor<?x?x?x?xi1>, %arg1: tensor<?x?xi1>, %arg2: tensor<?x?x?x?xi1>) -> tensor<?x?x?x?xi1> {
    %0 = linalg.pooling_nhwc_max {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<?x?x?x?xi1>, tensor<?x?xi1>) outs(%arg2 : tensor<?x?x?x?xi1>) -> tensor<?x?x?x?xi1>
    return %0 : tensor<?x?x?x?xi1>
  }
}

// -----
module {
  func.func @pooling_nhwc_min(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32> {
    %0 = linalg.pooling_nhwc_min {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<?x?x?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    return %0 : tensor<?x?x?x?xf32>
  }
}

// -----
module {
  func.func @pooling_nhwc_sum(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32> {
    %0 = linalg.pooling_nhwc_sum {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<?x?x?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    return %0 : tensor<?x?x?x?xf32>
  }
}

// -----
module {
  func.func @pooling_nhwc_max_unsigned(%arg0: tensor<?x?x?x?xi8>, %arg1: tensor<?x?xi8>, %arg2: tensor<?x?x?x?xi32>) -> tensor<?x?x?x?xi32> {
    %0 = linalg.pooling_nhwc_max_unsigned {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<?x?x?x?xi8>, tensor<?x?xi8>) outs(%arg2 : tensor<?x?x?x?xi32>) -> tensor<?x?x?x?xi32>
    return %0 : tensor<?x?x?x?xi32>
  }
}

// -----
module {
  func.func @pooling_nhwc_min_unsigned_integer(%arg0: tensor<?x?x?x?xi32>, %arg1: tensor<?x?xi32>, %arg2: tensor<?x?x?x?xi32>) -> tensor<?x?x?x?xi32> {
    %0 = linalg.pooling_nhwc_min_unsigned {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<?x?x?x?xi32>, tensor<?x?xi32>) outs(%arg2 : tensor<?x?x?x?xi32>) -> tensor<?x?x?x?xi32>
    return %0 : tensor<?x?x?x?xi32>
  }
}

// -----
module {
  func.func @pooling_nchw_sum(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32> {
    %0 = linalg.pooling_nchw_sum {dilations = dense<2> : tensor<2xi64>, strides = dense<3> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<?x?x?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    return %0 : tensor<?x?x?x?xf32>
  }
}

// -----
module {
  func.func @pooling_nchw_max(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32> {
    %0 = linalg.pooling_nchw_max {dilations = dense<1> : tensor<2xi64>, strides = dense<2> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<?x?x?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    return %0 : tensor<?x?x?x?xf32>
  }
}

// -----
module {
  func.func @pooling_nwc_sum(%arg0: tensor<?x?x?xf32>, %arg1: tensor<?xf32>, %arg2: tensor<?x?x?xf32>) -> tensor<?x?x?xf32> {
    %0 = linalg.pooling_nwc_sum {dilations = dense<3> : tensor<1xi64>, strides = dense<2> : tensor<1xi64>} ins(%arg0, %arg1 : tensor<?x?x?xf32>, tensor<?xf32>) outs(%arg2 : tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    return %0 : tensor<?x?x?xf32>
  }
}

// -----
module {
  func.func @pooling_ncw_sum(%arg0: tensor<?x?x?xf32>, %arg1: tensor<?xf32>, %arg2: tensor<?x?x?xf32>) -> tensor<?x?x?xf32> {
    %0 = linalg.pooling_ncw_sum {dilations = dense<2> : tensor<1xi64>, strides = dense<3> : tensor<1xi64>} ins(%arg0, %arg1 : tensor<?x?x?xf32>, tensor<?xf32>) outs(%arg2 : tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    return %0 : tensor<?x?x?xf32>
  }
}

// -----
module {
  func.func @pooling_nwc_max(%arg0: tensor<?x?x?xf32>, %arg1: tensor<?xf32>, %arg2: tensor<?x?x?xf32>) -> tensor<?x?x?xf32> {
    %0 = linalg.pooling_nwc_max {dilations = dense<1> : tensor<1xi64>, strides = dense<2> : tensor<1xi64>} ins(%arg0, %arg1 : tensor<?x?x?xf32>, tensor<?xf32>) outs(%arg2 : tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    return %0 : tensor<?x?x?xf32>
  }
}

// -----
module {
  func.func @pooling_nwc_max_unsigned(%arg0: tensor<?x?x?xi8>, %arg1: tensor<?xi8>, %arg2: tensor<?x?x?xi32>) -> tensor<?x?x?xi32> {
    %0 = linalg.pooling_nwc_max_unsigned {dilations = dense<1> : tensor<1xi64>, strides = dense<1> : tensor<1xi64>} ins(%arg0, %arg1 : tensor<?x?x?xi8>, tensor<?xi8>) outs(%arg2 : tensor<?x?x?xi32>) -> tensor<?x?x?xi32>
    return %0 : tensor<?x?x?xi32>
  }
}

// -----
module {
  func.func @pooling_ncw_max(%arg0: tensor<?x?x?xf32>, %arg1: tensor<?xf32>, %arg2: tensor<?x?x?xf32>) -> tensor<?x?x?xf32> {
    %0 = linalg.pooling_ncw_max {dilations = dense<2> : tensor<1xi64>, strides = dense<1> : tensor<1xi64>} ins(%arg0, %arg1 : tensor<?x?x?xf32>, tensor<?xf32>) outs(%arg2 : tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    return %0 : tensor<?x?x?xf32>
  }
}

// -----
module {
  func.func @pooling_nwc_min(%arg0: tensor<?x?x?xf32>, %arg1: tensor<?xf32>, %arg2: tensor<?x?x?xf32>) -> tensor<?x?x?xf32> {
    %0 = linalg.pooling_nwc_min {dilations = dense<1> : tensor<1xi64>, strides = dense<1> : tensor<1xi64>} ins(%arg0, %arg1 : tensor<?x?x?xf32>, tensor<?xf32>) outs(%arg2 : tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    return %0 : tensor<?x?x?xf32>
  }
}

// -----
module {
  func.func @pooling_nwc_min_unsigned(%arg0: tensor<?x?x?xi8>, %arg1: tensor<?xi8>, %arg2: tensor<?x?x?xi32>) -> tensor<?x?x?xi32> {
    %0 = linalg.pooling_nwc_min_unsigned {dilations = dense<1> : tensor<1xi64>, strides = dense<1> : tensor<1xi64>} ins(%arg0, %arg1 : tensor<?x?x?xi8>, tensor<?xi8>) outs(%arg2 : tensor<?x?x?xi32>) -> tensor<?x?x?xi32>
    return %0 : tensor<?x?x?xi32>
  }
}

// -----
module {
  func.func @pooling_ndhwc_sum(%arg0: tensor<?x?x?x?x?xf32>, %arg1: tensor<?x?x?xf32>, %arg2: tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32> {
    %0 = linalg.pooling_ndhwc_sum {dilations = dense<2> : tensor<3xi64>, strides = dense<3> : tensor<3xi64>} ins(%arg0, %arg1 : tensor<?x?x?x?x?xf32>, tensor<?x?x?xf32>) outs(%arg2 : tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>
    return %0 : tensor<?x?x?x?x?xf32>
  }
}

// -----
module {
  func.func @pooling_ndhwc_max(%arg0: tensor<?x?x?x?x?xf32>, %arg1: tensor<?x?x?xf32>, %arg2: tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32> {
    %0 = linalg.pooling_ndhwc_max {dilations = dense<1> : tensor<3xi64>, strides = dense<2> : tensor<3xi64>} ins(%arg0, %arg1 : tensor<?x?x?x?x?xf32>, tensor<?x?x?xf32>) outs(%arg2 : tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>
    return %0 : tensor<?x?x?x?x?xf32>
  }
}

// -----
module {
  func.func @pooling_ndhwc_min(%arg0: tensor<?x?x?x?x?xf32>, %arg1: tensor<?x?x?xf32>, %arg2: tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32> {
    %0 = linalg.pooling_ndhwc_min {dilations = dense<[1, 2, 3]> : tensor<3xi64>, strides = dense<[4, 5, 6]> : tensor<3xi64>} ins(%arg0, %arg1 : tensor<?x?x?x?x?xf32>, tensor<?x?x?xf32>) outs(%arg2 : tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>
    return %0 : tensor<?x?x?x?x?xf32>
  }
}

