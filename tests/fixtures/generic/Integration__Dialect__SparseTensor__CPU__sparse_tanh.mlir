#map = affine_map<(d0) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>, sym_name = "sparse_tanh"}> ({
  ^bb0(%arg0: tensor<?xf64, #sparse>):
    %3 = "linalg.generic"(%arg0) <{doc = "X(i) = OP X(i)", indexing_maps = [#map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg1: f64):
      %4 = "math.tanh"(%arg1) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64
      "linalg.yield"(%4) : (f64) -> ()
    }) : (tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>
    "func.return"(%3) : (tensor<?xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = sparse<[[0], [3], [11], [17], [20], [21], [28], [29], [31]], [-1.000000e+00, 1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 1.000000e+02]> : tensor<32xf64>}> : () -> tensor<32xf64>
    %1 = "sparse_tensor.convert"(%0) : (tensor<32xf64>) -> tensor<?xf64, #sparse>
    %2 = "func.call"(%1) <{callee = @sparse_tanh}> : (tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>
    "sparse_tensor.print"(%2) : (tensor<?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%1) : (tensor<?xf64, #sparse>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

