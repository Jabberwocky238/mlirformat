module {
  func.func @matmul_tensors_1(%arg0: tensor<128x128xf32>, %arg1: tensor<128x128xf32>, %arg2: tensor<128x128xf32>) -> tensor<128x128xf32> {
    %0 = linalg.matmul {test.attrA} ins(%arg0, %arg1 : tensor<128x128xf32>, tensor<128x128xf32>) outs(%arg2 : tensor<128x128xf32>) -> tensor<128x128xf32>
    return %0 : tensor<128x128xf32>
  }
  func.func @matmul_tensors_2(%arg0: tensor<128x128xf32>, %arg1: tensor<128x128xf32>, %arg2: tensor<128x128xf32>) -> tensor<128x128xf32> {
    %0 = linalg.matmul {test.attrA, test.attrC} ins(%arg0, %arg1 : tensor<128x128xf32>, tensor<128x128xf32>) outs(%arg2 : tensor<128x128xf32>) -> tensor<128x128xf32>
    return %0 : tensor<128x128xf32>
  }
  func.func @matmul_tensors_3(%arg0: tensor<128x128xf32>, %arg1: tensor<128x128xf32>, %arg2: tensor<128x128xf32>) -> tensor<128x128xf32> {
    %0 = linalg.matmul {test.attrC} ins(%arg0, %arg1 : tensor<128x128xf32>, tensor<128x128xf32>) outs(%arg2 : tensor<128x128xf32>) -> tensor<128x128xf32>
    return %0 : tensor<128x128xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      transform.with_pdl_patterns %arg0 : !transform.any_op {
      ^bb0(%arg1: !transform.any_op):
        pdl.pattern @pdl_target_attrA : benefit(1) {
          %0 = operands
          %1 = types
          %2 = attribute
          %3 = operation "linalg.matmul"(%0 : !pdl.range<value>)  {"test.attrA" = %2} -> (%1 : !pdl.range<type>)
          rewrite %3 with "transform.dialect"
        }
        pdl.pattern @pdl_target_attrC : benefit(1) {
          %0 = operands
          %1 = types
          %2 = attribute
          %3 = operation "linalg.matmul"(%0 : !pdl.range<value>)  {"test.attrC" = %2} -> (%1 : !pdl.range<type>)
          rewrite %3 with "transform.dialect"
        }
        sequence %arg1 : !transform.any_op failures(propagate) {
        ^bb0(%arg2: !transform.any_op):
          %0 = pdl_match @pdl_target_attrA in %arg2 : (!transform.any_op) -> !transform.any_op
          %tiled_linalg_op, %loops:3 = transform.structured.tile_using_for %0 tile_sizes [4, 4, 4] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
          %1 = pdl_match @pdl_target_attrC in %arg2 : (!transform.any_op) -> !transform.any_op
          %2 = get_parent_op %1 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
          %3 = transform.structured.vectorize_children_and_apply_patterns %2 : (!transform.any_op) -> !transform.any_op
        }
      }
      transform.yield 
    }
  }
}

// -----
module {
  func.func @vectorize_one(%arg0: tensor<128x128xf32>, %arg1: tensor<128x128xf32>, %arg2: tensor<128x128xf32>) -> tensor<128x128xf32> {
    %0 = linalg.matmul {test.attrA} ins(%arg0, %arg1 : tensor<128x128xf32>, tensor<128x128xf32>) outs(%arg2 : tensor<128x128xf32>) -> tensor<128x128xf32>
    return %0 : tensor<128x128xf32>
  }
  func.func @vectorize_none(%arg0: tensor<128x128xf32>, %arg1: tensor<128x128xf32>, %arg2: tensor<128x128xf32>) -> tensor<128x128xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<128x128xf32>, tensor<128x128xf32>) outs(%arg2 : tensor<128x128xf32>) -> tensor<128x128xf32>
    return %0 : tensor<128x128xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      transform.with_pdl_patterns %arg0 : !transform.any_op {
      ^bb0(%arg1: !transform.any_op):
        pdl.pattern @pdl_target : benefit(1) {
          %0 = operands
          %1 = types
          %2 = attribute
          %3 = operation "linalg.matmul"(%0 : !pdl.range<value>)  {"test.attrA" = %2} -> (%1 : !pdl.range<type>)
          rewrite %3 with "transform.dialect"
        }
        sequence %arg1 : !transform.any_op failures(propagate) {
        ^bb0(%arg2: !transform.any_op):
          %0 = pdl_match @pdl_target in %arg2 : (!transform.any_op) -> !transform.any_op
          %1 = get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
          %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
        }
      }
      transform.yield 
    }
  }
}

// -----
module {
  func.func @vectorize_all(%arg0: tensor<128x128xf32>, %arg1: tensor<128x128xf32>, %arg2: tensor<128x128xf32>, %arg3: tensor<128x128xf32>) -> tensor<128x128xf32> {
    %0 = linalg.matmul {test.attrA} ins(%arg0, %arg1 : tensor<128x128xf32>, tensor<128x128xf32>) outs(%arg2 : tensor<128x128xf32>) -> tensor<128x128xf32>
    %1 = linalg.matmul ins(%arg0, %0 : tensor<128x128xf32>, tensor<128x128xf32>) outs(%arg3 : tensor<128x128xf32>) -> tensor<128x128xf32>
    return %1 : tensor<128x128xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      %0 = transform.structured.vectorize_children_and_apply_patterns %arg0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

