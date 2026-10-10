module {
  func.func @unroll_from_elements_2d(%arg0: f32, %arg1: f32, %arg2: f32, %arg3: f32) -> vector<2x2xf32> {
    %0 = vector.from_elements %arg0, %arg1, %arg2, %arg3 : vector<2x2xf32>
    return %0 : vector<2x2xf32>
  }
  func.func @unroll_from_elements_3d(%arg0: f32, %arg1: f32, %arg2: f32, %arg3: f32) -> vector<2x1x2xf32> {
    %0 = vector.from_elements %arg0, %arg1, %arg2, %arg3 : vector<2x1x2xf32>
    return %0 : vector<2x1x2xf32>
  }
  func.func @negative_unroll_from_elements_1d(%arg0: f32, %arg1: f32) -> vector<2xf32> {
    %0 = vector.from_elements %arg0, %arg1 : vector<2xf32>
    return %0 : vector<2xf32>
  }
}

