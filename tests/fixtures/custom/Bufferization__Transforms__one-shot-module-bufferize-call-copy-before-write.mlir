module {
  func.func private @callee(tensor<64xf32>)
  func.func @caller(%arg0: tensor<64xf32>) {
    call @callee(%arg0) : (tensor<64xf32>) -> ()
    return
  }
}

