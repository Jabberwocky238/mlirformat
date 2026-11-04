#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32xf64, #sparse>) -> (), sym_name = "sparse_1d_tensor", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 64, crdWidth = 64 }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32, #sparse>) -> (), sym_name = "sparse_csr", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 64, crdWidth = 64, explicitVal = 1.000000e+00 : f32, implicitVal = 0.000000e+00 : f32 }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32, #sparse>) -> (), sym_name = "sparse_csr", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), explicitVal = 1.000000e+00 : f64, implicitVal = 0.000000e+00 : f64 }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse>) -> (), sym_name = "sparse_csr", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 64, crdWidth = 64, explicitVal = 1 : i32, implicitVal = 0 : i32 }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xi32, #sparse>) -> (), sym_name = "sparse_csr", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 64, crdWidth = 64, explicitVal = 1 : i64, implicitVal = 0 : i64 }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xi64, #sparse>) -> (), sym_name = "sparse_csr", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 64, crdWidth = 64, explicitVal = #complex.number<:f32 1.000000e+00, 0.000000e+00> : complex<f32>, implicitVal = #complex.number<:f32 0.000000e+00, 0.000000e+00> : complex<f32> }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xcomplex<f32>, #sparse>) -> (), sym_name = "sparse_csr", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : batch, d1 : dense, d2 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf32, #sparse>) -> (), sym_name = "sparse_bcsr", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse>) -> (), sym_name = "CSR_explicit", sym_visibility = "private"}> ({
  ^bb0(%arg0: tensor<?x?xf64, #sparse>):
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32, #sparse>) -> (), sym_name = "sparse_csc", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed), crdWidth = 64 }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32, #sparse>) -> (), sym_name = "sparse_dcsc", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique, nonordered), d1 : singleton(nonordered)) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32, #sparse>) -> (), sym_name = "sparse_coo", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed(nonunique), d1 : singleton, d2 : dense) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x1xf32, #sparse>) -> (), sym_name = "sparse_coo_trailing_dense", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : loose_compressed(nonunique), d2 : singleton) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf32, #sparse>) -> (), sym_name = "sparse_bcoo", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<10x10xf64, #sparse>) -> (), sym_name = "sparse_sorted_coo", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32, #sparse>) -> (), sym_name = "sparse_coo", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 3 : compressed, d0 mod 2 : dense, d1 mod 3 : dense) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<10x60xf64, #sparse>) -> (), sym_name = "sparse_bsr", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = [s0](d0, d1) -> (d0 * (s0 * 4) : dense, d0 : dense, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse>) -> (), sym_name = "sparse_ell", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(1, 4, 1)>, d1 : #sparse_tensor<slice(1, 4, 2)>) -> (d0 : dense, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse>) -> (), sym_name = "sparse_slice", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(1, ?, 1)>, d1 : #sparse_tensor<slice(?, 4, 2)>) -> (d0 : dense, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse>) -> (), sym_name = "sparse_slice", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 3 : compressed, d0 mod 2 : dense, d1 mod 3 : dense) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse>) -> (), sym_name = "BSR", sym_visibility = "private"}> ({
  ^bb0(%arg0: tensor<?x?xf64, #sparse>):
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 floordiv 2 : dense, d1 floordiv 3 : dense, d2 floordiv 4 : compressed, d0 mod 2 : dense, d1 mod 3 : dense, d2 mod 4 : dense) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf64, #sparse>) -> (), sym_name = "BCSR", sym_visibility = "private"}> ({
  ^bb0(%arg0: tensor<?x?x?xf64, #sparse>):
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 3 : compressed, d0 mod 2 : dense, d1 mod 3 : dense) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse>) -> (), sym_name = "BSR_explicit", sym_visibility = "private"}> ({
  ^bb0(%arg0: tensor<?x?xf64, #sparse>):
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 floordiv 4 : dense, d1 mod 4 : structured[2, 4]), crdWidth = 8 }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse>) -> (), sym_name = "NV_24", sym_visibility = "private"}> ({
  ^bb0(%arg0: tensor<?x?xf64, #sparse>):
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : dense, d2 floordiv 4 : dense, d2 mod 4 : structured[2, 4]) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf64, #sparse>) -> (), sym_name = "NV_24", sym_visibility = "private"}> ({
  ^bb0(%arg0: tensor<?x?x?xf64, #sparse>):
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d2 floordiv 4 : dense, d1 : dense, d2 mod 4 : structured[2, 4]) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf64, #sparse>) -> (), sym_name = "NV_24", sym_visibility = "private"}> ({
  ^bb0(%arg0: tensor<?x?x?xf64, #sparse>):
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d2 floordiv 8 : dense, d1 : dense, d2 mod 8 : structured[5, 8]) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf64, #sparse>) -> (), sym_name = "NOutOfM", sym_visibility = "private"}> ({
  ^bb0(%arg0: tensor<?x?x?xf64, #sparse>):
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

