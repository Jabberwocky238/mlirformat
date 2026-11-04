module {
  func.func private @printMemrefF32(tensor<*xf32>)
  func.func @main() {
    %c4 = arith.constant 4 : index
    %c8 = arith.constant 8 : index
    %cst = arith.constant dense<[[1.100000e+00, 2.100000e+00], [1.200000e+00, 2.200000e+00], [1.300000e+00, 2.300000e+00], [1.400000e+00, 2.400000e+00], [1.500000e+00, 2.500000e+00], [1.600000e+00, 2.600000e+00], [1.700000e+00, 2.700000e+00], [1.800000e+00, 2.800000e+00]]> : tensor<8x2xf32>
    %cst_0 = arith.constant dense<[[1.010000e+01, 1.110000e+01, 1.210000e+01, 1.310000e+01], [1.020000e+01, 1.120000e+01, 1.220000e+01, 1.320000e+01]]> : tensor<2x4xf32>
    %0 = bufferization.alloc_tensor(%c8, %c4) : tensor<?x?xf32>
    %cast = tensor.cast %cst : tensor<8x2xf32> to tensor<?x?xf32>
    %cast_1 = tensor.cast %cst_0 : tensor<2x4xf32> to tensor<?x?xf32>
    %cst_2 = arith.constant 0.000000e+00 : f32
    %1 = linalg.fill ins(%cst_2 : f32) outs(%0 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %2 = linalg.matmul ins(%cast, %cast_1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%1 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %cast_3 = tensor.cast %2 : tensor<?x?xf32> to tensor<*xf32>
    call @printMemrefF32(%cast_3) : (tensor<*xf32>) -> ()
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.structured.vectorize %0 vector_sizes [4, 4, 2] : !transform.any_op
      transform.apply_patterns to %1 {
        transform.apply_patterns.vector.lower_multi_reduction lowering_strategy = innerreduction
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
}

