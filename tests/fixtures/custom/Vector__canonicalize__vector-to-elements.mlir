module {
  func.func @to_elements_of_shape_cast_folds(%arg0: vector<4xf32>) -> (f32, f32, f32, f32) {
    %0 = vector.shape_cast %arg0 : vector<4xf32> to vector<2x2xf32>
    %1:4 = vector.to_elements %0 : vector<2x2xf32>
    return %1#0, %1#1, %1#2, %1#3 : f32, f32, f32, f32
  }
}

