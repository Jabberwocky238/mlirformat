module {
  func.func @main() {
    %cst = arith.constant dense<1.000000e+01> : tensor<2xf32>
    %cst_0 = arith.constant dense<2.000000e+01> : tensor<1xf32>
    %inserted_slice = tensor.insert_slice %cst_0 into %cst[0] [1] [1] : tensor<1xf32> into tensor<2xf32>
    %inserted_slice_1 = tensor.insert_slice %cst_0 into %cst[1] [1] [1] : tensor<1xf32> into tensor<2xf32>
    %cast = tensor.cast %inserted_slice : tensor<2xf32> to tensor<*xf32>
    call @printMemrefF32(%cast) : (tensor<*xf32>) -> ()
    %cast_2 = tensor.cast %inserted_slice_1 : tensor<2xf32> to tensor<*xf32>
    call @printMemrefF32(%cast_2) : (tensor<*xf32>) -> ()
    return
  }
  func.func private @printMemrefF32(tensor<*xf32>)
}

