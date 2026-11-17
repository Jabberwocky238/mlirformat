"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>>) -> tensor<1x1xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>>, sym_name = "sparse_scale"}> ({
  ^bb0(%arg0: tensor<1x1xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>> loc("<stdin>":5:8)):
    %0 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32 loc("<stdin>":6:10)
    %1 = "linalg.generic"(%arg0) <{doc = "X(i,j) = X(i,j) * 2.0", indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg1: f32 loc("<stdin>":8:10)):
      %2 = "arith.mulf"(%arg1, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":9:12)
      "linalg.yield"(%2) : (f32) -> () loc("<stdin>":10:7)
    }) : (tensor<1x1xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>>) -> tensor<1x1xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>> loc("<stdin>":7:10)
    "func.return"(%1) : (tensor<1x1xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>>) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":4:3)
}) : () -> () loc("<stdin>":3:1)
