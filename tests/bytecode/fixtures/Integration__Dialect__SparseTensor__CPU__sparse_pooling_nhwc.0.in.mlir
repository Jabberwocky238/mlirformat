"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x4x1xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed, d1 : compressed, d2 : compressed, d3 : compressed), posWidth = 32, crdWidth = 32 }>>, tensor<2x2xf32>) -> tensor<1x3x3x1xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed, d1 : compressed, d2 : compressed, d3 : compressed), posWidth = 32, crdWidth = 32 }>>, sym_name = "pooling_nhwc_sum_CCCC"}> ({
  ^bb0(%arg5: tensor<1x4x4x1xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed, d1 : compressed, d2 : compressed, d3 : compressed), posWidth = 32, crdWidth = 32 }>> loc("<stdin>":8:8), %arg6: tensor<2x2xf32> loc("<stdin>":8:45)):
    %11 = "tensor.empty"() : () -> tensor<1x3x3x1xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed, d1 : compressed, d2 : compressed, d3 : compressed), posWidth = 32, crdWidth = 32 }>> loc("<stdin>":9:11)
    %12 = "linalg.pooling_nhwc_sum"(%arg5, %arg6, %11) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg7: f32 loc("<stdin>":11:10), %arg8: f32 loc("<stdin>":11:22), %arg9: f32 loc("<stdin>":11:34)):
      %13 = "arith.addf"(%arg9, %arg7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":12:13)
      "linalg.yield"(%13) : (f32) -> () loc("<stdin>":13:7)
    }) {linalg.memoized_indexing_maps = [affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1 + d4, d2 + d5, d3)>, affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d5)>, affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>]} : (tensor<1x4x4x1xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed, d1 : compressed, d2 : compressed, d3 : compressed), posWidth = 32, crdWidth = 32 }>>, tensor<2x2xf32>, tensor<1x3x3x1xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed, d1 : compressed, d2 : compressed, d3 : compressed), posWidth = 32, crdWidth = 32 }>>) -> tensor<1x3x3x1xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed, d1 : compressed, d2 : compressed, d3 : compressed), posWidth = 32, crdWidth = 32 }>> loc("<stdin>":10:11)
    "func.return"(%12) : (tensor<1x3x3x1xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed, d1 : compressed, d2 : compressed, d3 : compressed), posWidth = 32, crdWidth = 32 }>>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (tensor<1x4x4x1xf32>, tensor<2x2xf32>) -> tensor<1x3x3x1xf32>, sym_name = "pooling_nhwc_sum"}> ({
  ^bb0(%arg0: tensor<1x4x4x1xf32> loc("<stdin>":18:8), %arg1: tensor<2x2xf32> loc("<stdin>":18:36)):
    %8 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<1x3x3x1xf32>}> : () -> tensor<1x3x3x1xf32> loc("<stdin>":19:10)
    %9 = "linalg.pooling_nhwc_sum"(%arg0, %arg1, %8) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg2: f32 loc("<stdin>":21:10), %arg3: f32 loc("<stdin>":21:22), %arg4: f32 loc("<stdin>":21:34)):
      %10 = "arith.addf"(%arg4, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":22:13)
      "linalg.yield"(%10) : (f32) -> () loc("<stdin>":23:7)
    }) {linalg.memoized_indexing_maps = [affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1 + d4, d2 + d5, d3)>, affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d5)>, affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>]} : (tensor<1x4x4x1xf32>, tensor<2x2xf32>, tensor<1x3x3x1xf32>) -> tensor<1x3x3x1xf32> loc("<stdin>":20:10)
    "func.return"(%9) : (tensor<1x3x3x1xf32>) -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":28:10)
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":29:10)
    %2 = "arith.constant"() <{value = dense<[[1.000000e+00, 0.000000e+00], [0.000000e+00, 1.000000e+00]]> : tensor<2x2xf32>}> : () -> tensor<2x2xf32> loc("<stdin>":30:10)
    %3 = "arith.constant"() <{value = dense<[[[[1.000000e+00], [2.000000e+00], [1.000000e+00], [2.000000e+00]], [[1.000000e+00], [2.000000e+00], [1.000000e+00], [2.000000e+00]], [[1.000000e+00], [2.000000e+00], [1.000000e+00], [2.000000e+00]], [[1.000000e+00], [2.000000e+00], [1.000000e+00], [2.000000e+00]]]]> : tensor<1x4x4x1xf32>}> : () -> tensor<1x4x4x1xf32> loc("<stdin>":31:10)
    %4 = "sparse_tensor.convert"(%3) : (tensor<1x4x4x1xf32>) -> tensor<1x4x4x1xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed, d1 : compressed, d2 : compressed, d3 : compressed), posWidth = 32, crdWidth = 32 }>> loc("<stdin>":32:10)
    %5 = "func.call"(%3, %2) <{callee = @pooling_nhwc_sum}> : (tensor<1x4x4x1xf32>, tensor<2x2xf32>) -> tensor<1x3x3x1xf32> loc("<stdin>":33:10)
    %6 = "func.call"(%4, %2) <{callee = @pooling_nhwc_sum_CCCC}> : (tensor<1x4x4x1xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed, d1 : compressed, d2 : compressed, d3 : compressed), posWidth = 32, crdWidth = 32 }>>, tensor<2x2xf32>) -> tensor<1x3x3x1xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed, d1 : compressed, d2 : compressed, d3 : compressed), posWidth = 32, crdWidth = 32 }>> loc("<stdin>":34:10)
    %7 = "vector.transfer_read"(%5, %0, %0, %0, %0, %1) <{in_bounds = [false, false, false, false], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>}> : (tensor<1x3x3x1xf32>, index, index, index, index, f32) -> vector<1x3x3x1xf32> loc("<stdin>":35:10)
    "vector.print"(%7) <{punctuation = #vector.punctuation<newline>}> : (vector<1x3x3x1xf32>) -> () loc("<stdin>":36:5)
    "sparse_tensor.print"(%6) : (tensor<1x3x3x1xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed, d1 : compressed, d2 : compressed, d3 : compressed), posWidth = 32, crdWidth = 32 }>>) -> () loc("<stdin>":37:5)
    "bufferization.dealloc_tensor"(%4) : (tensor<1x4x4x1xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed, d1 : compressed, d2 : compressed, d3 : compressed), posWidth = 32, crdWidth = 32 }>>) -> () loc("<stdin>":38:5)
    "bufferization.dealloc_tensor"(%6) : (tensor<1x3x3x1xf32, #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed, d1 : compressed, d2 : compressed, d3 : compressed), posWidth = 32, crdWidth = 32 }>>) -> () loc("<stdin>":39:5)
    "bufferization.dealloc_tensor"(%5) : (tensor<1x3x3x1xf32>) -> () loc("<stdin>":40:5)
    "func.return"() : () -> () loc("<stdin>":41:5)
  }) : () -> () loc("<stdin>":27:3)
}) : () -> () loc("<stdin>":6:1)
