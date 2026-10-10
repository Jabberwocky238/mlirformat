module {
  func.func @reciprocal_fold_single_valued() -> tensor<f32> {
    %0 = "tosa.const"() <{values = dense<4.000000e+00> : tensor<f32>}> : () -> tensor<f32>
    %1 = tosa.reciprocal %0 : (tensor<f32>) -> tensor<f32>
    return %1 : tensor<f32>
  }
  func.func @reciprocal_fold_splat() -> tensor<12x7xf32> {
    %0 = "tosa.const"() <{values = dense<4.000000e+00> : tensor<12x7xf32>}> : () -> tensor<12x7xf32>
    %1 = tosa.reciprocal %0 : (tensor<12x7xf32>) -> tensor<12x7xf32>
    return %1 : tensor<12x7xf32>
  }
  func.func @reciprocal_div_zero() -> tensor<f32> {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<f32>}> : () -> tensor<f32>
    %1 = tosa.reciprocal %0 : (tensor<f32>) -> tensor<f32>
    return %1 : tensor<f32>
  }
  func.func @reciprocal_div_neg_zero() -> tensor<f32> {
    %0 = "tosa.const"() <{values = dense<-0.000000e+00> : tensor<f32>}> : () -> tensor<f32>
    %1 = tosa.reciprocal %0 : (tensor<f32>) -> tensor<f32>
    return %1 : tensor<f32>
  }
  func.func @reciprocal_div_nan() -> tensor<f32> {
    %0 = "tosa.const"() <{values = dense<0x7FC00000> : tensor<f32>}> : () -> tensor<f32>
    %1 = tosa.reciprocal %0 : (tensor<f32>) -> tensor<f32>
    return %1 : tensor<f32>
  }
  func.func @reciprocal_div_infinity() -> tensor<f32> {
    %0 = "tosa.const"() <{values = dense<0x7F800000> : tensor<f32>}> : () -> tensor<f32>
    %1 = tosa.reciprocal %0 : (tensor<f32>) -> tensor<f32>
    return %1 : tensor<f32>
  }
  func.func @reciprocal_div_neg_infinity() -> tensor<f32> {
    %0 = "tosa.const"() <{values = dense<0xFF800000> : tensor<f32>}> : () -> tensor<f32>
    %1 = tosa.reciprocal %0 : (tensor<f32>) -> tensor<f32>
    return %1 : tensor<f32>
  }
  func.func @reciprocal_div_underflow() -> tensor<2xf16> {
    %0 = "tosa.const"() <{values = dense<[0xFC00, 0x7C00]> : tensor<2xf16>}> : () -> tensor<2xf16>
    %1 = tosa.reciprocal %0 : (tensor<2xf16>) -> tensor<2xf16>
    return %1 : tensor<2xf16>
  }
  func.func @reciprocal_div_overflow() -> tensor<2xf16> {
    %0 = "tosa.const"() <{values = dense<[1.192090e-07, -1.192090e-07]> : tensor<2xf16>}> : () -> tensor<2xf16>
    %1 = tosa.reciprocal %0 : (tensor<2xf16>) -> tensor<2xf16>
    return %1 : tensor<2xf16>
  }
  func.func @reciprocal_no_fold(%arg0: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = tosa.reciprocal %arg0 : (tensor<?x?xf32>) -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
  func.func @reciprocal_fold() -> tensor<4x6xf32> {
    %0 = "tosa.const"() <{values = dense<[[1.758000e-01, 0.0873999968, 5.924000e-01, 1.470000e+00, -1.142400e+00, 2.921300e+00], [-2.078000e-01, 1.432500e+00, 1.528300e+00, -1.210000e-02, -2.306000e-01, -1.337700e+00], [-0.0803999975, 7.610000e-02, 5.277000e-01, 1.129200e+00, 2.446000e-01, 6.946000e-01], [4.929000e-01, -6.524000e-01, 1.809200e+00, 1.397000e-01, 1.550500e+00, -1.027000e+00]]> : tensor<4x6xf32>}> : () -> tensor<4x6xf32>
    %1 = tosa.reciprocal %0 : (tensor<4x6xf32>) -> tensor<4x6xf32>
    return %1 : tensor<4x6xf32>
  }
  func.func @reciprocal_of_const_sparse() -> tensor<32xbf16> {
    %0 = "tosa.const"() <{values = sparse<[[0], [3], [11], [17], [20], [23], [25], [30], [31]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00, 9.000000e+00]> : tensor<32xbf16>}> : () -> tensor<32xbf16>
    %1 = tosa.reciprocal %0 : (tensor<32xbf16>) -> tensor<32xbf16>
    return %1 : tensor<32xbf16>
  }
}

