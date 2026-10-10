module {
  func.func @select_single_i1_vector(%arg0: i1) -> vector<1xi1> {
    %cst = arith.constant dense<true> : vector<1xi1>
    %cst_0 = arith.constant dense<false> : vector<1xi1>
    %0 = arith.select %arg0, %cst, %cst_0 : vector<1xi1>
    return %0 : vector<1xi1>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.materialize_masks
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
}

