module {
  func.func @scalar_ext(%arg0: f8E5M2FNUZ) -> f16 {
    %0 = arith.extf %arg0 : f8E5M2FNUZ to f16
    return %0 : f16
  }
}

// -----
module {
  func.func @vector_zero_d(%arg0: vector<f8E5M2FNUZ>) -> vector<f32> {
    %0 = arith.extf %arg0 : vector<f8E5M2FNUZ> to vector<f32>
    return %0 : vector<f32>
  }
}

// -----
module {
  func.func @vector_ext_short(%arg0: vector<2xf8E5M2FNUZ>) -> vector<2xf64> {
    %0 = arith.extf %arg0 : vector<2xf8E5M2FNUZ> to vector<2xf64>
    return %0 : vector<2xf64>
  }
}

// -----
module {
  func.func @vector_ext_long(%arg0: vector<9xf8E4M3FNUZ>) -> vector<9xf32> {
    %0 = arith.extf %arg0 : vector<9xf8E4M3FNUZ> to vector<9xf32>
    return %0 : vector<9xf32>
  }
}

// -----
module {
  func.func @scalar_trunc(%arg0: f16) -> f8E5M2FNUZ {
    %0 = arith.truncf %arg0 : f16 to f8E5M2FNUZ
    return %0 : f8E5M2FNUZ
  }
}

// -----
module {
  func.func @vector_trunc_short(%arg0: vector<2xf64>) -> vector<2xf8E5M2FNUZ> {
    %0 = arith.truncf %arg0 : vector<2xf64> to vector<2xf8E5M2FNUZ>
    return %0 : vector<2xf8E5M2FNUZ>
  }
}

// -----
module {
  func.func @vector_trunc_long(%arg0: vector<9xf32>) -> vector<9xf8E4M3FNUZ> {
    %0 = arith.truncf %arg0 : vector<9xf32> to vector<9xf8E4M3FNUZ>
    return %0 : vector<9xf8E4M3FNUZ>
  }
}

// -----
module {
  func.func @vector_trunc_long_2d(%arg0: vector<1x9xf32>) -> vector<1x9xf8E4M3FNUZ> {
    %0 = arith.truncf %arg0 : vector<1x9xf32> to vector<1x9xf8E4M3FNUZ>
    return %0 : vector<1x9xf8E4M3FNUZ>
  }
}

// -----
module {
  func.func @vector_ext_long_2d(%arg0: vector<1x11xf8E4M3FNUZ>) -> vector<1x11xf32> {
    %0 = arith.extf %arg0 : vector<1x11xf8E4M3FNUZ> to vector<1x11xf32>
    return %0 : vector<1x11xf32>
  }
}

