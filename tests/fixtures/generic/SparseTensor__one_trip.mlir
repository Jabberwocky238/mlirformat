#map = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1xf32, #sparse>) -> tensor<1x1xf32, #sparse>, sym_name = "sparse_scale"}> ({
  ^bb0(%arg0: tensor<1x1xf32, #sparse>):
    %0 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %1 = "linalg.generic"(%arg0) <{doc = "X(i,j) = X(i,j) * 2.0", indexing_maps = [#map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg1: f32):
      %2 = "arith.mulf"(%arg1, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<1x1xf32, #sparse>) -> tensor<1x1xf32, #sparse>
    "func.return"(%1) : (tensor<1x1xf32, #sparse>) -> ()
  }) : () -> ()
}) : () -> ()

