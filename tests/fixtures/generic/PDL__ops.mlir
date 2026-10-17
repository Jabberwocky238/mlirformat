"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "pdl.pattern"() <{benefit = 1 : i16, sym_name = "operations"}> ({
    %0 = "pdl.attribute"() : () -> !pdl.attribute
    %1 = "pdl.type"() : () -> !pdl.type
    %2 = "pdl.operation"(%0, %1) <{attributeValueNames = ["attr"], operandSegmentSizes = array<i32: 0, 1, 1>}> : (!pdl.attribute, !pdl.type) -> !pdl.operation
    %3 = "pdl.result"(%2) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.value
    %4 = "pdl.operand"() : () -> !pdl.value
    %5 = "pdl.operation"(%3, %4) <{attributeValueNames = [], operandSegmentSizes = array<i32: 2, 0, 0>}> : (!pdl.value, !pdl.value) -> !pdl.operation
    "pdl.rewrite"(%5) <{name = "rewriter", operandSegmentSizes = array<i32: 1, 0>}> ({
    }) : (!pdl.operation) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "pdl.pattern"() <{benefit = 1 : i16, sym_name = "rewrite_with_args"}> ({
    %0 = "pdl.operand"() : () -> !pdl.value
    %1 = "pdl.operation"(%0) <{attributeValueNames = [], operandSegmentSizes = array<i32: 1, 0, 0>}> : (!pdl.value) -> !pdl.operation
    "pdl.rewrite"(%1, %0) <{name = "rewriter", operandSegmentSizes = array<i32: 1, 1>}> ({
    }) : (!pdl.operation, !pdl.value) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "pdl.pattern"() <{benefit = 2 : i16, sym_name = "rewrite_multi_root_optimal"}> ({
    %0 = "pdl.operand"() : () -> !pdl.value
    %1 = "pdl.operand"() : () -> !pdl.value
    %2 = "pdl.type"() : () -> !pdl.type
    %3 = "pdl.operation"(%0, %2) <{attributeValueNames = [], operandSegmentSizes = array<i32: 1, 0, 1>}> : (!pdl.value, !pdl.type) -> !pdl.operation
    %4 = "pdl.result"(%3) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.value
    %5 = "pdl.operation"(%4) <{attributeValueNames = [], operandSegmentSizes = array<i32: 1, 0, 0>}> : (!pdl.value) -> !pdl.operation
    %6 = "pdl.operation"(%1, %2) <{attributeValueNames = [], operandSegmentSizes = array<i32: 1, 0, 1>}> : (!pdl.value, !pdl.type) -> !pdl.operation
    %7 = "pdl.result"(%6) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.value
    %8 = "pdl.operation"(%4, %7) <{attributeValueNames = [], operandSegmentSizes = array<i32: 2, 0, 0>}> : (!pdl.value, !pdl.value) -> !pdl.operation
    "pdl.rewrite"(%5, %8) <{name = "rewriter", operandSegmentSizes = array<i32: 0, 2>}> ({
    }) : (!pdl.operation, !pdl.operation) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "pdl.pattern"() <{benefit = 2 : i16, sym_name = "rewrite_multi_root_forced"}> ({
    %0 = "pdl.operand"() : () -> !pdl.value
    %1 = "pdl.operand"() : () -> !pdl.value
    %2 = "pdl.type"() : () -> !pdl.type
    %3 = "pdl.operation"(%0, %2) <{attributeValueNames = [], operandSegmentSizes = array<i32: 1, 0, 1>}> : (!pdl.value, !pdl.type) -> !pdl.operation
    %4 = "pdl.result"(%3) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.value
    %5 = "pdl.operation"(%4) <{attributeValueNames = [], operandSegmentSizes = array<i32: 1, 0, 0>}> : (!pdl.value) -> !pdl.operation
    %6 = "pdl.operation"(%1, %2) <{attributeValueNames = [], operandSegmentSizes = array<i32: 1, 0, 1>}> : (!pdl.value, !pdl.type) -> !pdl.operation
    %7 = "pdl.result"(%6) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.value
    %8 = "pdl.operation"(%4, %7) <{attributeValueNames = [], operandSegmentSizes = array<i32: 2, 0, 0>}> : (!pdl.value, !pdl.value) -> !pdl.operation
    "pdl.rewrite"(%5, %8) <{name = "rewriter", operandSegmentSizes = array<i32: 1, 1>}> ({
    }) : (!pdl.operation, !pdl.operation) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "pdl.pattern"() <{benefit = 1 : i16, sym_name = "infer_type_from_operation_replace"}> ({
    %0 = "pdl.type"() <{constantType = i32}> : () -> !pdl.type
    %1 = "pdl.type"() : () -> !pdl.type
    %2 = "pdl.operation"(%0, %1) <{attributeValueNames = [], operandSegmentSizes = array<i32: 0, 0, 2>}> : (!pdl.type, !pdl.type) -> !pdl.operation
    "pdl.rewrite"(%2) <{operandSegmentSizes = array<i32: 1, 0>}> ({
      %3 = "pdl.type"() : () -> !pdl.type
      %4 = "pdl.operation"(%0, %3) <{attributeValueNames = [], opName = "foo.op", operandSegmentSizes = array<i32: 0, 0, 2>}> : (!pdl.type, !pdl.type) -> !pdl.operation
      "pdl.replace"(%2, %4) <{operandSegmentSizes = array<i32: 1, 1, 0>}> : (!pdl.operation, !pdl.operation) -> ()
    }) : (!pdl.operation) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "pdl.pattern"() <{benefit = 1 : i16, sym_name = "infer_type_from_type_used_in_match"}> ({
    %0 = "pdl.type"() <{constantType = i32}> : () -> !pdl.type
    %1 = "pdl.type"() : () -> !pdl.type
    %2 = "pdl.operation"(%0, %1) <{attributeValueNames = [], operandSegmentSizes = array<i32: 0, 0, 2>}> : (!pdl.type, !pdl.type) -> !pdl.operation
    "pdl.rewrite"(%2) <{operandSegmentSizes = array<i32: 1, 0>}> ({
      %3 = "pdl.operation"(%0, %1) <{attributeValueNames = [], opName = "foo.op", operandSegmentSizes = array<i32: 0, 0, 2>}> : (!pdl.type, !pdl.type) -> !pdl.operation
    }) : (!pdl.operation) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "pdl.pattern"() <{benefit = 1 : i16, sym_name = "infer_type_from_type_used_in_match"}> ({
    %0 = "pdl.types"() : () -> !pdl.range<type>
    %1 = "pdl.operation"(%0) <{attributeValueNames = [], operandSegmentSizes = array<i32: 0, 0, 1>}> : (!pdl.range<type>) -> !pdl.operation
    "pdl.rewrite"(%1) <{operandSegmentSizes = array<i32: 1, 0>}> ({
      %2 = "pdl.types"() <{constantTypes = [i32, i64]}> : () -> !pdl.range<type>
      %3 = "pdl.operation"(%0, %2) <{attributeValueNames = [], opName = "foo.op", operandSegmentSizes = array<i32: 0, 0, 2>}> : (!pdl.range<type>, !pdl.range<type>) -> !pdl.operation
    }) : (!pdl.operation) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "pdl.pattern"() <{benefit = 1 : i16, sym_name = "infer_type_from_type_used_in_match"}> ({
    %0 = "pdl.type"() : () -> !pdl.type
    %1 = "pdl.type"() : () -> !pdl.type
    %2 = "pdl.operand"(%0) : (!pdl.type) -> !pdl.value
    %3 = "pdl.operand"(%1) : (!pdl.type) -> !pdl.value
    %4 = "pdl.operation"(%2, %3) <{attributeValueNames = [], operandSegmentSizes = array<i32: 2, 0, 0>}> : (!pdl.value, !pdl.value) -> !pdl.operation
    "pdl.rewrite"(%4) <{operandSegmentSizes = array<i32: 1, 0>}> ({
      %5 = "pdl.operation"(%0, %1) <{attributeValueNames = [], opName = "foo.op", operandSegmentSizes = array<i32: 0, 0, 2>}> : (!pdl.type, !pdl.type) -> !pdl.operation
    }) : (!pdl.operation) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "pdl.pattern"() <{benefit = 1 : i16, sym_name = "infer_type_from_type_used_in_match"}> ({
    %0 = "pdl.types"() : () -> !pdl.range<type>
    %1 = "pdl.operands"(%0) : (!pdl.range<type>) -> !pdl.range<value>
    %2 = "pdl.operation"(%1) <{attributeValueNames = [], operandSegmentSizes = array<i32: 1, 0, 0>}> : (!pdl.range<value>) -> !pdl.operation
    "pdl.rewrite"(%2) <{operandSegmentSizes = array<i32: 1, 0>}> ({
      %3 = "pdl.operation"(%0) <{attributeValueNames = [], opName = "foo.op", operandSegmentSizes = array<i32: 0, 0, 1>}> : (!pdl.range<type>) -> !pdl.operation
    }) : (!pdl.operation) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "pdl.pattern"() <{benefit = 1 : i16, sym_name = "apply_rewrite_with_no_results"}> ({
    %0 = "pdl.operation"() <{attributeValueNames = [], operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> !pdl.operation
    "pdl.rewrite"(%0) <{operandSegmentSizes = array<i32: 1, 0>}> ({
      "pdl.apply_native_rewrite"(%0) <{name = "NativeRewrite"}> : (!pdl.operation) -> ()
    }) : (!pdl.operation) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "pdl.pattern"() <{benefit = 1 : i16, sym_name = "apply_constraint_with_no_results"}> ({
    %0 = "pdl.operation"() <{attributeValueNames = [], operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> !pdl.operation
    "pdl.apply_native_constraint"(%0) <{isNegated = false, name = "NativeConstraint"}> : (!pdl.operation) -> ()
    "pdl.rewrite"(%0) <{name = "rewriter", operandSegmentSizes = array<i32: 1, 0>}> ({
    }) : (!pdl.operation) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "pdl.pattern"() <{benefit = 1 : i16, sym_name = "apply_constraint_with_results"}> ({
    %0 = "pdl.operation"() <{attributeValueNames = [], operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> !pdl.operation
    %1 = "pdl.apply_native_constraint"(%0) <{isNegated = false, name = "NativeConstraint"}> : (!pdl.operation) -> !pdl.attribute
    "pdl.rewrite"(%0) <{operandSegmentSizes = array<i32: 1, 0>}> ({
      "pdl.apply_native_rewrite"(%1) <{name = "NativeRewrite"}> : (!pdl.attribute) -> ()
    }) : (!pdl.operation) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "pdl.pattern"() <{benefit = 1 : i16, sym_name = "attribute_with_dict"}> ({
    %0 = "pdl.operation"() <{attributeValueNames = [], operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> !pdl.operation
    "pdl.rewrite"(%0) <{operandSegmentSizes = array<i32: 1, 0>}> ({
      %1 = "pdl.attribute"() <{value = {some_unit_attr}}> {pdl.special_attribute} : () -> !pdl.attribute
      "pdl.apply_native_rewrite"(%1) <{name = "NativeRewrite"}> : (!pdl.attribute) -> ()
    }) : (!pdl.operation) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "pdl.pattern"() <{benefit = 1 : i16, sym_name = "attribute_with_loc"}> ({
    %0 = "pdl.attribute"() : () -> !pdl.attribute
    %1 = "pdl.operation"(%0) <{attributeValueNames = ["attribute"], operandSegmentSizes = array<i32: 0, 1, 0>}> : (!pdl.attribute) -> !pdl.operation
    "pdl.rewrite"(%1) <{name = "rewriter", operandSegmentSizes = array<i32: 1, 0>}> ({
    }) : (!pdl.operation) -> ()
  }) : () -> ()
}) : () -> ()

