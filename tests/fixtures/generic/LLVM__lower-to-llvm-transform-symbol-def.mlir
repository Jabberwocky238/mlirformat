"builtin.module"() <{sym_name = "lower_module_to_cpu"}> ({
  "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.any_op) -> !transform.any_op, sym_name = "lower_to_cpu"}> ({
  ^bb0(%arg0: !transform.any_op):
    %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
    %1 = "transform.apply_registered_pass"(%0) <{options = {}, pass_name = "convert-vector-to-scf"}> : (!transform.any_op) -> !transform.any_op
    %2 = "transform.apply_registered_pass"(%1) <{options = {}, pass_name = "convert-linalg-to-loops"}> : (!transform.any_op) -> !transform.any_op
    %3 = "transform.apply_registered_pass"(%2) <{options = {}, pass_name = "convert-scf-to-cf"}> : (!transform.any_op) -> !transform.any_op
    %4 = "transform.apply_registered_pass"(%3) <{options = {}, pass_name = "expand-strided-metadata"}> : (!transform.any_op) -> !transform.any_op
    %5 = "transform.apply_registered_pass"(%4) <{options = {}, pass_name = "lower-affine"}> : (!transform.any_op) -> !transform.any_op
    "transform.apply_conversion_patterns"(%5) <{legal_dialects = ["llvm"], partial_conversion}> ({
      "transform.apply_conversion_patterns.dialect_to_llvm"() <{dialect_name = "math"}> : () -> ()
      "transform.apply_conversion_patterns.vector.vector_to_llvm"() <{force_32bit_vector_indices = true, reassociate_fp_reductions = false, use_vector_alignment = false}> : () -> ()
      "transform.apply_conversion_patterns.dialect_to_llvm"() <{dialect_name = "memref"}> : () -> ()
      "transform.apply_conversion_patterns.func.func_to_llvm"() : () -> ()
      "transform.apply_conversion_patterns.dialect_to_llvm"() <{dialect_name = "index"}> : () -> ()
      "transform.apply_conversion_patterns.dialect_to_llvm"() <{dialect_name = "arith"}> : () -> ()
      "transform.apply_conversion_patterns.dialect_to_llvm"() <{dialect_name = "cf"}> : () -> ()
    }, {
      "transform.apply_conversion_patterns.memref.memref_to_llvm_type_converter"() <{index_bitwidth = 64 : i64}> {use_bare_ptr = false, use_bare_ptr_memref_call_conv = false, use_opaque_pointers = true} : () -> ()
    }) : (!transform.any_op) -> ()
    %6 = "transform.apply_registered_pass"(%arg0) <{options = {}, pass_name = "reconcile-unrealized-casts"}> : (!transform.any_op) -> !transform.any_op
    "transform.yield"(%6) : (!transform.any_op) -> ()
  }) : () -> ()
}) {transform.with_named_sequence} : () -> ()

