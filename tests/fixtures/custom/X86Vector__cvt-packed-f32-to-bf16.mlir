module {
  func.func @avx512bf16_cvt_packed_f32_to_bf16_256(%arg0: vector<8xf32>) -> vector<8xbf16> {
    %0 = x86vector.avx512.cvt.packed.f32_to_bf16 %arg0 : vector<8xf32> -> vector<8xbf16>
    return %0 : vector<8xbf16>
  }
  func.func @avx512bf16_cvt_packed_f32_to_bf16_512(%arg0: vector<16xf32>) -> vector<16xbf16> {
    %0 = x86vector.avx512.cvt.packed.f32_to_bf16 %arg0 : vector<16xf32> -> vector<16xbf16>
    return %0 : vector<16xbf16>
  }
}

