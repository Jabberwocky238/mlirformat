module {
  func.func @scalar_trunc(%arg0: f16) -> f8E5M2FNUZ {
    %0 = arith.truncf %arg0 : f16 to f8E5M2FNUZ
    return %0 : f8E5M2FNUZ
  }
}

// -----
module {
  func.func @vector_trunc_short(%arg0: vector<2xf32>) -> vector<2xf8E4M3FNUZ> {
    %0 = arith.truncf %arg0 : vector<2xf32> to vector<2xf8E4M3FNUZ>
    return %0 : vector<2xf8E4M3FNUZ>
  }
}

