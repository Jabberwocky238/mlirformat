module {
  func.func @create_mask_2d_trailing_scalable(%arg0: index) -> vector<3x[4]xi1> {
    %c2 = arith.constant 2 : index
    %0 = vector.create_mask %c2, %arg0 : vector<3x[4]xi1>
    return %0 : vector<3x[4]xi1>
  }
}

// -----
module {
  func.func @cannot_create_mask_2d_leading_scalable(%arg0: index) -> vector<[4]x4xi1> {
    %c1 = arith.constant 1 : index
    %0 = vector.create_mask %arg0, %c1 : vector<[4]x4xi1>
    return %0 : vector<[4]x4xi1>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.lower_create_mask
      } : !transform.any_op
      transform.yield 
    }
  }
}

