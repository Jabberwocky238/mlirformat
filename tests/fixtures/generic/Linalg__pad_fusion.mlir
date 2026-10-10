#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, index, index, index, index, f32) -> tensor<?x?xf32>, sym_name = "dynamic_pad_fusion"}> ({
  ^bb0(%arg0: tensor<?x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: f32):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "tensor.dim"(%arg0, %0) : (tensor<?x?xf32>, index) -> index
    %3 = "tensor.dim"(%arg0, %1) : (tensor<?x?xf32>, index) -> index
    %4 = "tensor.empty"(%2, %3) : (index, index) -> tensor<?x?xf32>
    %5 = "linalg.generic"(%arg0, %4) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg8: f32, %arg9: f32):
      %7 = "arith.mulf"(%arg8, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%7) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %6 = "tensor.pad"(%5, %arg1, %arg2, %arg3, %arg4) <{operandSegmentSizes = array<i32: 1, 2, 2>, static_high = array<i64: -9223372036854775808, -9223372036854775808>, static_low = array<i64: -9223372036854775808, -9223372036854775808>}> ({
    ^bb0(%arg6: index, %arg7: index):
      "tensor.yield"(%arg5) : (f32) -> ()
    }) : (tensor<?x?xf32>, index, index, index, index) -> tensor<?x?xf32>
    "func.return"(%6) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x42xf32>, index, index, f32) -> tensor<49x?xf32>, sym_name = "mixed_pad_fusion"}> ({
  ^bb0(%arg0: tensor<?x42xf32>, %arg1: index, %arg2: index, %arg3: f32):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "tensor.dim"(%arg0, %0) : (tensor<?x42xf32>, index) -> index
    %2 = "tensor.empty"(%1) : (index) -> tensor<42x?xf32>
    %3 = "linalg.generic"(%arg0, %2) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32):
      %5 = "arith.mulf"(%arg6, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (tensor<?x42xf32>, tensor<42x?xf32>) -> tensor<42x?xf32>
    %4 = "tensor.pad"(%3, %arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 1>, static_high = array<i64: 4, -9223372036854775808>, static_low = array<i64: 3, -9223372036854775808>}> ({
    ^bb0(%arg4: index, %arg5: index):
      "tensor.yield"(%arg3) : (f32) -> ()
    }) : (tensor<42x?xf32>, index, index) -> tensor<49x?xf32>
    "func.return"(%4) : (tensor<49x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

