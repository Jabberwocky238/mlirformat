"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>>) -> tensor<?x?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : dense) }>>, sym_name = "tensor_scale"}> ({
  ^bb0(%arg0: tensor<?x?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>> loc("<stdin>":6:8)):
    %5 = "arith.constant"() <{value = 2.000000e+00 : f64}> : () -> f64 loc("<stdin>":7:10)
    %6 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":8:10)
    %7 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":9:10)
    %8 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":10:10)
    %9 = "tensor.dim"(%arg0, %6) : (tensor<?x?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>>, index) -> index loc("<stdin>":11:10)
    %10 = "tensor.dim"(%arg0, %7) : (tensor<?x?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>>, index) -> index loc("<stdin>":12:11)
    %11 = "tensor.dim"(%arg0, %8) : (tensor<?x?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>>, index) -> index loc("<stdin>":13:11)
    %12 = "tensor.empty"(%9, %10, %11) : (index, index, index) -> tensor<?x?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : dense) }>> loc("<stdin>":14:11)
    %13 = "linalg.generic"(%arg0, %12) <{doc = "X(i,j,k) = A(i,j,k) * 2.0", indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f64 loc("<stdin>":16:10), %arg2: f64 loc("<stdin>":16:22)):
      %14 = "arith.mulf"(%arg1, %5) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":17:13)
      "linalg.yield"(%14) : (f64) -> () loc("<stdin>":18:7)
    }) : (tensor<?x?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>>, tensor<?x?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : dense) }>>) -> tensor<?x?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : dense) }>> loc("<stdin>":15:11)
    "func.return"(%13) : (tensor<?x?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : dense) }>>) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":5:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":23:10)
    %1 = "arith.constant"() <{value = -1.000000e+00 : f64}> : () -> f64 loc("<stdin>":24:10)
    %2 = "arith.constant"() <{value = dense<[[[1.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 2.000000e+00]], [[0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00]], [[0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 3.000000e+00, 4.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 5.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00]]]> : tensor<3x4x8xf64>}> : () -> tensor<3x4x8xf64> loc("<stdin>":25:10)
    %3 = "sparse_tensor.convert"(%2) : (tensor<3x4x8xf64>) -> tensor<?x?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>> loc("<stdin>":26:10)
    %4 = "func.call"(%3) <{callee = @tensor_scale}> : (tensor<?x?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>>) -> tensor<?x?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : dense) }>> loc("<stdin>":27:10)
    "sparse_tensor.print"(%3) : (tensor<?x?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>>) -> () loc("<stdin>":28:5)
    "sparse_tensor.print"(%4) : (tensor<?x?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : dense) }>>) -> () loc("<stdin>":29:5)
    "bufferization.dealloc_tensor"(%3) : (tensor<?x?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>>) -> () loc("<stdin>":30:5)
    "bufferization.dealloc_tensor"(%4) : (tensor<?x?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : dense) }>>) -> () loc("<stdin>":31:5)
    "func.return"() : () -> () loc("<stdin>":32:5)
  }) : () -> () loc("<stdin>":22:3)
}) : () -> () loc("<stdin>":4:1)
