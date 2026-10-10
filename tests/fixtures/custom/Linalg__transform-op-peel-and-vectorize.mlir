module {
  func.func @matmul(%arg0: tensor<1024x512xf32>, %arg1: tensor<512x2000xf32>, %arg2: tensor<1024x2000xf32>) -> tensor<1024x2000xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<1024x512xf32>, tensor<512x2000xf32>) outs(%arg2 : tensor<1024x2000xf32>) -> tensor<1024x2000xf32>
    return %0 : tensor<1024x2000xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops:3 = transform.structured.tile_using_for %0 tile_sizes [8, [16], 1] : (!transform.any_op) -> (!transform.any_op, !transform.op<"scf.for">, !transform.op<"scf.for">, !transform.op<"scf.for">)
      %peeled_loop, %remainder_loop = transform.loop.peel %loops#1 : (!transform.op<"scf.for">) -> (!transform.op<"scf.for">, !transform.op<"scf.for">)
      %1 = transform.structured.match ops{["linalg.matmul"]} in %peeled_loop : (!transform.op<"scf.for">) -> !transform.any_op
      transform.structured.vectorize %1 vector_sizes [8, [16], 1] : !transform.any_op
      %2 = transform.structured.match ops{["linalg.matmul"]} in %remainder_loop : (!transform.op<"scf.for">) -> !transform.any_op
      transform.structured.vectorize %2 vector_sizes [8, [16], 1] : !transform.any_op
      transform.yield 
    }
  }
}

