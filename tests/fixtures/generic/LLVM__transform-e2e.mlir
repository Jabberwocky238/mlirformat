#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x4xf32>, tensor<4x6xf32>, tensor<2x6xf32>) -> tensor<2x6xf32>, sym_name = "matmul_tensors"}> ({
  ^bb0(%arg1: tensor<2x4xf32>, %arg2: tensor<4x6xf32>, %arg3: tensor<2x6xf32>):
    %6 = "linalg.matmul"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %7 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %8 = "arith.addf"(%arg6, %7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%8) : (f32) -> ()
    }) : (tensor<2x4xf32>, tensor<4x6xf32>, tensor<2x6xf32>) -> tensor<2x6xf32>
    "func.return"(%6) : (tensor<2x6xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1:4 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false, false>, static_sizes = array<i64: 2, 2, 2>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      %2 = "transform.get_parent_op"(%1#0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %3 = "transform.structured.vectorize_children_and_apply_patterns"(%2) : (!transform.any_op) -> !transform.any_op
      %4 = "transform.bufferization.one_shot_bufferize"(%arg0) <{allow_return_allocs_from_loops = false, allow_unknown_ops = false, bufferize_function_boundaries = true, check_parallel_regions = true, dump_alias_sets = false, function_boundary_type_conversion = 1 : i32, memcpy_op = "memref.copy", print_conflicts = false, test_analysis_only = false}> : (!transform.any_op) -> !transform.any_op
      %5 = "transform.structured.match"(%4) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%5) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_contraction"() <{lowering_strategy = 2 : i32}> : () -> ()
        "transform.apply_patterns.vector.transfer_permutation_patterns"() : () -> ()
        "transform.apply_patterns.vector.reorder_multi_reduction_dims"() <{lowering_strategy = 0 : i32}> : () -> ()
        "transform.apply_patterns.vector.multi_reduction_flattening"() <{lowering_strategy = 0 : i32}> : () -> ()
        "transform.apply_patterns.vector.multi_reduction_unrolling"() <{lowering_strategy = 0 : i32}> : () -> ()
        "transform.apply_patterns.vector.split_transfer_full_partial"() <{split_transfer_strategy = 2 : i32}> : () -> ()
        "transform.apply_patterns.vector.transfer_to_scf"() <{full_unroll = true, max_transfer_rank = 1 : i64}> : () -> ()
        "transform.apply_patterns.vector.lower_transfer"() <{max_transfer_rank = 1 : i64}> : () -> ()
        "transform.apply_patterns.vector.lower_shape_cast"() : () -> ()
        "transform.apply_patterns.vector.lower_transpose"() <{avx2_lowering_strategy = false, lowering_strategy = 2 : i32}> : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

