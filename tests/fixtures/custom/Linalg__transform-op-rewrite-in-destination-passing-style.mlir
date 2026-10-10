module {
  func.func @tensor_from_elements_0d(%arg0: index) -> tensor<index> {
    %from_elements = tensor.from_elements %arg0 : tensor<index>
    return %from_elements : tensor<index>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["tensor.from_elements"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.rewrite_in_destination_passing_style %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @tensor_from_elements_1d(%arg0: index, %arg1: index) -> tensor<2xindex> {
    %from_elements = tensor.from_elements %arg0, %arg1 : tensor<2xindex>
    return %from_elements : tensor<2xindex>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["tensor.from_elements"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.rewrite_in_destination_passing_style %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @tensor_from_elements_2d(%arg0: index, %arg1: index) -> tensor<3x2xindex> {
    %from_elements = tensor.from_elements %arg0, %arg1, %arg0, %arg1, %arg0, %arg1 : tensor<3x2xindex>
    return %from_elements : tensor<3x2xindex>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["tensor.from_elements"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.rewrite_in_destination_passing_style %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @tensor_generate(%arg0: index, %arg1: index) -> tensor<?x?xindex> {
    %generated = tensor.generate %arg0, %arg1 {
    ^bb0(%arg2: index, %arg3: index):
      %0 = arith.addi %arg2, %arg3 : index
      tensor.yield %0 : index
    } : tensor<?x?xindex>
    return %generated : tensor<?x?xindex>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["tensor.generate"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.rewrite_in_destination_passing_style %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @tensor_pad(%arg0: tensor<?x10xindex>, %arg1: index, %arg2: index, %arg3: index) -> tensor<?x?xindex> {
    %padded = tensor.pad %arg0 low[5, %arg1] high[%arg2, %arg3] {
    ^bb0(%arg4: index, %arg5: index):
      %0 = arith.muli %arg4, %arg5 : index
      tensor.yield %0 : index
    } : tensor<?x10xindex> to tensor<?x?xindex>
    return %padded : tensor<?x?xindex>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["tensor.pad"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.rewrite_in_destination_passing_style %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @tensor_pad_constant(%arg0: tensor<?x10xindex>, %arg1: index, %arg2: index, %arg3: index) -> tensor<?x?xindex> {
    %padded = tensor.pad %arg0 low[5, %arg1] high[%arg2, %arg3] {
    ^bb0(%arg4: index, %arg5: index):
      %c50 = arith.constant 50 : index
      tensor.yield %c50 : index
    } : tensor<?x10xindex> to tensor<?x?xindex>
    return %padded : tensor<?x?xindex>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["tensor.pad"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.rewrite_in_destination_passing_style %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @tensor_pad_invariant(%arg0: tensor<?x10xindex>, %arg1: index, %arg2: index, %arg3: index, %arg4: index) -> tensor<?x?xindex> {
    %padded = tensor.pad %arg0 low[5, %arg1] high[%arg2, %arg3] {
    ^bb0(%arg5: index, %arg6: index):
      tensor.yield %arg4 : index
    } : tensor<?x10xindex> to tensor<?x?xindex>
    return %padded : tensor<?x?xindex>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["tensor.pad"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.rewrite_in_destination_passing_style %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @tensor_pad_nofold(%arg0: tensor<?x?xindex>, %arg1: index) -> tensor<?x?xindex> {
    %c0 = arith.constant 0 : index
    %padded = tensor.pad %arg0 nofold low[0, %c0] high[%c0, 0] {
    ^bb0(%arg2: index, %arg3: index):
      tensor.yield %arg1 : index
    } : tensor<?x?xindex> to tensor<?x?xindex>
    return %padded : tensor<?x?xindex>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["tensor.pad"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.rewrite_in_destination_passing_style %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

