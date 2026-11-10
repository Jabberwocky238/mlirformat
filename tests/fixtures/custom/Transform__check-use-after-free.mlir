module {
  transform.sequence  failures(propagate) {
  ^bb0(%arg0: !transform.any_op):
    alternatives %arg0 : !transform.any_op {
    ^bb0(%arg1: !transform.any_op):
    }
  }
}

// -----
module attributes {transform.with_named_sequence} {
  transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
    %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
    transform.apply_patterns to %0 {
      transform.apply_patterns.memref.extract_address_computations
    } : !transform.any_op
    transform.yield 
  }
}

// -----
module {
  func.func @foo(%arg0: index, %arg1: index, %arg2: index) {
    scf.for %arg3 = %arg0 to %arg1 step %arg2 {
      %c0_i32 = arith.constant 0 : i32
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      transform.with_pdl_patterns %arg0 : !transform.any_op {
      ^bb0(%arg1: !transform.any_op):
        pdl.pattern @match_const : benefit(1) {
          %0 = operands
          %1 = types
          %2 = operation "arith.constant"(%0 : !pdl.range<value>)  -> (%1 : !pdl.range<type>)
          rewrite %2 with "transform.dialect"
        }
        sequence %arg1 : !transform.any_op failures(propagate) {
        ^bb0(%arg2: !transform.any_op):
          %0 = pdl_match @match_const in %arg2 : (!transform.any_op) -> !transform.any_op
          %1 = get_parent_op %0 {op_name = "scf.for"} : (!transform.any_op) -> !transform.any_op
          alternatives %1 : !transform.any_op {
          ^bb0(%arg3: !transform.any_op):
          }
        }
      }
      transform.yield 
    }
  }
}

