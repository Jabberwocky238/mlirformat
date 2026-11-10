#map = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x32xf32, #sparse>, tensor<32x32xf32, #sparse>) -> tensor<32x32xf32>, sym_name = "tensor_add"}> ({
  ^bb0(%arg0: tensor<32x32xf32, #sparse>, %arg1: tensor<32x32xf32, #sparse>):
    %0 = "tensor.empty"() : () -> tensor<32x32xf32>
    %1 = "linalg.generic"(%arg0, %arg1, %0) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %2 = "arith.addf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<32x32xf32, #sparse>, tensor<32x32xf32, #sparse>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "func.return"(%1) : (tensor<32x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

