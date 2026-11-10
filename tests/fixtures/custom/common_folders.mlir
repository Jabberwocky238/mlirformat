module {
  func.func @test_fold_unary_op_f32_to_i32() -> tensor<4x2xi32> {
    %cst = arith.constant dense<5.100000e+00> : tensor<4x2xf32>
    %0 = test.sign %cst : (tensor<4x2xf32>) -> tensor<4x2xi32>
    return %0 : tensor<4x2xi32>
  }
}

// -----
module {
  func.func @test_fold_binary_op_f32_to_i1() -> tensor<8xi1> {
    %cst = arith.constant dense<5.100000e+00> : tensor<8xf32>
    %cst_0 = arith.constant dense<4.200000e+00> : tensor<8xf32>
    %0 = test.less_than %cst, %cst_0 : (tensor<8xf32>, tensor<8xf32>) -> tensor<8xi1>
    return %0 : tensor<8xi1>
  }
}

