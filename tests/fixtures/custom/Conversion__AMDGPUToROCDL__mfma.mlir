module {
  func.func @mfma_to_rocdl(%arg0: f32, %arg1: vector<32xf32>, %arg2: vector<16xf32>, %arg3: vector<4xf32>, %arg4: vector<4xf16>, %arg5: vector<4xi8>, %arg6: vector<32xi32>, %arg7: vector<16xi32>, %arg8: vector<4xi32>, %arg9: vector<2xbf16>, %arg10: vector<4xbf16>, %arg11: f64, %arg12: vector<4xf64>, %arg13: vector<8xi8>, %arg14: vector<2xf32>, %arg15: vector<8xf8E5M2FNUZ>, %arg16: vector<8xf8E4M3FNUZ>) {
    %0 = amdgpu.mfma 32x32x1 %arg0 * %arg0 + %arg1 {blocks = 2 : i32} blgp =  none : f32, f32, vector<32xf32>
    %1 = amdgpu.mfma 16x16x1 %arg0 * %arg0 + %arg2 {blocks = 4 : i32} blgp =  none : f32, f32, vector<16xf32>
    %2 = amdgpu.mfma 4x4x1 %arg0 * %arg0 + %arg3 {blocks = 16 : i32} blgp =  none : f32, f32, vector<4xf32>
    %3 = amdgpu.mfma 32x32x2 %arg0 * %arg0 + %arg2 blgp =  none : f32, f32, vector<16xf32>
    %4 = amdgpu.mfma 16x16x4 %arg0 * %arg0 + %arg3 blgp =  none : f32, f32, vector<4xf32>
    %5 = amdgpu.mfma 32x32x4 %arg4 * %arg4 + %arg1 {blocks = 2 : i32} blgp =  none : vector<4xf16>, vector<4xf16>, vector<32xf32>
    %6 = amdgpu.mfma 16x16x4 %arg4 * %arg4 + %arg2 {blocks = 4 : i32} blgp =  none : vector<4xf16>, vector<4xf16>, vector<16xf32>
    %7 = amdgpu.mfma 4x4x4 %arg4 * %arg4 + %arg3 {blocks = 16 : i32} blgp =  none : vector<4xf16>, vector<4xf16>, vector<4xf32>
    %8 = amdgpu.mfma 32x32x8 %arg4 * %arg4 + %arg2 blgp =  none : vector<4xf16>, vector<4xf16>, vector<16xf32>
    %9 = amdgpu.mfma 16x16x16 %arg4 * %arg4 + %arg3 blgp =  none : vector<4xf16>, vector<4xf16>, vector<4xf32>
    %10 = amdgpu.mfma 32x32x4 %arg5 * %arg5 + %arg6 {blocks = 2 : i32} blgp =  none : vector<4xi8>, vector<4xi8>, vector<32xi32>
    %11 = amdgpu.mfma 16x16x4 %arg5 * %arg5 + %arg7 {blocks = 4 : i32} blgp =  none : vector<4xi8>, vector<4xi8>, vector<16xi32>
    %12 = amdgpu.mfma 4x4x4 %arg5 * %arg5 + %arg8 {blocks = 16 : i32} blgp =  none : vector<4xi8>, vector<4xi8>, vector<4xi32>
    %13 = amdgpu.mfma 32x32x8 %arg5 * %arg5 + %arg7 blgp =  none : vector<4xi8>, vector<4xi8>, vector<16xi32>
    %14 = amdgpu.mfma 16x16x16 %arg5 * %arg5 + %arg8 blgp =  none : vector<4xi8>, vector<4xi8>, vector<4xi32>
    %15 = amdgpu.mfma 32x32x2 %arg9 * %arg9 + %arg1 {blocks = 2 : i32} blgp =  none : vector<2xbf16>, vector<2xbf16>, vector<32xf32>
    %16 = amdgpu.mfma 16x16x2 %arg9 * %arg9 + %arg2 {blocks = 4 : i32} blgp =  none : vector<2xbf16>, vector<2xbf16>, vector<16xf32>
    %17 = amdgpu.mfma 4x4x2 %arg9 * %arg9 + %arg3 {blocks = 16 : i32} blgp =  none : vector<2xbf16>, vector<2xbf16>, vector<4xf32>
    %18 = amdgpu.mfma 32x32x4 %arg9 * %arg9 + %arg2 blgp =  none : vector<2xbf16>, vector<2xbf16>, vector<16xf32>
    %19 = amdgpu.mfma 16x16x8 %arg9 * %arg9 + %arg3 blgp =  none : vector<2xbf16>, vector<2xbf16>, vector<4xf32>
    %20 = amdgpu.mfma 32x32x4 %arg10 * %arg10 + %arg1 {blocks = 2 : i32} blgp =  none : vector<4xbf16>, vector<4xbf16>, vector<32xf32>
    %21 = amdgpu.mfma 16x16x4 %arg10 * %arg10 + %arg2 {blocks = 4 : i32} blgp =  none : vector<4xbf16>, vector<4xbf16>, vector<16xf32>
    %22 = amdgpu.mfma 4x4x4 %arg10 * %arg10 + %arg3 {blocks = 16 : i32} blgp =  none : vector<4xbf16>, vector<4xbf16>, vector<4xf32>
    %23 = amdgpu.mfma 32x32x8 %arg10 * %arg10 + %arg2 blgp =  none : vector<4xbf16>, vector<4xbf16>, vector<16xf32>
    %24 = amdgpu.mfma 16x16x16 %arg10 * %arg10 + %arg3 blgp =  none : vector<4xbf16>, vector<4xbf16>, vector<4xf32>
    %25 = amdgpu.mfma 16x16x4 %arg11 * %arg11 + %arg12 blgp =  none : f64, f64, vector<4xf64>
    %26 = amdgpu.mfma 4x4x4 %arg11 * %arg11 + %arg11 {blocks = 4 : i32} blgp =  none : f64, f64, f64
    %27 = amdgpu.mfma 16x16x32 %arg13 * %arg13 + %arg8 blgp =  none : vector<8xi8>, vector<8xi8>, vector<4xi32>
    %28 = amdgpu.mfma 32x32x16 %arg13 * %arg13 + %arg7 blgp =  none : vector<8xi8>, vector<8xi8>, vector<16xi32>
    %29 = amdgpu.mfma 16x16x8 %arg14 * %arg14 + %arg3 {reducePrecision} blgp =  none : vector<2xf32>, vector<2xf32>, vector<4xf32>
    %30 = amdgpu.mfma 32x32x4 %arg14 * %arg14 + %arg2 {reducePrecision} blgp =  none : vector<2xf32>, vector<2xf32>, vector<16xf32>
    %31 = amdgpu.mfma 16x16x32 %arg15 * %arg15 + %arg3 blgp =  none : vector<8xf8E5M2FNUZ>, vector<8xf8E5M2FNUZ>, vector<4xf32>
    %32 = amdgpu.mfma 16x16x32 %arg15 * %arg16 + %arg3 blgp =  none : vector<8xf8E5M2FNUZ>, vector<8xf8E4M3FNUZ>, vector<4xf32>
    %33 = amdgpu.mfma 16x16x32 %arg16 * %arg15 + %arg3 blgp =  none : vector<8xf8E4M3FNUZ>, vector<8xf8E5M2FNUZ>, vector<4xf32>
    %34 = amdgpu.mfma 16x16x32 %arg16 * %arg16 + %arg3 blgp =  none : vector<8xf8E4M3FNUZ>, vector<8xf8E4M3FNUZ>, vector<4xf32>
    %35 = amdgpu.mfma 32x32x16 %arg15 * %arg15 + %arg2 blgp =  none : vector<8xf8E5M2FNUZ>, vector<8xf8E5M2FNUZ>, vector<16xf32>
    %36 = amdgpu.mfma 32x32x16 %arg15 * %arg16 + %arg2 blgp =  none : vector<8xf8E5M2FNUZ>, vector<8xf8E4M3FNUZ>, vector<16xf32>
    %37 = amdgpu.mfma 32x32x16 %arg16 * %arg15 + %arg2 blgp =  none : vector<8xf8E4M3FNUZ>, vector<8xf8E5M2FNUZ>, vector<16xf32>
    %38 = amdgpu.mfma 32x32x16 %arg16 * %arg16 + %arg2 blgp =  none : vector<8xf8E4M3FNUZ>, vector<8xf8E4M3FNUZ>, vector<16xf32>
    return
  }
}

