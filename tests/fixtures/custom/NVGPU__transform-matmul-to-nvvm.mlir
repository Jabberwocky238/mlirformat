module {
  func.func @matmul_16x8x4xf32_global(%arg0: memref<16x4xf32>, %arg1: memref<4x8xf32>, %arg2: memref<16x8xf32>) {
    linalg.matmul ins(%arg0, %arg1 : memref<16x4xf32>, memref<4x8xf32>) outs(%arg2 : memref<16x8xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.nvgpu.rewrite_matmul_as_mma_sync %0 : (!transform.any_op) -> ()
      transform.yield 
    }
  }
}

// -----
module {
  func.func @matmul_16x8x16xf16_global(%arg0: memref<16x16xf16>, %arg1: memref<16x8xf16>, %arg2: memref<16x8xf16>) {
    linalg.matmul ins(%arg0, %arg1 : memref<16x16xf16>, memref<16x8xf16>) outs(%arg2 : memref<16x8xf16>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.nvgpu.rewrite_matmul_as_mma_sync %0 : (!transform.any_op) -> ()
      transform.yield 
    }
  }
}

