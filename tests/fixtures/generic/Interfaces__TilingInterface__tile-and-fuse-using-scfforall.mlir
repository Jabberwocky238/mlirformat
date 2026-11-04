#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "gemm_fill_fusion"}> ({
  ^bb0(%arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>):
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1 : index}> : () -> index
    %4 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %5 = "tensor.dim"(%arg1, %2) : (tensor<?x?xf32>, index) -> index
    %6 = "tensor.dim"(%arg2, %3) : (tensor<?x?xf32>, index) -> index
    %7 = "tensor.empty"(%5, %6) : (index, index) -> tensor<?x?xf32>
    %8 = "linalg.fill"(%4, %7) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32):
      "linalg.yield"(%arg6) : (f32) -> ()
    }) : (f32, tensor<?x?xf32>) -> tensor<?x?xf32>
    %9 = "linalg.matmul"(%arg1, %arg2, %8) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %10 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %11 = "arith.addf"(%arg5, %10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%11) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%9) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.test.fuse_using_forall"(%0) <{tile_sizes = [10, 20]}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map3 = affine_map<(d0, d1) -> (d0, d1)>
#map4 = affine_map<(d0, d1) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?xf32>) -> tensor<?x?xf32>, sym_name = "gemm_generic_fusion"}> ({
  ^bb0(%arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>, %arg3: tensor<?xf32>):
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1 : index}> : () -> index
    %4 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %5 = "tensor.dim"(%arg1, %2) : (tensor<?x?xf32>, index) -> index
    %6 = "tensor.dim"(%arg2, %3) : (tensor<?x?xf32>, index) -> index
    %7 = "tensor.empty"(%5, %6) : (index, index) -> tensor<?x?xf32>
    %8 = "linalg.fill"(%4, %7) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg10: f32, %arg11: f32):
      "linalg.yield"(%arg10) : (f32) -> ()
    }) : (f32, tensor<?x?xf32>) -> tensor<?x?xf32>
    %9 = "linalg.matmul"(%arg1, %arg2, %8) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg7: f32, %arg8: f32, %arg9: f32):
      %12 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %13 = "arith.addf"(%arg9, %12) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%13) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %10 = "linalg.generic"(%9, %arg3, %7) <{indexing_maps = [#map3, #map4, #map3], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %11 = "arith.addf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%11) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%10) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.test.fuse_using_forall"(%0) <{tile_sizes = [10, 20]}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<30x3xf32>) -> tensor<30x3xf32>, sym_name = "reduction_sequence"}> ({
  ^bb0(%arg1: tensor<30x3xf32>):
    %3 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %4 = "arith.constant"() <{value = 0xFF800000 : f32}> : () -> f32
    %5 = "tensor.empty"() : () -> tensor<30xf32>
    %6 = "linalg.fill"(%4, %5) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg13: f32, %arg14: f32):
      "linalg.yield"(%arg13) : (f32) -> ()
    }) : (f32, tensor<30xf32>) -> tensor<30xf32>
    %7 = "linalg.generic"(%arg1, %6) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg11: f32, %arg12: f32):
      %16 = "arith.maximumf"(%arg12, %arg11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%16) : (f32) -> ()
    }) : (tensor<30x3xf32>, tensor<30xf32>) -> tensor<30xf32>
    %8 = "tensor.empty"() : () -> tensor<30x3xf32>
    %9 = "linalg.fill"(%3, %5) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg9: f32, %arg10: f32):
      "linalg.yield"(%arg9) : (f32) -> ()
    }) : (f32, tensor<30xf32>) -> tensor<30xf32>
    %10:2 = "linalg.generic"(%arg1, %7, %9, %8) <{indexing_maps = [#map, #map1, #map1, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 2>}> ({
    ^bb0(%arg5: f32, %arg6: f32, %arg7: f32, %arg8: f32):
      %13 = "arith.subf"(%arg5, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %14 = "math.exp"(%13) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      %15 = "arith.addf"(%arg7, %14) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%15, %14) : (f32, f32) -> ()
    }) : (tensor<30x3xf32>, tensor<30xf32>, tensor<30xf32>, tensor<30x3xf32>) -> (tensor<30xf32>, tensor<30x3xf32>)
    %11 = "linalg.generic"(%10#1, %10#0, %8) <{indexing_maps = [#map, #map1, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %12 = "arith.divf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%12) : (f32) -> ()
    }) : (tensor<30x3xf32>, tensor<30xf32>, tensor<30x3xf32>) -> tensor<30x3xf32>
    "func.return"(%11) : (tensor<30x3xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.split_handle"(%0) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %2:2 = "transform.test.fuse_using_forall"(%1#2) <{tile_sizes = [10]}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

