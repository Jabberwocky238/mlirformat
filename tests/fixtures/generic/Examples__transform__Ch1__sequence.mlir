#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map3 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<512x512xf32>, tensor<512x512xf32>, tensor<512x512xf32>, tensor<512x512xf32>) -> tensor<512x512xf32>, sym_name = "fc_relu"}> ({
  ^bb0(%arg3: tensor<512x512xf32>, %arg4: tensor<512x512xf32>, %arg5: tensor<512x512xf32>, %arg6: tensor<512x512xf32>):
    %9 = "linalg.matmul"(%arg3, %arg4, %arg6) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg13: f32, %arg14: f32, %arg15: f32):
      %15 = "arith.mulf"(%arg13, %arg14) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %16 = "arith.addf"(%arg15, %15) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%16) : (f32) -> ()
    }) : (tensor<512x512xf32>, tensor<512x512xf32>, tensor<512x512xf32>) -> tensor<512x512xf32>
    %10 = "linalg.elementwise"(%9, %arg5, %arg6) <{indexing_maps = [#map3, #map3, #map3], kind = #linalg.elementwise_kind<add>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg10: f32, %arg11: f32, %arg12: f32):
      %14 = "arith.addf"(%arg10, %arg11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%14) : (f32) -> ()
    }) : (tensor<512x512xf32>, tensor<512x512xf32>, tensor<512x512xf32>) -> tensor<512x512xf32>
    %11 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<512x512xf32>}> : () -> tensor<512x512xf32>
    %12 = "linalg.elementwise"(%10, %11, %arg6) <{indexing_maps = [#map3, #map3, #map3], kind = #linalg.elementwise_kind<max_signed>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg7: f32, %arg8: f32, %arg9: f32):
      %13 = "arith.maximumf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%13) : (f32) -> ()
    }) : (tensor<512x512xf32>, tensor<512x512xf32>, tensor<512x512xf32>) -> tensor<512x512xf32>
    "func.return"(%12) : (tensor<512x512xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<4x512xf32>, tensor<512x4xf32>, tensor<4x4xf32>, tensor<4x4xf32>, tensor<4x4xf32>) -> tensor<4x4xf32>, sym_name = "microkernel", sym_visibility = "private"}> ({
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op, !transform.op<"linalg.matmul">, !transform.op<"linalg.elementwise">) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op, %arg1: !transform.op<"linalg.matmul">, %arg2: !transform.op<"linalg.elementwise">):
      %0:2 = "transform.split_handle"(%arg2) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.op<"linalg.elementwise">) -> (!transform.any_op, !transform.any_op)
      %1:2 = "transform.structured.tile_using_forall"(%0#1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0, 0>, static_tile_sizes = array<i64: 8, 32>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %2:2 = "transform.structured.fuse_into_containing_op"(%0#0, %1#1) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      %3:2 = "transform.structured.fuse_into_containing_op"(%arg1, %2#1) : (!transform.op<"linalg.matmul">, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      %4:2 = "transform.structured.tile_using_forall"(%2#0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0, 0>, static_tile_sizes = array<i64: 4, 4>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %5:2 = "transform.structured.fuse_into_containing_op"(%3#0, %4#1) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      %6:2 = "transform.structured.tile_using_forall"(%4#0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0, 0>, static_tile_sizes = array<i64: 1>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %7:2 = "transform.structured.fuse_into_containing_op"(%5#0, %6#1) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      %8:2 = "transform.loop.outline"(%7#1) <{func_name = "outlined"}> : (!transform.any_op) -> (!transform.any_op, !transform.op<"func.call">)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

