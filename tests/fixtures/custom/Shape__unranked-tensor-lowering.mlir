module {
  func.func @unranked_tensor_lowering(%arg0: tensor<*xf32>) -> tensor<*xf32> {
    %0 = shape.shape_of %arg0 : tensor<*xf32> -> tensor<?xindex>
    %1 = shape.num_elements %0 : tensor<?xindex> -> index
    %from_elements = tensor.from_elements %1 : tensor<1xindex>
    %reshape = tensor.reshape %arg0(%from_elements) : (tensor<*xf32>, tensor<1xindex>) -> tensor<?xf32>
    %cst = arith.constant 1.000000e+00 : f32
    %splat = tensor.splat %cst[%1] : tensor<?xf32>
    %2 = arith.addf %reshape, %splat : tensor<?xf32>
    %reshape_0 = tensor.reshape %2(%0) : (tensor<?xf32>, tensor<?xindex>) -> tensor<*xf32>
    %3 = shape.shape_of %reshape_0 : tensor<*xf32> -> tensor<?xindex>
    %4 = shape.num_elements %3 : tensor<?xindex> -> index
    %from_elements_1 = tensor.from_elements %4 : tensor<1xindex>
    %reshape_2 = tensor.reshape %reshape_0(%from_elements_1) : (tensor<*xf32>, tensor<1xindex>) -> tensor<?xf32>
    %cst_3 = arith.constant 2.000000e+00 : f32
    %splat_4 = tensor.splat %cst_3[%4] : tensor<?xf32>
    %5 = arith.mulf %reshape_2, %splat_4 : tensor<?xf32>
    %reshape_5 = tensor.reshape %5(%3) : (tensor<?xf32>, tensor<?xindex>) -> tensor<*xf32>
    return %reshape_5 : tensor<*xf32>
  }
}

