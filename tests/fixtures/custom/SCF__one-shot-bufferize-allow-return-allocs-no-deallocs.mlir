module {
  func.func @different_before_after_args() -> tensor<f32> {
    %true = arith.constant true
    %cst = arith.constant dense<0.000000e+00> : tensor<f32>
    %0 = scf.while (%arg0 = %true) : (i1) -> tensor<f32> {
      scf.condition(%true) %cst : tensor<f32>
    } do {
    ^bb0(%arg0: tensor<f32>):
      scf.yield %true : i1
    }
    return %0 : tensor<f32>
  }
}

