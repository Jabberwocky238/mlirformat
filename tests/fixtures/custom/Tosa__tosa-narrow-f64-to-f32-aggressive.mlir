module {
}

// -----
module {
  func.func @test_f64_add(%arg0: tensor<13x21x1xf64>, %arg1: tensor<13x21x3xf64>) -> tensor<13x21x3xf64> {
    %0 = tosa.add %arg0, %arg1 : (tensor<13x21x1xf64>, tensor<13x21x3xf64>) -> tensor<13x21x3xf64>
    return %0 : tensor<13x21x3xf64>
  }
}

// -----
module {
  func.func @test_f64_regions(%arg0: tensor<1xf64>, %arg1: tensor<1xf64>, %arg2: tensor<i1>) -> tensor<1xf64> {
    %0 = tosa.cond_if %arg2 : tensor<i1> -> tensor<1xf64> {
      %1 = tosa.add %arg0, %arg1 : (tensor<1xf64>, tensor<1xf64>) -> tensor<1xf64>
      tosa.yield %1 : tensor<1xf64>
    } else {
      %1 = tosa.sub %arg0, %arg1 : (tensor<1xf64>, tensor<1xf64>) -> tensor<1xf64>
      tosa.yield %1 : tensor<1xf64>
    }
    return %0 : tensor<1xf64>
  }
}

// -----
module {
  func.func @test_convert_input_parameters(%arg0: tensor<1x3xf64>) -> tensor<1x3xf32> {
    %0 = tosa.identity %arg0 : (tensor<1x3xf64>) -> tensor<1x3xf64>
    %1 = tosa.cast %0 : (tensor<1x3xf64>) -> tensor<1x3xf32>
    return %1 : tensor<1x3xf32>
  }
}

// -----
module {
  func.func @test_f64_const() -> tensor<2xf64> {
    %0 = "tosa.const"() <{values = dense<[1.000000e+00, 2.000000e+00]> : tensor<2xf64>}> : () -> tensor<2xf64>
    return %0 : tensor<2xf64>
  }
}

