module {
  func.func @scalar_ext(%arg0: f8E5M2) -> f16 {
    %0 = arith.extf %arg0 : f8E5M2 to f16
    return %0 : f16
  }
}

// -----
module {
  func.func @vector_ext_short(%arg0: vector<2xf8E5M2>) -> vector<2xf64> {
    %0 = arith.extf %arg0 : vector<2xf8E5M2> to vector<2xf64>
    return %0 : vector<2xf64>
  }
}

// -----
module {
  func.func @vector_ext_long(%arg0: vector<9xf8E4M3FN>) -> vector<9xf32> {
    %0 = arith.extf %arg0 : vector<9xf8E4M3FN> to vector<9xf32>
    return %0 : vector<9xf32>
  }
}

// -----
module {
  func.func @scalar_trunc(%arg0: f16) -> f8E5M2 {
    %0 = arith.truncf %arg0 : f16 to f8E5M2
    return %0 : f8E5M2
  }
}

// -----
module {
  func.func @vector_trunc_short(%arg0: vector<2xf64>) -> vector<2xf8E5M2> {
    %0 = arith.truncf %arg0 : vector<2xf64> to vector<2xf8E5M2>
    return %0 : vector<2xf8E5M2>
  }
}

// -----
module {
  func.func @vector_trunc_long(%arg0: vector<9xf32>) -> vector<9xf8E4M3FN> {
    %0 = arith.truncf %arg0 : vector<9xf32> to vector<9xf8E4M3FN>
    return %0 : vector<9xf8E4M3FN>
  }
}

// -----
module {
  func.func @vector_trunc_long_2d(%arg0: vector<1x9xf32>) -> vector<1x9xf8E4M3FN> {
    %0 = arith.truncf %arg0 : vector<1x9xf32> to vector<1x9xf8E4M3FN>
    return %0 : vector<1x9xf8E4M3FN>
  }
}

// -----
module {
  func.func @vector_ext_long_2d(%arg0: vector<1x11xf8E4M3FN>) -> vector<1x11xf32> {
    %0 = arith.extf %arg0 : vector<1x11xf8E4M3FN> to vector<1x11xf32>
    return %0 : vector<1x11xf32>
  }
}

