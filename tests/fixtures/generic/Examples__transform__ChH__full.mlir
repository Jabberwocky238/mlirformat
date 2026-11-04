#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d6, d4, d5, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4, d2 + d5, d6)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
#map3 = affine_map<(d0, d1, d2, d3) -> ()>
#map4 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map5 = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{arg_attrs = [{bufferization.access = "read", bufferization.buffer_layout = #map4, bufferization.writable = false}, {bufferization.access = "read", bufferization.buffer_layout = #map4, bufferization.writable = false}, {bufferization.access = "read", bufferization.buffer_layout = #map5, bufferization.writable = false}, {bufferization.access = "write", bufferization.buffer_layout = #map4, bufferization.writable = true}], function_type = (tensor<5x82x102x128xf32>, tensor<128x3x3x128xf32>, tensor<128xf32>, tensor<5x80x100x128xf32>) -> tensor<5x80x100x128xf32>, sym_name = "conv"}> ({
  ^bb0(%arg2: tensor<5x82x102x128xf32>, %arg3: tensor<128x3x3x128xf32>, %arg4: tensor<128xf32>, %arg5: tensor<5x80x100x128xf32>):
    %20 = "tensor.empty"() : () -> tensor<5x80x100x128xf32>
    %21 = "linalg.broadcast"(%arg4, %20) <{dimensions = array<i64: 0, 1, 2>}> ({
    ^bb0(%arg12: f32, %arg13: f32):
      "linalg.yield"(%arg12) : (f32) -> ()
    }) : (tensor<128xf32>, tensor<5x80x100x128xf32>) -> tensor<5x80x100x128xf32>
    %22 = "linalg.generic"(%arg3, %arg2, %21) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg9: f32, %arg10: f32, %arg11: f32):
      %26 = "arith.mulf"(%arg9, %arg10) <{fastmath = #arith.fastmath<fast>}> : (f32, f32) -> f32
      %27 = "arith.addf"(%arg11, %26) <{fastmath = #arith.fastmath<fast>}> : (f32, f32) -> f32
      "linalg.yield"(%27) : (f32) -> ()
    }) : (tensor<128x3x3x128xf32>, tensor<5x82x102x128xf32>, tensor<5x80x100x128xf32>) -> tensor<5x80x100x128xf32>
    %23 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %24 = "linalg.generic"(%23, %22, %arg5) <{indexing_maps = [#map3, #map4, #map4], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32, %arg8: f32):
      %25 = "llvm.intr.maxnum"(%arg6, %arg7) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%25) : (f32) -> ()
    }) : (f32, tensor<5x80x100x128xf32>, tensor<5x80x100x128xf32>) -> tensor<5x80x100x128xf32>
    "func.return"(%24) : (tensor<5x80x100x128xf32>) -> ()
  }) {llvm.emit_c_interface} : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg1: !transform.any_op):
      %8 = "transform.structured.match"(%arg1) <{ops = ["linalg.broadcast"]}> : (!transform.any_op) -> !transform.any_op
      %9 = "transform.structured.match"(%arg1) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %10:2 = "transform.split_handle"(%9) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %11:2 = "transform.structured.tile_using_forall"(%10#1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0, 0>, static_tile_sizes = array<i64: 0, 0, 0, 64>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %12:2 = "transform.structured.tile_using_forall"(%11#0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0, 0>, static_tile_sizes = array<i64: 1, 1, 5, 0>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %13:2 = "transform.structured.fuse_into_containing_op"(%10#0, %11#1) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      %14:2 = "transform.structured.fuse_into_containing_op"(%13#0, %12#1) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      %15:2 = "transform.structured.fuse_into_containing_op"(%8, %13#1) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      %16:2 = "transform.structured.fuse_into_containing_op"(%15#0, %14#1) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      %17 = "transform.structured.match"(%arg1) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%17) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
      ^bb0:
      }) : (!transform.any_op) -> ()
      %18:4 = "transform.structured.tile_reduction_using_for"(%14#0) <{reduction_dims = [], tile_sizes = [0, 0, 0, 0, 1, 1, 1]}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      %19 = "transform.structured.generalize"(%16#0) : (!transform.any_op) -> !transform.any_op
      "transform.include"(%arg1) <{failure_propagation_mode = 1 : i32, target = @lower}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
    "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.any_op) -> (), sym_name = "lower"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.canonicalization"() : () -> ()
        "transform.apply_patterns.linalg.tiling_canonicalization"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.apply_cse"(%0) : (!transform.any_op) -> ()
      %1 = "transform.structured.match"(%arg0) <{interface = 2 : i32}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_licm"(%1) : (!transform.any_op) -> ()
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.linalg.fold_unit_extent_dims_via_reshapes"() : () -> ()
      }) : (!transform.any_op) -> ()
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%2) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.canonicalization"() : () -> ()
        "transform.apply_patterns.tensor.fold_tensor_subset_ops_into_vector_transfers"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.apply_cse"(%2) : (!transform.any_op) -> ()
      %3 = "transform.structured.hoist_redundant_vector_transfers"(%2) : (!transform.any_op) -> !transform.any_op
      %4 = "transform.bufferization.one_shot_bufferize"(%arg0) <{allow_return_allocs_from_loops = false, allow_unknown_ops = false, bufferize_function_boundaries = true, check_parallel_regions = true, dump_alias_sets = false, function_boundary_type_conversion = 1 : i32, memcpy_op = "memref.copy", print_conflicts = false, test_analysis_only = false}> : (!transform.any_op) -> !transform.any_op
      %5 = "transform.structured.match"(%4) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %6 = "transform.apply_registered_pass"(%5) <{options = {}, pass_name = "buffer-deallocation-pipeline"}> : (!transform.any_op) -> !transform.any_op
      %7 = "transform.structured.match"(%4) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%7) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.canonicalization"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.apply_cse"(%7) : (!transform.any_op) -> ()
      "transform.apply_patterns"(%7) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_contraction"() <{lowering_strategy = 3 : i32}> : () -> ()
        "transform.apply_patterns.vector.lower_transfer"() <{max_transfer_rank = 1 : i64}> : () -> ()
        "transform.apply_patterns.vector.lower_transpose"() <{avx2_lowering_strategy = false, lowering_strategy = 0 : i32}> : () -> ()
        "transform.apply_patterns.vector.lower_shape_cast"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.apply_patterns"(%7) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.transfer_to_scf"() <{full_unroll = false, max_transfer_rank = 1 : i64}> : () -> ()
        "transform.apply_patterns.memref.alloc_to_alloca"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.bufferization.buffer_loop_hoisting"(%7) : (!transform.any_op) -> ()
      "transform.apply_patterns"(%7) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.memref.fold_memref_alias_ops"() : () -> ()
        "transform.apply_patterns.canonicalization"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.apply_cse"(%7) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

