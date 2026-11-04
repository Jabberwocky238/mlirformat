#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<10x5xf32, #sparse>) -> tensor<5x10xf32, #sparse>, sym_name = "transpose_coo"}> ({
  ^bb0(%arg0: tensor<10x5xf32, #sparse>):
    %6 = "tensor.empty"() : () -> tensor<5x10xf32, #sparse>
    %7 = "linalg.generic"(%arg0, %6) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      "linalg.yield"(%arg1) : (f32) -> ()
    }) : (tensor<10x5xf32, #sparse>, tensor<5x10xf32, #sparse>) -> tensor<5x10xf32, #sparse>
    "func.return"(%7) : (tensor<5x10xf32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = dense<[[1.000000e+01, 2.000000e+01, 3.000000e+01, 4.000000e+01, 5.000000e+01], [1.100000e+01, 2.100000e+01, 3.100000e+01, 4.100000e+01, 5.100000e+01], [1.200000e+01, 2.200000e+01, 3.200000e+01, 4.200000e+01, 5.200000e+01], [1.300000e+01, 2.300000e+01, 3.300000e+01, 4.300000e+01, 5.300000e+01], [1.400000e+01, 2.400000e+01, 3.400000e+01, 4.400000e+01, 5.400000e+01], [1.500000e+01, 2.500000e+01, 3.500000e+01, 4.500000e+01, 5.500000e+01], [1.600000e+01, 2.600000e+01, 3.600000e+01, 4.600000e+01, 5.600000e+01], [1.700000e+01, 2.700000e+01, 3.700000e+01, 4.700000e+01, 5.700000e+01], [1.800000e+01, 2.800000e+01, 3.800000e+01, 4.800000e+01, 5.800000e+01], [1.900000e+01, 2.900000e+01, 3.900000e+01, 4.900000e+01, 5.900000e+01]]> : tensor<10x5xf32>}> : () -> tensor<10x5xf32>
    %4 = "sparse_tensor.convert"(%3) : (tensor<10x5xf32>) -> tensor<10x5xf32, #sparse>
    %5 = "func.call"(%4) <{callee = @transpose_coo}> : (tensor<10x5xf32, #sparse>) -> tensor<5x10xf32, #sparse>
    "sparse_tensor.print"(%4) : (tensor<10x5xf32, #sparse>) -> ()
    "sparse_tensor.print"(%5) : (tensor<5x10xf32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<10x5xf32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<5x10xf32, #sparse>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

