module {
  func.func @scalar_trunc(%arg0: f32) -> f16 {
    %0 = arith.truncf %arg0 : f32 to f16
    return %0 : f16
  }
  func.func @vector_trunc_short(%arg0: vector<2xf32>) -> vector<2xf16> {
    %0 = arith.truncf %arg0 : vector<2xf32> to vector<2xf16>
    return %0 : vector<2xf16>
  }
  func.func @vector_trunc_long(%arg0: vector<9xf32>) -> vector<9xf16> {
    %0 = arith.truncf %arg0 : vector<9xf32> to vector<9xf16>
    return %0 : vector<9xf16>
  }
}

