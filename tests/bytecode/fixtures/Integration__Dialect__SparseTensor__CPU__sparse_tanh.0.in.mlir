"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, sym_name = "sparse_tanh"}> ({
  ^bb0(%arg0: tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":5:8)):
    %3 = "linalg.generic"(%arg0) <{doc = "X(i) = OP X(i)", indexing_maps = [affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg1: f64 loc("<stdin>":7:10)):
      %4 = "math.tanh"(%arg1) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64 loc("<stdin>":8:12)
      "linalg.yield"(%4) : (f64) -> () loc("<stdin>":9:7)
    }) : (tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":6:10)
    "func.return"(%3) : (tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":4:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = sparse<[[0], [3], [11], [17], [20], [21], [28], [29], [31]], [-1.000000e+00, 1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 1.000000e+02]> : tensor<32xf64>}> : () -> tensor<32xf64> loc("<stdin>":14:10)
    %1 = "sparse_tensor.convert"(%0) : (tensor<32xf64>) -> tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":15:10)
    %2 = "func.call"(%1) <{callee = @sparse_tanh}> : (tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":16:10)
    "sparse_tensor.print"(%2) : (tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":17:5)
    "bufferization.dealloc_tensor"(%1) : (tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":18:5)
    "func.return"() : () -> () loc("<stdin>":19:5)
  }) : () -> () loc("<stdin>":13:3)
}) : () -> () loc("<stdin>":3:1)
