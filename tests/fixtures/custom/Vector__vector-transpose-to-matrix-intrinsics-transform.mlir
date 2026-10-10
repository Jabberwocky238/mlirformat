module {
  func.func @transpose(%arg0: vector<2x4xf32>) -> vector<4x2xf32> {
    %0 = vector.transpose %arg0, [1, 0] : vector<2x4xf32> to vector<4x2xf32>
    return %0 : vector<4x2xf32>
  }
  func.func @transpose_scalable(%arg0: vector<2x[4]xf32>) -> vector<[4]x2xf32> {
    %0 = vector.transpose %arg0, [1, 0] : vector<2x[4]xf32> to vector<[4]x2xf32>
    return %0 : vector<[4]x2xf32>
  }
}

