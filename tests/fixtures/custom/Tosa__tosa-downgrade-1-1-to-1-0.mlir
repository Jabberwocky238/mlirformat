module {
  func.func @test_bool_to_fp32(%arg0: tensor<13x21x3xi1>) -> tensor<13x21x3xf32> {
    %0 = tosa.cast %arg0 : (tensor<13x21x3xi1>) -> tensor<13x21x3xf32>
    return %0 : tensor<13x21x3xf32>
  }
}

// -----
module {
  func.func @test_bool_to_fp32_unranked(%arg0: tensor<*xi1>) -> tensor<*xf32> {
    %0 = tosa.cast %arg0 : (tensor<*xi1>) -> tensor<*xf32>
    return %0 : tensor<*xf32>
  }
}

// -----
module {
  func.func @test_fp32_to_bool_ranked_dynamic(%arg0: tensor<13x?x3xf32>) -> tensor<13x?x3xi1> {
    %0 = tosa.cast %arg0 : (tensor<13x?x3xf32>) -> tensor<13x?x3xi1>
    return %0 : tensor<13x?x3xi1>
  }
}

// -----
module {
  func.func @test_unranked_fp32_to_bool(%arg0: tensor<*xf32>) -> tensor<*xi1> {
    %0 = tosa.cast %arg0 : (tensor<*xf32>) -> tensor<*xi1>
    return %0 : tensor<*xi1>
  }
}

// -----
module {
  func.func @test_preserve_bool_to_i8(%arg0: tensor<13x21x3xi1>) -> tensor<13x21x3xi8> {
    %0 = tosa.cast %arg0 : (tensor<13x21x3xi1>) -> tensor<13x21x3xi8>
    return %0 : tensor<13x21x3xi8>
  }
}

// -----
module {
  func.func @test_gather_bool_i32(%arg0: tensor<13x21x3xi1>, %arg1: tensor<13x26xi32>) -> tensor<13x26x3xi1> {
    %0 = tosa.gather %arg0, %arg1 : (tensor<13x21x3xi1>, tensor<13x26xi32>) -> tensor<13x26x3xi1>
    return %0 : tensor<13x26x3xi1>
  }
}

// -----
module {
  func.func @test_preserve_gather_bool_i64(%arg0: tensor<13x21x3xi1>, %arg1: tensor<13x26xi64>) -> tensor<13x26x3xi1> {
    %0 = tosa.gather %arg0, %arg1 : (tensor<13x21x3xi1>, tensor<13x26xi64>) -> tensor<13x26x3xi1>
    return %0 : tensor<13x26x3xi1>
  }
}

// -----
module {
  func.func @test_preserve_gather_i8_i32(%arg0: tensor<13x21x3xi8>, %arg1: tensor<13x26xi32>) -> tensor<13x26x3xi8> {
    %0 = tosa.gather %arg0, %arg1 : (tensor<13x21x3xi8>, tensor<13x26xi32>) -> tensor<13x26x3xi8>
    return %0 : tensor<13x26x3xi8>
  }
}

// -----
module {
  func.func @test_scatter_bool_i32(%arg0: tensor<13x52x3xi1>, %arg1: tensor<13x26xi32>, %arg2: tensor<13x26x3xi1>) -> tensor<13x52x3xi1> {
    %0 = tosa.scatter %arg0, %arg1, %arg2 : (tensor<13x52x3xi1>, tensor<13x26xi32>, tensor<13x26x3xi1>) -> tensor<13x52x3xi1>
    return %0 : tensor<13x52x3xi1>
  }
}

// -----
module {
  func.func @test_preserve_scatter_bool_i64(%arg0: tensor<13x52x3xi1>, %arg1: tensor<13x26xi64>, %arg2: tensor<13x26x3xi1>) -> tensor<13x52x3xi1> {
    %0 = tosa.scatter %arg0, %arg1, %arg2 : (tensor<13x52x3xi1>, tensor<13x26xi64>, tensor<13x26x3xi1>) -> tensor<13x52x3xi1>
    return %0 : tensor<13x52x3xi1>
  }
}

// -----
module {
  func.func @test_preserve_scatter_i8_i32(%arg0: tensor<13x52x3xi8>, %arg1: tensor<13x26xi32>, %arg2: tensor<13x26x3xi8>) -> tensor<13x52x3xi8> {
    %0 = tosa.scatter %arg0, %arg1, %arg2 : (tensor<13x52x3xi8>, tensor<13x26xi32>, tensor<13x26x3xi8>) -> tensor<13x52x3xi8>
    return %0 : tensor<13x52x3xi8>
  }
}

// -----
module {
  func.func @test_matmul_t_static_batch(%arg0: tensor<4x14x19xf32>, %arg1: tensor<4x28x19xf32>, %arg2: tensor<1xf32>, %arg3: tensor<1xf32>) -> tensor<4x14x28xf32> {
    %0 = tosa.matmul_t %arg0, %arg1, %arg2, %arg3 : (tensor<4x14x19xf32>, tensor<4x28x19xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<4x14x28xf32>
    return %0 : tensor<4x14x28xf32>
  }
}

// -----
module {
  func.func @test_matmul_t_static_broadcast(%arg0: tensor<4x14x19xf32>, %arg1: tensor<1x28x19xf32>, %arg2: tensor<1xf32>, %arg3: tensor<1xf32>) -> tensor<4x14x28xf32> {
    %0 = tosa.matmul_t %arg0, %arg1, %arg2, %arg3 : (tensor<4x14x19xf32>, tensor<1x28x19xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<4x14x28xf32>
    return %0 : tensor<4x14x28xf32>
  }
}

// -----
module {
  func.func @test_preserve_matmul_t_dynamic_broadcast(%arg0: tensor<4x14x19xf32>, %arg1: tensor<?x28x19xf32>, %arg2: tensor<1xf32>, %arg3: tensor<1xf32>) -> tensor<4x14x28xf32> {
    %0 = tosa.matmul_t %arg0, %arg1, %arg2, %arg3 : (tensor<4x14x19xf32>, tensor<?x28x19xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<4x14x28xf32>
    return %0 : tensor<4x14x28xf32>
  }
}

