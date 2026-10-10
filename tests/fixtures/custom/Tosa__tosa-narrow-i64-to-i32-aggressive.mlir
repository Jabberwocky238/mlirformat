module {
  func.func @test_i64_argmax_large_axis_dim(%arg0: tensor<1x513x513x2147483650xi8>) -> tensor<1x513x513xi64> {
    %0 = tosa.argmax %arg0 {axis = 3 : i32} : (tensor<1x513x513x2147483650xi8>) -> tensor<1x513x513xi64>
    return %0 : tensor<1x513x513xi64>
  }
}

// -----
module {
  func.func @test_convert_input_parameters(%arg0: tensor<1x513x513x3xi64>) -> tensor<1x513x513x3xf32> {
    %0 = tosa.cast %arg0 : (tensor<1x513x513x3xi64>) -> tensor<1x513x513x3xi32>
    %1 = tosa.cast %0 : (tensor<1x513x513x3xi32>) -> tensor<1x513x513x3xf32>
    return %1 : tensor<1x513x513x3xf32>
  }
}

// -----
module {
  func.func @test_add(%arg0: tensor<13x21x1xi64>, %arg1: tensor<13x21x3xi64>) -> tensor<13x21x3xi64> {
    %0 = tosa.add %arg0, %arg1 : (tensor<13x21x1xi64>, tensor<13x21x3xi64>) -> tensor<13x21x3xi64>
    return %0 : tensor<13x21x3xi64>
  }
}

// -----
module {
  func.func @test_regions(%arg0: tensor<i64>, %arg1: tensor<i64>, %arg2: tensor<i1>) -> tensor<i64> {
    %0 = tosa.cond_if %arg2 : tensor<i1> -> tensor<i64> {
      %1 = tosa.add %arg0, %arg1 : (tensor<i64>, tensor<i64>) -> tensor<i64>
      tosa.yield %1 : tensor<i64>
    } else {
      %1 = tosa.sub %arg0, %arg1 : (tensor<i64>, tensor<i64>) -> tensor<i64>
      tosa.yield %1 : tensor<i64>
    }
    return %0 : tensor<i64>
  }
}

// -----
module {
  func.func @test_const() -> tensor<2xi64> {
    %0 = "tosa.const"() <{values = dense<[1, 2]> : tensor<2xi64>}> : () -> tensor<2xi64>
    return %0 : tensor<2xi64>
  }
}

// -----
module {
  func.func @test_clamp_trunc(%arg0: tensor<100xi64>) -> tensor<100xi64> {
    %0 = tosa.clamp %arg0 {max_val = 3000000000 : i64, min_val = -2147483648 : i64} : (tensor<100xi64>) -> tensor<100xi64>
    return %0 : tensor<100xi64>
  }
}

