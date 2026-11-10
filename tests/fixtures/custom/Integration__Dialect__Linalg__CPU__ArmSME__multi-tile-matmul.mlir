module {
  func.func @matmul(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %cast = tensor.cast %0 : tensor<?x?xf32> to tensor<*xf32>
    call @printMemrefF32(%cast) : (tensor<*xf32>) -> ()
    return
  }
  func.func @main() {
    %c128_i32 = arith.constant 128 : i32
    call @setArmSVLBits(%c128_i32) : (i32) -> ()
    %cst = arith.constant 0.000000e+00 : f32
    %c7 = arith.constant 7 : index
    %cst_0 = arith.constant dense<[[1.000000e+00, 8.000000e+00, 1.500000e+01, 2.200000e+01, 2.900000e+01, 3.600000e+01, 4.300000e+01, 5.000000e+01, 5.700000e+01, 6.400000e+01, 7.100000e+01, 7.800000e+01, 8.500000e+01], [2.000000e+00, 9.000000e+00, 1.600000e+01, 2.300000e+01, 3.000000e+01, 3.700000e+01, 4.400000e+01, 5.100000e+01, 5.800000e+01, 6.500000e+01, 7.200000e+01, 7.900000e+01, 8.600000e+01], [3.000000e+00, 1.000000e+01, 1.700000e+01, 2.400000e+01, 3.100000e+01, 3.800000e+01, 4.500000e+01, 5.200000e+01, 5.900000e+01, 6.600000e+01, 7.300000e+01, 8.000000e+01, 8.700000e+01], [4.000000e+00, 1.100000e+01, 1.800000e+01, 2.500000e+01, 3.200000e+01, 3.900000e+01, 4.600000e+01, 5.300000e+01, 6.000000e+01, 6.700000e+01, 7.400000e+01, 8.100000e+01, 8.800000e+01], [5.000000e+00, 1.200000e+01, 1.900000e+01, 2.600000e+01, 3.300000e+01, 4.000000e+01, 4.700000e+01, 5.400000e+01, 6.100000e+01, 6.800000e+01, 7.500000e+01, 8.200000e+01, 8.900000e+01], [6.000000e+00, 1.300000e+01, 2.000000e+01, 2.700000e+01, 3.400000e+01, 4.100000e+01, 4.800000e+01, 5.500000e+01, 6.200000e+01, 6.900000e+01, 7.600000e+01, 8.300000e+01, 9.000000e+01], [7.000000e+00, 1.400000e+01, 2.100000e+01, 2.800000e+01, 3.500000e+01, 4.200000e+01, 4.900000e+01, 5.600000e+01, 6.300000e+01, 7.000000e+01, 7.700000e+01, 8.400000e+01, 9.100000e+01]]> : tensor<7x13xf32>
    %0 = tensor.empty() : tensor<13x7xf32>
    %transposed = linalg.transpose ins(%cst_0 : tensor<7x13xf32>) outs(%0 : tensor<13x7xf32>) permutation = [1, 0] 
    %cast = tensor.cast %cst_0 : tensor<7x13xf32> to tensor<?x?xf32>
    %cast_1 = tensor.cast %transposed : tensor<13x7xf32> to tensor<?x?xf32>
    %1 = bufferization.alloc_tensor(%c7, %c7) : tensor<?x?xf32>
    %2 = linalg.fill ins(%cst : f32) outs(%1 : tensor<?x?xf32>) -> tensor<?x?xf32>
    call @matmul(%cast, %cast_1, %2) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> ()
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops:3 = transform.structured.tile_using_for %0 tile_sizes [[8], [8], 4] : (!transform.any_op) -> (!transform.any_op, !transform.op<"scf.for">, !transform.op<"scf.for">, !transform.op<"scf.for">)
      transform.structured.vectorize %tiled_linalg_op vector_sizes [[8], [8], 4] {create_named_contraction} : !transform.any_op
      transform.apply_patterns to %loops#2 {
        transform.apply_patterns.vector.lower_masked_transfers
      } : !transform.op<"scf.for">
      transform.apply_licm to %loops#2 : !transform.op<"scf.for">
      transform.loop.hoist_loop_invariant_subsets %loops#2 : !transform.op<"scf.for">
      transform.apply_patterns to %1 {
        transform.apply_patterns.vector.transfer_permutation_patterns
        transform.apply_patterns.vector.lower_contraction
      } : !transform.any_op
      transform.yield 
    }
  }
  func.func private @printMemrefF32(tensor<*xf32>)
  func.func private @setArmSVLBits(i32)
}

