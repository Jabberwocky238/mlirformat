module {
  func.func @create_complex(%arg0: f32, %arg1: f32) -> complex<f32> {
    %0 = complex.create %arg0, %arg1 : complex<f32>
    return %0 : complex<f32>
  }
}

// -----
module {
  func.func @real_number(%arg0: complex<f32>) -> f32 {
    %0 = complex.re %arg0 : complex<f32>
    return %0 : f32
  }
}

// -----
module {
  func.func @imaginary_number(%arg0: complex<f32>) -> f32 {
    %0 = complex.im %arg0 : complex<f32>
    return %0 : f32
  }
}

// -----
module {
  func.func @complex_const() -> complex<f32> {
    %cst = complex.constant [0x7FC00000 : f32, 0.000000e+00 : f32] : complex<f32>
    return %cst : complex<f32>
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
  func.func @complex_sub(%arg0: complex<f32>, %arg1: complex<f32>) -> complex<f32> {
    %0 = complex.sub %arg0, %arg1 : complex<f32>
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
  func.func @complex_neq(%arg0: complex<f32>, %arg1: complex<f32>) -> i1 {
    %0 = complex.neq %arg0, %arg1 : complex<f32>
    return %0 : i1
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
  func.func @complex_conj(%arg0: complex<f32>) -> complex<f32> {
    %0 = complex.conj %arg0 : complex<f32>
    return %0 : complex<f32>
  }
}

// -----
module {
  func.func @complex_abs(%arg0: complex<f32>) -> f32 {
    %0 = complex.abs %arg0 : complex<f32>
    return %0 : f32
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Kernel], []>, #spirv.resource_limits<>>} {
  func.func @complex_abs_opencl(%arg0: complex<f32>) -> f32 {
    %0 = complex.abs %arg0 : complex<f32>
    return %0 : f32
  }
}

