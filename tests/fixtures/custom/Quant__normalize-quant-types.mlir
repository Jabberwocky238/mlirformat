module {
  func.func private @callee(tensor<?x?x!quant.uniform<i8:f32:{}, {{2.000000e+00:127}}>>, tensor<?x?x!quant.uniform<i8:f32:{0:1, 1:4}, {{2.000000e+00:127}}>>) -> (tensor<?x?x!quant.uniform<i8:f32:{}, {{2.000000e+00:127}}>>, tensor<?x?x!quant.uniform<i8:f32:{0:1, 1:4}, {{2.000000e+00:127}}>>)
  func.func @normalize_quant_types_to_per_tensor(%arg0: tensor<?x?x!quant.uniform<i8:f32:{}, {{2.000000e+00:127}}>>, %arg1: tensor<?x?x!quant.uniform<i8:f32:{0:1, 1:4}, {{2.000000e+00:127}}>>) -> (tensor<?x?x!quant.uniform<i8:f32:{}, {{2.000000e+00:127}}>>, tensor<?x?x!quant.uniform<i8:f32:{0:1, 1:4}, {{2.000000e+00:127}}>>) {
    %0 = "test.custom_op"(%arg0) : (tensor<?x?x!quant.uniform<i8:f32:{}, {{2.000000e+00:127}}>>) -> tensor<?x?x!quant.uniform<i8:f32:{}, {{2.000000e+00:127}}>>
    %1 = "test.custom_op"(%arg1) : (tensor<?x?x!quant.uniform<i8:f32:{0:1, 1:4}, {{2.000000e+00:127}}>>) -> tensor<?x?x!quant.uniform<i8:f32:{0:1, 1:4}, {{2.000000e+00:127}}>>
    %2:2 = call @callee(%0, %1) : (tensor<?x?x!quant.uniform<i8:f32:{}, {{2.000000e+00:127}}>>, tensor<?x?x!quant.uniform<i8:f32:{0:1, 1:4}, {{2.000000e+00:127}}>>) -> (tensor<?x?x!quant.uniform<i8:f32:{}, {{2.000000e+00:127}}>>, tensor<?x?x!quant.uniform<i8:f32:{0:1, 1:4}, {{2.000000e+00:127}}>>)
    return %2#0, %2#1 : tensor<?x?x!quant.uniform<i8:f32:{}, {{2.000000e+00:127}}>>, tensor<?x?x!quant.uniform<i8:f32:{0:1, 1:4}, {{2.000000e+00:127}}>>
  }
}

// -----
module {
  func.func private @callee(tensor<?x?x!quant.uniform<i8:f32:{0:1}, {{2.000000e+00:127}, {3.000000e+00:127}}>>, tensor<?x?x!quant.uniform<i8:f32:{0:1, 1:4}, {{2.000000e+00:127}, {3.000000e+00:127}}>>) -> (tensor<?x?x!quant.uniform<i8:f32:{0:1}, {{2.000000e+00:127}, {3.000000e+00:127}}>>, tensor<?x?x!quant.uniform<i8:f32:{0:1, 1:4}, {{2.000000e+00:127}, {3.000000e+00:127}}>>)
  func.func @normalize_quant_types_to_per_axis(%arg0: tensor<?x?x!quant.uniform<i8:f32:{0:1}, {{2.000000e+00:127}, {3.000000e+00:127}}>>, %arg1: tensor<?x?x!quant.uniform<i8:f32:{0:1, 1:4}, {{2.000000e+00:127}, {3.000000e+00:127}}>>) -> (tensor<?x?x!quant.uniform<i8:f32:{0:1}, {{2.000000e+00:127}, {3.000000e+00:127}}>>, tensor<?x?x!quant.uniform<i8:f32:{0:1, 1:4}, {{2.000000e+00:127}, {3.000000e+00:127}}>>) {
    %0 = "test.custom_op"(%arg0) : (tensor<?x?x!quant.uniform<i8:f32:{0:1}, {{2.000000e+00:127}, {3.000000e+00:127}}>>) -> tensor<?x?x!quant.uniform<i8:f32:{0:1}, {{2.000000e+00:127}, {3.000000e+00:127}}>>
    %1 = "test.custom_op"(%arg1) : (tensor<?x?x!quant.uniform<i8:f32:{0:1, 1:4}, {{2.000000e+00:127}, {3.000000e+00:127}}>>) -> tensor<?x?x!quant.uniform<i8:f32:{0:1, 1:4}, {{2.000000e+00:127}, {3.000000e+00:127}}>>
    %2:2 = call @callee(%0, %1) : (tensor<?x?x!quant.uniform<i8:f32:{0:1}, {{2.000000e+00:127}, {3.000000e+00:127}}>>, tensor<?x?x!quant.uniform<i8:f32:{0:1, 1:4}, {{2.000000e+00:127}, {3.000000e+00:127}}>>) -> (tensor<?x?x!quant.uniform<i8:f32:{0:1}, {{2.000000e+00:127}, {3.000000e+00:127}}>>, tensor<?x?x!quant.uniform<i8:f32:{0:1, 1:4}, {{2.000000e+00:127}, {3.000000e+00:127}}>>)
    return %2#0, %2#1 : tensor<?x?x!quant.uniform<i8:f32:{0:1}, {{2.000000e+00:127}, {3.000000e+00:127}}>>, tensor<?x?x!quant.uniform<i8:f32:{0:1, 1:4}, {{2.000000e+00:127}, {3.000000e+00:127}}>>
  }
}

