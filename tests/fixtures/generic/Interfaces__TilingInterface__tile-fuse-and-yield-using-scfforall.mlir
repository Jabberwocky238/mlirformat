#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> (tensor<?x?xf32>, tensor<?x?xf32>), sym_name = "gemm_gemm_fusion_yield_both"}> ({
  ^bb0(%arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>, %arg3: tensor<?x?xf32>, %arg4: tensor<?x?xf32>, %arg5: tensor<?x?xf32>):
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 1 : index}> : () -> index
    %5 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %6 = "tensor.dim"(%arg1, %3) : (tensor<?x?xf32>, index) -> index
    %7 = "tensor.dim"(%arg2, %4) : (tensor<?x?xf32>, index) -> index
    %8 = "linalg.fill"(%5, %arg4) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg14: f32, %arg15: f32):
      "linalg.yield"(%arg14) : (f32) -> ()
    }) : (f32, tensor<?x?xf32>) -> tensor<?x?xf32>
    %9 = "linalg.matmul"(%arg1, %arg2, %8) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg11: f32, %arg12: f32, %arg13: f32):
      %15 = "arith.mulf"(%arg11, %arg12) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %16 = "arith.addf"(%arg13, %15) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%16) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %10 = "tensor.dim"(%arg3, %4) : (tensor<?x?xf32>, index) -> index
    %11 = "linalg.fill"(%5, %arg5) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg9: f32, %arg10: f32):
      "linalg.yield"(%arg9) : (f32) -> ()
    }) : (f32, tensor<?x?xf32>) -> tensor<?x?xf32>
    %12 = "linalg.matmul"(%9, %arg3, %11) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32, %arg8: f32):
      %13 = "arith.mulf"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %14 = "arith.addf"(%arg8, %13) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%14) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%9, %12) : (tensor<?x?xf32>, tensor<?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.split_handle"(%0) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %2:2 = "transform.test.fuse_and_yield"(%1#1) <{tile_interchange = [], tile_sizes = [10], use_forall = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x1024xf32>) -> (tensor<32x1024xf32>, tensor<2x512x16x2xi8>), sym_name = "fuse_pack_consumer_into_multi_output_generic"}> ({
  ^bb0(%arg1: tensor<32x1024xf32>):
    %2 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %3 = "tensor.empty"() : () -> tensor<32x1024xf32>
    %4 = "tensor.empty"() : () -> tensor<32x1024xi8>
    %5 = "tensor.empty"() : () -> tensor<2x512x16x2xi8>
    %6:2 = "linalg.generic"(%arg1, %3, %4) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 2>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: i8):
      %8 = "arith.fptoui"(%arg2) : (f32) -> i8
      "linalg.yield"(%arg2, %8) : (f32, i8) -> ()
    }) : (tensor<32x1024xf32>, tensor<32x1024xf32>, tensor<32x1024xi8>) -> (tensor<32x1024xf32>, tensor<32x1024xi8>)
    %7 = "linalg.pack"(%6#1, %5, %2) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_inner_tiles = array<i64: 16, 2>}> : (tensor<32x1024xi8>, tensor<2x512x16x2xi8>, i8) -> tensor<2x512x16x2xi8>
    "func.return"(%6#0, %7) : (tensor<32x1024xf32>, tensor<2x512x16x2xi8>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.pack"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.test.fuse_and_yield"(%0) <{tile_interchange = [], tile_sizes = [1], use_forall = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

