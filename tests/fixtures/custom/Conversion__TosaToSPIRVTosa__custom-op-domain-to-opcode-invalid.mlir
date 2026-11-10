module {
  func.func @zero_results(%arg0: tensor<1x16xf32>) {
    tosa.custom %arg0 {domain_name = "test", implementation_attrs = "{}", operator_name = "NoResult"} : (tensor<1x16xf32>) -> ()
    return
  }
}

