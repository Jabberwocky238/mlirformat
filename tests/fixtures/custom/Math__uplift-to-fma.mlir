module {
  func.func @test(%arg0: f32, %arg1: f32, %arg2: f32) -> f32 {
    %0 = arith.mulf %arg0, %arg1 : f32
    %1 = arith.addf %0, %arg2 : f32
    return %1 : f32
  }
}

// -----
module {
  func.func @test(%arg0: f32, %arg1: f32, %arg2: f32) -> f32 {
    %0 = arith.mulf %arg0, %arg1 fastmath<fast> : f32
    %1 = arith.addf %0, %arg2 fastmath<fast> : f32
    return %1 : f32
  }
}

// -----
module {
  func.func @test(%arg0: f32, %arg1: f32, %arg2: f32) -> f32 {
    %0 = arith.mulf %arg0, %arg1 fastmath<fast> : f32
    %1 = arith.addf %arg2, %0 fastmath<contract> : f32
    return %1 : f32
  }
}

