#map = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<5x5xi1>, tensor<5x5xf64, #sparse>, tensor<5x5xf64, #sparse>) -> tensor<5x5xf64, #sparse>, sym_name = "sparse_select"}> ({
  ^bb0(%arg0: tensor<5x5xi1>, %arg1: tensor<5x5xf64, #sparse>, %arg2: tensor<5x5xf64, #sparse>):
    %8 = "tensor.empty"() : () -> tensor<5x5xf64, #sparse>
    %9 = "linalg.generic"(%arg0, %arg1, %arg2, %8) <{indexing_maps = [#map, #map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg3: i1, %arg4: f64, %arg5: f64, %arg6: f64):
      %10 = "arith.select"(%arg3, %arg4, %arg5) : (i1, f64, f64) -> f64
      "linalg.yield"(%10) : (f64) -> ()
    }) : (tensor<5x5xi1>, tensor<5x5xf64, #sparse>, tensor<5x5xf64, #sparse>, tensor<5x5xf64, #sparse>) -> tensor<5x5xf64, #sparse>
    "func.return"(%9) : (tensor<5x5xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %2 = "arith.constant"() <{value = sparse<[[0, 0], [1, 1], [2, 2], [3, 3], [4, 4]], true> : tensor<5x5xi1>}> : () -> tensor<5x5xi1>
    %3 = "arith.constant"() <{value = sparse<[[0, 0], [1, 1], [2, 2], [3, 3], [4, 4]], [1.000000e-01, 1.100000e+00, 2.100000e+00, 3.100000e+00, 4.100000e+00]> : tensor<5x5xf64>}> : () -> tensor<5x5xf64>
    %4 = "arith.constant"() <{value = sparse<[[0, 1], [1, 2], [2, 3], [3, 4], [4, 4]], [1.100000e+00, 2.200000e+00, 3.300000e+00, 4.400000e+00, 5.500000e+00]> : tensor<5x5xf64>}> : () -> tensor<5x5xf64>
    %5 = "sparse_tensor.convert"(%3) : (tensor<5x5xf64>) -> tensor<5x5xf64, #sparse>
    %6 = "sparse_tensor.convert"(%4) : (tensor<5x5xf64>) -> tensor<5x5xf64, #sparse>
    %7 = "func.call"(%2, %5, %6) <{callee = @sparse_select}> : (tensor<5x5xi1>, tensor<5x5xf64, #sparse>, tensor<5x5xf64, #sparse>) -> tensor<5x5xf64, #sparse>
    "sparse_tensor.print"(%7) : (tensor<5x5xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<5x5xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%6) : (tensor<5x5xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%7) : (tensor<5x5xf64, #sparse>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

