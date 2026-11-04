module {
  func.func @matmul_f32() {
    %c3 = arith.constant 3 : index
    %c5 = arith.constant 5 : index
    %c15 = arith.constant 15 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = bufferization.alloc_tensor(%c5, %c3) : tensor<?x?xf32>
    %1 = bufferization.alloc_tensor(%c3, %c15) : tensor<?x?xf32>
    %2 = bufferization.alloc_tensor(%c5, %c15) : tensor<?x?xf32>
    %cst_0 = arith.constant 3.140000e+00 : f32
    %3 = linalg.fill ins(%cst_0 : f32) outs(%0 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %4 = linalg.fill ins(%cst_0 : f32) outs(%1 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %5 = linalg.fill ins(%cst : f32) outs(%2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %6 = linalg.matmul ins(%3, %4 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%5 : tensor<?x?xf32>) -> tensor<?x?xf32>
    vector.print str "SVE: START OF TEST OUTPUT\0A"
    %cast = tensor.cast %6 : tensor<?x?xf32> to tensor<*xf32>
    call @printMemrefF32(%cast) : (tensor<*xf32>) -> ()
    vector.print str "SVE: END OF TEST OUTPUT\0A"
    return
  }
  func.func @matmul_mixed_ty() {
    %c3 = arith.constant 3 : index
    %c5 = arith.constant 5 : index
    %c15 = arith.constant 15 : index
    %c0_i8 = arith.constant 0 : i8
    %c0_i32 = arith.constant 0 : i32
    %0 = bufferization.alloc_tensor(%c5, %c3) : tensor<?x?xi8>
    %1 = bufferization.alloc_tensor(%c3, %c15) : tensor<?x?xi8>
    %2 = bufferization.alloc_tensor(%c5, %c15) : tensor<?x?xi32>
    %c123_i8 = arith.constant 123 : i8
    %3 = linalg.fill ins(%c123_i8 : i8) outs(%0 : tensor<?x?xi8>) -> tensor<?x?xi8>
    %4 = linalg.fill ins(%c123_i8 : i8) outs(%1 : tensor<?x?xi8>) -> tensor<?x?xi8>
    %5 = linalg.fill ins(%c0_i32 : i32) outs(%2 : tensor<?x?xi32>) -> tensor<?x?xi32>
    %6 = linalg.matmul ins(%3, %4 : tensor<?x?xi8>, tensor<?x?xi8>) outs(%5 : tensor<?x?xi32>) -> tensor<?x?xi32>
    vector.print str "SVE: START OF TEST OUTPUT\0A"
    %cast = tensor.cast %6 : tensor<?x?xi32> to tensor<*xi32>
    call @printMemrefI32(%cast) : (tensor<*xi32>) -> ()
    vector.print str "SVE: END OF TEST OUTPUT\0A"
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @tile_and_vectorize_matmul(%arg0: !transform.op<"func.func"> {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.op<"func.func">) -> !transform.any_op
      %tiled_linalg_op, %loops:3 = transform.structured.tile_using_for %0 tile_sizes [2, [4], 1] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      transform.structured.vectorize %tiled_linalg_op vector_sizes [2, [4], 1] : !transform.any_op
      transform.apply_patterns to %arg0 {
        transform.apply_patterns.vector.reduction_to_contract
        transform.apply_patterns.vector.transfer_permutation_patterns
        transform.apply_patterns.vector.lower_masked_transfers
        transform.apply_patterns.vector.sink_ops
      } : !transform.op<"func.func">
      transform.apply_patterns to %arg0 {
        transform.apply_patterns.vector.lower_contraction
        transform.apply_patterns.vector.lower_outerproduct
      } : !transform.op<"func.func">
      transform.yield 
    }
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.foreach %0 : !transform.op<"func.func"> {
      ^bb0(%arg1: !transform.op<"func.func">):
        transform.include @tile_and_vectorize_matmul failures(propagate) (%arg1) : (!transform.op<"func.func">) -> ()
      }
      transform.yield 
    }
  }
  func.func private @printMemrefF32(tensor<*xf32>)
  func.func private @printMemrefI32(tensor<*xi32>)
}

