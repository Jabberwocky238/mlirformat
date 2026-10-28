module {
  func.func @avx512bf16_dot_128(%arg0: vector<4xf32>, %arg1: vector<8xbf16>, %arg2: vector<8xbf16>) -> vector<4xf32> {
    %0 = x86vector.avx512.dot %arg0, %arg1, %arg2 : vector<8xbf16> -> vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @avx512bf16_dot_256(%arg0: vector<8xf32>, %arg1: vector<16xbf16>, %arg2: vector<16xbf16>) -> vector<8xf32> {
    %0 = x86vector.avx512.dot %arg0, %arg1, %arg2 : vector<16xbf16> -> vector<8xf32>
    return %0 : vector<8xf32>
  }
  func.func @avx512bf16_dot_512(%arg0: vector<16xf32>, %arg1: vector<32xbf16>, %arg2: vector<32xbf16>) -> vector<16xf32> {
    %0 = x86vector.avx512.dot %arg0, %arg1, %arg2 : vector<32xbf16> -> vector<16xf32>
    return %0 : vector<16xf32>
  }
}

