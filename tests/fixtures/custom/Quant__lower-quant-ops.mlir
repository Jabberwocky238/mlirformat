module {
  func.func @dcast_per_layer_scalar(%arg0: !quant.uniform<i8:f32, 2.000000e+00:10>) -> f32 {
    %0 = quant.dcast %arg0 : !quant.uniform<i8:f32, 2.000000e+00:10> to f32
    return %0 : f32
  }
}

// -----
module {
  func.func @dcast_per_layer_scalar_unsigned(%arg0: !quant.uniform<u8:f32, 2.000000e+00:10>) -> f32 {
    %0 = quant.dcast %arg0 : !quant.uniform<u8:f32, 2.000000e+00:10> to f32
    return %0 : f32
  }
}

// -----
module {
  func.func @dcast_per_layer_0d(%arg0: tensor<!quant.uniform<i8:f32, 2.000000e+00:10>>) -> tensor<f32> {
    %0 = quant.dcast %arg0 : tensor<!quant.uniform<i8:f32, 2.000000e+00:10>> to tensor<f32>
    return %0 : tensor<f32>
  }
}

// -----
module {
  func.func @dcast_per_layer_ranked(%arg0: tensor<3x?x5x!quant.uniform<i8:f32, 2.000000e+00:10>>) -> tensor<3x?x5xf32> {
    %0 = quant.dcast %arg0 : tensor<3x?x5x!quant.uniform<i8:f32, 2.000000e+00:10>> to tensor<3x?x5xf32>
    return %0 : tensor<3x?x5xf32>
  }
}

// -----
module {
  func.func @dcast_per_layer_unranked(%arg0: tensor<*x!quant.uniform<i8:f32, 2.000000e+00:10>>) -> tensor<*xf32> {
    %0 = quant.dcast %arg0 : tensor<*x!quant.uniform<i8:f32, 2.000000e+00:10>> to tensor<*xf32>
    return %0 : tensor<*xf32>
  }
}

// -----
module {
  func.func @dcast_per_channel_ranked(%arg0: tensor<4x?x?x5x!quant.uniform<i8:f32:1, {2.000000e+00:10,3.000000e+00:20}>>) -> tensor<4x?x?x5xf32> {
    %0 = quant.dcast %arg0 : tensor<4x?x?x5x!quant.uniform<i8:f32:1, {2.000000e+00:10,3.000000e+00:20}>> to tensor<4x?x?x5xf32>
    return %0 : tensor<4x?x?x5xf32>
  }
}

// -----
module {
  func.func @dcast_per_channel_unranked(%arg0: tensor<*x!quant.uniform<i8:f32:2, {2.000000e+00:10,3.000000e+00:20,4.000000e+00:30}>>) -> tensor<*xf32> {
    %0 = quant.dcast %arg0 : tensor<*x!quant.uniform<i8:f32:2, {2.000000e+00:10,3.000000e+00:20,4.000000e+00:30}>> to tensor<*xf32>
    return %0 : tensor<*xf32>
  }
}

// -----
module {
  func.func @qcast_per_layer_scalar(%arg0: f32) -> !quant.uniform<i8:f32, 2.000000e+00:10> {
    %0 = quant.qcast %arg0 : f32 to !quant.uniform<i8:f32, 2.000000e+00:10>
    return %0 : !quant.uniform<i8:f32, 2.000000e+00:10>
  }
}

// -----
module {
  func.func @qcast_per_layer_scalar_bounds(%arg0: f32) -> !quant.uniform<i8<-5:10>:f32, 2.000000e+00> {
    %0 = quant.qcast %arg0 : f32 to !quant.uniform<i8<-5:10>:f32, 2.000000e+00>
    return %0 : !quant.uniform<i8<-5:10>:f32, 2.000000e+00>
  }
}

// -----
module {
  func.func @qcast_per_layer_scalar_unsigned_bounds(%arg0: f32) -> !quant.uniform<u8<2:10>:f32, 2.000000e+00> {
    %0 = quant.qcast %arg0 : f32 to !quant.uniform<u8<2:10>:f32, 2.000000e+00>
    return %0 : !quant.uniform<u8<2:10>:f32, 2.000000e+00>
  }
}

// -----
module {
  func.func @qcast_per_layer_0d(%arg0: tensor<f32>) -> tensor<!quant.uniform<i8:f32, 2.000000e+00:10>> {
    %0 = quant.qcast %arg0 : tensor<f32> to tensor<!quant.uniform<i8:f32, 2.000000e+00:10>>
    return %0 : tensor<!quant.uniform<i8:f32, 2.000000e+00:10>>
  }
}

// -----
module {
  func.func @qcast_per_layer_ranked(%arg0: tensor<3x?x5xf32>) -> tensor<3x?x5x!quant.uniform<i8:f32, 2.000000e+00:10>> {
    %0 = quant.qcast %arg0 : tensor<3x?x5xf32> to tensor<3x?x5x!quant.uniform<i8:f32, 2.000000e+00:10>>
    return %0 : tensor<3x?x5x!quant.uniform<i8:f32, 2.000000e+00:10>>
  }
}

// -----
module {
  func.func @qcast_per_layer_ranked_bounds(%arg0: tensor<3x5xf32>) -> tensor<3x5x!quant.uniform<i8<-8:7>:f32, 2.000000e+00:10>> {
    %0 = quant.qcast %arg0 : tensor<3x5xf32> to tensor<3x5x!quant.uniform<i8<-8:7>:f32, 2.000000e+00:10>>
    return %0 : tensor<3x5x!quant.uniform<i8<-8:7>:f32, 2.000000e+00:10>>
  }
}

// -----
module {
  func.func @qcast_per_layer_unranked(%arg0: tensor<*xf32>) -> tensor<*x!quant.uniform<i8:f32, 2.000000e+00:10>> {
    %0 = quant.qcast %arg0 : tensor<*xf32> to tensor<*x!quant.uniform<i8:f32, 2.000000e+00:10>>
    return %0 : tensor<*x!quant.uniform<i8:f32, 2.000000e+00:10>>
  }
}

// -----
module {
  func.func @qcast_per_channel_ranked(%arg0: tensor<4x?x?x5xf32>) -> tensor<4x?x?x5x!quant.uniform<i8:f32:1, {2.000000e+00:10,3.000000e+00:20}>> {
    %0 = quant.qcast %arg0 : tensor<4x?x?x5xf32> to tensor<4x?x?x5x!quant.uniform<i8:f32:1, {2.000000e+00:10,3.000000e+00:20}>>
    return %0 : tensor<4x?x?x5x!quant.uniform<i8:f32:1, {2.000000e+00:10,3.000000e+00:20}>>
  }
}

// -----
module {
  func.func @qcast_per_channel_ranked_bounds(%arg0: tensor<4x2x5xf32>) -> tensor<4x2x5x!quant.uniform<i8<-8:7>:f32:1, {2.000000e+00,3.000000e+00}>> {
    %0 = quant.qcast %arg0 : tensor<4x2x5xf32> to tensor<4x2x5x!quant.uniform<i8<-8:7>:f32:1, {2.000000e+00,3.000000e+00}>>
    return %0 : tensor<4x2x5x!quant.uniform<i8<-8:7>:f32:1, {2.000000e+00,3.000000e+00}>>
  }
}

// -----
module {
  func.func @qcast_per_channel_unranked(%arg0: tensor<*xf32>) -> tensor<*x!quant.uniform<i8:f32:2, {2.000000e+00:10,3.000000e+00:20,4.000000e+00:30}>> {
    %0 = quant.qcast %arg0 : tensor<*xf32> to tensor<*x!quant.uniform<i8:f32:2, {2.000000e+00:10,3.000000e+00:20,4.000000e+00:30}>>
    return %0 : tensor<*x!quant.uniform<i8:f32:2, {2.000000e+00:10,3.000000e+00:20,4.000000e+00:30}>>
  }
}

// -----
module {
  func.func @qcast_sub_channel_ranked(%arg0: tensor<2x?x?x4xf32>) -> tensor<2x?x?x4x!quant.uniform<i8:f32:{0:1, 3:2}, {{{{2.000000e+00:10, 3.000000e+00:20}}}, {{{4.000000e+00:30, 5.000000e+00:40}}}}>> {
    %0 = quant.qcast %arg0 : tensor<2x?x?x4xf32> to tensor<2x?x?x4x!quant.uniform<i8:f32:{0:1, 3:2}, {{{{2.000000e+00:10, 3.000000e+00:20}}}, {{{4.000000e+00:30, 5.000000e+00:40}}}}>>
    return %0 : tensor<2x?x?x4x!quant.uniform<i8:f32:{0:1, 3:2}, {{{{2.000000e+00:10, 3.000000e+00:20}}}, {{{4.000000e+00:30, 5.000000e+00:40}}}}>>
  }
}

// -----
module {
  func.func @qcast_sub_channel_ranked_bounds(%arg0: tensor<2x3x5x4xf32>) -> tensor<2x3x5x4x!quant.uniform<i8:f32:{0:1, 3:2}, {{{{2.000000e+00:10, 3.000000e+00:20}}}, {{{4.000000e+00:30, 5.000000e+00:40}}}}>> {
    %0 = quant.qcast %arg0 : tensor<2x3x5x4xf32> to tensor<2x3x5x4x!quant.uniform<i8:f32:{0:1, 3:2}, {{{{2.000000e+00:10, 3.000000e+00:20}}}, {{{4.000000e+00:30, 5.000000e+00:40}}}}>>
    return %0 : tensor<2x3x5x4x!quant.uniform<i8:f32:{0:1, 3:2}, {{{{2.000000e+00:10, 3.000000e+00:20}}}, {{{4.000000e+00:30, 5.000000e+00:40}}}}>>
  }
}

