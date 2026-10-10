module {
  func.func @number_attr_f64() {
    "test.number_attr"() {attr = #complex.number<:f64 1.000000e+00, 0.000000e+00> : complex<f64>} : () -> ()
    return
  }
  func.func @number_attr_f32() {
    "test.number_attr"() {attr = #complex.number<:f32 1.000000e+00, 0.000000e+00> : complex<f32>} : () -> ()
    return
  }
}

