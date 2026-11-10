#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "builtin.module"() ({
    "func.func"() <{function_type = (tensor<32xf32>, tensor<32xf32>, tensor<64xf32>) -> tensor<64xf32>, sym_name = "fuse_tileable_consumer_scf_for"}> ({
    ^bb0(%arg1: tensor<32xf32>, %arg2: tensor<32xf32>, %arg3: tensor<64xf32>):
      %3 = "arith.constant"() <{value = 4 : index}> : () -> index
      %4 = "arith.constant"() <{value = 64 : index}> : () -> index
      %5 = "arith.constant"() <{value = 0 : index}> : () -> index
      %6:2 = "scf.for"(%5, %4, %3, %arg3, %arg3) ({
      ^bb0(%arg7: index, %arg8: tensor<64xf32>, %arg9: tensor<64xf32>):
        %11 = "tensor.extract_slice"(%arg8, %arg7) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 32>, static_strides = array<i64: 1>}> : (tensor<64xf32>, index) -> tensor<32xf32>
        %12 = "linalg.generic"(%arg1, %arg2, %11) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
        ^bb0(%arg10: f32, %arg11: f32, %arg12: f32):
          %14 = "arith.mulf"(%arg10, %arg11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          %15 = "arith.addf"(%arg12, %14) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "linalg.yield"(%15) : (f32) -> ()
        }) : (tensor<32xf32>, tensor<32xf32>, tensor<32xf32>) -> tensor<32xf32>
        %13 = "tensor.insert_slice"(%12, %arg8, %arg7) <{operandSegmentSizes = array<i32: 1, 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 32>, static_strides = array<i64: 1>}> : (tensor<32xf32>, tensor<64xf32>, index) -> tensor<64xf32>
        "scf.yield"(%arg9, %13) : (tensor<64xf32>, tensor<64xf32>) -> ()
      }) : (index, index, index, tensor<64xf32>, tensor<64xf32>) -> (tensor<64xf32>, tensor<64xf32>)
      %7 = "tensor.empty"() : () -> tensor<64xf32>
      %8 = "tensor.empty"() : () -> tensor<64xf32>
      %9 = "linalg.add"(%6#1, %7, %8) <{operandSegmentSizes = array<i32: 2, 1>}> ({
      ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
        %10 = "arith.addf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "linalg.yield"(%10) : (f32) -> ()
      }) : (tensor<64xf32>, tensor<64xf32>, tensor<64xf32>) -> tensor<64xf32>
      "func.return"(%9) : (tensor<64xf32>) -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["scf.for"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg0) <{ops = ["tensor.insert_slice"]}> : (!transform.any_op) -> !transform.any_op
      %2:2 = "transform.test.fuse_consumer_using_slice"(%1, %0) <{num_consumer_to_fuse = 1 : i32, operandSegmentSizes = array<i32: 1, 1>}> : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "builtin.module"() ({
    "func.func"() <{function_type = (tensor<32x32xf32>, tensor<32x32xf32>, tensor<64x64xf32>) -> tensor<64x64xf32>, sym_name = "fuse_tileable_consumer_scf_forall"}> ({
    ^bb0(%arg1: tensor<32x32xf32>, %arg2: tensor<32x32xf32>, %arg3: tensor<64x64xf32>):
      %4 = "arith.constant"() <{value = 4 : index}> : () -> index
      %5 = "arith.constant"() <{value = 64 : index}> : () -> index
      %6 = "arith.constant"() <{value = 0 : index}> : () -> index
      %7:2 = "scf.forall"(%arg3, %arg3) <{operandSegmentSizes = array<i32: 0, 0, 0, 2>, staticLowerBound = array<i64: 0, 0>, staticStep = array<i64: 1, 1>, staticUpperBound = array<i64: 2, 2>}> ({
      ^bb0(%arg7: index, %arg8: index, %arg9: tensor<64x64xf32>, %arg10: tensor<64x64xf32>):
        %12 = "tensor.extract_slice"(%arg9, %arg7, %arg8) <{operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 32, 32>, static_strides = array<i64: 1, 1>}> : (tensor<64x64xf32>, index, index) -> tensor<32x32xf32>
        %13 = "tensor.extract_slice"(%arg10, %arg7, %arg8) <{operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 32, 32>, static_strides = array<i64: 1, 1>}> : (tensor<64x64xf32>, index, index) -> tensor<32x32xf32>
        %14 = "linalg.matmul"(%arg1, %arg2, %12) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
        ^bb0(%arg11: f32, %arg12: f32, %arg13: f32):
          %15 = "arith.mulf"(%arg11, %arg12) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          %16 = "arith.addf"(%arg13, %15) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "linalg.yield"(%16) : (f32) -> ()
        }) : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
        "scf.forall.in_parallel"() ({
          "tensor.parallel_insert_slice"(%14, %arg10, %arg7, %arg8) <{operandSegmentSizes = array<i32: 1, 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 32, 32>, static_strides = array<i64: 1, 1>}> : (tensor<32x32xf32>, tensor<64x64xf32>, index, index) -> ()
          "tensor.parallel_insert_slice"(%13, %arg9, %arg7, %arg8) <{operandSegmentSizes = array<i32: 1, 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 32, 32>, static_strides = array<i64: 1, 1>}> : (tensor<32x32xf32>, tensor<64x64xf32>, index, index) -> ()
        }) : () -> ()
      }) : (tensor<64x64xf32>, tensor<64x64xf32>) -> (tensor<64x64xf32>, tensor<64x64xf32>)
      %8 = "tensor.empty"() : () -> tensor<64x64xf32>
      %9 = "tensor.empty"() : () -> tensor<64x64xf32>
      %10 = "linalg.add"(%7#1, %8, %9) <{operandSegmentSizes = array<i32: 2, 1>}> ({
      ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
        %11 = "arith.addf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "linalg.yield"(%11) : (f32) -> ()
      }) : (tensor<64x64xf32>, tensor<64x64xf32>, tensor<64x64xf32>) -> tensor<64x64xf32>
      "func.return"(%10) : (tensor<64x64xf32>) -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.parallel_insert_slice"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg0) <{ops = ["scf.forall"]}> : (!transform.any_op) -> !transform.any_op
      %2:2 = "transform.split_handle"(%0) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %3:2 = "transform.test.fuse_consumer_using_slice"(%2#0, %1) <{num_consumer_to_fuse = 1 : i32, operandSegmentSizes = array<i32: 1, 1>}> : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "builtin.module"() ({
    "func.func"() <{function_type = (tensor<32xf32>, tensor<32xf32>, tensor<64xf32>) -> tensor<64xf32>, sym_name = "fuse_tileable_consumer_scf_for_multi_yielding_consumer"}> ({
    ^bb0(%arg1: tensor<32xf32>, %arg2: tensor<32xf32>, %arg3: tensor<64xf32>):
      %3 = "arith.constant"() <{value = 4 : index}> : () -> index
      %4 = "arith.constant"() <{value = 64 : index}> : () -> index
      %5 = "arith.constant"() <{value = 0 : index}> : () -> index
      %6:2 = "scf.for"(%5, %4, %3, %arg3, %arg3) ({
      ^bb0(%arg8: index, %arg9: tensor<64xf32>, %arg10: tensor<64xf32>):
        %14 = "tensor.extract_slice"(%arg9, %arg8) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 32>, static_strides = array<i64: 1>}> : (tensor<64xf32>, index) -> tensor<32xf32>
        %15 = "linalg.generic"(%arg1, %arg2, %14) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
        ^bb0(%arg11: f32, %arg12: f32, %arg13: f32):
          %17 = "arith.mulf"(%arg11, %arg12) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          %18 = "arith.addf"(%arg13, %17) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "linalg.yield"(%18) : (f32) -> ()
        }) : (tensor<32xf32>, tensor<32xf32>, tensor<32xf32>) -> tensor<32xf32>
        %16 = "tensor.insert_slice"(%15, %arg9, %arg8) <{operandSegmentSizes = array<i32: 1, 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 32>, static_strides = array<i64: 1>}> : (tensor<32xf32>, tensor<64xf32>, index) -> tensor<64xf32>
        "scf.yield"(%arg10, %16) : (tensor<64xf32>, tensor<64xf32>) -> ()
      }) : (index, index, index, tensor<64xf32>, tensor<64xf32>) -> (tensor<64xf32>, tensor<64xf32>)
      %7 = "tensor.empty"() : () -> tensor<64xf32>
      %8 = "tensor.empty"() : () -> tensor<64xf32>
      %9 = "tensor.empty"() : () -> tensor<64xf32>
      %10:2 = "linalg.generic"(%6#1, %7, %8, %9) <{indexing_maps = [#map, #map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 2>}> ({
      ^bb0(%arg4: f32, %arg5: f32, %arg6: f32, %arg7: f32):
        %11 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        %12 = "arith.subf"(%arg6, %11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        %13 = "arith.addf"(%arg7, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "linalg.yield"(%12, %13) : (f32, f32) -> ()
      }) : (tensor<64xf32>, tensor<64xf32>, tensor<64xf32>, tensor<64xf32>) -> (tensor<64xf32>, tensor<64xf32>)
      "func.return"(%10#1) : (tensor<64xf32>) -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.insert_slice"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg0) <{ops = ["scf.for"]}> : (!transform.any_op) -> !transform.any_op
      %2:2 = "transform.test.fuse_consumer_using_slice"(%0, %1) <{num_consumer_to_fuse = 1 : i32, operandSegmentSizes = array<i32: 1, 1>}> : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map3 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "builtin.module"() ({
    "func.func"() <{function_type = (tensor<32x32xf32>, tensor<32x32xf32>, tensor<64x64xf32>, tensor<64x32xf32>) -> (tensor<64x64xf32>, tensor<2048xf32>), sym_name = "fuse_tileable_consumer_scf_forall_multi_yielding_consumer"}> ({
    ^bb0(%arg1: tensor<32x32xf32>, %arg2: tensor<32x32xf32>, %arg3: tensor<64x64xf32>, %arg4: tensor<64x32xf32>):
      %4 = "arith.constant"() <{value = 4 : index}> : () -> index
      %5 = "arith.constant"() <{value = 64 : index}> : () -> index
      %6 = "arith.constant"() <{value = 0 : index}> : () -> index
      %7:2 = "scf.forall"(%arg4, %arg3) <{operandSegmentSizes = array<i32: 0, 0, 0, 2>, staticLowerBound = array<i64: 0, 0>, staticStep = array<i64: 1, 1>, staticUpperBound = array<i64: 2, 2>}> ({
      ^bb0(%arg9: index, %arg10: index, %arg11: tensor<64x32xf32>, %arg12: tensor<64x64xf32>):
        %17 = "tensor.extract_slice"(%arg11, %arg9, %arg10) <{operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 32, 32>, static_strides = array<i64: 1, 1>}> : (tensor<64x32xf32>, index, index) -> tensor<32x32xf32>
        %18 = "tensor.extract_slice"(%arg12, %arg9, %arg10) <{operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 32, 32>, static_strides = array<i64: 1, 1>}> : (tensor<64x64xf32>, index, index) -> tensor<32x32xf32>
        %19 = "linalg.matmul"(%arg1, %arg2, %17) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
        ^bb0(%arg13: f32, %arg14: f32, %arg15: f32):
          %20 = "arith.mulf"(%arg13, %arg14) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          %21 = "arith.addf"(%arg15, %20) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "linalg.yield"(%21) : (f32) -> ()
        }) : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
        "scf.forall.in_parallel"() ({
          "tensor.parallel_insert_slice"(%19, %arg12, %arg9, %arg10) <{operandSegmentSizes = array<i32: 1, 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 32, 32>, static_strides = array<i64: 1, 1>}> : (tensor<32x32xf32>, tensor<64x64xf32>, index, index) -> ()
          "tensor.parallel_insert_slice"(%18, %arg11, %arg9, %arg10) <{operandSegmentSizes = array<i32: 1, 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 32, 32>, static_strides = array<i64: 1, 1>}> : (tensor<32x32xf32>, tensor<64x32xf32>, index, index) -> ()
        }) : () -> ()
      }) : (tensor<64x32xf32>, tensor<64x64xf32>) -> (tensor<64x32xf32>, tensor<64x64xf32>)
      %8 = "tensor.empty"() : () -> tensor<64x64xf32>
      %9 = "tensor.empty"() : () -> tensor<64x64xf32>
      %10 = "tensor.empty"() : () -> tensor<64x64xf32>
      %11:2 = "linalg.generic"(%7#1, %8, %9, %10) <{indexing_maps = [#map3, #map3, #map3, #map3], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 2>}> ({
      ^bb0(%arg5: f32, %arg6: f32, %arg7: f32, %arg8: f32):
        %14 = "arith.mulf"(%arg5, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        %15 = "arith.subf"(%arg7, %14) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        %16 = "arith.addf"(%arg8, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "linalg.yield"(%15, %16) : (f32, f32) -> ()
      }) : (tensor<64x64xf32>, tensor<64x64xf32>, tensor<64x64xf32>, tensor<64x64xf32>) -> (tensor<64x64xf32>, tensor<64x64xf32>)
      %12 = "tensor.empty"() : () -> tensor<2048xf32>
      %13 = "linalg.unpack"(%7#0, %12) <{inner_dims_pos = array<i64: 0>, outer_dims_perm = array<i64: 0>, static_inner_tiles = array<i64: 32>}> {operandSegmentSizes = array<i32: 1, 1, 0, 0>} : (tensor<64x32xf32>, tensor<2048xf32>) -> tensor<2048xf32>
      "func.return"(%11#1, %13) : (tensor<64x64xf32>, tensor<2048xf32>) -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.parallel_insert_slice"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg0) <{ops = ["scf.forall"]}> : (!transform.any_op) -> !transform.any_op
      %2:2 = "transform.split_handle"(%0) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %3:2 = "transform.test.fuse_consumer_using_slice"(%2#0, %1) <{num_consumer_to_fuse = 1 : i32, operandSegmentSizes = array<i32: 1, 1>}> : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "builtin.module"() ({
    "func.func"() <{function_type = (tensor<32x32xf32>, tensor<32x32xf32>, tensor<64x32xf32>) -> tensor<2048xf32>, sym_name = "fuse_unpack_consumer_into_scf_forall"}> ({
    ^bb0(%arg1: tensor<32x32xf32>, %arg2: tensor<32x32xf32>, %arg3: tensor<64x32xf32>):
      %3 = "arith.constant"() <{value = 4 : index}> : () -> index
      %4 = "arith.constant"() <{value = 64 : index}> : () -> index
      %5 = "arith.constant"() <{value = 0 : index}> : () -> index
      %6 = "scf.forall"(%arg3) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>, staticLowerBound = array<i64: 0, 0>, staticStep = array<i64: 32, 32>, staticUpperBound = array<i64: 64, 32>}> ({
      ^bb0(%arg4: index, %arg5: index, %arg6: tensor<64x32xf32>):
        %9 = "tensor.extract_slice"(%arg6, %arg4, %arg5) <{operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 32, 32>, static_strides = array<i64: 1, 1>}> : (tensor<64x32xf32>, index, index) -> tensor<32x32xf32>
        %10 = "linalg.generic"(%arg1, %arg2, %9) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
        ^bb0(%arg7: f32, %arg8: f32, %arg9: f32):
          %11 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          %12 = "arith.addf"(%arg9, %11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "linalg.yield"(%12) : (f32) -> ()
        }) : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
        "scf.forall.in_parallel"() ({
          "tensor.parallel_insert_slice"(%10, %arg6, %arg4, %arg5) <{operandSegmentSizes = array<i32: 1, 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 32, 32>, static_strides = array<i64: 1, 1>}> : (tensor<32x32xf32>, tensor<64x32xf32>, index, index) -> ()
        }) : () -> ()
      }) : (tensor<64x32xf32>) -> tensor<64x32xf32>
      %7 = "tensor.empty"() : () -> tensor<2048xf32>
      %8 = "linalg.unpack"(%6, %7) <{inner_dims_pos = array<i64: 0>, outer_dims_perm = array<i64: 0>, static_inner_tiles = array<i64: 32>}> {operandSegmentSizes = array<i32: 1, 1, 0, 0>} : (tensor<64x32xf32>, tensor<2048xf32>) -> tensor<2048xf32>
      "func.return"(%8) : (tensor<2048xf32>) -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.parallel_insert_slice"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg0) <{ops = ["scf.forall"]}> : (!transform.any_op) -> !transform.any_op
      %2:2 = "transform.test.fuse_consumer_using_slice"(%0, %1) <{num_consumer_to_fuse = 1 : i32, operandSegmentSizes = array<i32: 1, 1>}> : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "builtin.module"() ({
    "func.func"() <{function_type = (tensor<32x32xf32>, tensor<32x32xf32>, tensor<64x32xf32>) -> tensor<2047xf32>, sym_name = "fuse_unaligned_unpack_consumer_into_scf_forall"}> ({
    ^bb0(%arg1: tensor<32x32xf32>, %arg2: tensor<32x32xf32>, %arg3: tensor<64x32xf32>):
      %3 = "arith.constant"() <{value = 4 : index}> : () -> index
      %4 = "arith.constant"() <{value = 64 : index}> : () -> index
      %5 = "arith.constant"() <{value = 0 : index}> : () -> index
      %6 = "scf.forall"(%arg3) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>, staticLowerBound = array<i64: 0, 0>, staticStep = array<i64: 32, 32>, staticUpperBound = array<i64: 64, 32>}> ({
      ^bb0(%arg4: index, %arg5: index, %arg6: tensor<64x32xf32>):
        %9 = "tensor.extract_slice"(%arg6, %arg4, %arg5) <{operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 32, 32>, static_strides = array<i64: 1, 1>}> : (tensor<64x32xf32>, index, index) -> tensor<32x32xf32>
        %10 = "linalg.generic"(%arg1, %arg2, %9) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
        ^bb0(%arg7: f32, %arg8: f32, %arg9: f32):
          %11 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          %12 = "arith.addf"(%arg9, %11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "linalg.yield"(%12) : (f32) -> ()
        }) : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
        "scf.forall.in_parallel"() ({
          "tensor.parallel_insert_slice"(%10, %arg6, %arg4, %arg5) <{operandSegmentSizes = array<i32: 1, 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 32, 32>, static_strides = array<i64: 1, 1>}> : (tensor<32x32xf32>, tensor<64x32xf32>, index, index) -> ()
        }) : () -> ()
      }) : (tensor<64x32xf32>) -> tensor<64x32xf32>
      %7 = "tensor.empty"() : () -> tensor<2047xf32>
      %8 = "linalg.unpack"(%6, %7) <{inner_dims_pos = array<i64: 0>, outer_dims_perm = array<i64: 0>, static_inner_tiles = array<i64: 32>}> {operandSegmentSizes = array<i32: 1, 1, 0, 0>} : (tensor<64x32xf32>, tensor<2047xf32>) -> tensor<2047xf32>
      "func.return"(%8) : (tensor<2047xf32>) -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.parallel_insert_slice"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg0) <{ops = ["scf.forall"]}> : (!transform.any_op) -> !transform.any_op
      %2:2 = "transform.test.fuse_consumer_using_slice"(%0, %1) <{num_consumer_to_fuse = 1 : i32, operandSegmentSizes = array<i32: 1, 1>}> : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "builtin.module"() ({
    "func.func"() <{function_type = (tensor<32x32xf32>, tensor<32x32xf32>, tensor<64x32xf32>) -> tensor<4x32x16xf32>, sym_name = "fuse_perfect_tiling_pack_consumer"}> ({
    ^bb0(%arg1: tensor<32x32xf32>, %arg2: tensor<32x32xf32>, %arg3: tensor<64x32xf32>):
      %3 = "arith.constant"() <{value = 4 : index}> : () -> index
      %4 = "arith.constant"() <{value = 64 : index}> : () -> index
      %5 = "arith.constant"() <{value = 0 : index}> : () -> index
      %6 = "scf.forall"(%arg3) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>, staticLowerBound = array<i64: 0, 0>, staticStep = array<i64: 1, 1>, staticUpperBound = array<i64: 2, 1>}> ({
      ^bb0(%arg4: index, %arg5: index, %arg6: tensor<64x32xf32>):
        %9 = "tensor.extract_slice"(%arg6, %arg4, %arg5) <{operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 32, 32>, static_strides = array<i64: 1, 1>}> : (tensor<64x32xf32>, index, index) -> tensor<32x32xf32>
        %10 = "linalg.generic"(%arg1, %arg2, %9) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
        ^bb0(%arg7: f32, %arg8: f32, %arg9: f32):
          %11 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          %12 = "arith.addf"(%arg9, %11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "linalg.yield"(%12) : (f32) -> ()
        }) : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
        "scf.forall.in_parallel"() ({
          "tensor.parallel_insert_slice"(%10, %arg6, %arg4, %arg5) <{operandSegmentSizes = array<i32: 1, 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 32, 32>, static_strides = array<i64: 1, 1>}> : (tensor<32x32xf32>, tensor<64x32xf32>, index, index) -> ()
        }) : () -> ()
      }) : (tensor<64x32xf32>) -> tensor<64x32xf32>
      %7 = "tensor.empty"() : () -> tensor<4x32x16xf32>
      %8 = "linalg.pack"(%6, %7) <{inner_dims_pos = array<i64: 0>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 16>}> : (tensor<64x32xf32>, tensor<4x32x16xf32>) -> tensor<4x32x16xf32>
      "func.return"(%8) : (tensor<4x32x16xf32>) -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.parallel_insert_slice"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg0) <{ops = ["scf.forall"]}> : (!transform.any_op) -> !transform.any_op
      %2:2 = "transform.test.fuse_consumer_using_slice"(%0, %1) <{num_consumer_to_fuse = 1 : i32, operandSegmentSizes = array<i32: 1, 1>}> : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (-d0 + 4, 16)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x4xf32>) -> tensor<1x4x16x1xf32>, sym_name = "fuse_pack_consumer_if_single_iteration"}> ({
  ^bb0(%arg1: tensor<4x4xf32>):
    %3 = "tensor.empty"() : () -> tensor<1x4x16x1xf32>
    %4 = "tensor.empty"() : () -> tensor<4x4xf32>
    %5 = "scf.forall"(%4) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>, staticLowerBound = array<i64: 0>, staticStep = array<i64: 16>, staticUpperBound = array<i64: 4>}> ({
    ^bb0(%arg2: index, %arg3: tensor<4x4xf32>):
      %8 = "affine.min"(%arg2) <{map = #map}> : (index) -> index
      %9 = "tensor.extract_slice"(%arg1, %arg2, %8) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: -9223372036854775808, 4>, static_strides = array<i64: 1, 1>}> : (tensor<4x4xf32>, index, index) -> tensor<?x4xf32>
      %10 = "tensor.extract_slice"(%arg3, %arg2, %8) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: -9223372036854775808, 4>, static_strides = array<i64: 1, 1>}> : (tensor<4x4xf32>, index, index) -> tensor<?x4xf32>
      %11 = "linalg.exp"(%9, %10) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg4: f32, %arg5: f32):
        %12 = "math.exp"(%arg4) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
        "linalg.yield"(%12) : (f32) -> ()
      }) : (tensor<?x4xf32>, tensor<?x4xf32>) -> tensor<?x4xf32>
      "scf.forall.in_parallel"() ({
        "tensor.parallel_insert_slice"(%11, %arg3, %arg2, %8) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: -9223372036854775808, 4>, static_strides = array<i64: 1, 1>}> : (tensor<?x4xf32>, tensor<4x4xf32>, index, index) -> ()
      }) : () -> ()
    }) : (tensor<4x4xf32>) -> tensor<4x4xf32>
    %6 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %7 = "linalg.pack"(%5, %3, %6) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 1, 0>, outer_dims_perm = array<i64: 0, 1>, static_inner_tiles = array<i64: 16, 1>}> : (tensor<4x4xf32>, tensor<1x4x16x1xf32>, f32) -> tensor<1x4x16x1xf32>
    "func.return"(%7) : (tensor<1x4x16x1xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.parallel_insert_slice"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg0) <{ops = ["scf.forall"]}> : (!transform.any_op) -> !transform.any_op
      %2:2 = "transform.test.fuse_consumer_using_slice"(%0, %1) <{num_consumer_to_fuse = 1 : i32, operandSegmentSizes = array<i32: 1, 1>}> : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<64x32xf32>, tensor<64x32xf32>, tensor<2x64x16x1xf32>) -> tensor<2x64x16x1xf32>, sym_name = "fuse_perfect_tiling_pack_consumer_with_outer_dims_perm"}> ({
  ^bb0(%arg1: tensor<64x32xf32>, %arg2: tensor<64x32xf32>, %arg3: tensor<2x64x16x1xf32>):
    %3 = "scf.forall"(%arg2) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>, staticLowerBound = array<i64: 0>, staticStep = array<i64: 16>, staticUpperBound = array<i64: 32>}> ({
    ^bb0(%arg4: index, %arg5: tensor<64x32xf32>):
      %5 = "tensor.extract_slice"(%arg1, %arg4) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: 0, -9223372036854775808>, static_sizes = array<i64: 64, 16>, static_strides = array<i64: 1, 1>}> : (tensor<64x32xf32>, index) -> tensor<64x16xf32>
      %6 = "tensor.extract_slice"(%arg5, %arg4) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: 0, -9223372036854775808>, static_sizes = array<i64: 64, 16>, static_strides = array<i64: 1, 1>}> : (tensor<64x32xf32>, index) -> tensor<64x16xf32>
      %7 = "linalg.exp"(%5, %6) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg6: f32, %arg7: f32):
        %8 = "math.exp"(%arg6) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
        "linalg.yield"(%8) : (f32) -> ()
      }) : (tensor<64x16xf32>, tensor<64x16xf32>) -> tensor<64x16xf32>
      "scf.forall.in_parallel"() ({
        "tensor.parallel_insert_slice"(%7, %arg5, %arg4) <{operandSegmentSizes = array<i32: 1, 1, 1, 0, 0>, static_offsets = array<i64: 0, -9223372036854775808>, static_sizes = array<i64: 64, 16>, static_strides = array<i64: 1, 1>}> : (tensor<64x16xf32>, tensor<64x32xf32>, index) -> ()
      }) : () -> ()
    }) : (tensor<64x32xf32>) -> tensor<64x32xf32>
    %4 = "linalg.pack"(%3, %arg3) <{inner_dims_pos = array<i64: 1, 0>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, outer_dims_perm = array<i64: 1, 0>, static_inner_tiles = array<i64: 16, 1>}> : (tensor<64x32xf32>, tensor<2x64x16x1xf32>) -> tensor<2x64x16x1xf32>
    "func.return"(%4) : (tensor<2x64x16x1xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.parallel_insert_slice"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg0) <{ops = ["scf.forall"]}> : (!transform.any_op) -> !transform.any_op
      %2:2 = "transform.test.fuse_consumer_using_slice"(%0, %1) <{num_consumer_to_fuse = 1 : i32, operandSegmentSizes = array<i32: 1, 1>}> : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<64x?xf32>, tensor<64x?xf32>, tensor<64x?x16xf32>) -> tensor<64x?x16xf32>, sym_name = "fuse_pack_consumer_with_no_pad_dynamic_dim"}> ({
  ^bb0(%arg1: tensor<64x?xf32>, %arg2: tensor<64x?xf32>, %arg3: tensor<64x?x16xf32>):
    %3 = "arith.constant"() <{value = 1 : index}> : () -> index
    %4 = "tensor.dim"(%arg1, %3) : (tensor<64x?xf32>, index) -> index
    %5 = "scf.forall"(%4, %arg2) <{operandSegmentSizes = array<i32: 0, 1, 0, 1>, staticLowerBound = array<i64: 0>, staticStep = array<i64: 16>, staticUpperBound = array<i64: -9223372036854775808>}> ({
    ^bb0(%arg4: index, %arg5: tensor<64x?xf32>):
      %7 = "tensor.extract_slice"(%arg1, %arg4) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: 0, -9223372036854775808>, static_sizes = array<i64: 64, 16>, static_strides = array<i64: 1, 1>}> : (tensor<64x?xf32>, index) -> tensor<64x16xf32>
      %8 = "tensor.extract_slice"(%arg5, %arg4) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: 0, -9223372036854775808>, static_sizes = array<i64: 64, 16>, static_strides = array<i64: 1, 1>}> : (tensor<64x?xf32>, index) -> tensor<64x16xf32>
      %9 = "linalg.exp"(%7, %8) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg6: f32, %arg7: f32):
        %10 = "math.exp"(%arg6) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
        "linalg.yield"(%10) : (f32) -> ()
      }) : (tensor<64x16xf32>, tensor<64x16xf32>) -> tensor<64x16xf32>
      "scf.forall.in_parallel"() ({
        "tensor.parallel_insert_slice"(%9, %arg5, %arg4) <{operandSegmentSizes = array<i32: 1, 1, 1, 0, 0>, static_offsets = array<i64: 0, -9223372036854775808>, static_sizes = array<i64: 64, 16>, static_strides = array<i64: 1, 1>}> : (tensor<64x16xf32>, tensor<64x?xf32>, index) -> ()
      }) : () -> ()
    }) : (index, tensor<64x?xf32>) -> tensor<64x?xf32>
    %6 = "linalg.pack"(%5, %arg3) <{inner_dims_pos = array<i64: 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 16>}> : (tensor<64x?xf32>, tensor<64x?x16xf32>) -> tensor<64x?x16xf32>
    "func.return"(%6) : (tensor<64x?x16xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.parallel_insert_slice"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg0) <{ops = ["scf.forall"]}> : (!transform.any_op) -> !transform.any_op
      %2:2 = "transform.test.fuse_consumer_using_slice"(%0, %1) <{num_consumer_to_fuse = 1 : i32, operandSegmentSizes = array<i32: 1, 1>}> : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (-d0 + 64, 15)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<64x32xf32>, tensor<64x32xf32>) -> tensor<22x2x3x16xf32>, sym_name = "fuse_pack_consumer_with_padding_semantics"}> ({
  ^bb0(%arg1: tensor<64x32xf32>, %arg2: tensor<64x32xf32>):
    %3 = "scf.forall"(%arg2) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>, staticLowerBound = array<i64: 0, 0>, staticStep = array<i64: 15, 16>, staticUpperBound = array<i64: 64, 32>}> ({
    ^bb0(%arg3: index, %arg4: index, %arg5: tensor<64x32xf32>):
      %7 = "affine.min"(%arg3) <{map = #map}> : (index) -> index
      %8 = "tensor.extract_slice"(%arg1, %arg3, %arg4, %7) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, 16>, static_strides = array<i64: 1, 1>}> : (tensor<64x32xf32>, index, index, index) -> tensor<?x16xf32>
      %9 = "tensor.extract_slice"(%arg5, %arg3, %arg4, %7) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, 16>, static_strides = array<i64: 1, 1>}> : (tensor<64x32xf32>, index, index, index) -> tensor<?x16xf32>
      %10 = "linalg.exp"(%8, %9) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg6: f32, %arg7: f32):
        %11 = "math.exp"(%arg6) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
        "linalg.yield"(%11) : (f32) -> ()
      }) : (tensor<?x16xf32>, tensor<?x16xf32>) -> tensor<?x16xf32>
      "scf.forall.in_parallel"() ({
        "tensor.parallel_insert_slice"(%10, %arg5, %arg3, %arg4, %7) <{operandSegmentSizes = array<i32: 1, 1, 2, 1, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, 16>, static_strides = array<i64: 1, 1>}> : (tensor<?x16xf32>, tensor<64x32xf32>, index, index, index) -> ()
      }) : () -> ()
    }) : (tensor<64x32xf32>) -> tensor<64x32xf32>
    %4 = "tensor.empty"() : () -> tensor<22x2x3x16xf32>
    %5 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %6 = "linalg.pack"(%3, %4, %5) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_inner_tiles = array<i64: 3, 16>}> : (tensor<64x32xf32>, tensor<22x2x3x16xf32>, f32) -> tensor<22x2x3x16xf32>
    "func.return"(%6) : (tensor<22x2x3x16xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.parallel_insert_slice"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg0) <{ops = ["scf.forall"]}> : (!transform.any_op) -> !transform.any_op
      %2:2 = "transform.test.fuse_consumer_using_slice"(%0, %1) <{num_consumer_to_fuse = 1 : i32, operandSegmentSizes = array<i32: 1, 1>}> : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() ({
    "func.func"() <{function_type = (tensor<256x256xf32>, tensor<256x256xf32>, tensor<256x256xf32>) -> (tensor<256x256xf32>, tensor<256x256xf32>), sym_name = "fuse_add_multiple_tilable_consumers"}> ({
    ^bb0(%arg1: tensor<256x256xf32>, %arg2: tensor<256x256xf32>, %arg3: tensor<256x256xf32>):
      %3 = "arith.constant"() <{value = 0 : index}> : () -> index
      %4 = "arith.constant"() <{value = 64 : index}> : () -> index
      %5 = "arith.constant"() <{value = 256 : index}> : () -> index
      %6 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
      %7 = "tensor.empty"() : () -> tensor<256x256xf32>
      %8 = "scf.for"(%3, %5, %4, %7) ({
      ^bb0(%arg9: index, %arg10: tensor<256x256xf32>):
        %13 = "tensor.extract_slice"(%arg10, %arg9) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: 64, 256>, static_strides = array<i64: 1, 1>}> : (tensor<256x256xf32>, index) -> tensor<64x256xf32>
        %14 = "tensor.extract_slice"(%arg1, %arg9) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: 64, 256>, static_strides = array<i64: 1, 1>}> : (tensor<256x256xf32>, index) -> tensor<64x256xf32>
        %15 = "tensor.extract_slice"(%arg2, %arg9) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: 64, 256>, static_strides = array<i64: 1, 1>}> : (tensor<256x256xf32>, index) -> tensor<64x256xf32>
        %16 = "linalg.add"(%14, %15, %13) <{operandSegmentSizes = array<i32: 2, 1>}> ({
        ^bb0(%arg11: f32, %arg12: f32, %arg13: f32):
          %18 = "arith.addf"(%arg11, %arg12) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "linalg.yield"(%18) : (f32) -> ()
        }) : (tensor<64x256xf32>, tensor<64x256xf32>, tensor<64x256xf32>) -> tensor<64x256xf32>
        %17 = "tensor.insert_slice"(%16, %arg10, %arg9) <{operandSegmentSizes = array<i32: 1, 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: 64, 256>, static_strides = array<i64: 1, 1>}> : (tensor<64x256xf32>, tensor<256x256xf32>, index) -> tensor<256x256xf32>
        "scf.yield"(%17) : (tensor<256x256xf32>) -> ()
      }) : (index, index, index, tensor<256x256xf32>) -> tensor<256x256xf32>
      %9 = "linalg.mul"(%8, %arg3, %7) <{operandSegmentSizes = array<i32: 2, 1>}> ({
      ^bb0(%arg6: f32, %arg7: f32, %arg8: f32):
        %12 = "arith.mulf"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "linalg.yield"(%12) : (f32) -> ()
      }) : (tensor<256x256xf32>, tensor<256x256xf32>, tensor<256x256xf32>) -> tensor<256x256xf32>
      %10 = "linalg.exp"(%8, %7) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg4: f32, %arg5: f32):
        %11 = "math.exp"(%arg4) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
        "linalg.yield"(%11) : (f32) -> ()
      }) : (tensor<256x256xf32>, tensor<256x256xf32>) -> tensor<256x256xf32>
      "func.return"(%9, %10) : (tensor<256x256xf32>, tensor<256x256xf32>) -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.insert_slice"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg0) <{ops = ["scf.for"]}> : (!transform.any_op) -> !transform.any_op
      %2:2 = "transform.test.fuse_consumer_using_slice"(%0, %1) <{num_consumer_to_fuse = 2 : i32, operandSegmentSizes = array<i32: 1, 1>}> : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() ({
    "func.func"() <{function_type = (tensor<256x256xf32>, tensor<256x256xf32>, tensor<256x256xf32>) -> (tensor<256x256xf32>, tensor<258x258xf32>), sym_name = "no_fuse_only_dps_consumer"}> ({
    ^bb0(%arg1: tensor<256x256xf32>, %arg2: tensor<256x256xf32>, %arg3: tensor<256x256xf32>):
      %4 = "arith.constant"() <{value = 0 : index}> : () -> index
      %5 = "arith.constant"() <{value = 64 : index}> : () -> index
      %6 = "arith.constant"() <{value = 256 : index}> : () -> index
      %7 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
      %8 = "tensor.empty"() : () -> tensor<256x256xf32>
      %9 = "scf.for"(%4, %6, %5, %8) ({
      ^bb0(%arg7: index, %arg8: tensor<256x256xf32>):
        %14 = "tensor.extract_slice"(%arg8, %arg7) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: 64, 256>, static_strides = array<i64: 1, 1>}> : (tensor<256x256xf32>, index) -> tensor<64x256xf32>
        %15 = "tensor.extract_slice"(%arg1, %arg7) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: 64, 256>, static_strides = array<i64: 1, 1>}> : (tensor<256x256xf32>, index) -> tensor<64x256xf32>
        %16 = "tensor.extract_slice"(%arg2, %arg7) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: 64, 256>, static_strides = array<i64: 1, 1>}> : (tensor<256x256xf32>, index) -> tensor<64x256xf32>
        %17 = "linalg.add"(%15, %16, %14) <{operandSegmentSizes = array<i32: 2, 1>}> ({
        ^bb0(%arg9: f32, %arg10: f32, %arg11: f32):
          %19 = "arith.addf"(%arg9, %arg10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "linalg.yield"(%19) : (f32) -> ()
        }) : (tensor<64x256xf32>, tensor<64x256xf32>, tensor<64x256xf32>) -> tensor<64x256xf32>
        %18 = "tensor.insert_slice"(%17, %arg8, %arg7) <{operandSegmentSizes = array<i32: 1, 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: 64, 256>, static_strides = array<i64: 1, 1>}> : (tensor<64x256xf32>, tensor<256x256xf32>, index) -> tensor<256x256xf32>
        "scf.yield"(%18) : (tensor<256x256xf32>) -> ()
      }) : (index, index, index, tensor<256x256xf32>) -> tensor<256x256xf32>
      %10 = "tensor.empty"() : () -> tensor<258x258xf32>
      %11 = "tensor.insert_slice"(%9, %10) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 256, 256>, static_strides = array<i64: 1, 1>}> : (tensor<256x256xf32>, tensor<258x258xf32>) -> tensor<258x258xf32>
      %12 = "linalg.mul"(%9, %arg3, %8) <{operandSegmentSizes = array<i32: 2, 1>}> ({
      ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
        %13 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "linalg.yield"(%13) : (f32) -> ()
      }) : (tensor<256x256xf32>, tensor<256x256xf32>, tensor<256x256xf32>) -> tensor<256x256xf32>
      "func.return"(%12, %11) : (tensor<256x256xf32>, tensor<258x258xf32>) -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.insert_slice"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg0) <{ops = ["scf.for"]}> : (!transform.any_op) -> !transform.any_op
      %2:2 = "transform.split_handle"(%0) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %3:2 = "transform.test.fuse_consumer_using_slice"(%2#0, %1) <{num_consumer_to_fuse = 1 : i32, operandSegmentSizes = array<i32: 1, 1>}> : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1)>
#map1 = affine_map<(d0, d1, d2) -> (d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
"builtin.module"() ({
  "builtin.module"() ({
    "func.func"() <{function_type = (tensor<256x256xf32>, tensor<256x256xf32>, tensor<24xf32>) -> tensor<256x256x24xf32>, sym_name = "fuse_with_tilable_consumer_with_projected_permutations"}> ({
    ^bb0(%arg1: tensor<256x256xf32>, %arg2: tensor<256x256xf32>, %arg3: tensor<24xf32>):
      %3 = "arith.constant"() <{value = 0 : index}> : () -> index
      %4 = "arith.constant"() <{value = 64 : index}> : () -> index
      %5 = "arith.constant"() <{value = 256 : index}> : () -> index
      %6 = "tensor.empty"() : () -> tensor<256x256xf32>
      %7 = "scf.for"(%3, %5, %4, %6) ({
      ^bb0(%arg7: index, %arg8: tensor<256x256xf32>):
        %11 = "tensor.extract_slice"(%arg8, %arg7) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: 64, 256>, static_strides = array<i64: 1, 1>}> : (tensor<256x256xf32>, index) -> tensor<64x256xf32>
        %12 = "tensor.extract_slice"(%arg1, %arg7) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: 64, 256>, static_strides = array<i64: 1, 1>}> : (tensor<256x256xf32>, index) -> tensor<64x256xf32>
        %13 = "tensor.extract_slice"(%arg2, %arg7) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: 64, 256>, static_strides = array<i64: 1, 1>}> : (tensor<256x256xf32>, index) -> tensor<64x256xf32>
        %14 = "linalg.add"(%12, %13, %11) <{operandSegmentSizes = array<i32: 2, 1>}> ({
        ^bb0(%arg9: f32, %arg10: f32, %arg11: f32):
          %16 = "arith.addf"(%arg9, %arg10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "linalg.yield"(%16) : (f32) -> ()
        }) : (tensor<64x256xf32>, tensor<64x256xf32>, tensor<64x256xf32>) -> tensor<64x256xf32>
        %15 = "tensor.insert_slice"(%14, %arg8, %arg7) <{operandSegmentSizes = array<i32: 1, 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: 64, 256>, static_strides = array<i64: 1, 1>}> : (tensor<64x256xf32>, tensor<256x256xf32>, index) -> tensor<256x256xf32>
        "scf.yield"(%15) : (tensor<256x256xf32>) -> ()
      }) : (index, index, index, tensor<256x256xf32>) -> tensor<256x256xf32>
      %8 = "tensor.empty"() : () -> tensor<256x256x24xf32>
      %9 = "linalg.generic"(%7, %arg3, %8) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
      ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
        %10 = "arith.addf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "linalg.yield"(%10) : (f32) -> ()
      }) : (tensor<256x256xf32>, tensor<24xf32>, tensor<256x256x24xf32>) -> tensor<256x256x24xf32>
      "func.return"(%9) : (tensor<256x256x24xf32>) -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.insert_slice"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg0) <{ops = ["scf.for"]}> : (!transform.any_op) -> !transform.any_op
      %2:2 = "transform.test.fuse_consumer_using_slice"(%0, %1) <{num_consumer_to_fuse = 1 : i32, operandSegmentSizes = array<i32: 1, 1>}> : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0)[s0, s1] -> (s1, -d0 + s0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<(d0, d1) -> (d0)>
#map3 = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?xf32>, tensor<?xf32>, index) -> tensor<?xf32>, sym_name = "multi_slice_fusion1"}> ({
  ^bb0(%arg1: tensor<?x?xf32>, %arg2: tensor<?xf32>, %arg3: tensor<?xf32>, %arg4: index):
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    %5 = "arith.constant"() <{value = 1 : index}> : () -> index
    %6 = "tensor.dim"(%arg1, %4) : (tensor<?x?xf32>, index) -> index
    %7 = "tensor.dim"(%arg1, %5) : (tensor<?x?xf32>, index) -> index
    %8:2 = "scf.forall"(%4, %6, %arg4, %arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 1, 1, 2>, staticLowerBound = array<i64: -9223372036854775808>, staticStep = array<i64: -9223372036854775808>, staticUpperBound = array<i64: -9223372036854775808>}> ({
    ^bb0(%arg8: index, %arg9: tensor<?xf32>, %arg10: tensor<?xf32>):
      %12 = "affine.min"(%arg8, %6, %arg4) <{map = #map}> : (index, index, index) -> index
      %13 = "tensor.extract_slice"(%arg1, %arg8, %12, %7) <{operandSegmentSizes = array<i32: 1, 1, 2, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<?x?xf32>, index, index, index) -> tensor<?x?xf32>
      %14 = "tensor.extract_slice"(%arg9, %arg8, %12) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<?xf32>, index, index) -> tensor<?xf32>
      %15 = "tensor.extract_slice"(%arg10, %arg8, %12) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<?xf32>, index, index) -> tensor<?xf32>
      %16:2 = "linalg.generic"(%13, %14, %15) <{indexing_maps = [#map1, #map2, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 2>}> ({
      ^bb0(%arg11: f32, %arg12: f32, %arg13: f32):
        %17 = "arith.mulf"(%arg11, %arg12) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        %18 = "arith.addf"(%arg11, %arg13) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "linalg.yield"(%17, %18) : (f32, f32) -> ()
      }) : (tensor<?x?xf32>, tensor<?xf32>, tensor<?xf32>) -> (tensor<?xf32>, tensor<?xf32>)
      "scf.forall.in_parallel"() ({
        "tensor.parallel_insert_slice"(%16#0, %arg9, %arg8, %12) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<?xf32>, tensor<?xf32>, index, index) -> ()
        "tensor.parallel_insert_slice"(%16#1, %arg10, %arg8, %12) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<?xf32>, tensor<?xf32>, index, index) -> ()
      }) : () -> ()
    }) : (index, index, index, tensor<?xf32>, tensor<?xf32>) -> (tensor<?xf32>, tensor<?xf32>)
    %9 = "tensor.empty"(%6) : (index) -> tensor<?xf32>
    %10 = "linalg.generic"(%8#0, %8#1, %9) <{indexing_maps = [#map3, #map3, #map3], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg5: f32, %arg6: f32, %arg7: f32):
      %11 = "arith.addf"(%arg5, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%11) : (f32) -> ()
    }) : (tensor<?xf32>, tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>
    "func.return"(%10) : (tensor<?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["scf.forall"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg0) <{ops = ["tensor.parallel_insert_slice"]}> : (!transform.any_op) -> !transform.any_op
      %2:2 = "transform.split_handle"(%1) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %3:2 = "transform.test.fuse_consumer_using_slice"(%2#0, %2#1, %0) <{num_consumer_to_fuse = 1 : i32, operandSegmentSizes = array<i32: 2, 1>}> : (!transform.any_op, !transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0)[s0, s1] -> (s1, -d0 + s0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<(d0, d1) -> (d0)>
#map3 = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?xf32>, tensor<?xf32>, index) -> tensor<?xf32>, sym_name = "multi_slice_fusion2"}> ({
  ^bb0(%arg1: tensor<?x?xf32>, %arg2: tensor<?xf32>, %arg3: tensor<?xf32>, %arg4: index):
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    %5 = "arith.constant"() <{value = 1 : index}> : () -> index
    %6 = "tensor.dim"(%arg1, %4) : (tensor<?x?xf32>, index) -> index
    %7 = "tensor.dim"(%arg1, %5) : (tensor<?x?xf32>, index) -> index
    %8:2 = "scf.forall"(%4, %6, %arg4, %arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 1, 1, 2>, staticLowerBound = array<i64: -9223372036854775808>, staticStep = array<i64: -9223372036854775808>, staticUpperBound = array<i64: -9223372036854775808>}> ({
    ^bb0(%arg8: index, %arg9: tensor<?xf32>, %arg10: tensor<?xf32>):
      %12 = "affine.min"(%arg8, %6, %arg4) <{map = #map}> : (index, index, index) -> index
      %13 = "tensor.extract_slice"(%arg1, %arg8, %12, %7) <{operandSegmentSizes = array<i32: 1, 1, 2, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<?x?xf32>, index, index, index) -> tensor<?x?xf32>
      %14 = "tensor.extract_slice"(%arg9, %arg8, %12) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<?xf32>, index, index) -> tensor<?xf32>
      %15 = "linalg.generic"(%13, %14) <{indexing_maps = [#map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg13: f32, %arg14: f32):
        %19 = "arith.mulf"(%arg13, %arg14) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "linalg.yield"(%19) : (f32) -> ()
      }) : (tensor<?x?xf32>, tensor<?xf32>) -> tensor<?xf32>
      %16 = "tensor.extract_slice"(%arg10, %arg8, %12) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<?xf32>, index, index) -> tensor<?xf32>
      %17 = "linalg.generic"(%13, %16) <{indexing_maps = [#map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg11: f32, %arg12: f32):
        %18 = "arith.addf"(%arg11, %arg12) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "linalg.yield"(%18) : (f32) -> ()
      }) : (tensor<?x?xf32>, tensor<?xf32>) -> tensor<?xf32>
      "scf.forall.in_parallel"() ({
        "tensor.parallel_insert_slice"(%15, %arg9, %arg8, %12) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<?xf32>, tensor<?xf32>, index, index) -> ()
        "tensor.parallel_insert_slice"(%17, %arg10, %arg8, %12) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<?xf32>, tensor<?xf32>, index, index) -> ()
      }) : () -> ()
    }) : (index, index, index, tensor<?xf32>, tensor<?xf32>) -> (tensor<?xf32>, tensor<?xf32>)
    %9 = "tensor.empty"(%6) : (index) -> tensor<?xf32>
    %10 = "linalg.generic"(%8#0, %8#1, %9) <{indexing_maps = [#map3, #map3, #map3], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg5: f32, %arg6: f32, %arg7: f32):
      %11 = "arith.addf"(%arg5, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%11) : (f32) -> ()
    }) : (tensor<?xf32>, tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>
    "func.return"(%10) : (tensor<?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["scf.forall"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg0) <{ops = ["tensor.parallel_insert_slice"]}> : (!transform.any_op) -> !transform.any_op
      %2:2 = "transform.split_handle"(%1) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %3:2 = "transform.test.fuse_consumer_using_slice"(%2#0, %2#1, %0) <{num_consumer_to_fuse = 1 : i32, operandSegmentSizes = array<i32: 2, 1>}> : (!transform.any_op, !transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0)[s0, s1] -> (s1, -d0 + s0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map3 = affine_map<(d0, d1) -> (d0, d1)>
#map4 = affine_map<(d0, d1) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf32>, tensor<?x?xf32>, tensor<?xf32>, index, index) -> tensor<?x?xf32>, sym_name = "multi_slice_fusion_with_broadcast"}> ({
  ^bb0(%arg1: tensor<?x?x?xf32>, %arg2: tensor<?x?xf32>, %arg3: tensor<?xf32>, %arg4: index, %arg5: index):
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    %5 = "arith.constant"() <{value = 1 : index}> : () -> index
    %6 = "arith.constant"() <{value = 2 : index}> : () -> index
    %7 = "tensor.dim"(%arg1, %4) : (tensor<?x?x?xf32>, index) -> index
    %8 = "tensor.dim"(%arg1, %5) : (tensor<?x?x?xf32>, index) -> index
    %9 = "tensor.dim"(%arg1, %6) : (tensor<?x?x?xf32>, index) -> index
    %10:2 = "scf.forall"(%4, %4, %7, %8, %arg4, %arg5, %arg2, %arg3) <{operandSegmentSizes = array<i32: 2, 2, 2, 2>, staticLowerBound = array<i64: -9223372036854775808, -9223372036854775808>, staticStep = array<i64: -9223372036854775808, -9223372036854775808>, staticUpperBound = array<i64: -9223372036854775808, -9223372036854775808>}> ({
    ^bb0(%arg9: index, %arg10: index, %arg11: tensor<?x?xf32>, %arg12: tensor<?xf32>):
      %14 = "affine.min"(%arg9, %7, %arg4) <{map = #map}> : (index, index, index) -> index
      %15 = "affine.min"(%arg10, %8, %arg5) <{map = #map}> : (index, index, index) -> index
      %16 = "tensor.extract_slice"(%arg1, %arg9, %arg10, %14, %15, %9) <{operandSegmentSizes = array<i32: 1, 2, 3, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808, 0>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1, 1>}> : (tensor<?x?x?xf32>, index, index, index, index, index) -> tensor<?x?x?xf32>
      %17 = "tensor.extract_slice"(%arg11, %arg9, %arg10, %14, %15) <{operandSegmentSizes = array<i32: 1, 2, 2, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<?x?xf32>, index, index, index, index) -> tensor<?x?xf32>
      %18 = "linalg.generic"(%16, %17) <{indexing_maps = [#map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg15: f32, %arg16: f32):
        %22 = "arith.mulf"(%arg15, %arg16) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "linalg.yield"(%22) : (f32) -> ()
      }) : (tensor<?x?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
      %19 = "tensor.extract_slice"(%arg12, %arg9, %14) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<?xf32>, index, index) -> tensor<?xf32>
      %20 = "linalg.generic"(%18, %19) <{indexing_maps = [#map3, #map4], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg13: f32, %arg14: f32):
        %21 = "arith.addf"(%arg13, %arg14) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "linalg.yield"(%21) : (f32) -> ()
      }) : (tensor<?x?xf32>, tensor<?xf32>) -> tensor<?xf32>
      "scf.forall.in_parallel"() ({
        "tensor.parallel_insert_slice"(%18, %arg11, %arg9, %arg10, %14, %15) <{operandSegmentSizes = array<i32: 1, 1, 2, 2, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<?x?xf32>, tensor<?x?xf32>, index, index, index, index) -> ()
        "tensor.parallel_insert_slice"(%20, %arg12, %arg9, %14) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (tensor<?xf32>, tensor<?xf32>, index, index) -> ()
      }) : () -> ()
    }) : (index, index, index, index, index, index, tensor<?x?xf32>, tensor<?xf32>) -> (tensor<?x?xf32>, tensor<?xf32>)
    %11 = "tensor.empty"(%7, %8) : (index, index) -> tensor<?x?xf32>
    %12 = "linalg.generic"(%10#0, %10#1, %11) <{indexing_maps = [#map3, #map4, #map3], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32, %arg8: f32):
      %13 = "arith.addf"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%13) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%12) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["scf.forall"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg0) <{ops = ["tensor.parallel_insert_slice"]}> : (!transform.any_op) -> !transform.any_op
      %2:2 = "transform.split_handle"(%1) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %3:2 = "transform.test.fuse_consumer_using_slice"(%2#0, %2#1, %0) <{num_consumer_to_fuse = 1 : i32, operandSegmentSizes = array<i32: 2, 1>}> : (!transform.any_op, !transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

