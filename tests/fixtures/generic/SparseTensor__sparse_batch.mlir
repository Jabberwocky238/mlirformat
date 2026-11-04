#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : batch, d1 : dense, d2 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x4x2xf32, #sparse>) -> tensor<8x4x2xf32>, sym_name = "main"}> ({
  ^bb0(%arg0: tensor<8x4x2xf32, #sparse>):
    %0 = "tensor.empty"() : () -> tensor<8x4x2xf32>
    %1 = "linalg.generic"(%arg0, %0) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      %2 = "arith.negf"(%arg1) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<8x4x2xf32, #sparse>, tensor<8x4x2xf32>) -> tensor<8x4x2xf32>
    "func.return"(%1) : (tensor<8x4x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

