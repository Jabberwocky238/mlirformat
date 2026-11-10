module {
  func.func @foo() {
    "op"() : () -> ()
    "op"() : () -> ()
    "op"() : () -> ()
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      transform.with_pdl_patterns %arg0 : !transform.any_op {
      ^bb0(%arg1: !transform.any_op):
        pdl.pattern @some : benefit(1) {
          %0 = operands
          %1 = types
          %2 = operation "op"(%0 : !pdl.range<value>)  -> (%1 : !pdl.range<type>)
          rewrite %2 with "transform.dialect"
        }
        sequence %arg1 : !transform.any_op failures(propagate) {
        ^bb0(%arg2: !transform.any_op):
          %0 = pdl_match @some in %arg2 : (!transform.any_op) -> !transform.any_op
          %result1, %result2 = test_correct_number_of_multi_results %0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
        }
      }
      transform.yield 
    }
  }
}

// -----
module {
  func.func @foo() {
    "wrong_op_name"() : () -> ()
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      transform.with_pdl_patterns %arg0 : !transform.any_op {
      ^bb0(%arg1: !transform.any_op):
        pdl.pattern @some : benefit(1) {
          %0 = operands
          %1 = types
          %2 = operation "op"(%0 : !pdl.range<value>)  -> (%1 : !pdl.range<type>)
          rewrite %2 with "transform.dialect"
        }
        sequence %arg1 : !transform.any_op failures(propagate) {
        ^bb0(%arg2: !transform.any_op):
          %0 = pdl_match @some in %arg2 : (!transform.any_op) -> !transform.any_op
          %result1, %result2 = test_correct_number_of_multi_results %0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
        }
      }
      transform.yield 
    }
  }
}

// -----
module {
  func.func @foo() {
    "op"() : () -> ()
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      transform.with_pdl_patterns %arg0 : !transform.any_op {
      ^bb0(%arg1: !transform.any_op):
        pdl.pattern @some : benefit(1) {
          %0 = operands
          %1 = types
          %2 = operation "op"(%0 : !pdl.range<value>)  -> (%1 : !pdl.range<type>)
          rewrite %2 with "transform.dialect"
        }
        sequence %arg1 : !transform.any_op failures(propagate) {
        ^bb0(%arg2: !transform.any_op):
          %0 = pdl_match @some in %arg2 : (!transform.any_op) -> !transform.any_op
          %null, %non_null = test_mixed_null_and_non_null_results %0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
        }
      }
      transform.yield 
    }
  }
}

// -----
module {
  "test.some_op"() : () -> ()
  "other_dialect.other_op"() : () -> ()
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      transform.with_pdl_patterns %arg0 : !transform.any_op {
      ^bb0(%arg1: !transform.any_op):
        pdl.pattern @some : benefit(1) {
          %0 = operation "test.some_op" 
          rewrite %0 with "transform.dialect"
        }
        sequence %arg1 : !transform.any_op failures(propagate) {
        ^bb0(%arg2: !transform.any_op):
          %0 = pdl_match @some in %arg2 : (!transform.any_op) -> !transform.any_op
          %1 = cast %0 : !transform.any_op to !transform.test_dialect_op
          %2 = cast %1 : !transform.test_dialect_op to !transform.any_op
        }
      }
      transform.yield 
    }
  }
}

// -----
module {
  "test.some_op"() : () -> ()
  "other_dialect.other_op"() : () -> ()
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      transform.with_pdl_patterns %arg0 : !transform.any_op {
      ^bb0(%arg1: !transform.any_op):
        pdl.pattern @some : benefit(1) {
          %0 = operation "test.some_op" 
          rewrite %0 with "transform.dialect"
        }
        sequence %arg1 : !transform.any_op failures(propagate) {
        ^bb0(%arg2: !transform.any_op):
          %0 = pdl_match @some in %arg2 : (!transform.any_op) -> !transform.any_op
          %1 = cast %0 : !transform.any_op to !transform.op<"test.some_op">
          %2 = cast %1 : !transform.op<"test.some_op"> to !transform.any_op
        }
      }
      transform.yield 
    }
  }
}

// -----
module attributes {transform.with_named_sequence} {
  transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
    %0 = transform.sequence %arg0 : !transform.any_op -> !transform.any_op failures(suppress) {
    ^bb0(%arg1: !transform.any_op):
      %1 = transform.structured.match ops{["arith.muli"]} in %arg1 : (!transform.any_op) -> !transform.any_op
      %2:3 = split_handle %1 : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      yield %2#0 : !transform.any_op
    }
    transform.yield 
  }
}

// -----
module attributes {transform.with_named_sequence} {
  transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
    %out, %param = transform.test_produce_transform_param_or_forward_operand %arg0 {first_result_is_null} : (!transform.any_op) -> (!transform.any_op, !transform.param<i64>)
    transform.yield 
  }
}

// -----
module {
  func.func @test_annotation() {
    %0 = "test.annotate_me"() : () -> i1
    %1 = "test.annotate_me"() {existing_attr = "test"} : () -> i1
    %2 = "test.annotate_me"() {new_attr = 0 : i64} : () -> i1
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      %0 = transform.structured.match ops{["test.annotate_me"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.test_produce_param_with_number_of_test_ops %0 : !transform.any_op
      transform.annotate %0 "new_attr" = %1 : !transform.any_op, !transform.test_dialect_param
      %2 = transform.param.constant 2 : i64 -> !transform.param<i64>
      transform.annotate %0 "broadcast_attr" = %2 : !transform.any_op, !transform.param<i64>
      transform.annotate %0 "unit_attr" : !transform.any_op
      %3 = transform.param.constant "example" -> !transform.any_param
      transform.annotate %0 "any_attr" = %3 : !transform.any_op, !transform.any_param
      transform.yield 
    }
  }
}

// -----
module {
  func.func @test_licm(%arg0: index, %arg1: index, %arg2: index) {
    scf.for %arg3 = %arg0 to %arg1 step %arg2 {
      %0 = arith.muli %arg0, %arg1 : index
      vector.print %0 : index
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      %0 = transform.structured.match ops{["scf.for"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_licm to %0 : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func private @type_param_anchor()
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      %0 = transform.test_produce_param(f32) : !transform.type
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0) -> ()>
module {
  func.func private @affine_map_param_anchor()
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      %0 = transform.test_produce_param(#map) : !transform.affine_map
      transform.yield 
    }
  }
}

// -----
module {
  func.func @verify_success(%arg0: f64) -> f64 {
    return %arg0 : f64
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.verify %0 : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @no_constant_under_loop(%arg0: index, %arg1: index, %arg2: index) {
    scf.for %arg3 = %arg0 to %arg1 step %arg2 {
      %c0 = arith.constant 0 : index
    }
    return
  }
  module @named_inclusion attributes {transform.with_named_sequence} {
    transform.named_sequence @print(%arg0: !transform.any_op {transform.readonly}) {
      transform.debug.emit_remark_at %arg0, "matched func" : !transform.any_op
      transform.yield 
    }
    transform.named_sequence @match_constant_not_under_scf_for(%arg0: !transform.any_op {transform.readonly}) -> !transform.any_op {
      transform.match.operation_name %arg0 ["arith.constant"] : !transform.any_op
      %0 = transform.get_parent_op %arg0 {allow_empty_results, op_name = "scf.for"} : (!transform.any_op) -> !transform.any_op
      transform.match.operation_empty %0 : !transform.any_op
      transform.yield %arg0 : !transform.any_op
    }
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      %updated_root = transform.foreach_match in %arg0 
          @match_constant_not_under_scf_for -> @print : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

