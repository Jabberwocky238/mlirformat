module {
  func.func @fill_non_builtin_scalar_type(%arg0: !test.test_type, %arg1: tensor<4x!test.test_type>) -> tensor<4x!test.test_type> {
    %0 = linalg.fill ins(%arg0 : !test.test_type) outs(%arg1 : tensor<4x!test.test_type>) -> tensor<4x!test.test_type>
    return %0 : tensor<4x!test.test_type>
  }
}

