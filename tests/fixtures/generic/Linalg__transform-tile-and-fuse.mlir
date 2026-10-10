#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map3 = affine_map<(d0, d1) -> (d0)>
#map4 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?xf32>, tensor<?x?xf32>, index, index) -> tensor<?x?xf32>, sym_name = "foo"}> ({
  ^bb0(%arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>, %arg3: tensor<?xf32>, %arg4: tensor<?x?xf32>, %arg5: index, %arg6: index):
    %4 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %5 = "linalg.fill"(%4, %arg4) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg13: f32, %arg14: f32):
      "linalg.yield"(%arg13) : (f32) -> ()
    }) {__producer__} : (f32, tensor<?x?xf32>) -> tensor<?x?xf32>
    %6 = "linalg.matmul"(%arg1, %arg2, %5) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg10: f32, %arg11: f32, %arg12: f32):
      %11 = "arith.mulf"(%arg10, %arg11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %12 = "arith.addf"(%arg12, %11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%12) : (f32) -> ()
    }) {__producer__} : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %7 = "linalg.generic"(%arg3, %6, %arg4) <{indexing_maps = [#map3, #map4, #map4], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg7: f32, %arg8: f32, %arg9: f32):
      %8 = "arith.maximumf"(%arg8, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %9 = "arith.cmpf"(%arg7, %4) <{fastmath = #arith.fastmath<none>, predicate = 2 : i64}> : (f32, f32) -> i1
      %10 = "arith.select"(%9, %4, %8) : (i1, f32, f32) -> f32
      "linalg.yield"(%10) : (f32) -> ()
    }) {__root__} : (tensor<?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%7) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{op_attrs = {__root__}}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg0) <{op_attrs = {__producer__}}> : (!transform.any_op) -> !transform.any_op
      %2:2 = "transform.structured.tile_using_forall"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0, 0>, static_num_threads = array<i64: 10, 20>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %3:2 = "transform.structured.fuse_into_containing_op"(%1, %2#1) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map3 = affine_map<(d0, d1) -> (d0)>
#map4 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?xf32>, tensor<?x?xf32>, index, index) -> tensor<?x?xf32>, sym_name = "foo"}> ({
  ^bb0(%arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>, %arg3: tensor<?xf32>, %arg4: tensor<?x?xf32>, %arg5: index, %arg6: index):
    %5 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %6 = "linalg.fill"(%5, %arg4) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg13: f32, %arg14: f32):
      "linalg.yield"(%arg13) : (f32) -> ()
    }) {__producer__} : (f32, tensor<?x?xf32>) -> tensor<?x?xf32>
    %7 = "linalg.matmul"(%arg1, %arg2, %6) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg10: f32, %arg11: f32, %arg12: f32):
      %12 = "arith.mulf"(%arg10, %arg11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %13 = "arith.addf"(%arg12, %12) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%13) : (f32) -> ()
    }) {__producer__} : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %8 = "linalg.generic"(%arg3, %7, %arg4) <{indexing_maps = [#map3, #map4, #map4], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg7: f32, %arg8: f32, %arg9: f32):
      %9 = "arith.maximumf"(%arg8, %5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %10 = "arith.cmpf"(%arg7, %5) <{fastmath = #arith.fastmath<none>, predicate = 2 : i64}> : (f32, f32) -> i1
      %11 = "arith.select"(%10, %5, %9) : (i1, f32, f32) -> f32
      "linalg.yield"(%11) : (f32) -> ()
    }) {__root__} : (tensor<?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%8) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{op_attrs = {__root__}}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg0) <{op_attrs = {__producer__}}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.test_reverse_payload_ops"(%1) : (!transform.any_op) -> !transform.any_op
      %3:2 = "transform.structured.tile_using_forall"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0, 0>, static_num_threads = array<i64: 10, 20>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %4:2 = "transform.structured.fuse_into_containing_op"(%2, %3#1) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

