"builtin.module"() ({
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = (tensor<1x4x4x1xf32>) -> tensor<1x4x4x1xf32>, sym_name = "max_pool_static"}> ({
  ^bb0(%arg1: tensor<1x4x4x1xf32>):
    %9 = "tosa.max_pool2d"(%arg1) <{kernel = array<i64: 3, 3>, nan_mode = #tosa.nan_mode<PROPAGATE>, pad = array<i64: 1, 1, 1, 1>, stride = array<i64: 1, 1>}> : (tensor<1x4x4x1xf32>) -> tensor<1x4x4x1xf32>
    "func.return"(%9) : (tensor<1x4x4x1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>, sym_name = "max_pool_dynamic"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xf32>):
    %8 = "tosa.max_pool2d"(%arg0) <{kernel = array<i64: 3, 3>, nan_mode = #tosa.nan_mode<PROPAGATE>, pad = array<i64: 1, 1, 1, 1>, stride = array<i64: 1, 1>}> : (tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    "func.return"(%8) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = dense<[[[[0.000000e+00], [1.000000e-01], [2.000000e-01], [3.000000e-01]], [[1.000000e+00], [1.100000e+00], [1.200000e+00], [1.300000e+00]], [[2.000000e+00], [2.100000e+00], [2.200000e+00], [2.300000e+00]], [[3.000000e+00], [3.100000e+00], [3.200000e+00], [3.300000e+00]]]]> : tensor<1x4x4x1xf32>}> : () -> tensor<1x4x4x1xf32>
    %1 = "tensor.cast"(%0) : (tensor<1x4x4x1xf32>) -> tensor<?x?x?x?xf32>
    %2 = "func.call"(%0) <{callee = @max_pool_static}> : (tensor<1x4x4x1xf32>) -> tensor<1x4x4x1xf32>
    %3 = "func.call"(%1) <{callee = @max_pool_dynamic}> : (tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    %4 = "bufferization.to_buffer"(%2) : (tensor<1x4x4x1xf32>) -> memref<1x4x4x1xf32>
    %5 = "memref.cast"(%4) : (memref<1x4x4x1xf32>) -> memref<*xf32>
    "func.call"(%5) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    %6 = "bufferization.to_buffer"(%3) : (tensor<?x?x?x?xf32>) -> memref<?x?x?x?xf32>
    %7 = "memref.cast"(%6) : (memref<?x?x?x?xf32>) -> memref<*xf32>
    "func.call"(%7) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

