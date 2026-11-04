module {
  func.func @conv() {
    %0 = tensor.empty() : tensor<1x8x6xi32>
    %1 = tensor.empty() : tensor<1x7x6xi32>
    %c5_i32 = arith.constant 5 : i32
    %c0_i32 = arith.constant 0 : i32
    %2 = linalg.fill ins(%c5_i32 : i32) outs(%0 : tensor<1x8x6xi32>) -> tensor<1x8x6xi32>
    %3 = linalg.fill ins(%c0_i32 : i32) outs(%1 : tensor<1x7x6xi32>) -> tensor<1x7x6xi32>
    %cst = arith.constant dense<[[1, 2, 3, 4, 5, 6], [11, 12, 13, 14, 15, 16]]> : tensor<2x6xi32>
    %cast = tensor.cast %0 : tensor<1x8x6xi32> to tensor<1x8x?xi32>
    %cast_0 = tensor.cast %3 : tensor<1x7x6xi32> to tensor<1x7x?xi32>
    %cast_1 = tensor.cast %cst : tensor<2x6xi32> to tensor<2x?xi32>
    %4 = linalg.depthwise_conv_1d_nwc_wc ins(%cast, %cast_1 : tensor<1x8x?xi32>, tensor<2x?xi32>) outs(%cast_0 : tensor<1x7x?xi32>) -> tensor<1x7x?xi32>
    vector.print str "SVE: START OF TEST OUTPUT\0A"
    %cast_2 = tensor.cast %4 : tensor<1x7x?xi32> to tensor<*xi32>
    call @printMemrefI32(%cast_2) : (tensor<*xi32>) -> ()
    vector.print str "SVE: END OF TEST OUTPUT\0A"
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.depthwise_conv_1d_nwc_wc"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [1, 7, [8], 2] : !transform.any_op
      transform.yield 
    }
  }
  func.func private @printMemrefI32(tensor<*xi32>)
}

