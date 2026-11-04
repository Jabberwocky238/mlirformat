"builtin.module"() <{sym_name = "transforms"}> ({
  "transform.named_sequence"() <{arg_attrs = [{transform.consume}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main_basic"}> ({
  ^bb0(%arg1: !transform.any_op):
    %8 = "transform.structured.match"(%arg1) <{ops = ["linalg.pack"]}> : (!transform.any_op) -> !transform.any_op
    %9 = "transform.structured.match"(%arg1) <{ops = ["linalg.unpack"]}> : (!transform.any_op) -> !transform.any_op
    %10:3 = "transform.structured.tile_using_for"(%8) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 1, 1>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
    %11:3 = "transform.structured.tile_using_for"(%9) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 4, 1>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
    %12 = "transform.get_parent_op"(%10#0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.op<"func.func">
    "transform.apply_patterns"(%12) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
      "transform.apply_patterns.linalg.decompose_pack_unpack"() : () -> ()
      "transform.apply_patterns.linalg.decompose_pad"() : () -> ()
    }) : (!transform.op<"func.func">) -> ()
    "transform.apply_patterns"(%12) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
      "transform.apply_patterns.tensor.fold_tensor_subset_ops"() : () -> ()
      "transform.apply_patterns.canonicalization"() : () -> ()
    }) : (!transform.op<"func.func">) -> ()
    %13 = "transform.get_parent_op"(%11#0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.op<"func.func">
    "transform.apply_patterns"(%13) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
      "transform.apply_patterns.linalg.decompose_pack_unpack"() : () -> ()
    }) : (!transform.op<"func.func">) -> ()
    "transform.apply_patterns"(%13) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
      "transform.apply_patterns.tensor.fold_tensor_subset_ops"() : () -> ()
      "transform.apply_patterns.canonicalization"() : () -> ()
    }) : (!transform.op<"func.func">) -> ()
    %14 = "transform.bufferization.one_shot_bufferize"(%arg1) <{allow_return_allocs_from_loops = false, allow_unknown_ops = false, bufferize_function_boundaries = true, check_parallel_regions = true, dump_alias_sets = false, memcpy_op = "memref.copy", print_conflicts = false, test_analysis_only = false}> : (!transform.any_op) -> !transform.any_op
    %15 = "transform.structured.match"(%14) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
    "transform.apply_patterns"(%15) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
      "transform.apply_patterns.canonicalization"() : () -> ()
    }) : (!transform.op<"func.func">) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.consume}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main_vectorized"}> ({
  ^bb0(%arg0: !transform.any_op):
    %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.pack"]}> : (!transform.any_op) -> !transform.any_op
    %1 = "transform.structured.match"(%arg0) <{ops = ["linalg.unpack"]}> : (!transform.any_op) -> !transform.any_op
    %2:3 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 1, 1>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
    %3:3 = "transform.structured.tile_using_for"(%1) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 1, 1>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
    %4 = "transform.get_parent_op"(%2#0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.op<"func.func">
    "transform.apply_patterns"(%4) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
      "transform.apply_patterns.linalg.decompose_pack_unpack"() : () -> ()
      "transform.apply_patterns.linalg.decompose_pad"() : () -> ()
    }) : (!transform.op<"func.func">) -> ()
    "transform.apply_patterns"(%4) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
      "transform.apply_patterns.tensor.fold_tensor_subset_ops"() : () -> ()
      "transform.apply_patterns.canonicalization"() : () -> ()
    }) : (!transform.op<"func.func">) -> ()
    %5 = "transform.get_parent_op"(%3#0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.op<"func.func">
    "transform.structured.vectorize"(%3#0) <{assume_dynamic_dims_match_vec_sizes, scalable_sizes = array<i1: false, false, false, true>, static_vector_sizes = array<i64: 1, 1, 4, 4>}> : (!transform.any_op) -> ()
    "transform.apply_patterns"(%5) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
      "transform.apply_patterns.vector.transfer_permutation_patterns"() : () -> ()
      "transform.apply_patterns.vector.lower_masked_transfers"() : () -> ()
      "transform.apply_patterns.vector.sink_ops"() : () -> ()
    }) : (!transform.op<"func.func">) -> ()
    %6 = "transform.bufferization.one_shot_bufferize"(%arg0) <{allow_return_allocs_from_loops = false, allow_unknown_ops = false, bufferize_function_boundaries = true, check_parallel_regions = true, dump_alias_sets = false, memcpy_op = "memref.copy", print_conflicts = false, test_analysis_only = false}> : (!transform.any_op) -> !transform.any_op
    %7 = "transform.structured.match"(%6) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
    "transform.apply_patterns"(%7) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
      "transform.apply_patterns.canonicalization"() : () -> ()
    }) : (!transform.op<"func.func">) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
}) {transform.with_named_sequence} : () -> ()

