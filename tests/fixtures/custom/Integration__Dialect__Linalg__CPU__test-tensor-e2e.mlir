module {
  func.func @foo() -> tensor<4xf32> {
    %cst = arith.constant dense<[1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00]> : tensor<4xf32>
    return %cst : tensor<4xf32>
  }
  func.func @main() {
    %0 = call @foo() : () -> tensor<4xf32>
    %cast = tensor.cast %0 : tensor<4xf32> to tensor<*xf32>
    call @printMemrefF32(%cast) : (tensor<*xf32>) -> ()
    return
  }
  func.func private @printMemrefF32(tensor<*xf32>)
}

