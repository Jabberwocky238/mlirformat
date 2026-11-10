module {
  func.func @maximumf(%arg0: f32, %arg1: f32) -> f32 {
    %0 = arith.maximumf %arg0, %arg1 : f32
    return %0 : f32
  }
  func.func @minimumf(%arg0: f32, %arg1: f32) -> f32 {
    %0 = arith.minimumf %arg0, %arg1 : f32
    return %0 : f32
  }
  func.func @minsi(%arg0: i32, %arg1: i32) -> i32 {
    %0 = arith.minsi %arg0, %arg1 : i32
    return %0 : i32
  }
  func.func @maxsi(%arg0: i32, %arg1: i32) -> i32 {
    %0 = arith.maxsi %arg0, %arg1 : i32
    return %0 : i32
  }
}

