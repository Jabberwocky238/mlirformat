"builtin.module"() ({
  "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
  ^bb0(%arg0: !transform.any_op):
    %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
    %1 = "transform.apply_registered_pass"(%0) <{options = {}, pass_name = "tosa-to-linalg"}> : (!transform.any_op) -> !transform.any_op
    %2 = "transform.bufferization.one_shot_bufferize"(%arg0) <{allow_return_allocs_from_loops = false, allow_unknown_ops = false, bufferize_function_boundaries = true, check_parallel_regions = true, dump_alias_sets = false, function_boundary_type_conversion = 1 : i32, memcpy_op = "memref.copy", print_conflicts = false, test_analysis_only = false}> : (!transform.any_op) -> !transform.op<"builtin.module">
    %3 = "transform.structured.match"(%2) <{ops = ["func.func"]}> : (!transform.op<"builtin.module">) -> !transform.any_op
    %4 = "transform.get_parent_op"(%3) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
    %5 = "transform.apply_registered_pass"(%4) <{options = {"hoist-static-allocs" = true}, pass_name = "buffer-results-to-out-params"}> : (!transform.any_op) -> !transform.any_op
    %6 = "transform.apply_registered_pass"(%5) <{options = {}, pass_name = "convert-linalg-to-loops"}> : (!transform.any_op) -> !transform.any_op
    "transform.apply_patterns"(%6) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
      "transform.apply_patterns.canonicalization"() : () -> ()
    }) : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
}) {transform.with_named_sequence} : () -> ()

