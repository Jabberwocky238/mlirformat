module {
  func.func @uitofp_i16_ext_f64(%arg0: i16) -> f64 {
    %0 = arith.extui %arg0 : i16 to i64
    %c1_i64 = arith.constant 1 : i64
    %1 = arith.ori %0, %c1_i64 : i64
    %2 = arith.uitofp %1 : i64 to f64
    return %2 : f64
  }
}

