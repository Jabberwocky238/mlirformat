#map = affine_map<(d0)[s0] -> (-d0 + 256, s0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<256x128xf32>, tensor<256x128xf32>, tensor<256x128xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>, sym_name = "fuse_scalable_pack_consumer_equal"}> ({
  ^bb0(%arg1: tensor<256x128xf32>, %arg2: tensor<256x128xf32>, %arg3: tensor<256x128xf32>, %arg4: tensor<?x?x?x?xf32>):
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 4 : index}> : () -> index
    %5 = "arith.constant"() <{value = 8 : index}> : () -> index
    %6 = "arith.constant"() <{value = 256 : index}> : () -> index
    %7 = "vector.vscale"() : () -> index
    %8 = "arith.muli"(%4, %7) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %9 = "arith.muli"(%5, %7) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %10 = "scf.for"(%3, %6, %9, %arg3) ({
    ^bb0(%arg5: index, %arg6: tensor<256x128xf32>):
      %12 = "affine.min"(%arg5, %9) <{map = #map}> : (index, index) -> index
      %13 = "tensor.extract_slice"(%arg6, %arg5, %12) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: -9223372036854775808, 128>, static_strides = array<i64: 1, 1>}> : (tensor<256x128xf32>, index, index) -> tensor<?x128xf32>
      %14 = "tensor.extract_slice"(%arg1, %arg5, %12) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: -9223372036854775808, 128>, static_strides = array<i64: 1, 1>}> : (tensor<256x128xf32>, index, index) -> tensor<?x128xf32>
      %15 = "tensor.extract_slice"(%arg2, %arg5, %12) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: -9223372036854775808, 128>, static_strides = array<i64: 1, 1>}> : (tensor<256x128xf32>, index, index) -> tensor<?x128xf32>
      %16 = "linalg.generic"(%14, %15, %13) <{indexing_maps = [#map1, #map1, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
      ^bb0(%arg7: f32, %arg8: f32, %arg9: f32):
        %18 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "linalg.yield"(%18) : (f32) -> ()
      }) : (tensor<?x128xf32>, tensor<?x128xf32>, tensor<?x128xf32>) -> tensor<?x128xf32>
      %17 = "tensor.insert_slice"(%16, %arg6, %arg5, %12) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: -9223372036854775808, 128>, static_strides = array<i64: 1, 1>}> : (tensor<?x128xf32>, tensor<256x128xf32>, index, index) -> tensor<256x128xf32>
      "scf.yield"(%17) : (tensor<256x128xf32>) -> ()
    }) : (index, index, index, tensor<256x128xf32>) -> tensor<256x128xf32>
    %11 = "linalg.pack"(%10, %arg4, %9, %8) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 2>, outer_dims_perm = array<i64: 0, 1>, static_inner_tiles = array<i64: -9223372036854775808, -9223372036854775808>}> : (tensor<256x128xf32>, tensor<?x?x?x?xf32>, index, index) -> tensor<?x?x?x?xf32>
    "func.return"(%11) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.pack"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg0) <{ops = ["scf.for"]}> : (!transform.any_op) -> !transform.any_op
      %2:2 = "transform.test.fuse_consumer"(%0, %1) <{inner_tile_alignments = array<i64: 2, 0>}> : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<256x128xf32>, tensor<256x128xf32>, tensor<256x128xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>, sym_name = "fuse_scalable_pack_consumer_aligned"}> ({
  ^bb0(%arg1: tensor<256x128xf32>, %arg2: tensor<256x128xf32>, %arg3: tensor<256x128xf32>, %arg4: tensor<?x?x?x?xf32>):
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 4 : index}> : () -> index
    %5 = "arith.constant"() <{value = 8 : index}> : () -> index
    %6 = "arith.constant"() <{value = 64 : index}> : () -> index
    %7 = "arith.constant"() <{value = 256 : index}> : () -> index
    %8 = "vector.vscale"() : () -> index
    %9 = "arith.muli"(%4, %8) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %10 = "arith.muli"(%5, %8) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %11 = "scf.for"(%3, %7, %6, %arg3) ({
    ^bb0(%arg5: index, %arg6: tensor<256x128xf32>):
      %13 = "tensor.extract_slice"(%arg6, %arg5) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: 64, 128>, static_strides = array<i64: 1, 1>}> : (tensor<256x128xf32>, index) -> tensor<64x128xf32>
      %14 = "tensor.extract_slice"(%arg1, %arg5) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: 64, 128>, static_strides = array<i64: 1, 1>}> : (tensor<256x128xf32>, index) -> tensor<64x128xf32>
      %15 = "tensor.extract_slice"(%arg2, %arg5) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: 64, 128>, static_strides = array<i64: 1, 1>}> : (tensor<256x128xf32>, index) -> tensor<64x128xf32>
      %16 = "linalg.generic"(%14, %15, %13) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
      ^bb0(%arg7: f32, %arg8: f32, %arg9: f32):
        %18 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "linalg.yield"(%18) : (f32) -> ()
      }) : (tensor<64x128xf32>, tensor<64x128xf32>, tensor<64x128xf32>) -> tensor<64x128xf32>
      %17 = "tensor.insert_slice"(%16, %arg6, %arg5) <{operandSegmentSizes = array<i32: 1, 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: 64, 128>, static_strides = array<i64: 1, 1>}> : (tensor<64x128xf32>, tensor<256x128xf32>, index) -> tensor<256x128xf32>
      "scf.yield"(%17) : (tensor<256x128xf32>) -> ()
    }) : (index, index, index, tensor<256x128xf32>) -> tensor<256x128xf32>
    %12 = "linalg.pack"(%11, %arg4, %10, %9) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 2>, outer_dims_perm = array<i64: 0, 1>, static_inner_tiles = array<i64: -9223372036854775808, -9223372036854775808>}> : (tensor<256x128xf32>, tensor<?x?x?x?xf32>, index, index) -> tensor<?x?x?x?xf32>
    "func.return"(%12) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.pack"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg0) <{ops = ["scf.for"]}> : (!transform.any_op) -> !transform.any_op
      %2:2 = "transform.test.fuse_consumer"(%0, %1) <{inner_tile_alignments = array<i64: 1, 0>}> : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0)[s0] -> (-d0 + 256, s0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<256x128xf32>, tensor<256x128xf32>, tensor<256x128xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>, sym_name = "fuse_scalable_pack_consumer_aligned_scalable"}> ({
  ^bb0(%arg1: tensor<256x128xf32>, %arg2: tensor<256x128xf32>, %arg3: tensor<256x128xf32>, %arg4: tensor<?x?x?x?xf32>):
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 4 : index}> : () -> index
    %5 = "arith.constant"() <{value = 8 : index}> : () -> index
    %6 = "arith.constant"() <{value = 256 : index}> : () -> index
    %7 = "vector.vscale"() : () -> index
    %8 = "arith.muli"(%4, %7) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %9 = "arith.muli"(%5, %7) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %10 = "scf.for"(%3, %6, %9, %arg3) ({
    ^bb0(%arg5: index, %arg6: tensor<256x128xf32>):
      %12 = "affine.min"(%arg5, %9) <{map = #map}> : (index, index) -> index
      %13 = "tensor.extract_slice"(%arg6, %arg5, %12) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: -9223372036854775808, 128>, static_strides = array<i64: 1, 1>}> : (tensor<256x128xf32>, index, index) -> tensor<?x128xf32>
      %14 = "tensor.extract_slice"(%arg1, %arg5, %12) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: -9223372036854775808, 128>, static_strides = array<i64: 1, 1>}> : (tensor<256x128xf32>, index, index) -> tensor<?x128xf32>
      %15 = "tensor.extract_slice"(%arg2, %arg5, %12) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: -9223372036854775808, 128>, static_strides = array<i64: 1, 1>}> : (tensor<256x128xf32>, index, index) -> tensor<?x128xf32>
      %16 = "linalg.generic"(%14, %15, %13) <{indexing_maps = [#map1, #map1, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
      ^bb0(%arg7: f32, %arg8: f32, %arg9: f32):
        %18 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "linalg.yield"(%18) : (f32) -> ()
      }) : (tensor<?x128xf32>, tensor<?x128xf32>, tensor<?x128xf32>) -> tensor<?x128xf32>
      %17 = "tensor.insert_slice"(%16, %arg6, %arg5, %12) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: -9223372036854775808, 128>, static_strides = array<i64: 1, 1>}> : (tensor<?x128xf32>, tensor<256x128xf32>, index, index) -> tensor<256x128xf32>
      "scf.yield"(%17) : (tensor<256x128xf32>) -> ()
    }) : (index, index, index, tensor<256x128xf32>) -> tensor<256x128xf32>
    %11 = "linalg.pack"(%10, %arg4, %8, %8) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 2>, outer_dims_perm = array<i64: 0, 1>, static_inner_tiles = array<i64: -9223372036854775808, -9223372036854775808>}> : (tensor<256x128xf32>, tensor<?x?x?x?xf32>, index, index) -> tensor<?x?x?x?xf32>
    "func.return"(%11) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.pack"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg0) <{ops = ["scf.for"]}> : (!transform.any_op) -> !transform.any_op
      %2:2 = "transform.test.fuse_consumer"(%0, %1) <{inner_tile_alignments = array<i64: 1, 0>}> : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0)[s0] -> (-d0 + 256, s0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<256x128xf32>, tensor<256x128xf32>, tensor<256x128xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>, sym_name = "fuse_pack_consumer_transposed_outer"}> ({
  ^bb0(%arg1: tensor<256x128xf32>, %arg2: tensor<256x128xf32>, %arg3: tensor<256x128xf32>, %arg4: tensor<?x?x?x?xf32>):
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 4 : index}> : () -> index
    %5 = "arith.constant"() <{value = 8 : index}> : () -> index
    %6 = "arith.constant"() <{value = 256 : index}> : () -> index
    %7 = "vector.vscale"() : () -> index
    %8 = "arith.muli"(%4, %7) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %9 = "arith.muli"(%5, %7) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %10 = "scf.for"(%3, %6, %9, %arg3) ({
    ^bb0(%arg5: index, %arg6: tensor<256x128xf32>):
      %12 = "affine.min"(%arg5, %9) <{map = #map}> : (index, index) -> index
      %13 = "tensor.extract_slice"(%arg6, %arg5, %12) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: -9223372036854775808, 128>, static_strides = array<i64: 1, 1>}> : (tensor<256x128xf32>, index, index) -> tensor<?x128xf32>
      %14 = "tensor.extract_slice"(%arg1, %arg5, %12) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: -9223372036854775808, 128>, static_strides = array<i64: 1, 1>}> : (tensor<256x128xf32>, index, index) -> tensor<?x128xf32>
      %15 = "tensor.extract_slice"(%arg2, %arg5, %12) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: -9223372036854775808, 128>, static_strides = array<i64: 1, 1>}> : (tensor<256x128xf32>, index, index) -> tensor<?x128xf32>
      %16 = "linalg.generic"(%14, %15, %13) <{indexing_maps = [#map1, #map1, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
      ^bb0(%arg7: f32, %arg8: f32, %arg9: f32):
        %18 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "linalg.yield"(%18) : (f32) -> ()
      }) : (tensor<?x128xf32>, tensor<?x128xf32>, tensor<?x128xf32>) -> tensor<?x128xf32>
      %17 = "tensor.insert_slice"(%16, %arg6, %arg5, %12) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: -9223372036854775808, 128>, static_strides = array<i64: 1, 1>}> : (tensor<?x128xf32>, tensor<256x128xf32>, index, index) -> tensor<256x128xf32>
      "scf.yield"(%17) : (tensor<256x128xf32>) -> ()
    }) : (index, index, index, tensor<256x128xf32>) -> tensor<256x128xf32>
    %11 = "linalg.pack"(%10, %arg4, %9, %8) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 2>, outer_dims_perm = array<i64: 1, 0>, static_inner_tiles = array<i64: -9223372036854775808, -9223372036854775808>}> : (tensor<256x128xf32>, tensor<?x?x?x?xf32>, index, index) -> tensor<?x?x?x?xf32>
    "func.return"(%11) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.pack"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg0) <{ops = ["scf.for"]}> : (!transform.any_op) -> !transform.any_op
      %2:2 = "transform.test.fuse_consumer"(%0, %1) <{inner_tile_alignments = array<i64: 2, 0>}> : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

