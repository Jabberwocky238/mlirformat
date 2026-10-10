module {
  func.func @linalg_copy_to_memref_copy(%arg0: memref<128x64xf32>, %arg1: memref<128x64xf32>) {
    linalg.copy ins(%arg0 : memref<128x64xf32>) outs(%arg1 : memref<128x64xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.copy"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.linalg_copy_to_memref %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @linalg_copy_to_memref_copy_strides(%arg0: memref<128x32xf32>, %arg1: memref<128x64xf32>) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<128x64xf32>
    %subview = memref.subview %alloc[0, 32] [128, 32] [1, 1] : memref<128x64xf32> to memref<128x32xf32, strided<[64, 1], offset: 32>>
    linalg.copy ins(%arg0 : memref<128x32xf32>) outs(%subview : memref<128x32xf32, strided<[64, 1], offset: 32>>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.copy"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.linalg_copy_to_memref %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @linalg_copy_to_memref_copy_tensors(%arg0: tensor<128x64xf32>, %arg1: tensor<128x64xf32>) -> tensor<128x64xf32> {
    %0 = linalg.copy ins(%arg0 : tensor<128x64xf32>) outs(%arg1 : tensor<128x64xf32>) -> tensor<128x64xf32>
    return %0 : tensor<128x64xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.copy"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.linalg_copy_to_memref %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @linalg_copy_to_memref_copy_different_element(%arg0: memref<128x64xf32>, %arg1: memref<128x64xf64>) {
    linalg.copy ins(%arg0 : memref<128x64xf32>) outs(%arg1 : memref<128x64xf64>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.copy"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.linalg_copy_to_memref %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @linalg_copy_to_memref_copy_scalar(%arg0: f64, %arg1: memref<128x64xf64>) {
    linalg.copy ins(%arg0 : f64) outs(%arg1 : memref<128x64xf64>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.copy"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.linalg_copy_to_memref %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

