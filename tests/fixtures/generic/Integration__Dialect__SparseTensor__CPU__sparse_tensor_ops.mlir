#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : dense) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf64, #sparse>) -> tensor<?x?x?xf64, #sparse1>, sym_name = "tensor_scale"}> ({
  ^bb0(%arg0: tensor<?x?x?xf64, #sparse>):
    %5 = "arith.constant"() <{value = 2.000000e+00 : f64}> : () -> f64
    %6 = "arith.constant"() <{value = 0 : index}> : () -> index
    %7 = "arith.constant"() <{value = 1 : index}> : () -> index
    %8 = "arith.constant"() <{value = 2 : index}> : () -> index
    %9 = "tensor.dim"(%arg0, %6) : (tensor<?x?x?xf64, #sparse>, index) -> index
    %10 = "tensor.dim"(%arg0, %7) : (tensor<?x?x?xf64, #sparse>, index) -> index
    %11 = "tensor.dim"(%arg0, %8) : (tensor<?x?x?xf64, #sparse>, index) -> index
    %12 = "tensor.empty"(%9, %10, %11) : (index, index, index) -> tensor<?x?x?xf64, #sparse1>
    %13 = "linalg.generic"(%arg0, %12) <{doc = "X(i,j,k) = A(i,j,k) * 2.0", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f64, %arg2: f64):
      %14 = "arith.mulf"(%arg1, %5) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%14) : (f64) -> ()
    }) : (tensor<?x?x?xf64, #sparse>, tensor<?x?x?xf64, #sparse1>) -> tensor<?x?x?xf64, #sparse1>
    "func.return"(%13) : (tensor<?x?x?xf64, #sparse1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = -1.000000e+00 : f64}> : () -> f64
    %2 = "arith.constant"() <{value = dense<[[[1.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 2.000000e+00]], [[0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00]], [[0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 3.000000e+00, 4.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 5.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00]]]> : tensor<3x4x8xf64>}> : () -> tensor<3x4x8xf64>
    %3 = "sparse_tensor.convert"(%2) : (tensor<3x4x8xf64>) -> tensor<?x?x?xf64, #sparse>
    %4 = "func.call"(%3) <{callee = @tensor_scale}> : (tensor<?x?x?xf64, #sparse>) -> tensor<?x?x?xf64, #sparse1>
    "sparse_tensor.print"(%3) : (tensor<?x?x?xf64, #sparse>) -> ()
    "sparse_tensor.print"(%4) : (tensor<?x?x?xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%3) : (tensor<?x?x?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<?x?x?xf64, #sparse1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

