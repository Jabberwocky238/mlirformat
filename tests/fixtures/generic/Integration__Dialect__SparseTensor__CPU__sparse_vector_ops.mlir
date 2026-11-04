#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0) -> (d0 : dense) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>, sym_name = "vector_scale"}> ({
  ^bb0(%arg23: tensor<?xf64, #sparse>):
    %36 = "arith.constant"() <{value = 2.000000e+00 : f64}> : () -> f64
    %37 = "arith.constant"() <{value = 0 : index}> : () -> index
    %38 = "tensor.dim"(%arg23, %37) : (tensor<?xf64, #sparse>, index) -> index
    %39 = "tensor.empty"(%38) : (index) -> tensor<?xf64, #sparse>
    %40 = "linalg.generic"(%arg23, %39) <{doc = "x(i) = a(i) * 2.0", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg24: f64, %arg25: f64):
      %41 = "arith.mulf"(%arg24, %36) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%41) : (f64) -> ()
    }) : (tensor<?xf64, #sparse>, tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>
    "func.return"(%40) : (tensor<?xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>, sym_name = "vector_scale_inplace"}> ({
  ^bb0(%arg21: tensor<?xf64, #sparse>):
    %33 = "arith.constant"() <{value = 2.000000e+00 : f64}> : () -> f64
    %34 = "linalg.generic"(%arg21) <{doc = "x(i) *= 2.0", indexing_maps = [#map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg22: f64):
      %35 = "arith.mulf"(%arg22, %33) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%35) : (f64) -> ()
    }) : (tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>
    "func.return"(%34) : (tensor<?xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xf64, #sparse>, tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>, sym_name = "vector_add"}> ({
  ^bb0(%arg16: tensor<?xf64, #sparse>, %arg17: tensor<?xf64, #sparse>):
    %28 = "arith.constant"() <{value = 0 : index}> : () -> index
    %29 = "tensor.dim"(%arg16, %28) : (tensor<?xf64, #sparse>, index) -> index
    %30 = "tensor.empty"(%29) : (index) -> tensor<?xf64, #sparse>
    %31 = "linalg.generic"(%arg16, %arg17, %30) <{doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg18: f64, %arg19: f64, %arg20: f64):
      %32 = "arith.addf"(%arg18, %arg19) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%32) : (f64) -> ()
    }) : (tensor<?xf64, #sparse>, tensor<?xf64, #sparse>, tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>
    "func.return"(%31) : (tensor<?xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xf64, #sparse>, tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>, sym_name = "vector_mul"}> ({
  ^bb0(%arg11: tensor<?xf64, #sparse>, %arg12: tensor<?xf64, #sparse>):
    %23 = "arith.constant"() <{value = 0 : index}> : () -> index
    %24 = "tensor.dim"(%arg11, %23) : (tensor<?xf64, #sparse>, index) -> index
    %25 = "tensor.empty"(%24) : (index) -> tensor<?xf64, #sparse>
    %26 = "linalg.generic"(%arg11, %arg12, %25) <{doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg13: f64, %arg14: f64, %arg15: f64):
      %27 = "arith.mulf"(%arg13, %arg14) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%27) : (f64) -> ()
    }) : (tensor<?xf64, #sparse>, tensor<?xf64, #sparse>, tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>
    "func.return"(%26) : (tensor<?xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xf64, #sparse>, tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse1>, sym_name = "vector_mul_d"}> ({
  ^bb0(%arg6: tensor<?xf64, #sparse>, %arg7: tensor<?xf64, #sparse>):
    %18 = "arith.constant"() <{value = 0 : index}> : () -> index
    %19 = "tensor.dim"(%arg6, %18) : (tensor<?xf64, #sparse>, index) -> index
    %20 = "tensor.empty"(%19) : (index) -> tensor<?xf64, #sparse1>
    %21 = "linalg.generic"(%arg6, %arg7, %20) <{doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg8: f64, %arg9: f64, %arg10: f64):
      %22 = "arith.mulf"(%arg8, %arg9) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%22) : (f64) -> ()
    }) : (tensor<?xf64, #sparse>, tensor<?xf64, #sparse>, tensor<?xf64, #sparse1>) -> tensor<?xf64, #sparse1>
    "func.return"(%21) : (tensor<?xf64, #sparse1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xf64, #sparse>, tensor<?xf64, #sparse>, tensor<f64>) -> tensor<f64>, sym_name = "vector_dotprod"}> ({
  ^bb0(%arg0: tensor<?xf64, #sparse>, %arg1: tensor<?xf64, #sparse>, %arg2: tensor<f64>):
    %15 = "linalg.generic"(%arg0, %arg1, %arg2) <{doc = "x(i) += a(i) * b(i)", indexing_maps = [#map, #map, #map1], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f64, %arg4: f64, %arg5: f64):
      %16 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %17 = "arith.addf"(%arg5, %16) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%17) : (f64) -> ()
    }) : (tensor<?xf64, #sparse>, tensor<?xf64, #sparse>, tensor<f64>) -> tensor<f64>
    "func.return"(%15) : (tensor<f64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1.100000e+00 : f64}> : () -> f64
    %2 = "arith.constant"() <{value = sparse<[[0], [3], [11], [17], [20], [21], [28], [29], [31]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00, 9.000000e+00]> : tensor<32xf64>}> : () -> tensor<32xf64>
    %3 = "arith.constant"() <{value = sparse<[[1], [3], [4], [10], [16], [18], [21], [28], [29], [31]], [1.100000e+01, 1.200000e+01, 1.300000e+01, 1.400000e+01, 1.500000e+01, 1.600000e+01, 1.700000e+01, 1.800000e+01, 1.900000e+01, 2.000000e+01]> : tensor<32xf64>}> : () -> tensor<32xf64>
    %4 = "sparse_tensor.convert"(%2) : (tensor<32xf64>) -> tensor<?xf64, #sparse>
    %5 = "sparse_tensor.convert"(%2) : (tensor<32xf64>) -> tensor<?xf64, #sparse>
    %6 = "sparse_tensor.convert"(%3) : (tensor<32xf64>) -> tensor<?xf64, #sparse>
    %7 = "tensor.from_elements"(%1) : (f64) -> tensor<f64>
    %8 = "func.call"(%4) <{callee = @vector_scale}> : (tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>
    %9 = "func.call"(%5) <{callee = @vector_scale_inplace}> : (tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>
    %10 = "func.call"(%9, %6) <{callee = @vector_add}> : (tensor<?xf64, #sparse>, tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>
    %11 = "func.call"(%9, %6) <{callee = @vector_mul}> : (tensor<?xf64, #sparse>, tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>
    %12 = "func.call"(%9, %6) <{callee = @vector_mul_d}> : (tensor<?xf64, #sparse>, tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse1>
    %13 = "func.call"(%9, %6, %7) <{callee = @vector_dotprod}> : (tensor<?xf64, #sparse>, tensor<?xf64, #sparse>, tensor<f64>) -> tensor<f64>
    "sparse_tensor.print"(%4) : (tensor<?xf64, #sparse>) -> ()
    "sparse_tensor.print"(%6) : (tensor<?xf64, #sparse>) -> ()
    "sparse_tensor.print"(%8) : (tensor<?xf64, #sparse>) -> ()
    "sparse_tensor.print"(%9) : (tensor<?xf64, #sparse>) -> ()
    "sparse_tensor.print"(%10) : (tensor<?xf64, #sparse>) -> ()
    "sparse_tensor.print"(%11) : (tensor<?xf64, #sparse>) -> ()
    "sparse_tensor.print"(%12) : (tensor<?xf64, #sparse1>) -> ()
    %14 = "tensor.extract"(%13) : (tensor<f64>) -> f64
    "vector.print"(%14) <{punctuation = #vector.punctuation<newline>}> : (f64) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%6) : (tensor<?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%8) : (tensor<?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%10) : (tensor<?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%11) : (tensor<?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%12) : (tensor<?xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%13) : (tensor<f64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

