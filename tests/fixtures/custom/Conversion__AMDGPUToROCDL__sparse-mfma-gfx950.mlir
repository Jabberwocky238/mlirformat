module {
  func.func @sparse_mfma_to_rocdl(%arg0: vector<8xf16>, %arg1: vector<16xf16>, %arg2: vector<4xf32>, %arg3: vector<16xf32>, %arg4: vector<8xbf16>, %arg5: vector<16xbf16>, %arg6: vector<16xi8>, %arg7: vector<32xi8>, %arg8: vector<4xi32>, %arg9: vector<16xi32>, %arg10: vector<16xf8E4M3FN>, %arg11: vector<16xf8E5M2>, %arg12: vector<32xf8E4M3FN>, %arg13: vector<32xf8E5M2>, %arg14: vector<4xi8>, %arg15: vector<2xi16>) {
    %0 = amdgpu.sparse_mfma 16x16x64 %arg0 * %arg1 + %arg2 sparse(%arg14 : vector<4xi8>) : vector<8xf16>, vector<16xf16>, vector<4xf32>
    %1 = amdgpu.sparse_mfma 16x16x64 %arg4 * %arg5 + %arg2 sparse(%arg14 : vector<4xi8>) : vector<8xbf16>, vector<16xbf16>, vector<4xf32>
    %2 = amdgpu.sparse_mfma 16x16x128 %arg6 * %arg7 + %arg8 sparse(%arg15 : vector<2xi16>) : vector<16xi8>, vector<32xi8>, vector<4xi32>
    %3 = amdgpu.sparse_mfma 16x16x128 %arg10 * %arg12 + %arg2 sparse(%arg15 : vector<2xi16>) : vector<16xf8E4M3FN>, vector<32xf8E4M3FN>, vector<4xf32>
    %4 = amdgpu.sparse_mfma 16x16x128 %arg11 * %arg13 + %arg2 sparse(%arg15 : vector<2xi16>) : vector<16xf8E5M2>, vector<32xf8E5M2>, vector<4xf32>
    %5 = amdgpu.sparse_mfma 16x16x128 %arg10 * %arg13 + %arg2 sparse(%arg15 : vector<2xi16>) : vector<16xf8E4M3FN>, vector<32xf8E5M2>, vector<4xf32>
    %6 = amdgpu.sparse_mfma 16x16x128 %arg11 * %arg12 + %arg2 sparse(%arg15 : vector<2xi16>) : vector<16xf8E5M2>, vector<32xf8E4M3FN>, vector<4xf32>
    %7 = amdgpu.sparse_mfma 32x32x32 %arg0 * %arg1 + %arg3 sparse(%arg14 : vector<4xi8>) : vector<8xf16>, vector<16xf16>, vector<16xf32>
    %8 = amdgpu.sparse_mfma 32x32x32 %arg4 * %arg5 + %arg3 sparse(%arg14 : vector<4xi8>) : vector<8xbf16>, vector<16xbf16>, vector<16xf32>
    %9 = amdgpu.sparse_mfma 32x32x64 %arg6 * %arg7 + %arg9 sparse(%arg15 : vector<2xi16>) : vector<16xi8>, vector<32xi8>, vector<16xi32>
    %10 = amdgpu.sparse_mfma 32x32x64 %arg10 * %arg12 + %arg3 sparse(%arg15 : vector<2xi16>) : vector<16xf8E4M3FN>, vector<32xf8E4M3FN>, vector<16xf32>
    %11 = amdgpu.sparse_mfma 32x32x64 %arg11 * %arg13 + %arg3 sparse(%arg15 : vector<2xi16>) : vector<16xf8E5M2>, vector<32xf8E5M2>, vector<16xf32>
    %12 = amdgpu.sparse_mfma 32x32x64 %arg10 * %arg13 + %arg3 sparse(%arg15 : vector<2xi16>) : vector<16xf8E4M3FN>, vector<32xf8E5M2>, vector<16xf32>
    %13 = amdgpu.sparse_mfma 32x32x64 %arg11 * %arg12 + %arg3 sparse(%arg15 : vector<2xi16>) : vector<16xf8E5M2>, vector<32xf8E4M3FN>, vector<16xf32>
    return
  }
}

