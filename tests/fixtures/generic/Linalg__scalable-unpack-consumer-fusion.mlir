#map = affine_map<(d0)[s0, s1] -> (-d0 + s1, s0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x?xf32>, tensor<32x?xf32>, tensor<32x?xf32>) -> tensor<?xf32>, sym_name = "fuse_scalable_unpack_consumer"}> ({
  ^bb0(%arg3: tensor<32x?xf32>, %arg4: tensor<32x?xf32>, %arg5: tensor<32x?xf32>):
    %9 = "arith.constant"() <{value = 0 : index}> : () -> index
    %10 = "arith.constant"() <{value = 1 : index}> : () -> index
    %11 = "arith.constant"() <{value = 8 : index}> : () -> index
    %12 = "vector.vscale"() : () -> index
    %13 = "arith.muli"(%11, %12) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %14 = "tensor.dim"(%arg5, %10) : (tensor<32x?xf32>, index) -> index
    %15 = "scf.for"(%9, %14, %13, %arg5) ({
    ^bb0(%arg6: index, %arg7: tensor<32x?xf32>):
      %18 = "affine.min"(%arg6, %13, %14) <{map = #map}> : (index, index, index) -> index
      %19 = "tensor.extract_slice"(%arg3, %arg6, %18) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: 0, -9223372036854775808>, static_sizes = array<i64: 32, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<32x?xf32>, index, index) -> tensor<32x?xf32>
      %20 = "tensor.extract_slice"(%arg4, %arg6, %18) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: 0, -9223372036854775808>, static_sizes = array<i64: 32, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<32x?xf32>, index, index) -> tensor<32x?xf32>
      %21 = "tensor.extract_slice"(%arg7, %arg6, %18) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: 0, -9223372036854775808>, static_sizes = array<i64: 32, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<32x?xf32>, index, index) -> tensor<32x?xf32>
      %22 = "linalg.generic"(%19, %20, %21) <{indexing_maps = [#map1, #map1, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
      ^bb0(%arg8: f32, %arg9: f32, %arg10: f32):
        %24 = "arith.mulf"(%arg8, %arg9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "linalg.yield"(%24) : (f32) -> ()
      }) : (tensor<32x?xf32>, tensor<32x?xf32>, tensor<32x?xf32>) -> tensor<32x?xf32>
      %23 = "tensor.insert_slice"(%22, %arg7, %arg6, %18) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 0>, static_offsets = array<i64: 0, -9223372036854775808>, static_sizes = array<i64: 32, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<32x?xf32>, tensor<32x?xf32>, index, index) -> tensor<32x?xf32>
      "scf.yield"(%23) : (tensor<32x?xf32>) -> ()
    }) : (index, index, index, tensor<32x?xf32>) -> tensor<32x?xf32>
    %16 = "tensor.empty"(%14) : (index) -> tensor<?xf32>
    %17 = "linalg.unpack"(%15, %16, %13) <{inner_dims_pos = array<i64: 0>, outer_dims_perm = array<i64: 0>, static_inner_tiles = array<i64: -9223372036854775808>}> {operandSegmentSizes = array<i32: 1, 1, 0, 1>} : (tensor<32x?xf32>, tensor<?xf32>, index) -> tensor<?xf32>
    "func.return"(%17) : (tensor<?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg2: !transform.any_op):
      %6 = "transform.structured.match"(%arg2) <{ops = ["linalg.unpack"]}> : (!transform.any_op) -> !transform.any_op
      %7 = "transform.structured.match"(%arg2) <{ops = ["scf.for"]}> : (!transform.any_op) -> !transform.any_op
      %8:2 = "transform.test.fuse_consumer"(%6, %7) <{inner_tile_alignments = array<i64: 2>}> : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "no_hint"}> ({
    ^bb0(%arg1: !transform.any_op):
      %3 = "transform.structured.match"(%arg1) <{ops = ["linalg.unpack"]}> : (!transform.any_op) -> !transform.any_op
      %4 = "transform.structured.match"(%arg1) <{ops = ["scf.for"]}> : (!transform.any_op) -> !transform.any_op
      %5:2 = "transform.test.fuse_consumer"(%3, %4) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "multiple"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.unpack"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg0) <{ops = ["scf.for"]}> : (!transform.any_op) -> !transform.any_op
      %2:2 = "transform.test.fuse_consumer"(%0, %1) <{inner_tile_alignments = array<i64: 1>}> : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d2, d3, d5)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d1, d2, d4, d5)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d3, d4)>
#map3 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map4 = affine_map<(d0, d1, d2, d3) -> (d1, d0, d3, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x2x4x2xf32>, tensor<2x2x?x2xf32>, tensor<2x2x4x?xf32>, tensor<2x2x?x4xf32>, tensor<2x2x?x4xf32>, tensor<?x8xf32>) -> tensor<?x8xf32>, sym_name = "mmt4d_transpose_unpack"}> ({
  ^bb0(%arg3: tensor<2x2x4x2xf32>, %arg4: tensor<2x2x?x2xf32>, %arg5: tensor<2x2x4x?xf32>, %arg6: tensor<2x2x?x4xf32>, %arg7: tensor<2x2x?x4xf32>, %arg8: tensor<?x8xf32>):
    %12 = "arith.constant"() <{value = 8 : index}> : () -> index
    %13 = "vector.vscale"() : () -> index
    %14 = "arith.muli"(%12, %13) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %15 = "linalg.mmt4d"(%arg3, %arg4, %arg5) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg12: f32, %arg13: f32, %arg14: f32):
      %19 = "arith.mulf"(%arg12, %arg13) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %20 = "arith.addf"(%arg14, %19) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%20) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<2x2x4x2xf32>, tensor<2x2x?x2xf32>, tensor<2x2x4x?xf32>) -> tensor<2x2x4x?xf32>
    %16 = "linalg.generic"(%15, %arg6, %arg7) <{indexing_maps = [#map3, #map4, #map4], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg9: f32, %arg10: f32, %arg11: f32):
      %18 = "arith.addf"(%arg9, %arg10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%18) : (f32) -> ()
    }) : (tensor<2x2x4x?xf32>, tensor<2x2x?x4xf32>, tensor<2x2x?x4xf32>) -> tensor<2x2x?x4xf32>
    %17 = "linalg.unpack"(%16, %arg8, %14) <{inner_dims_pos = array<i64: 0, 1>, outer_dims_perm = array<i64: 0, 1>, static_inner_tiles = array<i64: -9223372036854775808, 4>}> {operandSegmentSizes = array<i32: 1, 1, 0, 1>} : (tensor<2x2x?x4xf32>, tensor<?x8xf32>, index) -> tensor<?x8xf32>
    "func.return"(%17) : (tensor<?x8xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg2: !transform.any_op):
      %6 = "transform.structured.match"(%arg2) <{ops = ["linalg.mmt4d"]}> : (!transform.any_op) -> !transform.any_op
      %7:2 = "transform.structured.tile_using_for"(%6) <{scalable_sizes = array<i1: false, false, false, false, true, false>, static_sizes = array<i64: 0, 0, 0, 0, 8, 0>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %8 = "transform.structured.match"(%arg2) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %9:2 = "transform.test.fuse_consumer"(%8, %7#1) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      %10 = "transform.structured.match"(%arg2) <{ops = ["linalg.unpack"]}> : (!transform.any_op) -> !transform.any_op
      %11:2 = "transform.test.fuse_consumer"(%10, %9#1) <{inner_tile_alignments = array<i64: 2, 0>}> : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "no_hint"}> ({
    ^bb0(%arg1: !transform.any_op):
      %0 = "transform.structured.match"(%arg1) <{ops = ["linalg.mmt4d"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false, false, false, true, false>, static_sizes = array<i64: 0, 0, 0, 0, 8, 0>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %2 = "transform.structured.match"(%arg1) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %3:2 = "transform.test.fuse_consumer"(%2, %1#1) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      %4 = "transform.structured.match"(%arg1) <{ops = ["linalg.unpack"]}> : (!transform.any_op) -> !transform.any_op
      %5:2 = "transform.test.fuse_consumer"(%4, %3#1) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "multiple"}> ({
    ^bb0(%arg0: !transform.any_op):
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

