"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<f32>) -> tensor<f32>, sym_name = "sparse_dot"}> ({
  ^bb0(%arg0: tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":6:8), %arg1: tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":6:42), %arg2: tensor<f32> loc("<stdin>":6:76)):
    %9 = "linalg.dot"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32 loc("<stdin>":8:10), %arg4: f32 loc("<stdin>":8:22), %arg5: f32 loc("<stdin>":8:34)):
      %10 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":9:13)
      %11 = "arith.addf"(%arg5, %10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":10:13)
      "linalg.yield"(%11) : (f32) -> () loc("<stdin>":11:7)
    }) {linalg.memoized_indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> ()>]} : (tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<f32>) -> tensor<f32> loc("<stdin>":7:10)
    "func.return"(%9) : (tensor<f32>) -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":5:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = sparse<[[0], [1], [22], [23], [1022]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00]> : tensor<1024xf32>}> : () -> tensor<1024xf32> loc("<stdin>":16:10)
    %1 = "arith.constant"() <{value = sparse<[[22], [1022], [1023]], [6.000000e+00, 7.000000e+00, 8.000000e+00]> : tensor<1024xf32>}> : () -> tensor<1024xf32> loc("<stdin>":17:10)
    %2 = "sparse_tensor.convert"(%0) : (tensor<1024xf32>) -> tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":18:10)
    %3 = "sparse_tensor.convert"(%1) : (tensor<1024xf32>) -> tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":19:10)
    "sparse_tensor.print"(%2) : (tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":20:5)
    "sparse_tensor.print"(%3) : (tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":21:5)
    %4 = "tensor.empty"() : () -> tensor<f32> loc("<stdin>":22:10)
    %5 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":23:10)
    %6 = "tensor.insert"(%5, %4) : (f32, tensor<f32>) -> tensor<f32> loc("<stdin>":24:10)
    %7 = "func.call"(%2, %3, %6) <{callee = @sparse_dot}> : (tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<f32>) -> tensor<f32> loc("<stdin>":25:10)
    %8 = "tensor.extract"(%7) : (tensor<f32>) -> f32 loc("<stdin>":26:10)
    "vector.print"(%8) <{punctuation = #vector.punctuation<newline>}> : (f32) -> () loc("<stdin>":27:5)
    "bufferization.dealloc_tensor"(%7) : (tensor<f32>) -> () loc("<stdin>":28:5)
    "bufferization.dealloc_tensor"(%2) : (tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":29:5)
    "bufferization.dealloc_tensor"(%3) : (tensor<1024xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":30:5)
    "func.return"() : () -> () loc("<stdin>":31:5)
  }) : () -> () loc("<stdin>":15:3)
}) : () -> () loc("<stdin>":4:1)
