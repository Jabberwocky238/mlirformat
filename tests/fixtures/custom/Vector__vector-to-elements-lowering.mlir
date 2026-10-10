module {
  func.func @negative_unroll_to_elements_1d(%arg0: vector<2xf32>) -> (f32, f32) {
    %0:2 = vector.to_elements %arg0 : vector<2xf32>
    return %0#0, %0#1 : f32, f32
  }
}

// -----
module {
  func.func @unroll_to_elements_2d(%arg0: vector<2x2xf32>) -> (f32, f32, f32, f32) {
    %0:4 = vector.to_elements %arg0 : vector<2x2xf32>
    return %0#0, %0#1, %0#2, %0#3 : f32, f32, f32, f32
  }
}

