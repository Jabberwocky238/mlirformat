module {
  func.func @main() {
    %cst = arith.constant dense<[[[1.000000e+00, 2.000000e+00, 3.000000e+00], [2.000000e+00, 3.000000e+00, 4.000000e+00]]]> : tensor<1x2x3xf32>
    %cast = tensor.cast %cst : tensor<1x2x3xf32> to tensor<1x?x3xf32>
    %c2 = arith.constant 2 : index
    %cst_0 = arith.constant 2.300000e+00 : f32
    %c0 = arith.constant 0 : index
    %padded = tensor.pad %cast low[%c0, %c2, %c0] high[%c0, %c0, %c2] {
    ^bb0(%arg0: index, %arg1: index, %arg2: index):
      tensor.yield %cst_0 : f32
    } : tensor<1x?x3xf32> to tensor<1x?x?xf32>
    %cast_1 = tensor.cast %padded : tensor<1x?x?xf32> to tensor<*xf32>
    call @printMemrefF32(%cast_1) : (tensor<*xf32>) -> ()
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.linalg.pad_vectorization
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
  func.func private @printMemrefF32(tensor<*xf32>)
}

