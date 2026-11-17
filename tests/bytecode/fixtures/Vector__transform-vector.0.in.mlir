"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x16xf32>, tensor<16x32xf32>, tensor<8x32xf32>) -> tensor<8x32xf32>, sym_name = "matmul_tensors"}> ({
  ^bb0(%arg1: tensor<8x16xf32> loc("<stdin>":6:8), %arg2: tensor<16x32xf32> loc("<stdin>":6:33), %arg3: tensor<8x32xf32> loc("<stdin>":6:59)):
    %6 = "linalg.matmul"(%arg1, %arg2, %arg3) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32 loc("<stdin>":8:10), %arg5: f32 loc("<stdin>":8:22), %arg6: f32 loc("<stdin>":8:34)):
      %7 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":9:12)
      %8 = "arith.addf"(%arg6, %7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":10:12)
      "linalg.yield"(%8) : (f32) -> () loc("<stdin>":11:7)
    }) : (tensor<8x16xf32>, tensor<16x32xf32>, tensor<8x32xf32>) -> tensor<8x32xf32> loc("<stdin>":7:10)
    "func.return"(%6) : (tensor<8x32xf32>) -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":5:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":17:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":18:12)
      %1:4 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false, false>, static_sizes = array<i64: 8, 4, 2>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":19:14)
      %2 = "transform.get_parent_op"(%1#0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":20:12)
      %3 = "transform.structured.vectorize_children_and_apply_patterns"(%2) : (!transform.any_op) -> !transform.any_op loc("<stdin>":21:12)
      %4 = "transform.bufferization.one_shot_bufferize"(%arg0) <{allow_return_allocs_from_loops = false, allow_unknown_ops = false, bufferize_function_boundaries = true, check_parallel_regions = true, dump_alias_sets = false, function_boundary_type_conversion = 1 : i32, memcpy_op = "memref.copy", print_conflicts = false, test_analysis_only = false}> {allow_return_allocs = true} : (!transform.any_op) -> !transform.any_op loc("<stdin>":22:12)
      %5 = "transform.structured.match"(%4) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":23:12)
      "transform.apply_patterns"(%5) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_contraction"() <{lowering_strategy = 2 : i32}> : () -> () loc("<stdin>":25:9)
      }) : (!transform.any_op) -> () loc("<stdin>":24:7)
      "transform.apply_patterns"(%5) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.transfer_permutation_patterns"() : () -> () loc("<stdin>":28:9)
      }) : (!transform.any_op) -> () loc("<stdin>":27:7)
      "transform.apply_patterns"(%5) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.reorder_multi_reduction_dims"() <{lowering_strategy = 0 : i32}> : () -> () loc("<stdin>":31:9)
        "transform.apply_patterns.vector.multi_reduction_flattening"() <{lowering_strategy = 0 : i32}> : () -> () loc("<stdin>":32:9)
        "transform.apply_patterns.vector.multi_reduction_unrolling"() <{lowering_strategy = 0 : i32}> : () -> () loc("<stdin>":33:9)
      }) : (!transform.any_op) -> () loc("<stdin>":30:7)
      "transform.apply_patterns"(%5) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.split_transfer_full_partial"() <{split_transfer_strategy = 2 : i32}> : () -> () loc("<stdin>":36:9)
      }) : (!transform.any_op) -> () loc("<stdin>":35:7)
      "transform.apply_patterns"(%5) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.transfer_to_scf"() <{full_unroll = true, max_transfer_rank = 1 : i64}> : () -> () loc("<stdin>":39:9)
      }) : (!transform.any_op) -> () loc("<stdin>":38:7)
      "transform.apply_patterns"(%5) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_transfer"() <{max_transfer_rank = 1 : i64}> : () -> () loc("<stdin>":42:9)
      }) : (!transform.any_op) -> () loc("<stdin>":41:7)
      "transform.apply_patterns"(%5) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_shape_cast"() : () -> () loc("<stdin>":45:9)
      }) : (!transform.any_op) -> () loc("<stdin>":44:7)
      "transform.apply_patterns"(%5) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_transpose"() <{avx2_lowering_strategy = false, lowering_strategy = 2 : i32}> : () -> () loc("<stdin>":48:9)
      }) : (!transform.any_op) -> () loc("<stdin>":47:7)
      "transform.yield"() : () -> () loc("<stdin>":50:7)
    }) : () -> () loc("<stdin>":16:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":15:3)
}) : () -> () loc("<stdin>":4:1)
