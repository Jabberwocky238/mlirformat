module {
  func.func @test_add_rank_valid(%arg0: tensor<f32>, %arg1: tensor<f32>) -> tensor<f32> {
    %0 = tosa.add %arg0, %arg1 : (tensor<f32>, tensor<f32>) -> tensor<f32>
    return %0 : tensor<f32>
  }
}

// -----
module {
  func.func @test_const_rank_valid(%arg0: tensor<i32>) -> tensor<i32> {
    %0 = "tosa.const"() <{values = dense<0> : tensor<i32>}> : () -> tensor<i32>
    return %0 : tensor<i32>
  }
}

// -----
module {
  func.func @test_identity_rank_valid(%arg0: tensor<i32>) -> tensor<i32> {
    %0 = tosa.identity %arg0 : (tensor<i32>) -> tensor<i32>
    return %0 : tensor<i32>
  }
}

// -----
module {
  func.func @test_tensor_size_valid(%arg0: tensor<1x536870911xf32>) {
    %0 = tosa.const_shape  {values = dense<0> : tensor<2xindex>} : () -> !tosa.shape<2>
    %1 = tosa.const_shape  {values = dense<1> : tensor<2xindex>} : () -> !tosa.shape<2>
    %2 = tosa.slice %arg0, %0, %1 : (tensor<1x536870911xf32>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<1x1xf32>
    return
  }
}

// -----
module {
  func.func @test_const_shape() {
    %0 = tosa.const_shape  {values = dense<[1, 1, 536870912, 1]> : tensor<4xindex>} : () -> !tosa.shape<4>
    return
  }
}

// -----
module {
  func.func @test_cond_if_rank_valid(%arg0: tensor<1x1x1x1x1x1x1xf32>, %arg1: tensor<1x1x1x1x1x1x1xf32>, %arg2: tensor<i1>) -> tensor<1x1x1x1x1x1x1xf32> {
    %0 = tosa.cond_if %arg2 (%arg3 = %arg0, %arg4 = %arg1) : tensor<i1> (tensor<1x1x1x1x1x1x1xf32>, tensor<1x1x1x1x1x1x1xf32>) -> tensor<1x1x1x1x1x1x1xf32> {
    ^bb0(%arg3: tensor<1x1x1x1x1x1x1xf32>, %arg4: tensor<1x1x1x1x1x1x1xf32>):
      tosa.yield %arg3 : tensor<1x1x1x1x1x1x1xf32>
    } else {
    ^bb0(%arg3: tensor<1x1x1x1x1x1x1xf32>, %arg4: tensor<1x1x1x1x1x1x1xf32>):
      tosa.yield %arg4 : tensor<1x1x1x1x1x1x1xf32>
    }
    return %0 : tensor<1x1x1x1x1x1x1xf32>
  }
}

// -----
module {
  func.func @test_while_loop(%arg0: tensor<1x1x1x1x1x1x1xf32>, %arg1: tensor<i32>) {
    %0 = "tosa.const"() <{values = dense<0> : tensor<i32>}> : () -> tensor<i32>
    %1:2 = tosa.while_loop (%arg2 = %0, %arg3 = %arg0) : (tensor<i32>, tensor<1x1x1x1x1x1x1xf32>) -> (tensor<i32>, tensor<1x1x1x1x1x1x1xf32>) {
      %2 = tosa.greater_equal %arg2, %arg1 : (tensor<i32>, tensor<i32>) -> tensor<i1>
      %3 = tosa.logical_not %2 : (tensor<i1>) -> tensor<i1>
      tosa.yield %3 : tensor<i1>
    } do {
    ^bb0(%arg2: tensor<i32>, %arg3: tensor<1x1x1x1x1x1x1xf32>):
      %2 = "tosa.const"() <{values = dense<1> : tensor<i32>}> : () -> tensor<i32>
      %3 = tosa.add %arg2, %2 : (tensor<i32>, tensor<i32>) -> tensor<i32>
      tosa.yield %3, %arg3 : tensor<i32>, tensor<1x1x1x1x1x1x1xf32>
    }
    return
  }
}

// -----
module {
  func.func @test_custom_rank_valid(%arg0: tensor<1x1x1x1x1x1x10xi32>) -> tensor<1x1x1x1x1x1x10xi32> {
    %0 = tosa.custom %arg0 {domain_name = "tosa_mlir_test", implementation_attrs = "", operator_name = "custom_test"} : (tensor<1x1x1x1x1x1x10xi32>) -> tensor<1x1x1x1x1x1x10xi32>
    return %0 : tensor<1x1x1x1x1x1x10xi32>
  }
}

// -----
module {
  func.func @test_tensor_size_ok(%arg0: tensor<1x536870911xf32>) {
    %0 = tosa.const_shape  {values = dense<0> : tensor<2xindex>} : () -> !tosa.shape<2>
    %1 = tosa.const_shape  {values = dense<1> : tensor<2xindex>} : () -> !tosa.shape<2>
    %2 = tosa.slice %arg0, %0, %1 : (tensor<1x536870911xf32>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<1x1xf32>
    return
  }
}

