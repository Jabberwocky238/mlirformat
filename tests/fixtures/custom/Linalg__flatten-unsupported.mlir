module {
  func.func @non_elementwise(%arg0: memref<2x3xf32>, %arg1: memref<3x4xf32>, %arg2: memref<2x4xf32>) {
    linalg.matmul ins(%arg0, %arg1 : memref<2x3xf32>, memref<3x4xf32>) outs(%arg2 : memref<2x4xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match interface{LinalgOp} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.flatten_elementwise %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @unsupported_memref(%arg0: memref<32x7xf32, strided<[7, 2]>>, %arg1: memref<32x7xf32, strided<[7, 2]>>, %arg2: memref<32x7xf32, strided<[7, 2]>>) {
    linalg.map { arith.addf } ins(%arg0, %arg1 : memref<32x7xf32, strided<[7, 2]>>, memref<32x7xf32, strided<[7, 2]>>) outs(%arg2 : memref<32x7xf32, strided<[7, 2]>>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match interface{LinalgOp} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.flatten_elementwise %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

