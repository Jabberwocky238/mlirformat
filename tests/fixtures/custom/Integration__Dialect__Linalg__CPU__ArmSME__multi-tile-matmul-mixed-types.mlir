module {
  func.func @matmul_i8_to_i32(%arg0: tensor<?x?xi8>, %arg1: tensor<?x?xi8>, %arg2: tensor<?x?xi32>) {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<?x?xi8>, tensor<?x?xi8>) outs(%arg2 : tensor<?x?xi32>) -> tensor<?x?xi32>
    %cast = tensor.cast %0 : tensor<?x?xi32> to tensor<*xi32>
    call @printMemrefI32(%cast) : (tensor<*xi32>) -> ()
    return
  }
  func.func @main() {
    %c128_i32 = arith.constant 128 : i32
    call @setArmSVLBits(%c128_i32) : (i32) -> ()
    %c0_i32 = arith.constant 0 : i32
    %c7 = arith.constant 7 : index
    %cst = arith.constant dense<[[1, 8, 15, 22, 29, 36, 43, 50, 57, 64, 71, 78, 85], [2, 9, 16, 23, 30, 37, 44, 51, 58, 65, 72, 79, 86], [3, 10, 17, 24, 31, 38, 45, 52, 59, 66, 73, 80, 87], [4, 11, 18, 25, 32, 39, 46, 53, 60, 67, 74, 81, 88], [5, 12, 19, 26, 33, 40, 47, 54, 61, 68, 75, 82, 89], [6, 13, 20, 27, 34, 41, 48, 55, 62, 69, 76, 83, 90], [7, 14, 21, 28, 35, 42, 49, 56, 63, 70, 77, 84, 91]]> : tensor<7x13xi8>
    %0 = tensor.empty() : tensor<13x7xi8>
    %transposed = linalg.transpose ins(%cst : tensor<7x13xi8>) outs(%0 : tensor<13x7xi8>) permutation = [1, 0] 
    %cast = tensor.cast %cst : tensor<7x13xi8> to tensor<?x?xi8>
    %cast_0 = tensor.cast %transposed : tensor<13x7xi8> to tensor<?x?xi8>
    %1 = bufferization.alloc_tensor(%c7, %c7) : tensor<?x?xi32>
    %2 = linalg.fill ins(%c0_i32 : i32) outs(%1 : tensor<?x?xi32>) -> tensor<?x?xi32>
    call @matmul_i8_to_i32(%cast, %cast_0, %2) : (tensor<?x?xi8>, tensor<?x?xi8>, tensor<?x?xi32>) -> ()
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.consumed}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops:3 = transform.structured.tile_using_for %0 tile_sizes [[8], [8], 4] : (!transform.any_op) -> (!transform.any_op, !transform.op<"scf.for">, !transform.op<"scf.for">, !transform.op<"scf.for">)
      transform.structured.vectorize %tiled_linalg_op vector_sizes [[8], [8], 4] : !transform.any_op
      %1 = transform.bufferization.one_shot_bufferize %arg0 {bufferize_function_boundaries = true} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.match ops{["func.func"]} in %1 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %2 {
        transform.apply_patterns.vector.lower_masked_transfers
        transform.apply_patterns.vector.transfer_permutation_patterns
        transform.apply_patterns.vector.reduction_to_contract
        transform.apply_patterns.vector.sink_ops
      } : !transform.any_op
      transform.apply_patterns to %2 {
        transform.apply_patterns.vector.lower_contraction
        transform.apply_patterns.vector.lower_masks
        transform.apply_patterns.vector.rank_reducing_subview_patterns
      } : !transform.any_op
      transform.yield 
    }
  }
  func.func private @printMemrefI32(tensor<*xi32>)
  func.func private @setArmSVLBits(i32)
}

