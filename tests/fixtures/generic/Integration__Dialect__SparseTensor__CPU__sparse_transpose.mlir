#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3x4xf64, #sparse>) -> tensor<4x3xf64, #sparse>, sym_name = "sparse_transpose"}> ({
  ^bb0(%arg3: tensor<3x4xf64, #sparse>):
    %10 = "sparse_tensor.convert"(%arg3) : (tensor<3x4xf64, #sparse>) -> tensor<3x4xf64, #sparse1>
    %11 = "tensor.empty"() : () -> tensor<4x3xf64, #sparse>
    %12 = "linalg.generic"(%10, %11) <{doc = "X(i,j) = A(j,i)", indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f64, %arg5: f64):
      "linalg.yield"(%arg4) : (f64) -> ()
    }) : (tensor<3x4xf64, #sparse1>, tensor<4x3xf64, #sparse>) -> tensor<4x3xf64, #sparse>
    "bufferization.dealloc_tensor"(%10) : (tensor<3x4xf64, #sparse1>) -> ()
    "func.return"(%12) : (tensor<4x3xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<3x4xf64, #sparse>) -> tensor<4x3xf64, #sparse>, sym_name = "sparse_transpose_auto"}> ({
  ^bb0(%arg0: tensor<3x4xf64, #sparse>):
    %8 = "tensor.empty"() : () -> tensor<4x3xf64, #sparse>
    %9 = "linalg.generic"(%arg0, %8) <{doc = "X(i,j) = A(j,i)", indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f64, %arg2: f64):
      "linalg.yield"(%arg1) : (f64) -> ()
    }) : (tensor<3x4xf64, #sparse>, tensor<4x3xf64, #sparse>) -> tensor<4x3xf64, #sparse>
    "func.return"(%9) : (tensor<4x3xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    %3 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %4 = "arith.constant"() <{value = dense<[[1.100000e+00, 1.200000e+00, 0.000000e+00, 1.400000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [3.100000e+00, 0.000000e+00, 3.300000e+00, 3.400000e+00]]> : tensor<3x4xf64>}> : () -> tensor<3x4xf64>
    %5 = "sparse_tensor.convert"(%4) : (tensor<3x4xf64>) -> tensor<3x4xf64, #sparse>
    %6 = "func.call"(%5) <{callee = @sparse_transpose}> : (tensor<3x4xf64, #sparse>) -> tensor<4x3xf64, #sparse>
    %7 = "func.call"(%5) <{callee = @sparse_transpose_auto}> : (tensor<3x4xf64, #sparse>) -> tensor<4x3xf64, #sparse>
    "sparse_tensor.print"(%6) : (tensor<4x3xf64, #sparse>) -> ()
    "sparse_tensor.print"(%7) : (tensor<4x3xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<3x4xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%6) : (tensor<4x3xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%7) : (tensor<4x3xf64, #sparse>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

