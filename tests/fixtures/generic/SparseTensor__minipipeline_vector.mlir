#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32, #sparse>, tensor<f32>) -> tensor<f32>, sym_name = "sum_reduction"}> ({
  ^bb0(%arg0: tensor<?xf32, #sparse>, %arg1: tensor<f32>):
    %0 = "linalg.generic"(%arg0, %arg1) <{doc = "x += SUM_i a(i)", indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %1 = "arith.addf"(%arg3, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (tensor<?xf32, #sparse>, tensor<f32>) -> tensor<f32>
    "func.return"(%0) : (tensor<f32>) -> ()
  }) : () -> ()
}) : () -> ()

