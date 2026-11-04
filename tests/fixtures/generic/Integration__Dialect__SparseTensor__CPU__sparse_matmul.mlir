#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<*xf64>) -> (), sym_name = "printMemrefF64", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf64>) -> (), sym_name = "printMemref1dF64", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = (tensor<4x8xf64>, tensor<8x4xf64>, tensor<4x4xf64>) -> tensor<4x4xf64>, sym_name = "matmul1"}> ({
  ^bb0(%arg10: tensor<4x8xf64>, %arg11: tensor<8x4xf64>, %arg12: tensor<4x4xf64>):
    %34 = "linalg.matmul"(%arg10, %arg11, %arg12) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg13: f64, %arg14: f64, %arg15: f64):
      %35 = "arith.mulf"(%arg13, %arg14) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %36 = "arith.addf"(%arg15, %35) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%36) : (f64) -> ()
    }) : (tensor<4x8xf64>, tensor<8x4xf64>, tensor<4x4xf64>) -> tensor<4x4xf64>
    "func.return"(%34) : (tensor<4x4xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<4x8xf64, #sparse>, tensor<8x4xf64, #sparse>) -> tensor<4x4xf64, #sparse>, sym_name = "matmul2"}> ({
  ^bb0(%arg5: tensor<4x8xf64, #sparse>, %arg6: tensor<8x4xf64, #sparse>):
    %30 = "tensor.empty"() : () -> tensor<4x4xf64, #sparse>
    %31 = "linalg.matmul"(%arg5, %arg6, %30) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg7: f64, %arg8: f64, %arg9: f64):
      %32 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %33 = "arith.addf"(%arg9, %32) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%33) : (f64) -> ()
    }) : (tensor<4x8xf64, #sparse>, tensor<8x4xf64, #sparse>, tensor<4x4xf64, #sparse>) -> tensor<4x4xf64, #sparse>
    "func.return"(%31) : (tensor<4x4xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<4x8xf64, #sparse1>, tensor<8x4xf64, #sparse1>) -> tensor<4x4xf64, #sparse1>, sym_name = "matmul3"}> ({
  ^bb0(%arg0: tensor<4x8xf64, #sparse1>, %arg1: tensor<8x4xf64, #sparse1>):
    %26 = "tensor.empty"() : () -> tensor<4x4xf64, #sparse1>
    %27 = "linalg.matmul"(%arg0, %arg1, %26) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f64, %arg3: f64, %arg4: f64):
      %28 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %29 = "arith.addf"(%arg4, %28) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%29) : (f64) -> ()
    }) : (tensor<4x8xf64, #sparse1>, tensor<8x4xf64, #sparse1>, tensor<4x4xf64, #sparse1>) -> tensor<4x4xf64, #sparse1>
    "func.return"(%27) : (tensor<4x4xf64, #sparse1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = dense<[[1.100000e+00, 2.100000e+00, 3.100000e+00, 4.100000e+00, 5.100000e+00, 6.100000e+00, 7.100000e+00, 8.100000e+00], [1.200000e+00, 2.200000e+00, 3.200000e+00, 4.200000e+00, 5.200000e+00, 6.200000e+00, 7.200000e+00, 8.1999999999999993], [1.300000e+00, 2.300000e+00, 3.300000e+00, 4.300000e+00, 5.300000e+00, 6.300000e+00, 7.300000e+00, 8.300000e+00], [1.400000e+00, 2.400000e+00, 3.400000e+00, 4.400000e+00, 5.400000e+00, 6.400000e+00, 7.400000e+00, 8.400000e+00]]> : tensor<4x8xf64>}> : () -> tensor<4x8xf64>
    %2 = "arith.constant"() <{value = dense<[[1.010000e+01, 1.110000e+01, 1.210000e+01, 1.310000e+01], [1.020000e+01, 1.120000e+01, 1.220000e+01, 1.320000e+01], [1.030000e+01, 1.130000e+01, 1.230000e+01, 1.330000e+01], [1.040000e+01, 1.140000e+01, 1.240000e+01, 1.340000e+01], [1.050000e+01, 1.150000e+01, 1.250000e+01, 1.350000e+01], [1.060000e+01, 1.160000e+01, 1.260000e+01, 1.360000e+01], [1.070000e+01, 1.170000e+01, 1.270000e+01, 1.370000e+01], [1.080000e+01, 1.180000e+01, 1.280000e+01, 1.380000e+01]]> : tensor<8x4xf64>}> : () -> tensor<8x4xf64>
    %3 = "arith.constant"() <{value = dense<[[0.000000e+00, 2.100000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 6.100000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 2.300000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 1.000000e+00]]> : tensor<4x8xf64>}> : () -> tensor<4x8xf64>
    %4 = "arith.constant"() <{value = dense<[[0.000000e+00, 0.000000e+00, 0.000000e+00, 1.000000e+00], [0.000000e+00, 0.000000e+00, 2.000000e+00, 0.000000e+00], [0.000000e+00, 3.000000e+00, 0.000000e+00, 0.000000e+00], [4.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 5.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 6.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 7.000000e+00, 8.000000e+00]]> : tensor<8x4xf64>}> : () -> tensor<8x4xf64>
    %5 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<4x4xf64>}> : () -> tensor<4x4xf64>
    %6 = "sparse_tensor.convert"(%1) : (tensor<4x8xf64>) -> tensor<4x8xf64, #sparse>
    %7 = "sparse_tensor.convert"(%1) : (tensor<4x8xf64>) -> tensor<4x8xf64, #sparse1>
    %8 = "sparse_tensor.convert"(%3) : (tensor<4x8xf64>) -> tensor<4x8xf64, #sparse>
    %9 = "sparse_tensor.convert"(%3) : (tensor<4x8xf64>) -> tensor<4x8xf64, #sparse1>
    %10 = "sparse_tensor.convert"(%2) : (tensor<8x4xf64>) -> tensor<8x4xf64, #sparse>
    %11 = "sparse_tensor.convert"(%2) : (tensor<8x4xf64>) -> tensor<8x4xf64, #sparse1>
    %12 = "sparse_tensor.convert"(%4) : (tensor<8x4xf64>) -> tensor<8x4xf64, #sparse>
    %13 = "sparse_tensor.convert"(%4) : (tensor<8x4xf64>) -> tensor<8x4xf64, #sparse1>
    "sparse_tensor.print"(%6) : (tensor<4x8xf64, #sparse>) -> ()
    "sparse_tensor.print"(%7) : (tensor<4x8xf64, #sparse1>) -> ()
    "sparse_tensor.print"(%8) : (tensor<4x8xf64, #sparse>) -> ()
    "sparse_tensor.print"(%9) : (tensor<4x8xf64, #sparse1>) -> ()
    "sparse_tensor.print"(%10) : (tensor<8x4xf64, #sparse>) -> ()
    "sparse_tensor.print"(%11) : (tensor<8x4xf64, #sparse1>) -> ()
    "sparse_tensor.print"(%12) : (tensor<8x4xf64, #sparse>) -> ()
    "sparse_tensor.print"(%13) : (tensor<8x4xf64, #sparse1>) -> ()
    %14 = "func.call"(%1, %2, %5) <{callee = @matmul1}> : (tensor<4x8xf64>, tensor<8x4xf64>, tensor<4x4xf64>) -> tensor<4x4xf64>
    %15 = "func.call"(%6, %10) <{callee = @matmul2}> : (tensor<4x8xf64, #sparse>, tensor<8x4xf64, #sparse>) -> tensor<4x4xf64, #sparse>
    %16 = "func.call"(%7, %11) <{callee = @matmul3}> : (tensor<4x8xf64, #sparse1>, tensor<8x4xf64, #sparse1>) -> tensor<4x4xf64, #sparse1>
    %17 = "func.call"(%3, %2, %5) <{callee = @matmul1}> : (tensor<4x8xf64>, tensor<8x4xf64>, tensor<4x4xf64>) -> tensor<4x4xf64>
    %18 = "func.call"(%8, %10) <{callee = @matmul2}> : (tensor<4x8xf64, #sparse>, tensor<8x4xf64, #sparse>) -> tensor<4x4xf64, #sparse>
    %19 = "func.call"(%9, %11) <{callee = @matmul3}> : (tensor<4x8xf64, #sparse1>, tensor<8x4xf64, #sparse1>) -> tensor<4x4xf64, #sparse1>
    %20 = "func.call"(%3, %4, %5) <{callee = @matmul1}> : (tensor<4x8xf64>, tensor<8x4xf64>, tensor<4x4xf64>) -> tensor<4x4xf64>
    %21 = "func.call"(%8, %12) <{callee = @matmul2}> : (tensor<4x8xf64, #sparse>, tensor<8x4xf64, #sparse>) -> tensor<4x4xf64, #sparse>
    %22 = "func.call"(%9, %13) <{callee = @matmul3}> : (tensor<4x8xf64, #sparse1>, tensor<8x4xf64, #sparse1>) -> tensor<4x4xf64, #sparse1>
    %23 = "tensor.cast"(%14) : (tensor<4x4xf64>) -> tensor<*xf64>
    "func.call"(%23) <{callee = @printMemrefF64}> : (tensor<*xf64>) -> ()
    "sparse_tensor.print"(%15) : (tensor<4x4xf64, #sparse>) -> ()
    "sparse_tensor.print"(%16) : (tensor<4x4xf64, #sparse1>) -> ()
    %24 = "tensor.cast"(%17) : (tensor<4x4xf64>) -> tensor<*xf64>
    "func.call"(%24) <{callee = @printMemrefF64}> : (tensor<*xf64>) -> ()
    "sparse_tensor.print"(%18) : (tensor<4x4xf64, #sparse>) -> ()
    "sparse_tensor.print"(%19) : (tensor<4x4xf64, #sparse1>) -> ()
    %25 = "tensor.cast"(%20) : (tensor<4x4xf64>) -> tensor<*xf64>
    "func.call"(%25) <{callee = @printMemrefF64}> : (tensor<*xf64>) -> ()
    "sparse_tensor.print"(%21) : (tensor<4x4xf64, #sparse>) -> ()
    "sparse_tensor.print"(%22) : (tensor<4x4xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%6) : (tensor<4x8xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%7) : (tensor<4x8xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%8) : (tensor<4x8xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%9) : (tensor<4x8xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%10) : (tensor<8x4xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%11) : (tensor<8x4xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%12) : (tensor<8x4xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%13) : (tensor<8x4xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%14) : (tensor<4x4xf64>) -> ()
    "bufferization.dealloc_tensor"(%15) : (tensor<4x4xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%16) : (tensor<4x4xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%17) : (tensor<4x4xf64>) -> ()
    "bufferization.dealloc_tensor"(%18) : (tensor<4x4xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%19) : (tensor<4x4xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%20) : (tensor<4x4xf64>) -> ()
    "bufferization.dealloc_tensor"(%21) : (tensor<4x4xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%22) : (tensor<4x4xf64, #sparse1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

