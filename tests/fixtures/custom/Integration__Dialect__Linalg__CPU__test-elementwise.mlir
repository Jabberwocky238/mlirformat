module {
  func.func @main() {
    %cst = arith.constant dense<[1.000000e+00, 2.000000e+00, 3.000000e+00]> : tensor<3xf32>
    %cst_0 = arith.constant dense<[1.000000e+01, 2.000000e+01, 3.000000e+01]> : tensor<3xf32>
    %0 = arith.addf %cst, %cst_0 : tensor<3xf32>
    %cast = tensor.cast %0 : tensor<3xf32> to tensor<*xf32>
    call @printMemrefF32(%cast) : (tensor<*xf32>) -> ()
    return
  }
  func.func private @printMemrefF32(tensor<*xf32>)
}

