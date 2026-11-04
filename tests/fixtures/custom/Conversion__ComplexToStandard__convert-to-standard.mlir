module {
  func.func @complex_abs(%arg0: complex<f32>) -> f32 {
    %0 = complex.abs %arg0 : complex<f32>
    return %0 : f32
  }
}

// -----
module {
  func.func @complex_atan2(%arg0: complex<f32>, %arg1: complex<f32>) -> complex<f32> {
    %0 = complex.atan2 %arg0, %arg1 : complex<f32>
    return %0 : complex<f32>
  }
}

// -----
module {
  func.func @complex_add(%arg0: complex<f32>, %arg1: complex<f32>) -> complex<f32> {
    %0 = complex.add %arg0, %arg1 : complex<f32>
    return %0 : complex<f32>
  }
}

// -----
module {
  func.func @complex_cos(%arg0: complex<f32>) -> complex<f32> {
    %0 = complex.cos %arg0 : complex<f32>
    return %0 : complex<f32>
  }
}

// -----
module {
  func.func @complex_div(%arg0: complex<f32>, %arg1: complex<f32>) -> complex<f32> {
    %0 = complex.div %arg0, %arg1 : complex<f32>
    return %0 : complex<f32>
  }
}

// -----
module {
  func.func @complex_eq(%arg0: complex<f32>, %arg1: complex<f32>) -> i1 {
    %0 = complex.eq %arg0, %arg1 : complex<f32>
    return %0 : i1
  }
}

// -----
module {
  func.func @complex_exp(%arg0: complex<f32>) -> complex<f32> {
    %0 = complex.exp %arg0 : complex<f32>
    return %0 : complex<f32>
  }
}

// -----
module {
  func.func @complex_expm1(%arg0: complex<f32>) -> complex<f32> {
    %0 = complex.expm1 %arg0 fastmath<nnan,contract> : complex<f32>
    return %0 : complex<f32>
  }
}

// -----
module {
  func.func @complex_log(%arg0: complex<f32>) -> complex<f32> {
    %0 = complex.log %arg0 : complex<f32>
    return %0 : complex<f32>
  }
}

// -----
module {
  func.func @complex_log1p(%arg0: complex<f32>) -> complex<f32> {
    %0 = complex.log1p %arg0 : complex<f32>
    return %0 : complex<f32>
  }
}

// -----
module {
  func.func @complex_mul(%arg0: complex<f32>, %arg1: complex<f32>) -> complex<f32> {
    %0 = complex.mul %arg0, %arg1 : complex<f32>
    return %0 : complex<f32>
  }
}

// -----
module {
  func.func @complex_neg(%arg0: complex<f32>) -> complex<f32> {
    %0 = complex.neg %arg0 : complex<f32>
    return %0 : complex<f32>
  }
}

// -----
module {
  func.func @complex_neq(%arg0: complex<f32>, %arg1: complex<f32>) -> i1 {
    %0 = complex.neq %arg0, %arg1 : complex<f32>
    return %0 : i1
  }
}

// -----
module {
  func.func @complex_sin(%arg0: complex<f32>) -> complex<f32> {
    %0 = complex.sin %arg0 : complex<f32>
    return %0 : complex<f32>
  }
}

// -----
module {
  func.func @complex_sign(%arg0: complex<f32>) -> complex<f32> {
    %0 = complex.sign %arg0 : complex<f32>
    return %0 : complex<f32>
  }
}

// -----
module {
  func.func @complex_sub(%arg0: complex<f32>, %arg1: complex<f32>) -> complex<f32> {
    %0 = complex.sub %arg0, %arg1 : complex<f32>
    return %0 : complex<f32>
  }
}

// -----
module {
  func.func @complex_tan(%arg0: complex<f32>) -> complex<f32> {
    %0 = complex.tan %arg0 : complex<f32>
    return %0 : complex<f32>
  }
}

// -----
module {
  func.func @complex_tanh(%arg0: complex<f32>) -> complex<f32> {
    %0 = complex.tanh %arg0 : complex<f32>
    return %0 : complex<f32>
  }
}

// -----
module {
  func.func @complex_sqrt(%arg0: complex<f32>) -> complex<f32> {
    %0 = complex.sqrt %arg0 : complex<f32>
    return %0 : complex<f32>
  }
}

// -----
module {
  func.func @complex_sqrt_nnan_ninf(%arg0: complex<f32>) -> complex<f32> {
    %0 = complex.sqrt %arg0 fastmath<nnan,ninf> : complex<f32>
    return %0 : complex<f32>
  }
}

// -----
module {
  func.func @complex_conj(%arg0: complex<f32>) -> complex<f32> {
    %0 = complex.conj %arg0 : complex<f32>
    return %0 : complex<f32>
  }
}

// -----
module {
  func.func @complex_pow(%arg0: complex<f32>, %arg1: complex<f32>) -> complex<f32> {
    %0 = complex.pow %arg0, %arg1 : complex<f32>
    return %0 : complex<f32>
  }
}

// -----
module {
  func.func @complex_pow_with_fmf(%arg0: complex<f32>, %arg1: complex<f32>) -> complex<f32> {
    %0 = complex.pow %arg0, %arg1 fastmath<nnan,contract> : complex<f32>
    return %0 : complex<f32>
  }
}

// -----
module {
  func.func @complex_powi(%arg0: complex<f32>, %arg1: i32) -> complex<f32> {
    %0 = complex.powi %arg0, %arg1 : complex<f32>, i32
    return %0 : complex<f32>
  }
}

// -----
module {
  func.func @complex_powi_with_fmf(%arg0: complex<f32>, %arg1: i32) -> complex<f32> {
    %0 = complex.powi %arg0, %arg1 fastmath<nnan,contract> : complex<f32>, i32
    return %0 : complex<f32>
  }
}

// -----
module {
  func.func @complex_rsqrt(%arg0: complex<f32>) -> complex<f32> {
    %0 = complex.rsqrt %arg0 : complex<f32>
    return %0 : complex<f32>
  }
}

// -----
module {
  func.func @complex_rsqrt_nnan_ninf(%arg0: complex<f32>) -> complex<f32> {
    %0 = complex.rsqrt %arg0 fastmath<nnan,ninf> : complex<f32>
    return %0 : complex<f32>
  }
}

// -----
module {
  func.func @complex_angle(%arg0: complex<f32>) -> f32 {
    %0 = complex.angle %arg0 : complex<f32>
    return %0 : f32
  }
}

// -----
module {
  func.func @complex_abs_with_fmf(%arg0: complex<f32>) -> f32 {
    %0 = complex.abs %arg0 fastmath<nnan,contract> : complex<f32>
    return %0 : f32
  }
}

// -----
module {
  func.func @complex_add_with_fmf(%arg0: complex<f32>, %arg1: complex<f32>) -> complex<f32> {
    %0 = complex.add %arg0, %arg1 fastmath<nnan,contract> : complex<f32>
    return %0 : complex<f32>
  }
}

// -----
module {
  func.func @complex_sub_with_fmf(%arg0: complex<f32>, %arg1: complex<f32>) -> complex<f32> {
    %0 = complex.sub %arg0, %arg1 fastmath<nnan,contract> : complex<f32>
    return %0 : complex<f32>
  }
}

// -----
module {
  func.func @complex_exp_with_fmf(%arg0: complex<f32>) -> complex<f32> {
    %0 = complex.exp %arg0 fastmath<nnan,contract> : complex<f32>
    return %0 : complex<f32>
  }
}

// -----
module {
  func.func @complex_log_with_fmf(%arg0: complex<f32>) -> complex<f32> {
    %0 = complex.log %arg0 fastmath<nnan,contract> : complex<f32>
    return %0 : complex<f32>
  }
}

// -----
module {
  func.func @complex_log1p_with_fmf(%arg0: complex<f32>) -> complex<f32> {
    %0 = complex.log1p %arg0 fastmath<nnan,contract> : complex<f32>
    return %0 : complex<f32>
  }
}

// -----
module {
  func.func @complex_mul_with_fmf(%arg0: complex<f32>, %arg1: complex<f32>) -> complex<f32> {
    %0 = complex.mul %arg0, %arg1 fastmath<nnan,contract> : complex<f32>
    return %0 : complex<f32>
  }
}

// -----
module {
  func.func @complex_atan2_with_fmf(%arg0: complex<f32>, %arg1: complex<f32>) -> complex<f32> {
    %0 = complex.atan2 %arg0, %arg1 fastmath<nnan,contract> : complex<f32>
    return %0 : complex<f32>
  }
}

// -----
module {
  func.func @complex_div_with_fmf(%arg0: complex<f32>, %arg1: complex<f32>) -> complex<f32> {
    %0 = complex.div %arg0, %arg1 fastmath<nnan,contract> : complex<f32>
    return %0 : complex<f32>
  }
}

// -----
module {
  func.func @complex_sqrt_with_fmf(%arg0: complex<f32>) -> complex<f32> {
    %0 = complex.sqrt %arg0 fastmath<nnan,contract> : complex<f32>
    return %0 : complex<f32>
  }
}

// -----
module {
  func.func @complex_cos_with_fmf(%arg0: complex<f32>) -> complex<f32> {
    %0 = complex.cos %arg0 fastmath<nnan,contract> : complex<f32>
    return %0 : complex<f32>
  }
}

// -----
module {
  func.func @complex_sin_with_fmf(%arg0: complex<f32>) -> complex<f32> {
    %0 = complex.sin %arg0 fastmath<nnan,contract> : complex<f32>
    return %0 : complex<f32>
  }
}

// -----
module {
  func.func @complex_sign_with_fmf(%arg0: complex<f32>) -> complex<f32> {
    %0 = complex.sign %arg0 fastmath<nnan,contract> : complex<f32>
    return %0 : complex<f32>
  }
}

// -----
module {
  func.func @complex_tan_with_fmf(%arg0: complex<f32>) -> complex<f32> {
    %0 = complex.tan %arg0 fastmath<nnan,contract> : complex<f32>
    return %0 : complex<f32>
  }
}

// -----
module {
  func.func @complex_tanh_with_fmf(%arg0: complex<f32>) -> complex<f32> {
    %0 = complex.tanh %arg0 fastmath<nnan,contract> : complex<f32>
    return %0 : complex<f32>
  }
}

// -----
module {
  func.func @complex_tanh_nnan_ninf(%arg0: complex<f32>) -> complex<f32> {
    %0 = complex.tanh %arg0 fastmath<nnan,ninf> : complex<f32>
    return %0 : complex<f32>
  }
}

// -----
module {
  func.func @complex_angle_with_fmf(%arg0: complex<f32>) -> f32 {
    %0 = complex.angle %arg0 fastmath<nnan,contract> : complex<f32>
    return %0 : f32
  }
}

