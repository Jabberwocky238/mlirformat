"builtin.module"() ({
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (tensor<1x4x4x1xf32>) -> tensor<1x4x4x1xf32>, sym_name = "max_pool_static"}> ({
  ^bb0(%arg1: tensor<1x4x4x1xf32> loc("<stdin>":5:8)):
    %9 = "tosa.max_pool2d"(%arg1) <{kernel = array<i64: 3, 3>, nan_mode = #tosa.nan_mode<PROPAGATE>, pad = array<i64: 1, 1, 1, 1>, stride = array<i64: 1, 1>}> : (tensor<1x4x4x1xf32>) -> tensor<1x4x4x1xf32> loc("<stdin>":6:10)
    "func.return"(%9) : (tensor<1x4x4x1xf32>) -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":4:3)
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>, sym_name = "max_pool_dynamic"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xf32> loc("<stdin>":10:8)):
    %8 = "tosa.max_pool2d"(%arg0) <{kernel = array<i64: 3, 3>, nan_mode = #tosa.nan_mode<PROPAGATE>, pad = array<i64: 1, 1, 1, 1>, stride = array<i64: 1, 1>}> : (tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32> loc("<stdin>":11:10)
    "func.return"(%8) : (tensor<?x?x?x?xf32>) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":9:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = dense<[[[[0.000000e+00], [1.000000e-01], [2.000000e-01], [3.000000e-01]], [[1.000000e+00], [1.100000e+00], [1.200000e+00], [1.300000e+00]], [[2.000000e+00], [2.100000e+00], [2.200000e+00], [2.300000e+00]], [[3.000000e+00], [3.100000e+00], [3.200000e+00], [3.300000e+00]]]]> : tensor<1x4x4x1xf32>}> : () -> tensor<1x4x4x1xf32> loc("<stdin>":15:10)
    %1 = "tensor.cast"(%0) : (tensor<1x4x4x1xf32>) -> tensor<?x?x?x?xf32> loc("<stdin>":16:10)
    %2 = "func.call"(%0) <{callee = @max_pool_static}> : (tensor<1x4x4x1xf32>) -> tensor<1x4x4x1xf32> loc("<stdin>":17:10)
    %3 = "func.call"(%1) <{callee = @max_pool_dynamic}> : (tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32> loc("<stdin>":18:10)
    %4 = "bufferization.to_buffer"(%2) : (tensor<1x4x4x1xf32>) -> memref<1x4x4x1xf32> loc("<stdin>":19:10)
    %5 = "memref.cast"(%4) : (memref<1x4x4x1xf32>) -> memref<*xf32> loc("<stdin>":20:10)
    "func.call"(%5) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":21:5)
    %6 = "bufferization.to_buffer"(%3) : (tensor<?x?x?x?xf32>) -> memref<?x?x?x?xf32> loc("<stdin>":22:10)
    %7 = "memref.cast"(%6) : (memref<?x?x?x?xf32>) -> memref<*xf32> loc("<stdin>":23:10)
    "func.call"(%7) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":24:5)
    "func.return"() : () -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":14:3)
}) : () -> () loc("<stdin>":1:1)
