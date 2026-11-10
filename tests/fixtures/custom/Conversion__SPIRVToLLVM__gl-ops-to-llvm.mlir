module {
  spirv.func @ceil(%arg0: f32, %arg1: vector<3xf16>) "None" {
    %0 = spirv.GL.Ceil %arg0 : f32
    %1 = spirv.GL.Ceil %arg1 : vector<3xf16>
    spirv.Return
  }
  spirv.func @cos(%arg0: f32, %arg1: vector<3xf16>) "None" {
    %0 = spirv.GL.Cos %arg0 : f32
    %1 = spirv.GL.Cos %arg1 : vector<3xf16>
    spirv.Return
  }
  spirv.func @exp(%arg0: f32, %arg1: vector<3xf16>) "None" {
    %0 = spirv.GL.Exp %arg0 : f32
    %1 = spirv.GL.Exp %arg1 : vector<3xf16>
    spirv.Return
  }
  spirv.func @fabs(%arg0: f32, %arg1: vector<3xf16>) "None" {
    %0 = spirv.GL.FAbs %arg0 : f32
    %1 = spirv.GL.FAbs %arg1 : vector<3xf16>
    spirv.Return
  }
  spirv.func @floor(%arg0: f32, %arg1: vector<3xf16>) "None" {
    %0 = spirv.GL.Floor %arg0 : f32
    %1 = spirv.GL.Floor %arg1 : vector<3xf16>
    spirv.Return
  }
  spirv.func @fmax(%arg0: f32, %arg1: vector<3xf16>) "None" {
    %0 = spirv.GL.FMax %arg0, %arg0 : f32
    %1 = spirv.GL.FMax %arg1, %arg1 : vector<3xf16>
    spirv.Return
  }
  spirv.func @fmin(%arg0: f32, %arg1: vector<3xf16>) "None" {
    %0 = spirv.GL.FMin %arg0, %arg0 : f32
    %1 = spirv.GL.FMin %arg1, %arg1 : vector<3xf16>
    spirv.Return
  }
  spirv.func @fclamp(%arg0: f32, %arg1: f32, %arg2: f32) "None" {
    %0 = spirv.GL.FClamp %arg0, %arg1, %arg2 : f32
    spirv.Return
  }
  spirv.func @nmax(%arg0: f32, %arg1: vector<3xf16>) "None" {
    %0 = spirv.GL.NMax %arg0, %arg0 : f32
    %1 = spirv.GL.NMax %arg1, %arg1 : vector<3xf16>
    spirv.Return
  }
  spirv.func @nmin(%arg0: f32, %arg1: vector<3xf16>) "None" {
    %0 = spirv.GL.NMin %arg0, %arg0 : f32
    %1 = spirv.GL.NMin %arg1, %arg1 : vector<3xf16>
    spirv.Return
  }
  spirv.func @log(%arg0: f32, %arg1: vector<3xf16>) "None" {
    %0 = spirv.GL.Log %arg0 : f32
    %1 = spirv.GL.Log %arg1 : vector<3xf16>
    spirv.Return
  }
  spirv.func @sin(%arg0: f32, %arg1: vector<3xf16>) "None" {
    %0 = spirv.GL.Sin %arg0 : f32
    %1 = spirv.GL.Sin %arg1 : vector<3xf16>
    spirv.Return
  }
  spirv.func @pow(%arg0: f32, %arg1: vector<3xf16>) "None" {
    %0 = spirv.GL.Pow %arg0, %arg0 : f32
    %1 = spirv.GL.Pow %arg1, %arg1 : vector<3xf16>
    spirv.Return
  }
  spirv.func @fma(%arg0: f32, %arg1: vector<3xf16>) "None" {
    %0 = spirv.GL.Fma %arg0, %arg0, %arg0 : f32
    %1 = spirv.GL.Fma %arg1, %arg1, %arg1 : vector<3xf16>
    spirv.Return
  }
  spirv.func @sabs(%arg0: i16, %arg1: vector<3xi32>) "None" {
    %0 = spirv.GL.SAbs %arg0 : i16
    %1 = spirv.GL.SAbs %arg1 : vector<3xi32>
    spirv.Return
  }
  spirv.func @smax(%arg0: i16, %arg1: vector<3xi32>) "None" {
    %0 = spirv.GL.SMax %arg0, %arg0 : i16
    %1 = spirv.GL.SMax %arg1, %arg1 : vector<3xi32>
    spirv.Return
  }
  spirv.func @smin(%arg0: i16, %arg1: vector<3xi32>) "None" {
    %0 = spirv.GL.SMin %arg0, %arg0 : i16
    %1 = spirv.GL.SMin %arg1, %arg1 : vector<3xi32>
    spirv.Return
  }
  spirv.func @umax(%arg0: i16, %arg1: vector<3xi32>) "None" {
    %0 = spirv.GL.UMax %arg0, %arg0 : i16
    %1 = spirv.GL.UMax %arg1, %arg1 : vector<3xi32>
    spirv.Return
  }
  spirv.func @umin(%arg0: i16, %arg1: vector<3xi32>) "None" {
    %0 = spirv.GL.UMin %arg0, %arg0 : i16
    %1 = spirv.GL.UMin %arg1, %arg1 : vector<3xi32>
    spirv.Return
  }
  spirv.func @sclamp(%arg0: i16, %arg1: i16, %arg2: i16) "None" {
    %0 = spirv.GL.SClamp %arg0, %arg1, %arg2 : i16
    spirv.Return
  }
  spirv.func @uclamp(%arg0: i32, %arg1: i32, %arg2: i32) "None" {
    %0 = spirv.GL.UClamp %arg0, %arg1, %arg2 : i32
    spirv.Return
  }
  spirv.func @sqrt(%arg0: f32, %arg1: vector<3xf16>) "None" {
    %0 = spirv.GL.Sqrt %arg0 : f32
    %1 = spirv.GL.Sqrt %arg1 : vector<3xf16>
    spirv.Return
  }
  spirv.func @tan(%arg0: f32) "None" {
    %0 = spirv.GL.Tan %arg0 : f32
    spirv.Return
  }
  spirv.func @tanh(%arg0: f32) "None" {
    %0 = spirv.GL.Tanh %arg0 : f32
    spirv.Return
  }
  spirv.func @exp2(%arg0: f32, %arg1: vector<3xf16>) "None" {
    %0 = spirv.GL.Exp2 %arg0 : f32
    %1 = spirv.GL.Exp2 %arg1 : vector<3xf16>
    spirv.Return
  }
  spirv.func @log2(%arg0: f32, %arg1: vector<3xf16>) "None" {
    %0 = spirv.GL.Log2 %arg0 : f32
    %1 = spirv.GL.Log2 %arg1 : vector<3xf16>
    spirv.Return
  }
  spirv.func @round(%arg0: f32, %arg1: vector<3xf16>) "None" {
    %0 = spirv.GL.Round %arg0 : f32
    %1 = spirv.GL.Round %arg1 : vector<3xf16>
    spirv.Return
  }
  spirv.func @round_even(%arg0: f32, %arg1: vector<3xf16>) "None" {
    %0 = spirv.GL.RoundEven %arg0 : f32
    %1 = spirv.GL.RoundEven %arg1 : vector<3xf16>
    spirv.Return
  }
  spirv.func @sinh(%arg0: f32, %arg1: vector<3xf16>) "None" {
    %0 = spirv.GL.Sinh %arg0 : f32
    %1 = spirv.GL.Sinh %arg1 : vector<3xf16>
    spirv.Return
  }
  spirv.func @cosh(%arg0: f32, %arg1: vector<3xf16>) "None" {
    %0 = spirv.GL.Cosh %arg0 : f32
    %1 = spirv.GL.Cosh %arg1 : vector<3xf16>
    spirv.Return
  }
  spirv.func @inverse_sqrt(%arg0: f32) "None" {
    %0 = spirv.GL.InverseSqrt %arg0 : f32
    spirv.Return
  }
  spirv.func @radians(%arg0: f32, %arg1: vector<3xf32>) "None" {
    %0 = spirv.GL.Radians %arg0 : f32
    %1 = spirv.GL.Radians %arg1 : vector<3xf32>
    spirv.Return
  }
  spirv.func @degrees(%arg0: f32, %arg1: vector<3xf32>) "None" {
    %0 = spirv.GL.Degrees %arg0 : f32
    %1 = spirv.GL.Degrees %arg1 : vector<3xf32>
    spirv.Return
  }
  spirv.func @trunc(%arg0: f32, %arg1: vector<3xf16>) "None" {
    %0 = spirv.GL.Trunc %arg0 : f32
    %1 = spirv.GL.Trunc %arg1 : vector<3xf16>
    spirv.Return
  }
  spirv.func @asin_acos_atan(%arg0: f32, %arg1: vector<3xf16>) "None" {
    %0 = spirv.GL.Asin %arg0 : f32
    %1 = spirv.GL.Acos %arg1 : vector<3xf16>
    %2 = spirv.GL.Atan %arg0 : f32
    spirv.Return
  }
  spirv.func @fract(%arg0: f32, %arg1: vector<3xf16>) "None" {
    %0 = spirv.GL.Fract %arg0 : f32
    %1 = spirv.GL.Fract %arg1 : vector<3xf16>
    spirv.Return
  }
  spirv.func @fmix_scalar(%arg0: f32, %arg1: f32, %arg2: f32) "None" {
    %0 = spirv.GL.FMix %arg0 : f32, %arg1 : f32, %arg2 : f32 -> f32
    spirv.Return
  }
  spirv.func @fmix_vector(%arg0: vector<4xf32>, %arg1: vector<4xf32>, %arg2: vector<4xf32>) "None" {
    %0 = spirv.GL.FMix %arg0 : vector<4xf32>, %arg1 : vector<4xf32>, %arg2 : vector<4xf32> -> vector<4xf32>
    spirv.Return
  }
}

