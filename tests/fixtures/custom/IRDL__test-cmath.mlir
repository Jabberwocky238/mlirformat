module {
  func.func @conorm(%arg0: !cmath.complex<f32>, %arg1: !cmath.complex<f32>) -> f32 {
    %0 = "cmath.norm"(%arg0) : (!cmath.complex<f32>) -> f32
    %1 = "cmath.norm"(%arg1) : (!cmath.complex<f32>) -> f32
    %2 = arith.mulf %0, %1 : f32
    return %2 : f32
  }
  func.func @conorm2(%arg0: !cmath.complex<f32>, %arg1: !cmath.complex<f32>) -> f32 {
    %0 = "cmath.mul"(%arg0, %arg1) : (!cmath.complex<f32>, !cmath.complex<f32>) -> !cmath.complex<f32>
    %1 = "cmath.norm"(%0) : (!cmath.complex<f32>) -> f32
    return %1 : f32
  }
}

