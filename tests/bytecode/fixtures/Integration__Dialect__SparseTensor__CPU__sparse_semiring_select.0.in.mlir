"builtin.module"() ({
  "func.func"() <{function_type = (tensor<5x5xi1>, tensor<5x5xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<5x5xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<5x5xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, sym_name = "sparse_select"}> ({
  ^bb0(%arg0: tensor<5x5xi1> loc("<stdin>":5:8), %arg1: tensor<5x5xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":5:31), %arg2: tensor<5x5xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":5:64)):
    %8 = "tensor.empty"() : () -> tensor<5x5xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":6:10)
    %9 = "linalg.generic"(%arg0, %arg1, %arg2, %8) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg3: i1 loc("<stdin>":8:10), %arg4: f64 loc("<stdin>":8:21), %arg5: f64 loc("<stdin>":8:33), %arg6: f64 loc("<stdin>":8:45)):
      %10 = "arith.select"(%arg3, %arg4, %arg5) : (i1, f64, f64) -> f64 loc("<stdin>":9:13)
      "linalg.yield"(%10) : (f64) -> () loc("<stdin>":10:7)
    }) : (tensor<5x5xi1>, tensor<5x5xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<5x5xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<5x5xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<5x5xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":7:10)
    "func.return"(%9) : (tensor<5x5xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":4:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":15:10)
    %1 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64 loc("<stdin>":16:10)
    %2 = "arith.constant"() <{value = sparse<[[0, 0], [1, 1], [2, 2], [3, 3], [4, 4]], true> : tensor<5x5xi1>}> : () -> tensor<5x5xi1> loc("<stdin>":17:10)
    %3 = "arith.constant"() <{value = sparse<[[0, 0], [1, 1], [2, 2], [3, 3], [4, 4]], [1.000000e-01, 1.100000e+00, 2.100000e+00, 3.100000e+00, 4.100000e+00]> : tensor<5x5xf64>}> : () -> tensor<5x5xf64> loc("<stdin>":18:10)
    %4 = "arith.constant"() <{value = sparse<[[0, 1], [1, 2], [2, 3], [3, 4], [4, 4]], [1.100000e+00, 2.200000e+00, 3.300000e+00, 4.400000e+00, 5.500000e+00]> : tensor<5x5xf64>}> : () -> tensor<5x5xf64> loc("<stdin>":19:10)
    %5 = "sparse_tensor.convert"(%3) : (tensor<5x5xf64>) -> tensor<5x5xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":20:10)
    %6 = "sparse_tensor.convert"(%4) : (tensor<5x5xf64>) -> tensor<5x5xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":21:10)
    %7 = "func.call"(%2, %5, %6) <{callee = @sparse_select}> : (tensor<5x5xi1>, tensor<5x5xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<5x5xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<5x5xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":22:10)
    "sparse_tensor.print"(%7) : (tensor<5x5xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":23:5)
    "bufferization.dealloc_tensor"(%5) : (tensor<5x5xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":24:5)
    "bufferization.dealloc_tensor"(%6) : (tensor<5x5xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":25:5)
    "bufferization.dealloc_tensor"(%7) : (tensor<5x5xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":26:5)
    "func.return"() : () -> () loc("<stdin>":27:5)
  }) : () -> () loc("<stdin>":14:3)
}) : () -> () loc("<stdin>":3:1)
