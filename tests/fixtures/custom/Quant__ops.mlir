module {
  func.func @dcast_scalar(%arg0: !quant.uniform<i8:f32, 1.000000e+00>) {
    %0 = quant.dcast %arg0 : !quant.uniform<i8:f32, 1.000000e+00> to f32
    return
  }
}

// -----
module {
  func.func @dcast_ranked(%arg0: tensor<2x?x4x!quant.uniform<i8:f32, 1.000000e+00>>) {
    %0 = quant.dcast %arg0 : tensor<2x?x4x!quant.uniform<i8:f32, 1.000000e+00>> to tensor<2x?x4xf32>
    return
  }
}

// -----
module {
  func.func @dcast_unranked(%arg0: tensor<*x!quant.uniform<i8:f32, 1.000000e+00>>) {
    %0 = quant.dcast %arg0 : tensor<*x!quant.uniform<i8:f32, 1.000000e+00>> to tensor<*xf32>
    return
  }
}

// -----
module {
  func.func @dcast_per_axis_static(%arg0: tensor<1x2x3x!quant.uniform<i8:f32:2, {1.000000e+00,2.000000e+00,3.000000e+00}>>) {
    %0 = quant.dcast %arg0 : tensor<1x2x3x!quant.uniform<i8:f32:2, {1.000000e+00,2.000000e+00,3.000000e+00}>> to tensor<1x2x3xf32>
    return
  }
}

// -----
module {
  func.func @dcast_per_axis_dynamic(%arg0: tensor<?x?x?x!quant.uniform<i8:f32:2, {1.000000e+00,2.000000e+00,3.000000e+00}>>) {
    %0 = quant.dcast %arg0 : tensor<?x?x?x!quant.uniform<i8:f32:2, {1.000000e+00,2.000000e+00,3.000000e+00}>> to tensor<?x?x?xf32>
    return
  }
}

// -----
module {
  func.func @dcast_per_axis_unranked(%arg0: tensor<*x!quant.uniform<i8:f32:2, {1.000000e+00,2.000000e+00,3.000000e+00}>>) {
    %0 = quant.dcast %arg0 : tensor<*x!quant.uniform<i8:f32:2, {1.000000e+00,2.000000e+00,3.000000e+00}>> to tensor<*xf32>
    return
  }
}

// -----
module {
  func.func @qcast_scalar(%arg0: f32) {
    %0 = quant.qcast %arg0 : f32 to !quant.uniform<i8:f32, 1.000000e+00>
    return
  }
}

// -----
module {
  func.func @qcast_ranked(%arg0: tensor<2x?x4xf32>) {
    %0 = quant.qcast %arg0 : tensor<2x?x4xf32> to tensor<2x?x4x!quant.uniform<i8:f32, 1.000000e+00>>
    return
  }
}

// -----
module {
  func.func @qcast_unranked(%arg0: tensor<*xf32>) {
    %0 = quant.qcast %arg0 : tensor<*xf32> to tensor<*x!quant.uniform<i8:f32, 1.000000e+00>>
    return
  }
}

// -----
module {
  func.func @qcast_per_axis_static(%arg0: tensor<1x2x3xf32>) {
    %0 = quant.qcast %arg0 : tensor<1x2x3xf32> to tensor<1x2x3x!quant.uniform<i8:f32:2, {1.000000e+00,2.000000e+00,3.000000e+00}>>
    return
  }
}

// -----
module {
  func.func @qcast_per_axis_dynamic(%arg0: tensor<?x?x?xf32>) {
    %0 = quant.qcast %arg0 : tensor<?x?x?xf32> to tensor<?x?x?x!quant.uniform<i8:f32:2, {1.000000e+00,2.000000e+00,3.000000e+00}>>
    return
  }
}

// -----
module {
  func.func @qcast_per_axis_unranked(%arg0: tensor<*xf32>) {
    %0 = quant.qcast %arg0 : tensor<*xf32> to tensor<*x!quant.uniform<i8:f32:2, {1.000000e+00,2.000000e+00,3.000000e+00}>>
    return
  }
}

// -----
module {
  func.func @scast_scalar(%arg0: i8) {
    %0 = quant.scast %arg0 : i8 to !quant.uniform<i8:f32, 1.000000e+00>
    %1 = quant.scast %0 : !quant.uniform<i8:f32, 1.000000e+00> to i8
    return
  }
}

// -----
module {
  func.func @scast_ranked(%arg0: tensor<2x?x4xi8>) {
    %0 = quant.scast %arg0 : tensor<2x?x4xi8> to tensor<2x?x4x!quant.uniform<i8:f32, 1.000000e+00>>
    %1 = quant.scast %0 : tensor<2x?x4x!quant.uniform<i8:f32, 1.000000e+00>> to tensor<2x?x4xi8>
    return
  }
}

// -----
module {
  func.func @scast_unranked(%arg0: tensor<*xi8>) {
    %0 = quant.scast %arg0 : tensor<*xi8> to tensor<*x!quant.uniform<i8:f32, 1.000000e+00>>
    %1 = quant.scast %0 : tensor<*x!quant.uniform<i8:f32, 1.000000e+00>> to tensor<*xi8>
    return
  }
}

// -----
module {
  func.func @scast_per_axis_static(%arg0: tensor<1x2x3xi8>) {
    %0 = quant.scast %arg0 : tensor<1x2x3xi8> to tensor<1x2x3x!quant.uniform<i8:f32:2, {1.000000e+00,2.000000e+00,3.000000e+00}>>
    %1 = quant.scast %0 : tensor<1x2x3x!quant.uniform<i8:f32:2, {1.000000e+00,2.000000e+00,3.000000e+00}>> to tensor<1x2x3xi8>
    return
  }
}

// -----
module {
  func.func @scast_per_axis_dynamic(%arg0: tensor<?x?x?xi8>) {
    %0 = quant.scast %arg0 : tensor<?x?x?xi8> to tensor<?x?x?x!quant.uniform<i8:f32:2, {1.000000e+00,2.000000e+00,3.000000e+00}>>
    %1 = quant.scast %0 : tensor<?x?x?x!quant.uniform<i8:f32:2, {1.000000e+00,2.000000e+00,3.000000e+00}>> to tensor<?x?x?xi8>
    return
  }
}

// -----
module {
  func.func @scast_per_axis_unranked(%arg0: tensor<*xi8>) {
    %0 = quant.scast %arg0 : tensor<*xi8> to tensor<*x!quant.uniform<i8:f32:2, {1.000000e+00,2.000000e+00,3.000000e+00}>>
    %1 = quant.scast %0 : tensor<*x!quant.uniform<i8:f32:2, {1.000000e+00,2.000000e+00,3.000000e+00}>> to tensor<*xi8>
    return
  }
}

// -----
module {
  func.func @sub_channel_quantization(%arg0: tensor<2x4xi8>) -> tensor<2x4xi8> {
    %0 = quant.scast %arg0 : tensor<2x4xi8> to tensor<2x4x!quant.uniform<u8:f32:{0:1, 1:2}, {{2.000000e+02:120, 0.99871999:127}, {2.000000e+02, 0.99871999}}>>
    %1 = quant.dcast %0 : tensor<2x4x!quant.uniform<u8:f32:{0:1, 1:2}, {{2.000000e+02:120, 0.99871999:127}, {2.000000e+02, 0.99871999}}>> to tensor<2x4xf32>
    %2 = quant.qcast %1 : tensor<2x4xf32> to tensor<2x4x!quant.uniform<u8:f32:{0:1, 1:2}, {{2.000000e+02:120, 0.99871999:127}, {2.000000e+02, 0.99871999}}>>
    %3 = quant.scast %2 : tensor<2x4x!quant.uniform<u8:f32:{0:1, 1:2}, {{2.000000e+02:120, 0.99871999:127}, {2.000000e+02, 0.99871999}}>> to tensor<2x4xi8>
    return %3 : tensor<2x4xi8>
  }
}

// -----
module {
  func.func @sub_channel_quantization_with_unknown_dims(%arg0: tensor<2x?xf32>) {
    %0 = quant.qcast %arg0 : tensor<2x?xf32> to tensor<2x?x!quant.uniform<u8:f32:{0:1, 1:2}, {{2.000000e+02:120, 0.99871999:127}, {2.000000e+02, 0.99871999}}>>
    return
  }
}

