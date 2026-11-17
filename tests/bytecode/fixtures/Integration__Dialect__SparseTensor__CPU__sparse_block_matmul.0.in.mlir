"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x8xf64>, tensor<4x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>>) -> tensor<4x4xf64>, sym_name = "mul"}> ({
  ^bb0(%arg16: tensor<4x8xf64> loc("<stdin>":10:8), %arg17: tensor<4x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>> loc("<stdin>":10:33)):
    %24 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<4x4xf64>}> : () -> tensor<4x4xf64> loc("<stdin>":11:11)
    %25 = "linalg.generic"(%arg16, %arg17, %24) <{doc = "X(i,j) *= A(i,j) * B(j,i)", indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg18: f64 loc("<stdin>":13:10), %arg19: f64 loc("<stdin>":13:23), %arg20: f64 loc("<stdin>":13:36)):
      %26 = "arith.mulf"(%arg18, %arg19) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":14:13)
      %27 = "arith.addf"(%26, %arg20) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":15:13)
      "linalg.yield"(%27) : (f64) -> () loc("<stdin>":16:7)
    }) : (tensor<4x8xf64>, tensor<4x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>>, tensor<4x4xf64>) -> tensor<4x4xf64> loc("<stdin>":12:11)
    "func.return"(%25) : (tensor<4x4xf64>) -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":9:3)
  "func.func"() <{function_type = (tensor<4x8xf64>, tensor<4x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 floordiv 4 : dense, d1 mod 4 : structured[2, 4]) }>>) -> tensor<4x4xf64>, sym_name = "mul_24"}> ({
  ^bb0(%arg11: tensor<4x8xf64> loc("<stdin>":21:8), %arg12: tensor<4x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 floordiv 4 : dense, d1 mod 4 : structured[2, 4]) }>> loc("<stdin>":21:33)):
    %20 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<4x4xf64>}> : () -> tensor<4x4xf64> loc("<stdin>":22:11)
    %21 = "linalg.generic"(%arg11, %arg12, %20) <{doc = "X(i,j) *= A(i,j) * B(j,i)", indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg13: f64 loc("<stdin>":24:10), %arg14: f64 loc("<stdin>":24:23), %arg15: f64 loc("<stdin>":24:36)):
      %22 = "arith.mulf"(%arg13, %arg14) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":25:13)
      %23 = "arith.addf"(%22, %arg15) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":26:13)
      "linalg.yield"(%23) : (f64) -> () loc("<stdin>":27:7)
    }) : (tensor<4x8xf64>, tensor<4x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 floordiv 4 : dense, d1 mod 4 : structured[2, 4]) }>>, tensor<4x4xf64>) -> tensor<4x4xf64> loc("<stdin>":23:11)
    "func.return"(%21) : (tensor<4x4xf64>) -> () loc("<stdin>":29:5)
  }) : () -> () loc("<stdin>":20:3)
  "func.func"() <{function_type = (tensor<4x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<4x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>>) -> tensor<4x4xf64>, sym_name = "mul_csr_bsr"}> ({
  ^bb0(%arg6: tensor<4x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":32:8), %arg7: tensor<4x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>> loc("<stdin>":32:42)):
    %16 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<4x4xf64>}> : () -> tensor<4x4xf64> loc("<stdin>":33:11)
    %17 = "linalg.generic"(%arg6, %arg7, %16) <{doc = "X(i,j) *= A(i,j) * B(j,i)", indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg8: f64 loc("<stdin>":35:10), %arg9: f64 loc("<stdin>":35:22), %arg10: f64 loc("<stdin>":35:34)):
      %18 = "arith.mulf"(%arg8, %arg9) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":36:13)
      %19 = "arith.addf"(%18, %arg10) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":37:13)
      "linalg.yield"(%19) : (f64) -> () loc("<stdin>":38:7)
    }) : (tensor<4x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<4x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>>, tensor<4x4xf64>) -> tensor<4x4xf64> loc("<stdin>":34:11)
    "func.return"(%17) : (tensor<4x4xf64>) -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":31:3)
  "func.func"() <{function_type = (tensor<4x8xf64>, tensor<4x8xf64>) -> tensor<4x4xf64>, sym_name = "mul_dense"}> ({
  ^bb0(%arg1: tensor<4x8xf64> loc("<stdin>":43:8), %arg2: tensor<4x8xf64> loc("<stdin>":43:32)):
    %12 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<4x4xf64>}> : () -> tensor<4x4xf64> loc("<stdin>":44:11)
    %13 = "linalg.generic"(%arg1, %arg2, %12) <{doc = "X(i,j) *= A(i,j) * B(j,i)", indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f64 loc("<stdin>":46:10), %arg4: f64 loc("<stdin>":46:22), %arg5: f64 loc("<stdin>":46:34)):
      %14 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":47:13)
      %15 = "arith.addf"(%14, %arg5) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":48:13)
      "linalg.yield"(%15) : (f64) -> () loc("<stdin>":49:7)
    }) : (tensor<4x8xf64>, tensor<4x8xf64>, tensor<4x4xf64>) -> tensor<4x4xf64> loc("<stdin>":45:11)
    "func.return"(%13) : (tensor<4x4xf64>) -> () loc("<stdin>":51:5)
  }) : () -> () loc("<stdin>":42:3)
  "func.func"() <{function_type = (tensor<4x4xf64>) -> (), sym_name = "dump_dense_f64"}> ({
  ^bb0(%arg0: tensor<4x4xf64> loc("<stdin>":54:8)):
    %9 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":55:10)
    %10 = "arith.constant"() <{value = -1.000000e+00 : f64}> : () -> f64 loc("<stdin>":56:11)
    %11 = "vector.transfer_read"(%arg0, %9, %9, %10) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d0, d1)>}> : (tensor<4x4xf64>, index, index, f64) -> vector<4x4xf64> loc("<stdin>":57:11)
    "vector.print"(%11) <{punctuation = #vector.punctuation<newline>}> : (vector<4x4xf64>) -> () loc("<stdin>":58:5)
    "func.return"() : () -> () loc("<stdin>":59:5)
  }) : () -> () loc("<stdin>":53:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":62:10)
    %1 = "arith.constant"() <{value = dense<[[1.000000e+00, 2.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 4.000000e+00, 5.000000e+00], [6.000000e+00, 7.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 1.000000e+01, 1.100000e+01], [0.000000e+00, 0.000000e+00, 1.200000e+01, 1.300000e+01, 1.600000e+01, 1.700000e+01, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 1.800000e+01, 1.900000e+01, 2.200000e+01, 2.300000e+01, 0.000000e+00, 0.000000e+00]]> : tensor<4x8xf64>}> : () -> tensor<4x8xf64> loc("<stdin>":63:10)
    %2 = "sparse_tensor.convert"(%1) : (tensor<4x8xf64>) -> tensor<4x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>> loc("<stdin>":64:10)
    %3 = "sparse_tensor.convert"(%1) : (tensor<4x8xf64>) -> tensor<4x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 floordiv 4 : dense, d1 mod 4 : structured[2, 4]) }>> loc("<stdin>":65:10)
    %4 = "sparse_tensor.convert"(%1) : (tensor<4x8xf64>) -> tensor<4x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":66:10)
    %5 = "func.call"(%1, %1) <{callee = @mul_dense}> : (tensor<4x8xf64>, tensor<4x8xf64>) -> tensor<4x4xf64> loc("<stdin>":67:10)
    %6 = "func.call"(%1, %2) <{callee = @mul}> : (tensor<4x8xf64>, tensor<4x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>>) -> tensor<4x4xf64> loc("<stdin>":68:10)
    %7 = "func.call"(%1, %3) <{callee = @mul_24}> : (tensor<4x8xf64>, tensor<4x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 floordiv 4 : dense, d1 mod 4 : structured[2, 4]) }>>) -> tensor<4x4xf64> loc("<stdin>":69:10)
    %8 = "func.call"(%4, %2) <{callee = @mul_csr_bsr}> : (tensor<4x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, tensor<4x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>>) -> tensor<4x4xf64> loc("<stdin>":70:10)
    "func.call"(%5) <{callee = @dump_dense_f64}> : (tensor<4x4xf64>) -> () loc("<stdin>":71:5)
    "func.call"(%6) <{callee = @dump_dense_f64}> : (tensor<4x4xf64>) -> () loc("<stdin>":72:5)
    "func.call"(%7) <{callee = @dump_dense_f64}> : (tensor<4x4xf64>) -> () loc("<stdin>":73:5)
    "func.call"(%8) <{callee = @dump_dense_f64}> : (tensor<4x4xf64>) -> () loc("<stdin>":74:5)
    "bufferization.dealloc_tensor"(%2) : (tensor<4x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>>) -> () loc("<stdin>":75:5)
    "bufferization.dealloc_tensor"(%3) : (tensor<4x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 floordiv 4 : dense, d1 mod 4 : structured[2, 4]) }>>) -> () loc("<stdin>":76:5)
    "bufferization.dealloc_tensor"(%4) : (tensor<4x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":77:5)
    "bufferization.dealloc_tensor"(%5) : (tensor<4x4xf64>) -> () loc("<stdin>":78:5)
    "bufferization.dealloc_tensor"(%6) : (tensor<4x4xf64>) -> () loc("<stdin>":79:5)
    "bufferization.dealloc_tensor"(%7) : (tensor<4x4xf64>) -> () loc("<stdin>":80:5)
    "bufferization.dealloc_tensor"(%8) : (tensor<4x4xf64>) -> () loc("<stdin>":81:5)
    "func.return"() : () -> () loc("<stdin>":82:5)
  }) : () -> () loc("<stdin>":61:3)
}) : () -> () loc("<stdin>":8:1)
