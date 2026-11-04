module {
  func.func @scalar_trunc(%arg0: f16) -> f8E5M2 {
    %0 = arith.truncf %arg0 : f16 to f8E5M2
    return %0 : f8E5M2
  }
}

// -----
module {
  func.func @vector_trunc_short(%arg0: vector<2xf32>) -> vector<2xf8E4M3FN> {
    %0 = arith.truncf %arg0 : vector<2xf32> to vector<2xf8E4M3FN>
    return %0 : vector<2xf8E4M3FN>
  }
}

