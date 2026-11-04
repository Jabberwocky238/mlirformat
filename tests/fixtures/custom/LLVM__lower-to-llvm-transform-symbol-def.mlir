module @lower_module_to_cpu attributes {transform.with_named_sequence} {
  transform.named_sequence @lower_to_cpu(%arg0: !transform.any_op {transform.consumed}) -> !transform.any_op {
    %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
    %1 = transform.apply_registered_pass "convert-vector-to-scf" to %0 : (!transform.any_op) -> !transform.any_op
    %2 = transform.apply_registered_pass "convert-linalg-to-loops" to %1 : (!transform.any_op) -> !transform.any_op
    %3 = transform.apply_registered_pass "convert-scf-to-cf" to %2 : (!transform.any_op) -> !transform.any_op
    %4 = transform.apply_registered_pass "expand-strided-metadata" to %3 : (!transform.any_op) -> !transform.any_op
    %5 = transform.apply_registered_pass "lower-affine" to %4 : (!transform.any_op) -> !transform.any_op
    transform.apply_conversion_patterns to %5 {
      transform.apply_conversion_patterns.dialect_to_llvm "math"
      transform.apply_conversion_patterns.vector.vector_to_llvm
      transform.apply_conversion_patterns.dialect_to_llvm "memref"
      transform.apply_conversion_patterns.func.func_to_llvm
      transform.apply_conversion_patterns.dialect_to_llvm "index"
      transform.apply_conversion_patterns.dialect_to_llvm "arith"
      transform.apply_conversion_patterns.dialect_to_llvm "cf"
    } with type_converter {
      transform.apply_conversion_patterns.memref.memref_to_llvm_type_converter {use_bare_ptr = false, use_bare_ptr_memref_call_conv = false, use_opaque_pointers = true}
    } {legal_dialects = ["llvm"], partial_conversion} : !transform.any_op
    %6 = transform.apply_registered_pass "reconcile-unrealized-casts" to %arg0 : (!transform.any_op) -> !transform.any_op
    transform.yield %6 : !transform.any_op
  }
}

