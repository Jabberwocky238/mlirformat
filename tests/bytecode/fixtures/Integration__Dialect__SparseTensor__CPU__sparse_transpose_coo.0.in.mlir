"builtin.module"() ({
  "func.func"() <{function_type = (tensor<10x5xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>>) -> tensor<5x10xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>>, sym_name = "transpose_coo"}> ({
  ^bb0(%arg0: tensor<10x5xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>> loc("<stdin>":6:8)):
    %6 = "tensor.empty"() : () -> tensor<5x10xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>> loc("<stdin>":7:10)
    %7 = "linalg.generic"(%arg0, %6) <{indexing_maps = [affine_map<(d0, d1) -> (d1, d0)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32 loc("<stdin>":9:10), %arg2: f32 loc("<stdin>":9:22)):
      "linalg.yield"(%arg1) : (f32) -> () loc("<stdin>":10:7)
    }) : (tensor<10x5xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>>, tensor<5x10xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>>) -> tensor<5x10xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>> loc("<stdin>":8:10)
    "func.return"(%7) : (tensor<5x10xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>>) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":5:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":15:10)
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":16:10)
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":17:10)
    %3 = "arith.constant"() <{value = dense<[[1.000000e+01, 2.000000e+01, 3.000000e+01, 4.000000e+01, 5.000000e+01], [1.100000e+01, 2.100000e+01, 3.100000e+01, 4.100000e+01, 5.100000e+01], [1.200000e+01, 2.200000e+01, 3.200000e+01, 4.200000e+01, 5.200000e+01], [1.300000e+01, 2.300000e+01, 3.300000e+01, 4.300000e+01, 5.300000e+01], [1.400000e+01, 2.400000e+01, 3.400000e+01, 4.400000e+01, 5.400000e+01], [1.500000e+01, 2.500000e+01, 3.500000e+01, 4.500000e+01, 5.500000e+01], [1.600000e+01, 2.600000e+01, 3.600000e+01, 4.600000e+01, 5.600000e+01], [1.700000e+01, 2.700000e+01, 3.700000e+01, 4.700000e+01, 5.700000e+01], [1.800000e+01, 2.800000e+01, 3.800000e+01, 4.800000e+01, 5.800000e+01], [1.900000e+01, 2.900000e+01, 3.900000e+01, 4.900000e+01, 5.900000e+01]]> : tensor<10x5xf32>}> : () -> tensor<10x5xf32> loc("<stdin>":18:10)
    %4 = "sparse_tensor.convert"(%3) : (tensor<10x5xf32>) -> tensor<10x5xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>> loc("<stdin>":19:10)
    %5 = "func.call"(%4) <{callee = @transpose_coo}> : (tensor<10x5xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>>) -> tensor<5x10xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>> loc("<stdin>":20:10)
    "sparse_tensor.print"(%4) : (tensor<10x5xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>>) -> () loc("<stdin>":21:5)
    "sparse_tensor.print"(%5) : (tensor<5x10xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>>) -> () loc("<stdin>":22:5)
    "bufferization.dealloc_tensor"(%4) : (tensor<10x5xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>>) -> () loc("<stdin>":23:5)
    "bufferization.dealloc_tensor"(%5) : (tensor<5x10xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>>) -> () loc("<stdin>":24:5)
    "func.return"() : () -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":14:3)
}) : () -> () loc("<stdin>":4:1)
