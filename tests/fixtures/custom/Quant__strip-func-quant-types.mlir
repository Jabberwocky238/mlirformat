module {
  func.func @strip_operands(%arg0: !quant.uniform<i8:f32, 2.000000e+00:128>, %arg1: !quant.uniform<i16:f32, 3.000000e+00:128>, %arg2: f32) {
    %0 = "test.custom_op"(%arg0) : (!quant.uniform<i8:f32, 2.000000e+00:128>) -> tensor<4x!quant.uniform<i8:f32, 2.000000e+00:128>>
    %1 = "test.custom_op"(%arg1) : (!quant.uniform<i16:f32, 3.000000e+00:128>) -> tensor<?x!quant.uniform<i16:f32, 3.000000e+00:128>>
    %2 = "test.custom_op"(%arg2) : (f32) -> tensor<4xf32>
  }
}

// -----
module {
  func.func @strip_results() -> (tensor<4x!quant.uniform<i8:f32, 2.000000e+00:128>>, tensor<?x!quant.uniform<i16:f32, 3.000000e+00:128>>, tensor<*x!quant.uniform<i8:f32, 2.000000e+00:128>>, tensor<4xf32>) {
    %0 = "test.custom_op"() : () -> tensor<4x!quant.uniform<i8:f32, 2.000000e+00:128>>
    %1 = "test.custom_op"() : () -> tensor<?x!quant.uniform<i16:f32, 3.000000e+00:128>>
    %2 = "test.custom_op"() : () -> tensor<*x!quant.uniform<i8:f32, 2.000000e+00:128>>
    %3 = "test.custom_op"() : () -> tensor<4xf32>
    return %0, %1, %2, %3 : tensor<4x!quant.uniform<i8:f32, 2.000000e+00:128>>, tensor<?x!quant.uniform<i16:f32, 3.000000e+00:128>>, tensor<*x!quant.uniform<i8:f32, 2.000000e+00:128>>, tensor<4xf32>
  }
}

// -----
module {
  func.func private @callee(tensor<4x!quant.uniform<i8:f32, 2.000000e+00:128>>, tensor<?x!quant.uniform<i16:f32, 3.000000e+00:128>>) -> (tensor<*x!quant.uniform<i8:f32, 2.000000e+00:128>>, tensor<4xf32>)
  func.func @strip_call() {
    %0 = "test.custom_op"() : () -> tensor<4x!quant.uniform<i8:f32, 2.000000e+00:128>>
    %1 = "test.custom_op"() : () -> tensor<?x!quant.uniform<i16:f32, 3.000000e+00:128>>
    %2:2 = call @callee(%0, %1) : (tensor<4x!quant.uniform<i8:f32, 2.000000e+00:128>>, tensor<?x!quant.uniform<i16:f32, 3.000000e+00:128>>) -> (tensor<*x!quant.uniform<i8:f32, 2.000000e+00:128>>, tensor<4xf32>)
    "test.custom_op"(%2#0) : (tensor<*x!quant.uniform<i8:f32, 2.000000e+00:128>>) -> ()
    "test.custom_op"(%2#1) : (tensor<4xf32>) -> ()
    return
  }
}

