module {
  func.func @mixedOperations(%arg0: f32, %arg1: f32, %arg2: f32) -> f32 {
    %0 = arith.addf %arg0, %arg1 : f32
    %1 = arith.subf %0, %arg2 : f32
    %2 = arith.mulf %arg0, %1 : f32
    %3 = arith.addf %arg1, %arg2 : f32
    %4 = arith.mulf %3, %2 : f32
    %5 = arith.subf %4, %arg0 : f32
    %6 = arith.addf %4, %arg1 : f32
    %7 = arith.mulf %5, %6 : f32
    return %7 : f32
  }
}

