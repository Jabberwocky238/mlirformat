module attributes {transform.with_named_sequence} {
  transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.consumed}) {
    %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
    %1 = transform.apply_registered_pass "tosa-to-linalg" to %0 : (!transform.any_op) -> !transform.any_op
    %2 = transform.bufferization.one_shot_bufferize layout{IdentityLayoutMap} %arg0 {bufferize_function_boundaries = true} : (!transform.any_op) -> !transform.op<"builtin.module">
    %3 = transform.structured.match ops{["func.func"]} in %2 : (!transform.op<"builtin.module">) -> !transform.any_op
    %4 = transform.get_parent_op %3 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
    %5 = transform.apply_registered_pass "buffer-results-to-out-params" with options = {"hoist-static-allocs" = true} to %4 : (!transform.any_op) -> !transform.any_op
    %6 = transform.apply_registered_pass "convert-linalg-to-loops" to %5 : (!transform.any_op) -> !transform.any_op
    transform.apply_patterns to %6 {
      transform.apply_patterns.canonicalization
    } : !transform.any_op
    transform.yield 
  }
}

