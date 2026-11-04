#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func private @sparse_1d_tensor(tensor<32xf64, #sparse>)
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 64, crdWidth = 64 }>
module {
  func.func private @sparse_csr(tensor<?x?xf32, #sparse>)
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 64, crdWidth = 64, explicitVal = 1.000000e+00 : f32, implicitVal = 0.000000e+00 : f32 }>
module {
  func.func private @sparse_csr(tensor<?x?xf32, #sparse>)
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), explicitVal = 1.000000e+00 : f64, implicitVal = 0.000000e+00 : f64 }>
module {
  func.func private @sparse_csr(tensor<?x?xf64, #sparse>)
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 64, crdWidth = 64, explicitVal = 1 : i32, implicitVal = 0 : i32 }>
module {
  func.func private @sparse_csr(tensor<?x?xi32, #sparse>)
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 64, crdWidth = 64, explicitVal = 1 : i64, implicitVal = 0 : i64 }>
module {
  func.func private @sparse_csr(tensor<?x?xi64, #sparse>)
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 64, crdWidth = 64, explicitVal = #complex.number<:f32 1.000000e+00, 0.000000e+00> : complex<f32>, implicitVal = #complex.number<:f32 0.000000e+00, 0.000000e+00> : complex<f32> }>
module {
  func.func private @sparse_csr(tensor<?x?xcomplex<f32>, #sparse>)
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : batch, d1 : dense, d2 : compressed) }>
module {
  func.func private @sparse_bcsr(tensor<?x?x?xf32, #sparse>)
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
module {
  func.func private @CSR_explicit(%arg0: tensor<?x?xf64, #sparse>) {
    return
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>
module {
  func.func private @sparse_csc(tensor<?x?xf32, #sparse>)
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed), crdWidth = 64 }>
module {
  func.func private @sparse_dcsc(tensor<?x?xf32, #sparse>)
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique, nonordered), d1 : singleton(nonordered)) }>
module {
  func.func private @sparse_coo(tensor<?x?xf32, #sparse>)
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed(nonunique), d1 : singleton, d2 : dense) }>
module {
  func.func private @sparse_coo_trailing_dense(tensor<?x?x1xf32, #sparse>)
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : loose_compressed(nonunique), d2 : singleton) }>
module {
  func.func private @sparse_bcoo(tensor<?x?x?xf32, #sparse>)
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>
module {
  func.func private @sparse_sorted_coo(tensor<10x10xf64, #sparse>)
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>
module {
  func.func private @sparse_coo(tensor<?x?xf32, #sparse>)
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 3 : compressed, d0 mod 2 : dense, d1 mod 3 : dense) }>
module {
  func.func private @sparse_bsr(tensor<10x60xf64, #sparse>)
}

// -----
#sparse = #sparse_tensor.encoding<{ map = [s0](d0, d1) -> (d0 * (s0 * 4) : dense, d0 : dense, d1 : compressed) }>
module {
  func.func private @sparse_ell(tensor<?x?xf64, #sparse>)
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(1, 4, 1)>, d1 : #sparse_tensor<slice(1, 4, 2)>) -> (d0 : dense, d1 : compressed) }>
module {
  func.func private @sparse_slice(tensor<?x?xf64, #sparse>)
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(1, ?, 1)>, d1 : #sparse_tensor<slice(?, 4, 2)>) -> (d0 : dense, d1 : compressed) }>
module {
  func.func private @sparse_slice(tensor<?x?xf64, #sparse>)
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 3 : compressed, d0 mod 2 : dense, d1 mod 3 : dense) }>
module {
  func.func private @BSR(%arg0: tensor<?x?xf64, #sparse>) {
    return
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 floordiv 2 : dense, d1 floordiv 3 : dense, d2 floordiv 4 : compressed, d0 mod 2 : dense, d1 mod 3 : dense, d2 mod 4 : dense) }>
module {
  func.func private @BCSR(%arg0: tensor<?x?x?xf64, #sparse>) {
    return
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 3 : compressed, d0 mod 2 : dense, d1 mod 3 : dense) }>
module {
  func.func private @BSR_explicit(%arg0: tensor<?x?xf64, #sparse>) {
    return
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 floordiv 4 : dense, d1 mod 4 : structured[2, 4]), crdWidth = 8 }>
module {
  func.func private @NV_24(%arg0: tensor<?x?xf64, #sparse>) {
    return
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : dense, d2 floordiv 4 : dense, d2 mod 4 : structured[2, 4]) }>
module {
  func.func private @NV_24(%arg0: tensor<?x?x?xf64, #sparse>) {
    return
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d2 floordiv 4 : dense, d1 : dense, d2 mod 4 : structured[2, 4]) }>
module {
  func.func private @NV_24(%arg0: tensor<?x?x?xf64, #sparse>) {
    return
  }
}

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d2 floordiv 8 : dense, d1 : dense, d2 mod 8 : structured[5, 8]) }>
module {
  func.func private @NOutOfM(%arg0: tensor<?x?x?xf64, #sparse>) {
    return
  }
}

