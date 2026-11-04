module {
  func.func @main() {
    %c4 = arith.constant 4 : index
    %0 = tensor.empty() : tensor<1xf32>
    %dim = tensor.dim %0, %c4 : tensor<1xf32>
    return
  }
}

