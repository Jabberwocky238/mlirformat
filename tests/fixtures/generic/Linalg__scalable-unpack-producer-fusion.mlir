"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x8x?x?xf32>, tensor<?x?xf32>, index, index) -> tensor<?x?xf32>, sym_name = "unpack_elemwise_scalable"}> ({
  ^bb0(%arg4: tensor<4x8x?x?xf32>, %arg5: tensor<?x?xf32>, %arg6: index, %arg7: index):
    %10 = "arith.constant"() <{value = 4 : index}> : () -> index
    %11 = "arith.constant"() <{value = 8 : index}> : () -> index
    %12 = "arith.constant"() <{value = 16 : index}> : () -> index
    %13 = "vector.vscale"() : () -> index
    %14 = "arith.muli"(%11, %13) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %15 = "arith.muli"(%10, %13) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %16 = "arith.muli"(%12, %13) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %17 = "tensor.empty"(%arg6, %arg7) : (index, index) -> tensor<?x?xf32>
    %18 = "linalg.unpack"(%arg4, %17, %14, %15) <{inner_dims_pos = array<i64: 0, 1>, static_inner_tiles = array<i64: -9223372036854775808, -9223372036854775808>}> {operandSegmentSizes = array<i32: 1, 1, 0, 2>} : (tensor<4x8x?x?xf32>, tensor<?x?xf32>, index, index) -> tensor<?x?xf32>
    %19 = "linalg.exp"(%18, %arg5) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg8: f32, %arg9: f32):
      %20 = "math.exp"(%arg8) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%20) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%19) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "aligned"}> ({
    ^bb0(%arg3: !transform.any_op):
      %6 = "transform.structured.match"(%arg3) <{ops = ["linalg.exp"]}> : (!transform.any_op) -> !transform.any_op
      %7 = "transform.structured.match"(%arg3) <{ops = ["arith.muli"]}> : (!transform.any_op) -> !transform.any_op
      %8:3 = "transform.split_handle"(%7) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %9:3 = "transform.structured.fuse"(%6, %8#2, %8#0) <{inner_tile_alignments = array<i64: 1, 1>, operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_tile_interchange = array<i64: 0, 1>, static_tile_sizes = array<i64: -9223372036854775808, -9223372036854775808>}> : (!transform.any_op, !transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "equal"}> ({
    ^bb0(%arg2: !transform.any_op):
      %2 = "transform.structured.match"(%arg2) <{ops = ["linalg.exp"]}> : (!transform.any_op) -> !transform.any_op
      %3 = "transform.structured.match"(%arg2) <{ops = ["arith.muli"]}> : (!transform.any_op) -> !transform.any_op
      %4:3 = "transform.split_handle"(%3) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %5:3 = "transform.structured.fuse"(%2, %4#0, %4#1) <{inner_tile_alignments = array<i64: 2, 2>, operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_tile_interchange = array<i64: 0, 1>, static_tile_sizes = array<i64: -9223372036854775808, -9223372036854775808>}> : (!transform.any_op, !transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "unaligned"}> ({
    ^bb0(%arg1: !transform.any_op):
      %0 = "transform.structured.match"(%arg1) <{ops = ["linalg.exp"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.fuse"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_tile_interchange = array<i64: 0, 1>, static_tile_sizes = array<i64: 7, 5>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>, index, index) -> tensor<?x?xf32>, sym_name = "fuse_unpack_into_containing"}> ({
  ^bb0(%arg4: tensor<?x?x?x?xf32>, %arg5: tensor<?x?xf32>, %arg6: tensor<?x?xf32>, %arg7: index, %arg8: index):
    %9 = "arith.constant"() <{value = 4 : index}> : () -> index
    %10 = "arith.constant"() <{value = 8 : index}> : () -> index
    %11 = "vector.vscale"() : () -> index
    %12 = "arith.muli"(%10, %11) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %13 = "arith.muli"(%9, %11) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %14 = "arith.muli"(%10, %11) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %15 = "arith.muli"(%9, %11) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %16 = "linalg.unpack"(%arg4, %arg5, %12, %13) <{inner_dims_pos = array<i64: 0, 1>, static_inner_tiles = array<i64: -9223372036854775808, -9223372036854775808>}> {operandSegmentSizes = array<i32: 1, 1, 0, 2>} : (tensor<?x?x?x?xf32>, tensor<?x?xf32>, index, index) -> tensor<?x?xf32>
    %17 = "scf.forall"(%arg7, %arg8, %14, %15, %arg6) <{operandSegmentSizes = array<i32: 0, 2, 2, 1>, staticLowerBound = array<i64: 0, 0>, staticStep = array<i64: -9223372036854775808, -9223372036854775808>, staticUpperBound = array<i64: -9223372036854775808, -9223372036854775808>}> ({
    ^bb0(%arg9: index, %arg10: index, %arg11: tensor<?x?xf32>):
      %18 = "tensor.extract_slice"(%16, %arg9, %arg10, %14, %15) <{operandSegmentSizes = array<i32: 1, 2, 2, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<?x?xf32>, index, index, index, index) -> tensor<?x?xf32>
      %19 = "tensor.extract_slice"(%arg11, %arg9, %arg10, %14, %15) <{operandSegmentSizes = array<i32: 1, 2, 2, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<?x?xf32>, index, index, index, index) -> tensor<?x?xf32>
      %20 = "linalg.exp"(%18, %19) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg12: f32, %arg13: f32):
        %21 = "math.exp"(%arg12) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
        "linalg.yield"(%21) : (f32) -> ()
      }) : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
      "scf.forall.in_parallel"() ({
        "tensor.parallel_insert_slice"(%20, %arg11, %arg9, %arg10, %14, %15) <{operandSegmentSizes = array<i32: 1, 1, 2, 2, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<?x?xf32>, tensor<?x?xf32>, index, index, index, index) -> ()
      }) : () -> ()
    }) : (index, index, index, index, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%17) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "equal"}> ({
    ^bb0(%arg3: !transform.any_op):
      %6 = "transform.structured.match"(%arg3) <{ops = ["linalg.unpack"]}> : (!transform.any_op) -> !transform.any_op
      %7 = "transform.structured.match"(%arg3) <{ops = ["scf.forall"]}> : (!transform.any_op) -> !transform.any_op
      %8:2 = "transform.structured.fuse_into_containing_op"(%6, %7) <{inner_tile_alignments = array<i64: 2, 2>}> : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "unaligned"}> ({
    ^bb0(%arg2: !transform.any_op):
      %3 = "transform.structured.match"(%arg2) <{ops = ["linalg.unpack"]}> : (!transform.any_op) -> !transform.any_op
      %4 = "transform.structured.match"(%arg2) <{ops = ["scf.forall"]}> : (!transform.any_op) -> !transform.any_op
      %5:2 = "transform.structured.fuse_into_containing_op"(%3, %4) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "aligned"}> ({
    ^bb0(%arg1: !transform.any_op):
      %0 = "transform.structured.match"(%arg1) <{ops = ["linalg.unpack"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg1) <{ops = ["scf.forall"]}> : (!transform.any_op) -> !transform.any_op
      %2:2 = "transform.structured.fuse_into_containing_op"(%0, %1) <{inner_tile_alignments = array<i64: 1, 1>}> : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x4x?x?xf32>, tensor<?x?xf32>, index, index) -> tensor<?x?xf32>, sym_name = "unpack_transposed_consumer_scalable"}> ({
  ^bb0(%arg4: tensor<2x4x?x?xf32>, %arg5: tensor<?x?xf32>, %arg6: index, %arg7: index):
    %4 = "arith.constant"() <{value = 4 : index}> : () -> index
    %5 = "arith.constant"() <{value = 8 : index}> : () -> index
    %6 = "arith.constant"() <{value = 16 : index}> : () -> index
    %7 = "vector.vscale"() : () -> index
    %8 = "arith.muli"(%5, %7) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %9 = "arith.muli"(%4, %7) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %10 = "arith.muli"(%4, %7) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %11 = "arith.muli"(%6, %7) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %12 = "tensor.empty"(%arg6, %arg7) : (index, index) -> tensor<?x?xf32>
    %13 = "linalg.unpack"(%arg4, %12, %8, %9) <{inner_dims_pos = array<i64: 0, 1>, static_inner_tiles = array<i64: -9223372036854775808, -9223372036854775808>}> {operandSegmentSizes = array<i32: 1, 1, 0, 2>} : (tensor<2x4x?x?xf32>, tensor<?x?xf32>, index, index) -> tensor<?x?xf32>
    %14 = "linalg.generic"(%13, %arg5) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg8: f32, %arg9: f32):
      "linalg.yield"(%arg8) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%14) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg3: !transform.any_op):
      %0 = "transform.structured.match"(%arg3) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg3) <{ops = ["arith.muli"]}> : (!transform.any_op) -> !transform.any_op
      %2:4 = "transform.split_handle"(%1) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      %3:3 = "transform.structured.fuse"(%0, %2#2, %2#3) <{inner_tile_alignments = array<i64: 1, 2>, operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_tile_sizes = array<i64: -9223372036854775808, -9223372036854775808>}> : (!transform.any_op, !transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "aligned"}> ({
    ^bb0(%arg2: !transform.any_op):
      "transform.yield"() : () -> ()
    }) : () -> ()
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "equal"}> ({
    ^bb0(%arg1: !transform.any_op):
      "transform.yield"() : () -> ()
    }) : () -> ()
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "unaligned"}> ({
    ^bb0(%arg0: !transform.any_op):
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>, tensor<?x?xf32>, index, index) -> tensor<?x?xf32>, sym_name = "fuse_unpack_through_block_arg"}> ({
  ^bb0(%arg4: tensor<?x?x?x?xf32>, %arg5: tensor<?x?xf32>, %arg6: index, %arg7: index):
    %3 = "arith.constant"() <{value = 4 : index}> : () -> index
    %4 = "arith.constant"() <{value = 8 : index}> : () -> index
    %5 = "vector.vscale"() : () -> index
    %6 = "arith.muli"(%4, %5) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %7 = "arith.muli"(%3, %5) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %8 = "linalg.unpack"(%arg4, %arg5, %6, %7) <{inner_dims_pos = array<i64: 0, 1>, static_inner_tiles = array<i64: -9223372036854775808, -9223372036854775808>}> {operandSegmentSizes = array<i32: 1, 1, 0, 2>} : (tensor<?x?x?x?xf32>, tensor<?x?xf32>, index, index) -> tensor<?x?xf32>
    %9 = "scf.forall"(%arg6, %arg7, %6, %7, %8) <{operandSegmentSizes = array<i32: 0, 2, 2, 1>, staticLowerBound = array<i64: 0, 0>, staticStep = array<i64: -9223372036854775808, -9223372036854775808>, staticUpperBound = array<i64: -9223372036854775808, -9223372036854775808>}> ({
    ^bb0(%arg8: index, %arg9: index, %arg10: tensor<?x?xf32>):
      %10 = "tensor.extract_slice"(%arg10, %arg8, %arg9, %6, %7) <{operandSegmentSizes = array<i32: 1, 2, 2, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<?x?xf32>, index, index, index, index) -> tensor<?x?xf32>
      %11 = "linalg.exp"(%10, %10) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg11: f32, %arg12: f32):
        %12 = "math.exp"(%arg11) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
        "linalg.yield"(%12) : (f32) -> ()
      }) : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
      "scf.forall.in_parallel"() ({
        "tensor.parallel_insert_slice"(%11, %arg10, %arg8, %arg9, %6, %7) <{operandSegmentSizes = array<i32: 1, 1, 2, 2, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<?x?xf32>, tensor<?x?xf32>, index, index, index, index) -> ()
      }) : () -> ()
    }) : (index, index, index, index, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%9) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg3: !transform.any_op):
      %0 = "transform.structured.match"(%arg3) <{ops = ["linalg.unpack"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg3) <{ops = ["scf.forall"]}> : (!transform.any_op) -> !transform.any_op
      %2:2 = "transform.structured.fuse_into_containing_op"(%0, %1) <{inner_tile_alignments = array<i64: 2, 2>}> : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "aligned"}> ({
    ^bb0(%arg2: !transform.any_op):
      "transform.yield"() : () -> ()
    }) : () -> ()
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "equal"}> ({
    ^bb0(%arg1: !transform.any_op):
      "transform.yield"() : () -> ()
    }) : () -> ()
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "unaligned"}> ({
    ^bb0(%arg0: !transform.any_op):
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

