module {
  func.func @fold_extract_transpose_negative(%arg0: vector<4x4xf16>) -> vector<4x4xf16> {
    %cst = arith.constant dense<0.000000e+00> : vector<1x4x4xf16>
    %0 = vector.insert %arg0, %cst [0] : vector<4x4xf16> into vector<1x4x4xf16>
    %1 = vector.transpose %0, [0, 2, 1] : vector<1x4x4xf16> to vector<1x4x4xf16>
    %2 = vector.extract %1[0] : vector<4x4xf16> from vector<1x4x4xf16>
    return %2 : vector<4x4xf16>
  }
}

