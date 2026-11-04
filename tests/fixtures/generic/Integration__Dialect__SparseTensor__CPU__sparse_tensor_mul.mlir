#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf64, #sparse>, tensor<?x?x?xf64, #sparse>) -> tensor<?x?x?xf64, #sparse>, sym_name = "tensor_mul"}> ({
  ^bb0(%arg0: tensor<?x?x?xf64, #sparse>, %arg1: tensor<?x?x?xf64, #sparse>):
    %7 = "arith.constant"() <{value = 0 : index}> : () -> index
    %8 = "arith.constant"() <{value = 1 : index}> : () -> index
    %9 = "arith.constant"() <{value = 2 : index}> : () -> index
    %10 = "tensor.dim"(%arg0, %7) : (tensor<?x?x?xf64, #sparse>, index) -> index
    %11 = "tensor.dim"(%arg0, %8) : (tensor<?x?x?xf64, #sparse>, index) -> index
    %12 = "tensor.dim"(%arg0, %9) : (tensor<?x?x?xf64, #sparse>, index) -> index
    %13 = "tensor.empty"(%10, %11, %12) : (index, index, index) -> tensor<?x?x?xf64, #sparse>
    %14 = "linalg.generic"(%arg0, %arg1, %13) <{doc = "X(i,j,k) = A(i,j,k) * B(i,j,k)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f64, %arg3: f64, %arg4: f64):
      %15 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%15) : (f64) -> ()
    }) : (tensor<?x?x?xf64, #sparse>, tensor<?x?x?xf64, #sparse>, tensor<?x?x?xf64, #sparse>) -> tensor<?x?x?xf64, #sparse>
    "func.return"(%14) : (tensor<?x?x?xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = -1.000000e+00 : f64}> : () -> f64
    %2 = "arith.constant"() <{value = dense<[[[1.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [1.200000e+00, 0.000000e+00, 3.500000e+00, 0.000000e+00, 0.000000e+00]], [[0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00]], [[2.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 4.000000e+00, 0.000000e+00, 0.000000e+00]]]> : tensor<3x3x5xf64>}> : () -> tensor<3x3x5xf64>
    %3 = "arith.constant"() <{value = dense<[[[0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 4.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [2.000000e+00, 0.000000e+00, 1.000000e+00, 0.000000e+00, 0.000000e+00]], [[0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 9.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 7.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00]], [[1.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 2.000000e+00, 0.000000e+00, 0.000000e+00]]]> : tensor<3x3x5xf64>}> : () -> tensor<3x3x5xf64>
    %4 = "sparse_tensor.convert"(%2) : (tensor<3x3x5xf64>) -> tensor<?x?x?xf64, #sparse>
    %5 = "sparse_tensor.convert"(%3) : (tensor<3x3x5xf64>) -> tensor<?x?x?xf64, #sparse>
    %6 = "func.call"(%4, %5) <{callee = @tensor_mul}> : (tensor<?x?x?xf64, #sparse>, tensor<?x?x?xf64, #sparse>) -> tensor<?x?x?xf64, #sparse>
    "sparse_tensor.print"(%6) : (tensor<?x?x?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<?x?x?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<?x?x?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%6) : (tensor<?x?x?xf64, #sparse>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

