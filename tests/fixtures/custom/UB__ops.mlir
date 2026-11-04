module {
  func.func @poison() -> i32 {
    %0 = ub.poison : i32
    return %0 : i32
  }
  func.func @poison_full_form() -> i32 {
    %0 = ub.poison : i32
    return %0 : i32
  }
  func.func @poison_complex() -> complex<f32> {
    %0 = ub.poison : complex<f32>
    return %0 : complex<f32>
  }
  func.func @poison_vec() -> vector<4xi64> {
    %0 = ub.poison : vector<4xi64>
    return %0 : vector<4xi64>
  }
  func.func @poison_tensor() -> tensor<8x?xf64> {
    %0 = ub.poison : tensor<8x?xf64>
    return %0 : tensor<8x?xf64>
  }
  func.func @unreachable() {
    ub.unreachable
  }
}

