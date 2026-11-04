module {
  func.func @absf(%arg0: f32, %arg1: f64) {
    %0 = math.absf %arg0 : f32
    %1 = math.absf %arg1 : f64
    return
  }
  func.func @floor(%arg0: f32, %arg1: f64) {
    %0 = math.floor %arg0 : f32
    %1 = math.floor %arg1 : f64
    return
  }
  func.func @sin(%arg0: f32, %arg1: f64) {
    %0 = math.sin %arg0 : f32
    %1 = math.sin %arg1 : f64
    return
  }
  func.func @cos(%arg0: f32, %arg1: f64) {
    %0 = math.cos %arg0 : f32
    %1 = math.cos %arg1 : f64
    return
  }
  func.func @asin(%arg0: f32, %arg1: f64) {
    %0 = math.asin %arg0 : f32
    %1 = math.asin %arg1 : f64
    return
  }
  func.func @acos(%arg0: f32, %arg1: f64) {
    %0 = math.acos %arg0 : f32
    %1 = math.acos %arg1 : f64
    return
  }
  func.func @atan2(%arg0: f32, %arg1: f32, %arg2: f64, %arg3: f64) {
    %0 = math.atan2 %arg0, %arg1 : f32
    %1 = math.atan2 %arg2, %arg3 : f64
    return
  }
  func.func @ceil(%arg0: f32, %arg1: f64) {
    %0 = math.ceil %arg0 : f32
    %1 = math.ceil %arg1 : f64
    return
  }
  func.func @exp(%arg0: f32, %arg1: f64) {
    %0 = math.exp %arg0 : f32
    %1 = math.exp %arg1 : f64
    return
  }
  func.func @powf(%arg0: f32, %arg1: f32, %arg2: f64, %arg3: f64) {
    %0 = math.powf %arg0, %arg1 : f32
    %1 = math.powf %arg2, %arg3 : f64
    return
  }
  func.func @round(%arg0: f32, %arg1: f64) {
    %0 = math.round %arg0 : f32
    %1 = math.round %arg1 : f64
    return
  }
}

