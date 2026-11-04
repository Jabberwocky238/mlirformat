module {
  func.func @mfma_to_rocdl(%arg0: vector<8xf16>, %arg1: vector<16xf32>, %arg2: vector<4xf32>, %arg3: vector<8xbf16>, %arg4: vector<16xi8>, %arg5: vector<16xi32>, %arg6: vector<4xi32>, %arg7: vector<32xf8E4M3FN>, %arg8: vector<32xf8E5M2>, %arg9: vector<32xf6E2M3FN>, %arg10: vector<32xf6E3M2FN>, %arg11: vector<32xf4E2M1FN>) {
    %0 = amdgpu.mfma 32x32x16 %arg0 * %arg0 + %arg1 blgp =  none : vector<8xf16>, vector<8xf16>, vector<16xf32>
    %1 = amdgpu.mfma 16x16x32 %arg0 * %arg0 + %arg2 blgp =  none : vector<8xf16>, vector<8xf16>, vector<4xf32>
    %2 = amdgpu.mfma 32x32x16 %arg3 * %arg3 + %arg1 blgp =  none : vector<8xbf16>, vector<8xbf16>, vector<16xf32>
    %3 = amdgpu.mfma 16x16x32 %arg3 * %arg3 + %arg2 blgp =  none : vector<8xbf16>, vector<8xbf16>, vector<4xf32>
    %4 = amdgpu.mfma 32x32x32 %arg4 * %arg4 + %arg5 blgp =  none : vector<16xi8>, vector<16xi8>, vector<16xi32>
    %5 = amdgpu.mfma 16x16x64 %arg4 * %arg4 + %arg6 blgp =  none : vector<16xi8>, vector<16xi8>, vector<4xi32>
    %6 = amdgpu.mfma 32x32x64 %arg7 * %arg7 + %arg1 blgp =  none : vector<32xf8E4M3FN>, vector<32xf8E4M3FN>, vector<16xf32>
    %7 = amdgpu.mfma 16x16x128 %arg7 * %arg7 + %arg2 blgp =  none : vector<32xf8E4M3FN>, vector<32xf8E4M3FN>, vector<4xf32>
    %8 = amdgpu.mfma 32x32x64 %arg8 * %arg8 + %arg1 blgp =  none : vector<32xf8E5M2>, vector<32xf8E5M2>, vector<16xf32>
    %9 = amdgpu.mfma 16x16x128 %arg8 * %arg8 + %arg2 blgp =  none : vector<32xf8E5M2>, vector<32xf8E5M2>, vector<4xf32>
    %10 = amdgpu.mfma 32x32x64 %arg9 * %arg9 + %arg1 blgp =  none : vector<32xf6E2M3FN>, vector<32xf6E2M3FN>, vector<16xf32>
    %11 = amdgpu.mfma 16x16x128 %arg9 * %arg9 + %arg2 blgp =  none : vector<32xf6E2M3FN>, vector<32xf6E2M3FN>, vector<4xf32>
    %12 = amdgpu.mfma 32x32x64 %arg10 * %arg10 + %arg1 blgp =  none : vector<32xf6E3M2FN>, vector<32xf6E3M2FN>, vector<16xf32>
    %13 = amdgpu.mfma 16x16x128 %arg10 * %arg10 + %arg2 blgp =  none : vector<32xf6E3M2FN>, vector<32xf6E3M2FN>, vector<4xf32>
    %14 = amdgpu.mfma 32x32x64 %arg11 * %arg11 + %arg1 blgp =  none : vector<32xf4E2M1FN>, vector<32xf4E2M1FN>, vector<16xf32>
    %15 = amdgpu.mfma 16x16x128 %arg11 * %arg11 + %arg2 blgp =  none : vector<32xf4E2M1FN>, vector<32xf4E2M1FN>, vector<4xf32>
    %16 = amdgpu.mfma 32x32x64 %arg9 * %arg11 + %arg1 blgp =  none : vector<32xf6E2M3FN>, vector<32xf4E2M1FN>, vector<16xf32>
    %17 = amdgpu.mfma 16x16x128 %arg9 * %arg11 + %arg2 blgp =  none : vector<32xf6E2M3FN>, vector<32xf4E2M1FN>, vector<4xf32>
    return
  }
  func.func @scaled_mfma_to_rocdl(%arg0: vector<16xf32>, %arg1: vector<4xf32>, %arg2: vector<32xf8E4M3FN>, %arg3: vector<32xf8E5M2>, %arg4: vector<32xf6E2M3FN>, %arg5: vector<32xf6E3M2FN>, %arg6: vector<32xf4E2M1FN>, %arg7: vector<4xf8E8M0FNU>, %arg8: f8E8M0FNU) {
    %0 = amdgpu.scaled_mfma 32x32x64 (%arg7[0] * %arg2) * (%arg8[1] * %arg2) + %arg0 : vector<4xf8E8M0FNU>, vector<32xf8E4M3FN>, f8E8M0FNU, vector<32xf8E4M3FN>, vector<16xf32>
    %1 = amdgpu.scaled_mfma 16x16x128 (%arg7[0] * %arg2) * (%arg8[1] * %arg2) + %arg1 : vector<4xf8E8M0FNU>, vector<32xf8E4M3FN>, f8E8M0FNU, vector<32xf8E4M3FN>, vector<4xf32>
    %2 = amdgpu.scaled_mfma 32x32x64 (%arg7[0] * %arg3) * (%arg8[1] * %arg3) + %arg0 : vector<4xf8E8M0FNU>, vector<32xf8E5M2>, f8E8M0FNU, vector<32xf8E5M2>, vector<16xf32>
    %3 = amdgpu.scaled_mfma 16x16x128 (%arg7[0] * %arg3) * (%arg8[1] * %arg3) + %arg1 : vector<4xf8E8M0FNU>, vector<32xf8E5M2>, f8E8M0FNU, vector<32xf8E5M2>, vector<4xf32>
    %4 = amdgpu.scaled_mfma 32x32x64 (%arg7[0] * %arg4) * (%arg8[1] * %arg4) + %arg0 : vector<4xf8E8M0FNU>, vector<32xf6E2M3FN>, f8E8M0FNU, vector<32xf6E2M3FN>, vector<16xf32>
    %5 = amdgpu.scaled_mfma 16x16x128 (%arg7[0] * %arg4) * (%arg8[1] * %arg4) + %arg1 : vector<4xf8E8M0FNU>, vector<32xf6E2M3FN>, f8E8M0FNU, vector<32xf6E2M3FN>, vector<4xf32>
    %6 = amdgpu.scaled_mfma 32x32x64 (%arg7[0] * %arg5) * (%arg8[1] * %arg5) + %arg0 : vector<4xf8E8M0FNU>, vector<32xf6E3M2FN>, f8E8M0FNU, vector<32xf6E3M2FN>, vector<16xf32>
    %7 = amdgpu.scaled_mfma 16x16x128 (%arg7[0] * %arg5) * (%arg8[1] * %arg5) + %arg1 : vector<4xf8E8M0FNU>, vector<32xf6E3M2FN>, f8E8M0FNU, vector<32xf6E3M2FN>, vector<4xf32>
    %8 = amdgpu.scaled_mfma 32x32x64 (%arg7[0] * %arg6) * (%arg8[1] * %arg6) + %arg0 : vector<4xf8E8M0FNU>, vector<32xf4E2M1FN>, f8E8M0FNU, vector<32xf4E2M1FN>, vector<16xf32>
    %9 = amdgpu.scaled_mfma 16x16x128 (%arg7[0] * %arg6) * (%arg8[1] * %arg6) + %arg1 : vector<4xf8E8M0FNU>, vector<32xf4E2M1FN>, f8E8M0FNU, vector<32xf4E2M1FN>, vector<4xf32>
    return
  }
}

