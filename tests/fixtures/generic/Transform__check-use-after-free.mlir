"builtin.module"() ({
  "transform.sequence"() <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 0, 0>}> ({
  ^bb0(%arg0: !transform.any_op):
    "transform.alternatives"(%arg0) ({
    ^bb0(%arg1: !transform.any_op):
      "transform.yield"() : () -> ()
    }) : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
  ^bb0(%arg0: !transform.any_op):
    %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
    "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
      "transform.apply_patterns.memref.extract_address_computations"() : () -> ()
    }) : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
}) {transform.with_named_sequence} : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "foo"}> ({
  ^bb0(%arg4: index, %arg5: index, %arg6: index):
    "scf.for"(%arg4, %arg5, %arg6) ({
    ^bb0(%arg7: index):
      %5 = "arith.constant"() <{value = 0 : i32}> : () -> i32
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      "transform.with_pdl_patterns"(%arg0) ({
      ^bb0(%arg1: !transform.any_op):
        "pdl.pattern"() <{benefit = 1 : i16, sym_name = "match_const"}> ({
          %2 = "pdl.operands"() : () -> !pdl.range<value>
          %3 = "pdl.types"() : () -> !pdl.range<type>
          %4 = "pdl.operation"(%2, %3) <{attributeValueNames = [], opName = "arith.constant", operandSegmentSizes = array<i32: 1, 0, 1>}> : (!pdl.range<value>, !pdl.range<type>) -> !pdl.operation
          "pdl.rewrite"(%4) <{name = "transform.dialect", operandSegmentSizes = array<i32: 1, 0>}> ({
          }) : (!pdl.operation) -> ()
        }) : () -> ()
        "transform.sequence"(%arg1) <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 1, 0>}> ({
        ^bb0(%arg2: !transform.any_op):
          %0 = "transform.pdl_match"(%arg2) <{pattern_name = @match_const}> : (!transform.any_op) -> !transform.any_op
          %1 = "transform.get_parent_op"(%0) <{nth_parent = 1 : i64, op_name = "scf.for"}> : (!transform.any_op) -> !transform.any_op
          "transform.alternatives"(%1) ({
          ^bb0(%arg3: !transform.any_op):
            "transform.yield"() : () -> ()
          }) : (!transform.any_op) -> ()
          "transform.yield"() : () -> ()
        }) : (!transform.any_op) -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

