module {
  func.func @extract_strided_slice_1D(%arg0: vector<8xf16>) -> vector<4xf16> {
    %0 = vector.extract_strided_slice %arg0 {offsets = [1], sizes = [4], strides = [1]} : vector<8xf16> to vector<4xf16>
    return %0 : vector<4xf16>
  }
}

// -----
module {
  func.func @extract_strided_slice_2D(%arg0: vector<1x8xf16>) -> vector<1x4xf16> {
    %0 = vector.extract_strided_slice %arg0 {offsets = [0, 1], sizes = [1, 4], strides = [1, 1]} : vector<1x8xf16> to vector<1x4xf16>
    return %0 : vector<1x4xf16>
  }
}

