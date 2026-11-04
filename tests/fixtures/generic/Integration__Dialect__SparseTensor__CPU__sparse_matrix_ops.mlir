#map = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse>) -> tensor<?x?xf64, #sparse>, sym_name = "matrix_scale"}> ({
  ^bb0(%arg12: tensor<?x?xf64, #sparse>):
    %28 = "arith.constant"() <{value = 2.000000e+00 : f64}> : () -> f64
    %29 = "arith.constant"() <{value = 0 : index}> : () -> index
    %30 = "arith.constant"() <{value = 1 : index}> : () -> index
    %31 = "tensor.dim"(%arg12, %29) : (tensor<?x?xf64, #sparse>, index) -> index
    %32 = "tensor.dim"(%arg12, %30) : (tensor<?x?xf64, #sparse>, index) -> index
    %33 = "tensor.empty"(%31, %32) : (index, index) -> tensor<?x?xf64, #sparse>
    %34 = "linalg.generic"(%arg12, %33) <{doc = "X(i,j) = A(i,j) * 2.0", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg13: f64, %arg14: f64):
      %35 = "arith.mulf"(%arg13, %28) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%35) : (f64) -> ()
    }) : (tensor<?x?xf64, #sparse>, tensor<?x?xf64, #sparse>) -> tensor<?x?xf64, #sparse>
    "func.return"(%34) : (tensor<?x?xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse>) -> tensor<?x?xf64, #sparse>, sym_name = "matrix_scale_inplace"}> ({
  ^bb0(%arg10: tensor<?x?xf64, #sparse>):
    %25 = "arith.constant"() <{value = 2.000000e+00 : f64}> : () -> f64
    %26 = "linalg.generic"(%arg10) <{doc = "X(i,j) *= 2.0", indexing_maps = [#map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg11: f64):
      %27 = "arith.mulf"(%arg11, %25) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%27) : (f64) -> ()
    }) : (tensor<?x?xf64, #sparse>) -> tensor<?x?xf64, #sparse>
    "func.return"(%26) : (tensor<?x?xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse>, tensor<?x?xf64, #sparse>) -> tensor<?x?xf64, #sparse>, sym_name = "matrix_add"}> ({
  ^bb0(%arg5: tensor<?x?xf64, #sparse>, %arg6: tensor<?x?xf64, #sparse>):
    %18 = "arith.constant"() <{value = 0 : index}> : () -> index
    %19 = "arith.constant"() <{value = 1 : index}> : () -> index
    %20 = "tensor.dim"(%arg5, %18) : (tensor<?x?xf64, #sparse>, index) -> index
    %21 = "tensor.dim"(%arg5, %19) : (tensor<?x?xf64, #sparse>, index) -> index
    %22 = "tensor.empty"(%20, %21) : (index, index) -> tensor<?x?xf64, #sparse>
    %23 = "linalg.generic"(%arg5, %arg6, %22) <{doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg7: f64, %arg8: f64, %arg9: f64):
      %24 = "arith.addf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%24) : (f64) -> ()
    }) : (tensor<?x?xf64, #sparse>, tensor<?x?xf64, #sparse>, tensor<?x?xf64, #sparse>) -> tensor<?x?xf64, #sparse>
    "func.return"(%23) : (tensor<?x?xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse>, tensor<?x?xf64, #sparse>) -> tensor<?x?xf64, #sparse>, sym_name = "matrix_mul"}> ({
  ^bb0(%arg0: tensor<?x?xf64, #sparse>, %arg1: tensor<?x?xf64, #sparse>):
    %11 = "arith.constant"() <{value = 0 : index}> : () -> index
    %12 = "arith.constant"() <{value = 1 : index}> : () -> index
    %13 = "tensor.dim"(%arg0, %11) : (tensor<?x?xf64, #sparse>, index) -> index
    %14 = "tensor.dim"(%arg0, %12) : (tensor<?x?xf64, #sparse>, index) -> index
    %15 = "tensor.empty"(%13, %14) : (index, index) -> tensor<?x?xf64, #sparse>
    %16 = "linalg.generic"(%arg0, %arg1, %15) <{doc = "X(i,j) = A(i,j) OP B(i,j)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f64, %arg3: f64, %arg4: f64):
      %17 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%17) : (f64) -> ()
    }) : (tensor<?x?xf64, #sparse>, tensor<?x?xf64, #sparse>, tensor<?x?xf64, #sparse>) -> tensor<?x?xf64, #sparse>
    "func.return"(%16) : (tensor<?x?xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1.100000e+00 : f64}> : () -> f64
    %2 = "arith.constant"() <{value = sparse<[[0, 0], [0, 1], [1, 7], [2, 2], [2, 4], [2, 7], [3, 0], [3, 2], [3, 3]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00, 9.000000e+00]> : tensor<4x8xf64>}> : () -> tensor<4x8xf64>
    %3 = "arith.constant"() <{value = sparse<[[0, 0], [0, 7], [1, 0], [1, 6], [2, 1], [2, 7]], [6.000000e+00, 5.000000e+00, 4.000000e+00, 3.000000e+00, 2.000000e+00, 1.000000e+00]> : tensor<4x8xf64>}> : () -> tensor<4x8xf64>
    %4 = "sparse_tensor.convert"(%2) : (tensor<4x8xf64>) -> tensor<?x?xf64, #sparse>
    %5 = "sparse_tensor.convert"(%2) : (tensor<4x8xf64>) -> tensor<?x?xf64, #sparse>
    %6 = "sparse_tensor.convert"(%3) : (tensor<4x8xf64>) -> tensor<?x?xf64, #sparse>
    %7 = "func.call"(%4) <{callee = @matrix_scale}> : (tensor<?x?xf64, #sparse>) -> tensor<?x?xf64, #sparse>
    %8 = "func.call"(%5) <{callee = @matrix_scale_inplace}> : (tensor<?x?xf64, #sparse>) -> tensor<?x?xf64, #sparse>
    %9 = "func.call"(%8, %6) <{callee = @matrix_add}> : (tensor<?x?xf64, #sparse>, tensor<?x?xf64, #sparse>) -> tensor<?x?xf64, #sparse>
    %10 = "func.call"(%8, %6) <{callee = @matrix_mul}> : (tensor<?x?xf64, #sparse>, tensor<?x?xf64, #sparse>) -> tensor<?x?xf64, #sparse>
    "sparse_tensor.print"(%4) : (tensor<?x?xf64, #sparse>) -> ()
    "sparse_tensor.print"(%6) : (tensor<?x?xf64, #sparse>) -> ()
    "sparse_tensor.print"(%7) : (tensor<?x?xf64, #sparse>) -> ()
    "sparse_tensor.print"(%8) : (tensor<?x?xf64, #sparse>) -> ()
    "sparse_tensor.print"(%9) : (tensor<?x?xf64, #sparse>) -> ()
    "sparse_tensor.print"(%10) : (tensor<?x?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<?x?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<?x?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%6) : (tensor<?x?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%7) : (tensor<?x?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%9) : (tensor<?x?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%10) : (tensor<?x?xf64, #sparse>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

