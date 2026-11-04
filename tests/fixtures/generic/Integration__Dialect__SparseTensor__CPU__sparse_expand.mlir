#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x2xf64, #sparse>, tensor<2x4xf64, #sparse>) -> tensor<8x4xf64, #sparse>, sym_name = "matmul"}> ({
  ^bb0(%arg0: tensor<8x2xf64, #sparse>, %arg1: tensor<2x4xf64, #sparse>):
    %7 = "tensor.empty"() : () -> tensor<8x4xf64, #sparse>
    %8 = "linalg.matmul"(%arg0, %arg1, %7) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f64, %arg3: f64, %arg4: f64):
      %9 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %10 = "arith.addf"(%arg4, %9) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%10) : (f64) -> ()
    }) : (tensor<8x2xf64, #sparse>, tensor<2x4xf64, #sparse>, tensor<8x4xf64, #sparse>) -> tensor<8x4xf64, #sparse>
    "func.return"(%8) : (tensor<8x4xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = -1.000000e+00 : f64}> : () -> f64
    %2 = "arith.constant"() <{value = dense<[[1.100000e+00, 2.100000e+00], [1.200000e+00, 2.200000e+00], [1.300000e+00, 2.300000e+00], [1.400000e+00, 2.400000e+00], [1.500000e+00, 2.500000e+00], [1.600000e+00, 2.600000e+00], [1.700000e+00, 2.700000e+00], [1.800000e+00, 2.800000e+00]]> : tensor<8x2xf64>}> : () -> tensor<8x2xf64>
    %3 = "arith.constant"() <{value = dense<[[1.010000e+01, 1.110000e+01, 1.210000e+01, 1.310000e+01], [1.020000e+01, 1.120000e+01, 1.220000e+01, 1.320000e+01]]> : tensor<2x4xf64>}> : () -> tensor<2x4xf64>
    %4 = "sparse_tensor.convert"(%2) : (tensor<8x2xf64>) -> tensor<8x2xf64, #sparse>
    %5 = "sparse_tensor.convert"(%3) : (tensor<2x4xf64>) -> tensor<2x4xf64, #sparse>
    %6 = "func.call"(%4, %5) <{callee = @matmul}> : (tensor<8x2xf64, #sparse>, tensor<2x4xf64, #sparse>) -> tensor<8x4xf64, #sparse>
    "sparse_tensor.print"(%6) : (tensor<8x4xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<8x2xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<2x4xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%6) : (tensor<8x4xf64, #sparse>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

