"builtin.module"() <{sym_name = "transforms"}> ({
  "transform.named_sequence"() <{arg_attrs = [{transform.consume}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main_basic"}> ({
  ^bb0(%arg1: !transform.any_op loc("<stdin>":3:8)):
    %8 = "transform.structured.match"(%arg1) <{ops = ["linalg.pack"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":4:10)
    %9 = "transform.structured.match"(%arg1) <{ops = ["linalg.unpack"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":5:10)
    %10:3 = "transform.structured.tile_using_for"(%8) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 1, 1>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":6:13)
    %11:3 = "transform.structured.tile_using_for"(%9) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 4, 1>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":7:13)
    %12 = "transform.get_parent_op"(%10#0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.op<"func.func"> loc("<stdin>":8:11)
    "transform.apply_patterns"(%12) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
      "transform.apply_patterns.linalg.decompose_pack_unpack"() : () -> () loc("<stdin>":10:7)
      "transform.apply_patterns.linalg.decompose_pad"() : () -> () loc("<stdin>":11:7)
    }) : (!transform.op<"func.func">) -> () loc("<stdin>":9:5)
    "transform.apply_patterns"(%12) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
      "transform.apply_patterns.tensor.fold_tensor_subset_ops"() : () -> () loc("<stdin>":14:7)
      "transform.apply_patterns.canonicalization"() : () -> () loc("<stdin>":15:7)
    }) : (!transform.op<"func.func">) -> () loc("<stdin>":13:5)
    %13 = "transform.get_parent_op"(%11#0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.op<"func.func"> loc("<stdin>":17:11)
    "transform.apply_patterns"(%13) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
      "transform.apply_patterns.linalg.decompose_pack_unpack"() : () -> () loc("<stdin>":19:7)
    }) : (!transform.op<"func.func">) -> () loc("<stdin>":18:5)
    "transform.apply_patterns"(%13) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
      "transform.apply_patterns.tensor.fold_tensor_subset_ops"() : () -> () loc("<stdin>":22:7)
      "transform.apply_patterns.canonicalization"() : () -> () loc("<stdin>":23:7)
    }) : (!transform.op<"func.func">) -> () loc("<stdin>":21:5)
    %14 = "transform.bufferization.one_shot_bufferize"(%arg1) <{allow_return_allocs_from_loops = false, allow_unknown_ops = false, bufferize_function_boundaries = true, check_parallel_regions = true, dump_alias_sets = false, memcpy_op = "memref.copy", print_conflicts = false, test_analysis_only = false}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":25:11)
    %15 = "transform.structured.match"(%14) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func"> loc("<stdin>":26:11)
    "transform.apply_patterns"(%15) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
      "transform.apply_patterns.canonicalization"() : () -> () loc("<stdin>":28:7)
    }) : (!transform.op<"func.func">) -> () loc("<stdin>":27:5)
    "transform.yield"() : () -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":2:3)
  "transform.named_sequence"() <{arg_attrs = [{transform.consume}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main_vectorized"}> ({
  ^bb0(%arg0: !transform.any_op loc("<stdin>":33:8)):
    %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.pack"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":34:10)
    %1 = "transform.structured.match"(%arg0) <{ops = ["linalg.unpack"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":35:10)
    %2:3 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 1, 1>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":36:12)
    %3:3 = "transform.structured.tile_using_for"(%1) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 1, 1>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":37:12)
    %4 = "transform.get_parent_op"(%2#0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.op<"func.func"> loc("<stdin>":38:10)
    "transform.apply_patterns"(%4) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
      "transform.apply_patterns.linalg.decompose_pack_unpack"() : () -> () loc("<stdin>":40:7)
      "transform.apply_patterns.linalg.decompose_pad"() : () -> () loc("<stdin>":41:7)
    }) : (!transform.op<"func.func">) -> () loc("<stdin>":39:5)
    "transform.apply_patterns"(%4) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
      "transform.apply_patterns.tensor.fold_tensor_subset_ops"() : () -> () loc("<stdin>":44:7)
      "transform.apply_patterns.canonicalization"() : () -> () loc("<stdin>":45:7)
    }) : (!transform.op<"func.func">) -> () loc("<stdin>":43:5)
    %5 = "transform.get_parent_op"(%3#0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.op<"func.func"> loc("<stdin>":47:10)
    "transform.structured.vectorize"(%3#0) <{assume_dynamic_dims_match_vec_sizes, scalable_sizes = array<i1: false, false, false, true>, static_vector_sizes = array<i64: 1, 1, 4, 4>}> : (!transform.any_op) -> () loc("<stdin>":48:5)
    "transform.apply_patterns"(%5) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
      "transform.apply_patterns.vector.transfer_permutation_patterns"() : () -> () loc("<stdin>":50:7)
      "transform.apply_patterns.vector.lower_masked_transfers"() : () -> () loc("<stdin>":51:7)
      "transform.apply_patterns.vector.sink_ops"() : () -> () loc("<stdin>":52:7)
    }) : (!transform.op<"func.func">) -> () loc("<stdin>":49:5)
    %6 = "transform.bufferization.one_shot_bufferize"(%arg0) <{allow_return_allocs_from_loops = false, allow_unknown_ops = false, bufferize_function_boundaries = true, check_parallel_regions = true, dump_alias_sets = false, memcpy_op = "memref.copy", print_conflicts = false, test_analysis_only = false}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":54:10)
    %7 = "transform.structured.match"(%6) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func"> loc("<stdin>":55:10)
    "transform.apply_patterns"(%7) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
      "transform.apply_patterns.canonicalization"() : () -> () loc("<stdin>":57:7)
    }) : (!transform.op<"func.func">) -> () loc("<stdin>":56:5)
    "transform.yield"() : () -> () loc("<stdin>":59:5)
  }) : () -> () loc("<stdin>":32:3)
}) {transform.with_named_sequence} : () -> () loc("<stdin>":1:1)
