module {
}

// -----
module {
  func.func @test_build_qtype_unsigned(%arg0: tensor<16x1x1x8x!quant.uniform<u8<1:255>:f32, 0.015680249780416489:128>>, %arg1: tensor<1xui8>, %arg2: tensor<1xui8>) -> tensor<16x1x1x8x!quant.uniform<u8<1:255>:f32, 0.015680249780416489:128>> {
    %0 = tosa.negate %arg0, %arg1, %arg2 : (tensor<16x1x1x8x!quant.uniform<u8<1:255>:f32, 0.015680249780416489:128>>, tensor<1xui8>, tensor<1xui8>) -> tensor<16x1x1x8x!quant.uniform<u8<1:255>:f32, 0.015680249780416489:128>>
    return %0 : tensor<16x1x1x8x!quant.uniform<u8<1:255>:f32, 0.015680249780416489:128>>
  }
}

// -----
module {
  func.func @test_build_qtype_signed(%arg0: tensor<16x1x1x8x!quant.uniform<i8<1:127>:f32, 0.015680249780416489:128>>, %arg1: tensor<1xi8>, %arg2: tensor<1xi8>) -> tensor<16x1x1x8x!quant.uniform<i8<1:127>:f32, 0.015680249780416489:128>> {
    %0 = tosa.negate %arg0, %arg1, %arg2 : (tensor<16x1x1x8x!quant.uniform<i8<1:127>:f32, 0.015680249780416489:128>>, tensor<1xi8>, tensor<1xi8>) -> tensor<16x1x1x8x!quant.uniform<i8<1:127>:f32, 0.015680249780416489:128>>
    return %0 : tensor<16x1x1x8x!quant.uniform<i8<1:127>:f32, 0.015680249780416489:128>>
  }
}

// -----
module {
  func.func @test_build_mult_and_shift(%arg0: tensor<1x32x32x8x!quant.uniform<i8:f32, 0.015684768557548523>>, %arg1: tensor<16x1x1x8x!quant.uniform<i8<-127:127>:f32, 0.015680249780416489>>, %arg2: tensor<16xi32>) -> tensor<1x34x36x16x!quant.uniform<i32:f32, 0.078431375324726104>> {
    %0 = "tosa.const"() <{values = dense<-1> : tensor<1xi8>}> : () -> tensor<1xi8>
    %1 = "tosa.const"() <{values = dense<1> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = tosa.conv2d %arg0, %arg1, %arg2, %0, %1 {acc_type = i32, dilation = array<i64: 2, 1>, pad = array<i64: 1, 1, 2, 2>, stride = array<i64: 1, 1>} : (tensor<1x32x32x8x!quant.uniform<i8:f32, 0.015684768557548523>>, tensor<16x1x1x8x!quant.uniform<i8<-127:127>:f32, 0.015680249780416489>>, tensor<16xi32>, tensor<1xi8>, tensor<1xi8>) -> tensor<1x34x36x16x!quant.uniform<i32:f32, 0.078431375324726104>>
    return %2 : tensor<1x34x36x16x!quant.uniform<i32:f32, 0.078431375324726104>>
  }
}

