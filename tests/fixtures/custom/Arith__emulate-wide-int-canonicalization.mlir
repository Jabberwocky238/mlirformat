module {
  func.func @uitofp_i16_ext_f64(%arg0: i16) -> f64 {
    %0 = arith.extui %arg0 : i16 to i64
    %1 = arith.uitofp %0 : i64 to f64
    return %1 : f64
  }
}

