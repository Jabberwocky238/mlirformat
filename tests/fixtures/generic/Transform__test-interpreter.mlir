"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "foo"}> ({
    "op"() : () -> ()
    "op"() : () -> ()
    "op"() : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      "transform.with_pdl_patterns"(%arg0) ({
      ^bb0(%arg1: !transform.any_op):
        "pdl.pattern"() <{benefit = 1 : i16, sym_name = "some"}> ({
          %2 = "pdl.operands"() : () -> !pdl.range<value>
          %3 = "pdl.types"() : () -> !pdl.range<type>
          %4 = "pdl.operation"(%2, %3) <{attributeValueNames = [], opName = "op", operandSegmentSizes = array<i32: 1, 0, 1>}> : (!pdl.range<value>, !pdl.range<type>) -> !pdl.operation
          "pdl.rewrite"(%4) <{name = "transform.dialect", operandSegmentSizes = array<i32: 1, 0>}> ({
          }) : (!pdl.operation) -> ()
        }) : () -> ()
        "transform.sequence"(%arg1) <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 1, 0>}> ({
        ^bb0(%arg2: !transform.any_op):
          %0 = "transform.pdl_match"(%arg2) <{pattern_name = @some}> : (!transform.any_op) -> !transform.any_op
          %1:2 = "transform.test_correct_number_of_multi_results"(%0) : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
          "transform.yield"() : () -> ()
        }) : (!transform.any_op) -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "foo"}> ({
    "wrong_op_name"() : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      "transform.with_pdl_patterns"(%arg0) ({
      ^bb0(%arg1: !transform.any_op):
        "pdl.pattern"() <{benefit = 1 : i16, sym_name = "some"}> ({
          %2 = "pdl.operands"() : () -> !pdl.range<value>
          %3 = "pdl.types"() : () -> !pdl.range<type>
          %4 = "pdl.operation"(%2, %3) <{attributeValueNames = [], opName = "op", operandSegmentSizes = array<i32: 1, 0, 1>}> : (!pdl.range<value>, !pdl.range<type>) -> !pdl.operation
          "pdl.rewrite"(%4) <{name = "transform.dialect", operandSegmentSizes = array<i32: 1, 0>}> ({
          }) : (!pdl.operation) -> ()
        }) : () -> ()
        "transform.sequence"(%arg1) <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 1, 0>}> ({
        ^bb0(%arg2: !transform.any_op):
          %0 = "transform.pdl_match"(%arg2) <{pattern_name = @some}> : (!transform.any_op) -> !transform.any_op
          %1:2 = "transform.test_correct_number_of_multi_results"(%0) : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
          "transform.yield"() : () -> ()
        }) : (!transform.any_op) -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "foo"}> ({
    "op"() : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      "transform.with_pdl_patterns"(%arg0) ({
      ^bb0(%arg1: !transform.any_op):
        "pdl.pattern"() <{benefit = 1 : i16, sym_name = "some"}> ({
          %2 = "pdl.operands"() : () -> !pdl.range<value>
          %3 = "pdl.types"() : () -> !pdl.range<type>
          %4 = "pdl.operation"(%2, %3) <{attributeValueNames = [], opName = "op", operandSegmentSizes = array<i32: 1, 0, 1>}> : (!pdl.range<value>, !pdl.range<type>) -> !pdl.operation
          "pdl.rewrite"(%4) <{name = "transform.dialect", operandSegmentSizes = array<i32: 1, 0>}> ({
          }) : (!pdl.operation) -> ()
        }) : () -> ()
        "transform.sequence"(%arg1) <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 1, 0>}> ({
        ^bb0(%arg2: !transform.any_op):
          %0 = "transform.pdl_match"(%arg2) <{pattern_name = @some}> : (!transform.any_op) -> !transform.any_op
          %1:2 = "transform.test_mixed_null_and_non_null_results"(%0) : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
          "transform.yield"() : () -> ()
        }) : (!transform.any_op) -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "test.some_op"() : () -> ()
  "other_dialect.other_op"() : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      "transform.with_pdl_patterns"(%arg0) ({
      ^bb0(%arg1: !transform.any_op):
        "pdl.pattern"() <{benefit = 1 : i16, sym_name = "some"}> ({
          %3 = "pdl.operation"() <{attributeValueNames = [], opName = "test.some_op", operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> !pdl.operation
          "pdl.rewrite"(%3) <{name = "transform.dialect", operandSegmentSizes = array<i32: 1, 0>}> ({
          }) : (!pdl.operation) -> ()
        }) : () -> ()
        "transform.sequence"(%arg1) <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 1, 0>}> ({
        ^bb0(%arg2: !transform.any_op):
          %0 = "transform.pdl_match"(%arg2) <{pattern_name = @some}> : (!transform.any_op) -> !transform.any_op
          %1 = "transform.cast"(%0) : (!transform.any_op) -> !transform.test_dialect_op
          %2 = "transform.cast"(%1) : (!transform.test_dialect_op) -> !transform.any_op
          "transform.yield"() : () -> ()
        }) : (!transform.any_op) -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "test.some_op"() : () -> ()
  "other_dialect.other_op"() : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      "transform.with_pdl_patterns"(%arg0) ({
      ^bb0(%arg1: !transform.any_op):
        "pdl.pattern"() <{benefit = 1 : i16, sym_name = "some"}> ({
          %3 = "pdl.operation"() <{attributeValueNames = [], opName = "test.some_op", operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> !pdl.operation
          "pdl.rewrite"(%3) <{name = "transform.dialect", operandSegmentSizes = array<i32: 1, 0>}> ({
          }) : (!pdl.operation) -> ()
        }) : () -> ()
        "transform.sequence"(%arg1) <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 1, 0>}> ({
        ^bb0(%arg2: !transform.any_op):
          %0 = "transform.pdl_match"(%arg2) <{pattern_name = @some}> : (!transform.any_op) -> !transform.any_op
          %1 = "transform.cast"(%0) : (!transform.any_op) -> !transform.op<"test.some_op">
          %2 = "transform.cast"(%1) : (!transform.op<"test.some_op">) -> !transform.any_op
          "transform.yield"() : () -> ()
        }) : (!transform.any_op) -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
  ^bb0(%arg0: !transform.any_op):
    %0 = "transform.sequence"(%arg0) <{failure_propagation_mode = 2 : i32, operandSegmentSizes = array<i32: 1, 0>}> ({
    ^bb0(%arg1: !transform.any_op):
      %1 = "transform.structured.match"(%arg1) <{ops = ["arith.muli"]}> : (!transform.any_op) -> !transform.any_op
      %2:3 = "transform.split_handle"(%1) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      "transform.yield"(%2#0) : (!transform.any_op) -> ()
    }) : (!transform.any_op) -> !transform.any_op
    "transform.yield"() : () -> ()
  }) : () -> ()
}) {transform.with_named_sequence} : () -> ()

// -----
"builtin.module"() ({
  "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
  ^bb0(%arg0: !transform.any_op):
    %0:2 = "transform.test_produce_transform_param_or_forward_operand"(%arg0) <{first_result_is_null}> : (!transform.any_op) -> (!transform.any_op, !transform.param<i64>)
    "transform.yield"() : () -> ()
  }) : () -> ()
}) {transform.with_named_sequence} : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_annotation"}> ({
    %4 = "test.annotate_me"() : () -> i1
    %5 = "test.annotate_me"() {existing_attr = "test"} : () -> i1
    %6 = "test.annotate_me"() {new_attr = 0 : i64} : () -> i1
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["test.annotate_me"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.test_produce_param_with_number_of_test_ops"(%0) : (!transform.any_op) -> !transform.test_dialect_param
      "transform.annotate"(%0, %1) <{name = "new_attr"}> : (!transform.any_op, !transform.test_dialect_param) -> ()
      %2 = "transform.param.constant"() <{value = 2 : i64}> : () -> !transform.param<i64>
      "transform.annotate"(%0, %2) <{name = "broadcast_attr"}> : (!transform.any_op, !transform.param<i64>) -> ()
      "transform.annotate"(%0) <{name = "unit_attr"}> : (!transform.any_op) -> ()
      %3 = "transform.param.constant"() <{value = "example"}> : () -> !transform.any_param
      "transform.annotate"(%0, %3) <{name = "any_attr"}> : (!transform.any_op, !transform.any_param) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "test_licm"}> ({
  ^bb0(%arg1: index, %arg2: index, %arg3: index):
    "scf.for"(%arg1, %arg2, %arg3) ({
    ^bb0(%arg4: index):
      %1 = "arith.muli"(%arg1, %arg2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      "vector.print"(%1) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["scf.for"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_licm"(%0) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "type_param_anchor", sym_visibility = "private"}> ({
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.test_produce_param"() <{attr = f32}> : () -> !transform.type
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "affine_map_param_anchor", sym_visibility = "private"}> ({
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.test_produce_param"() <{attr = #map}> : () -> !transform.affine_map
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f64) -> f64, sym_name = "verify_success"}> ({
  ^bb0(%arg1: f64):
    "func.return"(%arg1) : (f64) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.verify"(%0) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "no_constant_under_loop"}> ({
  ^bb0(%arg3: index, %arg4: index, %arg5: index):
    "scf.for"(%arg3, %arg4, %arg5) ({
    ^bb0(%arg6: index):
      %2 = "arith.constant"() <{value = 0 : index}> : () -> index
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "named_inclusion"}> ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "print"}> ({
    ^bb0(%arg2: !transform.any_op):
      "transform.debug.emit_remark_at"(%arg2) <{message = "matched func"}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> !transform.any_op, sym_name = "match_constant_not_under_scf_for"}> ({
    ^bb0(%arg1: !transform.any_op):
      "transform.match.operation_name"(%arg1) <{op_names = ["arith.constant"]}> : (!transform.any_op) -> ()
      %1 = "transform.get_parent_op"(%arg1) <{allow_empty_results, nth_parent = 1 : i64, op_name = "scf.for"}> : (!transform.any_op) -> !transform.any_op
      "transform.match.operation_empty"(%1) : (!transform.any_op) -> ()
      "transform.yield"(%arg1) : (!transform.any_op) -> ()
    }) : () -> ()
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.foreach_match"(%arg0) <{actions = [@print], matchers = [@match_constant_not_under_scf_for]}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

