#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf32>, tensor<?xf32>) -> tensor<?x?xf32>, sym_name = "control_producer_reshape_fusion"}> ({
  ^bb0(%arg0: tensor<?x?x?xf32>, %arg1: tensor<?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "tensor.collapse_shape"(%arg0) <{reassociation = [[0, 1], [2]]}> : (tensor<?x?x?xf32>) -> tensor<?x?xf32>
    %3 = "tensor.dim"(%2, %0) : (tensor<?x?xf32>, index) -> index
    %4 = "tensor.dim"(%2, %1) : (tensor<?x?xf32>, index) -> index
    %5 = "tensor.empty"(%3, %4) : (index, index) -> tensor<?x?xf32>
    %6 = "linalg.generic"(%2, %arg1, %5) <{indexing_maps = [#map, #map1, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %7 = "arith.addf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%7) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%6) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map3 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x?x?xf32>, tensor<1x?x?xf32>) -> tensor<1x?x?xf32>, sym_name = "control_consumer_reshape_fusion"}> ({
  ^bb0(%arg0: tensor<1x?x?xf32>, %arg1: tensor<1x?x?xf32>):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 2 : index}> : () -> index
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %3 = "tensor.dim"(%arg0, %0) : (tensor<1x?x?xf32>, index) -> index
    %4 = "tensor.dim"(%arg1, %1) : (tensor<1x?x?xf32>, index) -> index
    %5 = "tensor.empty"(%3, %4) : (index, index) -> tensor<?x?xf32>
    %6 = "linalg.generic"(%5) <{indexing_maps = [#map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg5: f32):
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<?x?xf32>) -> tensor<?x?xf32>
    %7 = "tensor.expand_shape"(%6, %3, %4) <{reassociation = [[0, 1], [2]], static_output_shape = array<i64: 1, -9223372036854775808, -9223372036854775808>}> : (tensor<?x?xf32>, index, index) -> tensor<1x?x?xf32>
    %8 = "linalg.batch_matmul"(%arg0, %arg1, %7) <{indexing_maps = [#map1, #map2, #map3], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %9 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %10 = "arith.addf"(%arg4, %9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%10) : (f32) -> ()
    }) : (tensor<1x?x?xf32>, tensor<1x?x?xf32>, tensor<1x?x?xf32>) -> tensor<1x?x?xf32>
    "func.return"(%8) : (tensor<1x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

