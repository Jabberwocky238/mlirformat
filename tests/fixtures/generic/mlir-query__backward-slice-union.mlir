#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<5x5xf32>, tensor<5x5xf32>) -> (), sym_name = "slice_use_from_above"}> ({
  ^bb0(%arg0: tensor<5x5xf32>, %arg1: tensor<5x5xf32>):
    %0 = "linalg.generic"(%arg0, %arg1) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32):
      %6 = "arith.addf"(%arg4, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%6) : (f32) -> ()
    }) : (tensor<5x5xf32>, tensor<5x5xf32>) -> tensor<5x5xf32>
    %1 = "tensor.collapse_shape"(%0) <{reassociation = [[0, 1]]}> : (tensor<5x5xf32>) -> tensor<25xf32>
    %2 = "linalg.generic"(%0, %arg1) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %3 = "arith.constant"() <{value = 2 : index}> : () -> index
      %4 = "tensor.extract"(%1, %3) : (tensor<25xf32>, index) -> f32
      %5 = "arith.addf"(%4, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (tensor<5x5xf32>, tensor<5x5xf32>) -> tensor<5x5xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

