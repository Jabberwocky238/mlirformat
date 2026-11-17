"builtin.module"() <{sym_name = "lower_module_to_llvm"}> ({
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> !transform.any_op, sym_name = "lower_to_llvm"}> ({
  ^bb0(%arg0: !transform.any_op loc("<stdin>":3:8)):
    %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":4:10)
    %1 = "transform.apply_registered_pass"(%0) <{options = {}, pass_name = "convert-vector-to-scf"}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":5:10)
    %2 = "transform.apply_registered_pass"(%1) <{options = {}, pass_name = "convert-linalg-to-loops"}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":6:10)
    %3 = "transform.apply_registered_pass"(%2) <{options = {}, pass_name = "convert-scf-to-cf"}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":7:10)
    %4 = "transform.apply_registered_pass"(%3) <{options = {}, pass_name = "expand-strided-metadata"}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":8:10)
    %5 = "transform.apply_registered_pass"(%4) <{options = {}, pass_name = "lower-affine"}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":9:10)
    "transform.apply_conversion_patterns"(%5) <{legal_dialects = ["llvm"], partial_conversion}> ({
      "transform.apply_conversion_patterns.dialect_to_llvm"() <{dialect_name = "math"}> : () -> () loc("<stdin>":11:7)
      "transform.apply_conversion_patterns.vector.vector_to_llvm"() <{force_32bit_vector_indices = true, reassociate_fp_reductions = false, use_vector_alignment = false}> : () -> () loc("<stdin>":12:7)
      "transform.apply_conversion_patterns.dialect_to_llvm"() <{dialect_name = "memref"}> : () -> () loc("<stdin>":13:7)
      "transform.apply_conversion_patterns.func.func_to_llvm"() : () -> () loc("<stdin>":14:7)
      "transform.apply_conversion_patterns.dialect_to_llvm"() <{dialect_name = "index"}> : () -> () loc("<stdin>":15:7)
      "transform.apply_conversion_patterns.dialect_to_llvm"() <{dialect_name = "arith"}> : () -> () loc("<stdin>":16:7)
      "transform.apply_conversion_patterns.dialect_to_llvm"() <{dialect_name = "cf"}> : () -> () loc("<stdin>":17:7)
    }, {
      "transform.apply_conversion_patterns.memref.memref_to_llvm_type_converter"() <{index_bitwidth = 64 : i64}> {use_bare_ptr = false, use_bare_ptr_memref_call_conv = false, use_opaque_pointers = true} : () -> () loc("<stdin>":19:7)
    }) : (!transform.any_op) -> () loc("<stdin>":10:5)
    %6 = "transform.structured.match"(%arg0) <{ops = ["llvm.func"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":21:10)
    %7 = "transform.apply_registered_pass"(%6) <{options = {}, pass_name = "reconcile-unrealized-casts"}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":22:10)
    "transform.yield"(%arg0) : (!transform.any_op) -> () loc("<stdin>":23:5)
  }) : () -> () loc("<stdin>":2:3)
}) {transform.with_named_sequence} : () -> () loc("<stdin>":1:1)
