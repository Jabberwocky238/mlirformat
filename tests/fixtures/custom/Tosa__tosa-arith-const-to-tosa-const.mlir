module {
  func.func @rewrite_f32_tensor() -> tensor<2xf32> {
    %cst = arith.constant dense<[1.000000e+00, 2.000000e+00]> : tensor<2xf32>
    return %cst : tensor<2xf32>
  }
}

// -----
module {
  func.func @rewrite_i32_tensor() -> tensor<3xi32> {
    %cst = arith.constant dense<[1, 0, -1]> : tensor<3xi32>
    return %cst : tensor<3xi32>
  }
}

// -----
module {
  func.func @rewrite_i1_tensor() -> tensor<2xi1> {
    %cst = arith.constant dense<[true, false]> : tensor<2xi1>
    return %cst : tensor<2xi1>
  }
}

// -----
module {
  func.func @rewrite_rank0_tensor() -> tensor<f32> {
    %cst = arith.constant dense<1.234500e+00> : tensor<f32>
    return %cst : tensor<f32>
  }
}

// -----
module {
  func.func @preserve_scalar_i32() -> i32 {
    %c42_i32 = arith.constant 42 : i32
    return %c42_i32 : i32
  }
}

// -----
module {
  func.func @preserve_index_tensor() -> tensor<2xindex> {
    %cst = arith.constant dense<[0, 1]> : tensor<2xindex>
    return %cst : tensor<2xindex>
  }
}

// -----
module {
  func.func @rewrite_resource_tensor() -> tensor<4xf32> {
    %cst = arith.constant dense_resource<blob1> : tensor<4xf32>
    return %cst : tensor<4xf32>
  }
}

// -----
module {
  func.func @rewrite_quant_tensor() -> tensor<2xui8> {
    %cst = arith.constant dense<[10, 20]> : tensor<2xui8>
    return %cst : tensor<2xui8>
  }
}

// -----
module {
  func.func @rewrite_quant_uniform_tensor() -> tensor<2x!quant.uniform<i8:f32, 5.000000e-01>> {
    %cst = arith.constant dense<["10", "20"]> : tensor<2x!quant.uniform<i8:f32, 5.000000e-01>>
    return %cst : tensor<2x!quant.uniform<i8:f32, 5.000000e-01>>
  }
}

// -----
module {
  func.func @rewrite_fp8_tensor() -> tensor<2xf8E4M3FN> {
    %cst = arith.constant dense<[1.000000e+00, -5.000000e-01]> : tensor<2xf8E4M3FN>
    return %cst : tensor<2xf8E4M3FN>
  }
}

// -----
module {
  func.func @rewrite_mxint8_tensor() -> tensor<2x!tosa.mxint8> {
    %cst = arith.constant dense<["0x00", "0x7F"]> : tensor<2x!tosa.mxint8>
    return %cst : tensor<2x!tosa.mxint8>
  }
}

