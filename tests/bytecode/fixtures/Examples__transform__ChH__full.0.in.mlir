"builtin.module"() ({
  "func.func"() <{arg_attrs = [{bufferization.access = "read", bufferization.buffer_layout = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>, bufferization.writable = false}, {bufferization.access = "read", bufferization.buffer_layout = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>, bufferization.writable = false}, {bufferization.access = "read", bufferization.buffer_layout = affine_map<(d0) -> (d0)>, bufferization.writable = false}, {bufferization.access = "write", bufferization.buffer_layout = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>, bufferization.writable = true}], function_type = (tensor<5x82x102x128xf32>, tensor<128x3x3x128xf32>, tensor<128xf32>, tensor<5x80x100x128xf32>) -> tensor<5x80x100x128xf32>, sym_name = "conv"}> ({
  ^bb0(%arg2: tensor<5x82x102x128xf32> loc("<stdin>":9:8), %arg3: tensor<128x3x3x128xf32> loc("<stdin>":9:41), %arg4: tensor<128xf32> loc("<stdin>":9:73), %arg5: tensor<5x80x100x128xf32> loc("<stdin>":9:97)):
    %20 = "tensor.empty"() : () -> tensor<5x80x100x128xf32> loc("<stdin>":10:11)
    %21 = "linalg.broadcast"(%arg4, %20) <{dimensions = array<i64: 0, 1, 2>}> ({
    ^bb0(%arg12: f32 loc("<stdin>":12:10), %arg13: f32 loc("<stdin>":12:23)):
      "linalg.yield"(%arg12) : (f32) -> () loc("<stdin>":13:7)
    }) : (tensor<128xf32>, tensor<5x80x100x128xf32>) -> tensor<5x80x100x128xf32> loc("<stdin>":11:11)
    %22 = "linalg.generic"(%arg3, %arg2, %21) <{indexing_maps = [affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d6, d4, d5, d3)>, affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4, d2 + d5, d6)>, affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg9: f32 loc("<stdin>":16:10), %arg10: f32 loc("<stdin>":16:22), %arg11: f32 loc("<stdin>":16:35)):
      %26 = "arith.mulf"(%arg9, %arg10) <{fastmath = #arith.fastmath<fast>}> : (f32, f32) -> f32 loc("<stdin>":17:13)
      %27 = "arith.addf"(%arg11, %26) <{fastmath = #arith.fastmath<fast>}> : (f32, f32) -> f32 loc("<stdin>":18:13)
      "linalg.yield"(%27) : (f32) -> () loc("<stdin>":19:7)
    }) : (tensor<128x3x3x128xf32>, tensor<5x82x102x128xf32>, tensor<5x80x100x128xf32>) -> tensor<5x80x100x128xf32> loc("<stdin>":15:11)
    %23 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":21:11)
    %24 = "linalg.generic"(%23, %22, %arg5) <{indexing_maps = [affine_map<(d0, d1, d2, d3) -> ()>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: f32 loc("<stdin>":23:10), %arg7: f32 loc("<stdin>":23:22), %arg8: f32 loc("<stdin>":23:34)):
      %25 = "llvm.intr.maxnum"(%arg6, %arg7) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":24:13)
      "linalg.yield"(%25) : (f32) -> () loc("<stdin>":25:7)
    }) : (f32, tensor<5x80x100x128xf32>, tensor<5x80x100x128xf32>) -> tensor<5x80x100x128xf32> loc("<stdin>":22:11)
    "func.return"(%24) : (tensor<5x80x100x128xf32>) -> () loc("<stdin>":27:5)
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":8:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg1: !transform.any_op loc("<stdin>":31:10)):
      %8 = "transform.structured.match"(%arg1) <{ops = ["linalg.broadcast"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":32:12)
      %9 = "transform.structured.match"(%arg1) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":33:12)
      %10:2 = "transform.split_handle"(%9) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op) loc("<stdin>":34:15)
      %11:2 = "transform.structured.tile_using_forall"(%10#1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0, 0>, static_tile_sizes = array<i64: 0, 0, 0, 64>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op) loc("<stdin>":35:15)
      %12:2 = "transform.structured.tile_using_forall"(%11#0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0, 0>, static_tile_sizes = array<i64: 1, 1, 5, 0>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op) loc("<stdin>":36:15)
      %13:2 = "transform.structured.fuse_into_containing_op"(%10#0, %11#1) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op) loc("<stdin>":37:15)
      %14:2 = "transform.structured.fuse_into_containing_op"(%13#0, %12#1) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op) loc("<stdin>":38:15)
      %15:2 = "transform.structured.fuse_into_containing_op"(%8, %13#1) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op) loc("<stdin>":39:15)
      %16:2 = "transform.structured.fuse_into_containing_op"(%15#0, %14#1) : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op) loc("<stdin>":40:15)
      %17 = "transform.structured.match"(%arg1) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":41:13)
      "transform.apply_patterns"(%17) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
      ^bb0:
      }) : (!transform.any_op) -> () loc("<stdin>":42:7)
      %18:4 = "transform.structured.tile_reduction_using_for"(%14#0) <{reduction_dims = [], tile_sizes = [0, 0, 0, 0, 1, 1, 1]}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":45:15)
      %19 = "transform.structured.generalize"(%16#0) : (!transform.any_op) -> !transform.any_op loc("<stdin>":46:13)
      "transform.include"(%arg1) <{failure_propagation_mode = 1 : i32, target = @lower}> : (!transform.any_op) -> () loc("<stdin>":47:7)
      "transform.yield"() : () -> () loc("<stdin>":48:7)
    }) : () -> () loc("<stdin>":30:5)
    "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.any_op) -> (), sym_name = "lower"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":51:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":52:12)
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.canonicalization"() : () -> () loc("<stdin>":54:9)
        "transform.apply_patterns.linalg.tiling_canonicalization"() : () -> () loc("<stdin>":55:9)
      }) : (!transform.any_op) -> () loc("<stdin>":53:7)
      "transform.apply_cse"(%0) : (!transform.any_op) -> () loc("<stdin>":57:7)
      %1 = "transform.structured.match"(%arg0) <{interface = 2 : i32}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":58:12)
      "transform.apply_licm"(%1) : (!transform.any_op) -> () loc("<stdin>":59:7)
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.linalg.fold_unit_extent_dims_via_reshapes"() : () -> () loc("<stdin>":61:9)
      }) : (!transform.any_op) -> () loc("<stdin>":60:7)
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%0) : (!transform.any_op) -> !transform.any_op loc("<stdin>":63:12)
      "transform.apply_patterns"(%2) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.canonicalization"() : () -> () loc("<stdin>":65:9)
        "transform.apply_patterns.tensor.fold_tensor_subset_ops_into_vector_transfers"() : () -> () loc("<stdin>":66:9)
      }) : (!transform.any_op) -> () loc("<stdin>":64:7)
      "transform.apply_cse"(%2) : (!transform.any_op) -> () loc("<stdin>":68:7)
      %3 = "transform.structured.hoist_redundant_vector_transfers"(%2) : (!transform.any_op) -> !transform.any_op loc("<stdin>":69:12)
      %4 = "transform.bufferization.one_shot_bufferize"(%arg0) <{allow_return_allocs_from_loops = false, allow_unknown_ops = false, bufferize_function_boundaries = true, check_parallel_regions = true, dump_alias_sets = false, function_boundary_type_conversion = 1 : i32, memcpy_op = "memref.copy", print_conflicts = false, test_analysis_only = false}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":70:12)
      %5 = "transform.structured.match"(%4) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":71:12)
      %6 = "transform.apply_registered_pass"(%5) <{options = {}, pass_name = "buffer-deallocation-pipeline"}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":72:12)
      %7 = "transform.structured.match"(%4) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":73:12)
      "transform.apply_patterns"(%7) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.canonicalization"() : () -> () loc("<stdin>":75:9)
      }) : (!transform.any_op) -> () loc("<stdin>":74:7)
      "transform.apply_cse"(%7) : (!transform.any_op) -> () loc("<stdin>":77:7)
      "transform.apply_patterns"(%7) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_contraction"() <{lowering_strategy = 3 : i32}> : () -> () loc("<stdin>":79:9)
        "transform.apply_patterns.vector.lower_transfer"() <{max_transfer_rank = 1 : i64}> : () -> () loc("<stdin>":80:9)
        "transform.apply_patterns.vector.lower_transpose"() <{avx2_lowering_strategy = false, lowering_strategy = 0 : i32}> : () -> () loc("<stdin>":81:9)
        "transform.apply_patterns.vector.lower_shape_cast"() : () -> () loc("<stdin>":82:9)
      }) : (!transform.any_op) -> () loc("<stdin>":78:7)
      "transform.apply_patterns"(%7) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.transfer_to_scf"() <{full_unroll = false, max_transfer_rank = 1 : i64}> : () -> () loc("<stdin>":85:9)
        "transform.apply_patterns.memref.alloc_to_alloca"() : () -> () loc("<stdin>":86:9)
      }) : (!transform.any_op) -> () loc("<stdin>":84:7)
      "transform.bufferization.buffer_loop_hoisting"(%7) : (!transform.any_op) -> () loc("<stdin>":88:7)
      "transform.apply_patterns"(%7) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.memref.fold_memref_alias_ops"() : () -> () loc("<stdin>":90:9)
        "transform.apply_patterns.canonicalization"() : () -> () loc("<stdin>":91:9)
      }) : (!transform.any_op) -> () loc("<stdin>":89:7)
      "transform.apply_cse"(%7) : (!transform.any_op) -> () loc("<stdin>":93:7)
      "transform.yield"() : () -> () loc("<stdin>":94:7)
    }) : () -> () loc("<stdin>":50:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":29:3)
}) : () -> () loc("<stdin>":7:1)
