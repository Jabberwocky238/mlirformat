"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, sym_name = "sparse_mult_elt"}> ({
  ^bb0(%arg0: tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":5:8), %arg1: tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":5:43)):
    %7 = "tensor.empty"() : () -> tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":6:10)
    %8 = "linalg.generic"(%arg0, %arg1, %7) <{doc = "X(i,j) = A(i,j) * B(i,j)", indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32 loc("<stdin>":8:10), %arg3: f32 loc("<stdin>":8:22), %arg4: f32 loc("<stdin>":8:34)):
      %9 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":9:12)
      "linalg.yield"(%9) : (f32) -> () loc("<stdin>":10:7)
    }) : (tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":7:10)
    "func.return"(%8) : (tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":4:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":15:10)
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":16:10)
    %2 = "arith.constant"() <{value = sparse<[[2, 2], [15, 15], [31, 0], [31, 14]], [2.000000e+00, 3.000000e+00, -2.000000e+00, 4.000000e+00]> : tensor<32x16xf32>}> : () -> tensor<32x16xf32> loc("<stdin>":17:10)
    %3 = "arith.constant"() <{value = sparse<[[1, 1], [2, 0], [2, 2], [2, 15], [31, 0], [31, 15]], [5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00, -1.000000e+01, 9.000000e+00]> : tensor<32x16xf32>}> : () -> tensor<32x16xf32> loc("<stdin>":18:10)
    %4 = "sparse_tensor.convert"(%2) : (tensor<32x16xf32>) -> tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":19:10)
    %5 = "sparse_tensor.convert"(%3) : (tensor<32x16xf32>) -> tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":20:10)
    %6 = "func.call"(%4, %5) <{callee = @sparse_mult_elt}> : (tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":21:10)
    "sparse_tensor.print"(%6) : (tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":22:5)
    "bufferization.dealloc_tensor"(%4) : (tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":23:5)
    "bufferization.dealloc_tensor"(%5) : (tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":24:5)
    "bufferization.dealloc_tensor"(%6) : (tensor<32x16xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":25:5)
    "func.return"() : () -> () loc("<stdin>":26:5)
  }) : () -> () loc("<stdin>":14:3)
}) : () -> () loc("<stdin>":3:1)
