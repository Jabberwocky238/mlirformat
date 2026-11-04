module {
  func.func @main() {
    %cst = arith.constant dense<[[1.000000e+00, 2.000000e+00, 3.000000e+00], [4.000000e+00, 5.000000e+00, 6.000000e+00]]> : tensor<2x3xf32>
    %cst_0 = arith.constant dense<[[1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00], [5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00], [9.000000e+00, 1.000000e+01, 1.100000e+01, 1.200000e+01]]> : tensor<3x4xf32>
    %cst_1 = arith.constant dense<1.000000e+03> : tensor<2x4xf32>
    %0 = linalg.matmul ins(%cst, %cst_0 : tensor<2x3xf32>, tensor<3x4xf32>) outs(%cst_1 : tensor<2x4xf32>) -> tensor<2x4xf32>
    %cast = tensor.cast %0 : tensor<2x4xf32> to tensor<*xf32>
    call @printMemrefF32(%cast) : (tensor<*xf32>) -> ()
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops:3 = transform.structured.tile_using_for %0 tile_sizes [1, 2, 3] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
  func.func private @printMemrefF32(tensor<*xf32>)
}

