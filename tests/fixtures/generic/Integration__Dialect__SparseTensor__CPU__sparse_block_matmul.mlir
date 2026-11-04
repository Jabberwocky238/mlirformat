#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map3 = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 floordiv 4 : dense, d1 mod 4 : structured[2, 4]) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x8xf64>, tensor<4x8xf64, #sparse>) -> tensor<4x4xf64>, sym_name = "mul"}> ({
  ^bb0(%arg16: tensor<4x8xf64>, %arg17: tensor<4x8xf64, #sparse>):
    %24 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<4x4xf64>}> : () -> tensor<4x4xf64>
    %25 = "linalg.generic"(%arg16, %arg17, %24) <{doc = "X(i,j) *= A(i,j) * B(j,i)", indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg18: f64, %arg19: f64, %arg20: f64):
      %26 = "arith.mulf"(%arg18, %arg19) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %27 = "arith.addf"(%26, %arg20) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%27) : (f64) -> ()
    }) : (tensor<4x8xf64>, tensor<4x8xf64, #sparse>, tensor<4x4xf64>) -> tensor<4x4xf64>
    "func.return"(%25) : (tensor<4x4xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<4x8xf64>, tensor<4x8xf64, #sparse1>) -> tensor<4x4xf64>, sym_name = "mul_24"}> ({
  ^bb0(%arg11: tensor<4x8xf64>, %arg12: tensor<4x8xf64, #sparse1>):
    %20 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<4x4xf64>}> : () -> tensor<4x4xf64>
    %21 = "linalg.generic"(%arg11, %arg12, %20) <{doc = "X(i,j) *= A(i,j) * B(j,i)", indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg13: f64, %arg14: f64, %arg15: f64):
      %22 = "arith.mulf"(%arg13, %arg14) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %23 = "arith.addf"(%22, %arg15) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%23) : (f64) -> ()
    }) : (tensor<4x8xf64>, tensor<4x8xf64, #sparse1>, tensor<4x4xf64>) -> tensor<4x4xf64>
    "func.return"(%21) : (tensor<4x4xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<4x8xf64, #sparse2>, tensor<4x8xf64, #sparse>) -> tensor<4x4xf64>, sym_name = "mul_csr_bsr"}> ({
  ^bb0(%arg6: tensor<4x8xf64, #sparse2>, %arg7: tensor<4x8xf64, #sparse>):
    %16 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<4x4xf64>}> : () -> tensor<4x4xf64>
    %17 = "linalg.generic"(%arg6, %arg7, %16) <{doc = "X(i,j) *= A(i,j) * B(j,i)", indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg8: f64, %arg9: f64, %arg10: f64):
      %18 = "arith.mulf"(%arg8, %arg9) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %19 = "arith.addf"(%18, %arg10) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%19) : (f64) -> ()
    }) : (tensor<4x8xf64, #sparse2>, tensor<4x8xf64, #sparse>, tensor<4x4xf64>) -> tensor<4x4xf64>
    "func.return"(%17) : (tensor<4x4xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<4x8xf64>, tensor<4x8xf64>) -> tensor<4x4xf64>, sym_name = "mul_dense"}> ({
  ^bb0(%arg1: tensor<4x8xf64>, %arg2: tensor<4x8xf64>):
    %12 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<4x4xf64>}> : () -> tensor<4x4xf64>
    %13 = "linalg.generic"(%arg1, %arg2, %12) <{doc = "X(i,j) *= A(i,j) * B(j,i)", indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f64, %arg4: f64, %arg5: f64):
      %14 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %15 = "arith.addf"(%14, %arg5) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%15) : (f64) -> ()
    }) : (tensor<4x8xf64>, tensor<4x8xf64>, tensor<4x4xf64>) -> tensor<4x4xf64>
    "func.return"(%13) : (tensor<4x4xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<4x4xf64>) -> (), sym_name = "dump_dense_f64"}> ({
  ^bb0(%arg0: tensor<4x4xf64>):
    %9 = "arith.constant"() <{value = 0 : index}> : () -> index
    %10 = "arith.constant"() <{value = -1.000000e+00 : f64}> : () -> f64
    %11 = "vector.transfer_read"(%arg0, %9, %9, %10) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map3}> : (tensor<4x4xf64>, index, index, f64) -> vector<4x4xf64>
    "vector.print"(%11) <{punctuation = #vector.punctuation<newline>}> : (vector<4x4xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = dense<[[1.000000e+00, 2.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 4.000000e+00, 5.000000e+00], [6.000000e+00, 7.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 1.000000e+01, 1.100000e+01], [0.000000e+00, 0.000000e+00, 1.200000e+01, 1.300000e+01, 1.600000e+01, 1.700000e+01, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 1.800000e+01, 1.900000e+01, 2.200000e+01, 2.300000e+01, 0.000000e+00, 0.000000e+00]]> : tensor<4x8xf64>}> : () -> tensor<4x8xf64>
    %2 = "sparse_tensor.convert"(%1) : (tensor<4x8xf64>) -> tensor<4x8xf64, #sparse>
    %3 = "sparse_tensor.convert"(%1) : (tensor<4x8xf64>) -> tensor<4x8xf64, #sparse1>
    %4 = "sparse_tensor.convert"(%1) : (tensor<4x8xf64>) -> tensor<4x8xf64, #sparse2>
    %5 = "func.call"(%1, %1) <{callee = @mul_dense}> : (tensor<4x8xf64>, tensor<4x8xf64>) -> tensor<4x4xf64>
    %6 = "func.call"(%1, %2) <{callee = @mul}> : (tensor<4x8xf64>, tensor<4x8xf64, #sparse>) -> tensor<4x4xf64>
    %7 = "func.call"(%1, %3) <{callee = @mul_24}> : (tensor<4x8xf64>, tensor<4x8xf64, #sparse1>) -> tensor<4x4xf64>
    %8 = "func.call"(%4, %2) <{callee = @mul_csr_bsr}> : (tensor<4x8xf64, #sparse2>, tensor<4x8xf64, #sparse>) -> tensor<4x4xf64>
    "func.call"(%5) <{callee = @dump_dense_f64}> : (tensor<4x4xf64>) -> ()
    "func.call"(%6) <{callee = @dump_dense_f64}> : (tensor<4x4xf64>) -> ()
    "func.call"(%7) <{callee = @dump_dense_f64}> : (tensor<4x4xf64>) -> ()
    "func.call"(%8) <{callee = @dump_dense_f64}> : (tensor<4x4xf64>) -> ()
    "bufferization.dealloc_tensor"(%2) : (tensor<4x8xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%3) : (tensor<4x8xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<4x8xf64, #sparse2>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<4x4xf64>) -> ()
    "bufferization.dealloc_tensor"(%6) : (tensor<4x4xf64>) -> ()
    "bufferization.dealloc_tensor"(%7) : (tensor<4x4xf64>) -> ()
    "bufferization.dealloc_tensor"(%8) : (tensor<4x4xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

