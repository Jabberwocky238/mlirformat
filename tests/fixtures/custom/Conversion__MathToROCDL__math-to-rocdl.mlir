module @test_module {
  func.func @arith_remf(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
    %0 = arith.remf %arg0, %arg0 : f16
    %1 = arith.remf %arg1, %arg1 : f32
    %2 = arith.remf %arg2, %arg2 : f64
    return %0, %1, %2 : f16, f32, f64
  }
}

// -----
module @test_module {
  func.func @math_acos(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
    %0 = math.acos %arg0 : f16
    %1 = math.acos %arg1 : f32
    %2 = math.acos %arg2 : f64
    return %0, %1, %2 : f16, f32, f64
  }
}

// -----
module @test_module {
  func.func @math_acosh(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
    %0 = math.acosh %arg0 : f16
    %1 = math.acosh %arg1 : f32
    %2 = math.acosh %arg2 : f64
    return %0, %1, %2 : f16, f32, f64
  }
}

// -----
module @test_module {
  func.func @math_asin(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
    %0 = math.asin %arg0 : f16
    %1 = math.asin %arg1 : f32
    %2 = math.asin %arg2 : f64
    return %0, %1, %2 : f16, f32, f64
  }
}

// -----
module @test_module {
  func.func @math_asinh(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
    %0 = math.asinh %arg0 : f16
    %1 = math.asinh %arg1 : f32
    %2 = math.asinh %arg2 : f64
    return %0, %1, %2 : f16, f32, f64
  }
}

// -----
module @test_module {
  func.func @math_atan(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
    %0 = math.atan %arg0 : f16
    %1 = math.atan %arg1 : f32
    %2 = math.atan %arg2 : f64
    return %0, %1, %2 : f16, f32, f64
  }
}

// -----
module @test_module {
  func.func @math_atanh(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
    %0 = math.atanh %arg0 : f16
    %1 = math.atanh %arg1 : f32
    %2 = math.atanh %arg2 : f64
    return %0, %1, %2 : f16, f32, f64
  }
}

// -----
module @test_module {
  func.func @math_atan2(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
    %0 = math.atan2 %arg0, %arg0 : f16
    %1 = math.atan2 %arg1, %arg1 : f32
    %2 = math.atan2 %arg2, %arg2 : f64
    return %0, %1, %2 : f16, f32, f64
  }
}

// -----
module @test_module {
  func.func @math_cbrt(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
    %0 = math.cbrt %arg0 : f16
    %1 = math.cbrt %arg1 : f32
    %2 = math.cbrt %arg2 : f64
    return %0, %1, %2 : f16, f32, f64
  }
}

// -----
module @test_module {
  func.func @math_ceil(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
    %0 = math.ceil %arg0 : f16
    %1 = math.ceil %arg1 : f32
    %2 = math.ceil %arg2 : f64
    return %0, %1, %2 : f16, f32, f64
  }
}

// -----
module @test_module {
  func.func @math_cos(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
    %0 = math.cos %arg0 : f16
    %1 = math.cos %arg1 : f32
    %2 = math.cos %arg2 : f64
    return %0, %1, %2 : f16, f32, f64
  }
}

// -----
module @test_module {
  func.func @math_cosh(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
    %0 = math.cosh %arg0 : f16
    %1 = math.cosh %arg1 : f32
    %2 = math.cosh %arg2 : f64
    return %0, %1, %2 : f16, f32, f64
  }
}

// -----
module @test_module {
  func.func @math_sinh(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
    %0 = math.sinh %arg0 : f16
    %1 = math.sinh %arg1 : f32
    %2 = math.sinh %arg2 : f64
    return %0, %1, %2 : f16, f32, f64
  }
}

// -----
module @test_module {
  func.func @math_exp(%arg0: f16, %arg1: f64) -> (f16, f64) {
    %0 = math.exp %arg0 : f16
    %1 = math.exp %arg1 : f64
    return %0, %1 : f16, f64
  }
}

// -----
module @test_module {
  func.func @math_exp2(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
    %0 = math.exp2 %arg0 : f16
    %1 = math.exp2 %arg1 : f32
    %2 = math.exp2 %arg2 : f64
    return %0, %1, %2 : f16, f32, f64
  }
}

// -----
module @test_module {
  func.func @math_expm1(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
    %0 = math.expm1 %arg0 : f16
    %1 = math.expm1 %arg1 : f32
    %2 = math.expm1 %arg2 : f64
    return %0, %1, %2 : f16, f32, f64
  }
}

// -----
module @test_module {
  func.func @math_floor(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
    %0 = math.floor %arg0 : f16
    %1 = math.floor %arg1 : f32
    %2 = math.floor %arg2 : f64
    return %0, %1, %2 : f16, f32, f64
  }
}

// -----
module @test_module {
  func.func @math_log(%arg0: f16, %arg1: f64) -> (f16, f64) {
    %0 = math.log %arg0 : f16
    %1 = math.log %arg1 : f64
    return %0, %1 : f16, f64
  }
}

// -----
module @test_module {
  func.func @math_log10(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
    %0 = math.log10 %arg0 : f16
    %1 = math.log10 %arg1 : f32
    %2 = math.log10 %arg2 : f64
    return %0, %1, %2 : f16, f32, f64
  }
}

// -----
module @test_module {
  func.func @math_log1p(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
    %0 = math.log1p %arg0 : f16
    %1 = math.log1p %arg1 : f32
    %2 = math.log1p %arg2 : f64
    return %0, %1, %2 : f16, f32, f64
  }
}

// -----
module @test_module {
  func.func @math_powf(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
    %0 = math.powf %arg0, %arg0 : f16
    %1 = math.powf %arg1, %arg1 : f32
    %2 = math.powf %arg2, %arg2 : f64
    return %0, %1, %2 : f16, f32, f64
  }
}

// -----
module @test_module {
  func.func @math_rsqrt(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
    %0 = math.rsqrt %arg0 : f16
    %1 = math.rsqrt %arg1 : f32
    %2 = math.rsqrt %arg2 : f64
    return %0, %1, %2 : f16, f32, f64
  }
}

// -----
module @test_module {
  func.func @math_sin(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
    %0 = math.sin %arg0 : f16
    %1 = math.sin %arg1 : f32
    %2 = math.sin %arg2 : f64
    return %0, %1, %2 : f16, f32, f64
  }
}

// -----
module @test_module {
  func.func @math_tanh(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
    %0 = math.tanh %arg0 : f16
    %1 = math.tanh %arg1 : f32
    %2 = math.tanh %arg2 : f64
    return %0, %1, %2 : f16, f32, f64
  }
}

// -----
module @test_module {
  func.func @math_tan(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
    %0 = math.tan %arg0 : f16
    %1 = math.tan %arg1 : f32
    %2 = math.tan %arg2 : f64
    return %0, %1, %2 : f16, f32, f64
  }
}

// -----
module @test_module {
  func.func @math_erf(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
    %0 = math.erf %arg0 : f16
    %1 = math.erf %arg1 : f32
    %2 = math.erf %arg2 : f64
    return %0, %1, %2 : f16, f32, f64
  }
}

// -----
module @test_module {
  func.func @math_erfc(%arg0: f16, %arg1: f32, %arg2: f64) -> (f16, f32, f64) {
    %0 = math.erfc %arg0 : f16
    %1 = math.erfc %arg1 : f32
    %2 = math.erfc %arg2 : f64
    return %0, %1, %2 : f16, f32, f64
  }
}

// -----
module @test_module {
  func.func @math_casting(%arg0: f16, %arg1: f32, %arg2: f64, %arg3: bf16) -> (f16, f32, f64, bf16) {
    %0 = math.sin %arg0 : f16
    %1 = math.sin %arg1 : f32
    %2 = math.sin %arg2 : f64
    %3 = math.sin %arg3 : bf16
    return %0, %1, %2, %3 : f16, f32, f64, bf16
  }
}

// -----
module @test_module {
  func.func @math_fpowi(%arg0: f16, %arg1: f32, %arg2: f64, %arg3: i32) -> (f16, f32, f64) {
    %0 = math.fpowi %arg0, %arg3 : f16, i32
    %1 = math.fpowi %arg1, %arg3 : f32, i32
    %2 = math.fpowi %arg2, %arg3 : f64, i32
    return %0, %1, %2 : f16, f32, f64
  }
}

// -----
module {
  "test.some_op_with_region"() ({
  ^bb0(%arg0: f64):
    %0 = math.atan %arg0 : f64
    "test.possible_terminator"() : () -> ()
  }) : () -> ()
}

// -----
module @test_module {
  func.func @math_sin_vector_0d(%arg0: vector<f16>) -> vector<f16> {
    %0 = math.sin %arg0 : vector<f16>
    return %0 : vector<f16>
  }
}

// -----
module @test_module {
  func.func @math_sin_vector_1d(%arg0: vector<4xf16>) -> vector<4xf16> {
    %0 = math.sin %arg0 : vector<4xf16>
    return %0 : vector<4xf16>
  }
}

// -----
module @test_module {
  func.func @math_sin_vector_2d(%arg0: vector<2x2xf16>) -> vector<2x2xf16> {
    %0 = math.sin %arg0 : vector<2x2xf16>
    return %0 : vector<2x2xf16>
  }
}

// -----
module {
  func.func @clampf_f16(%arg0: f16, %arg1: f16, %arg2: f16) -> f16 {
    %0 = math.clampf %arg0 to [%arg1, %arg2] : f16
    return %0 : f16
  }
  func.func @clampf_f32(%arg0: f32, %arg1: f32, %arg2: f32) -> f32 {
    %0 = math.clampf %arg0 to [%arg1, %arg2] : f32
    return %0 : f32
  }
}

// -----
module {
  func.func @clampf_vector_f16(%arg0: vector<2xf16>, %arg1: vector<2xf16>, %arg2: vector<2xf16>) -> vector<2xf16> {
    %0 = math.clampf %arg0 to [%arg1, %arg2] : vector<2xf16>
    return %0 : vector<2xf16>
  }
}

// -----
module {
  func.func @clampf_vector_f32(%arg0: vector<2xf32>, %arg1: vector<2xf32>, %arg2: vector<2xf32>) -> vector<2xf32> {
    %0 = math.clampf %arg0 to [%arg1, %arg2] : vector<2xf32>
    return %0 : vector<2xf32>
  }
}

// -----
module {
  func.func @clampf_vector_2d_f16(%arg0: vector<2x2xf16>, %arg1: vector<2x2xf16>, %arg2: vector<2x2xf16>) -> vector<2x2xf16> {
    %0 = math.clampf %arg0 to [%arg1, %arg2] : vector<2x2xf16>
    return %0 : vector<2x2xf16>
  }
}

// -----
module {
  func.func @clampf_bf16(%arg0: bf16, %arg1: bf16, %arg2: bf16) -> bf16 {
    %0 = math.clampf %arg0 to [%arg1, %arg2] : bf16
    return %0 : bf16
  }
}

