module {
}

// -----
module {
  func.func @test_rescale_input_unsigned(%arg0: tensor<1x1xui8>) -> tensor<1x1xi8> {
    %0 = "tosa.const"() <{values = dense<1> : tensor<1xi8>}> : () -> tensor<1xi8>
    %1 = "tosa.const"() <{values = dense<2> : tensor<1xi32>}> : () -> tensor<1xi32>
    %2 = "tosa.const"() <{values = dense<3> : tensor<1xi8>}> : () -> tensor<1xi8>
    %3 = "tosa.const"() <{values = dense<-128> : tensor<1xi8>}> : () -> tensor<1xi8>
    %4 = tosa.rescale %arg0, %1, %0, %3, %2 {input_unsigned = true, output_unsigned = false, per_channel = false, rounding_mode = SINGLE_ROUND, scale32 = true} : (tensor<1x1xui8>, tensor<1xi32>, tensor<1xi8>, tensor<1xi8>, tensor<1xi8>) -> tensor<1x1xi8>
    return %4 : tensor<1x1xi8>
  }
}

// -----
module {
  func.func @test_rescale_output_unsigned(%arg0: tensor<1x1xi8>) -> tensor<1x1xui8> {
    %0 = "tosa.const"() <{values = dense<1> : tensor<1xi8>}> : () -> tensor<1xi8>
    %1 = "tosa.const"() <{values = dense<2> : tensor<1xi32>}> : () -> tensor<1xi32>
    %2 = "tosa.const"() <{values = dense<3> : tensor<1xi8>}> : () -> tensor<1xi8>
    %3 = "tosa.const"() <{values = dense<-128> : tensor<1xi8>}> : () -> tensor<1xi8>
    %4 = tosa.rescale %arg0, %1, %0, %3, %2 {input_unsigned = false, output_unsigned = true, per_channel = false, rounding_mode = SINGLE_ROUND, scale32 = true} : (tensor<1x1xi8>, tensor<1xi32>, tensor<1xi8>, tensor<1xi8>, tensor<1xi8>) -> tensor<1x1xui8>
    return %4 : tensor<1x1xui8>
  }
}

// -----
module {
  func.func @test_validate_without_tosa(%arg0: f32) -> f32 {
    %0 = math.asin %arg0 : f32
    return %0 : f32
  }
}

// -----
module {
  func.func @test_pad_large_input_rank(%arg0: tensor<13x21x3x1x1x1xf32>) -> tensor<13x21x3x1x1x1xf32> {
    %0 = "tosa.const"() <{values = dense<3.140000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %1 = tosa.const_shape  {values = dense<0> : tensor<12xindex>} : () -> !tosa.shape<12>
    %2 = tosa.pad %arg0, %1, %0 : (tensor<13x21x3x1x1x1xf32>, !tosa.shape<12>, tensor<1xf32>) -> tensor<13x21x3x1x1x1xf32>
    return %2 : tensor<13x21x3x1x1x1xf32>
  }
}

