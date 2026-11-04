module {
  func.func @exp(%arg0: f32) {
    %0 = spirv.GL.Exp %arg0 : f32
    return
  }
  func.func @expvec(%arg0: vector<3xf16>) {
    %0 = spirv.GL.Exp %arg0 : vector<3xf16>
    return
  }
}

// -----
// -----
// -----
// -----
// -----
// -----
module {
  func.func @fmaxmin(%arg0: f32, %arg1: f32) {
    %0 = spirv.GL.FMax %arg0, %arg1 : f32
    %1 = spirv.GL.FMin %arg0, %arg1 : f32
    return
  }
  func.func @fmaxminvec(%arg0: vector<3xf16>, %arg1: vector<3xf16>) {
    %0 = spirv.GL.FMax %arg0, %arg1 : vector<3xf16>
    %1 = spirv.GL.FMin %arg0, %arg1 : vector<3xf16>
    return
  }
  func.func @fmaxminf64(%arg0: f64, %arg1: f64) {
    %0 = spirv.GL.FMax %arg0, %arg1 : f64
    %1 = spirv.GL.FMin %arg0, %arg1 : f64
    return
  }
  func.func @iminmax(%arg0: i32, %arg1: i32) {
    %0 = spirv.GL.SMax %arg0, %arg1 : i32
    %1 = spirv.GL.UMax %arg0, %arg1 : i32
    %2 = spirv.GL.SMin %arg0, %arg1 : i32
    %3 = spirv.GL.UMin %arg0, %arg1 : i32
    return
  }
}

// -----
// -----
module {
  func.func @inversesqrt(%arg0: f32) {
    %0 = spirv.GL.InverseSqrt %arg0 : f32
    return
  }
  func.func @inversesqrtvec(%arg0: vector<3xf16>) {
    %0 = spirv.GL.InverseSqrt %arg0 : vector<3xf16>
    return
  }
}

// -----
module {
  func.func @sqrt(%arg0: f32) {
    %0 = spirv.GL.Sqrt %arg0 : f32
    return
  }
  func.func @sqrtvec(%arg0: vector<3xf16>) {
    %0 = spirv.GL.Sqrt %arg0 : vector<3xf16>
    return
  }
  func.func @cos(%arg0: f32) {
    %0 = spirv.GL.Cos %arg0 : f32
    return
  }
  func.func @cosvec(%arg0: vector<3xf16>) {
    %0 = spirv.GL.Cos %arg0 : vector<3xf16>
    return
  }
  func.func @sin(%arg0: f32) {
    %0 = spirv.GL.Sin %arg0 : f32
    return
  }
  func.func @sinvec(%arg0: vector<3xf16>) {
    %0 = spirv.GL.Sin %arg0 : vector<3xf16>
    return
  }
  func.func @tan(%arg0: f32) {
    %0 = spirv.GL.Tan %arg0 : f32
    return
  }
  func.func @tanvec(%arg0: vector<3xf16>) {
    %0 = spirv.GL.Tan %arg0 : vector<3xf16>
    return
  }
  func.func @acos(%arg0: f32) {
    %0 = spirv.GL.Acos %arg0 : f32
    return
  }
  func.func @acosvec(%arg0: vector<3xf16>) {
    %0 = spirv.GL.Acos %arg0 : vector<3xf16>
    return
  }
  func.func @asin(%arg0: f32) {
    %0 = spirv.GL.Asin %arg0 : f32
    return
  }
  func.func @asinvec(%arg0: vector<3xf16>) {
    %0 = spirv.GL.Asin %arg0 : vector<3xf16>
    return
  }
  func.func @atan(%arg0: f32) {
    %0 = spirv.GL.Atan %arg0 : f32
    return
  }
  func.func @atanvec(%arg0: vector<3xf16>) {
    %0 = spirv.GL.Atan %arg0 : vector<3xf16>
    return
  }
  func.func @sinh(%arg0: f32) {
    %0 = spirv.GL.Sinh %arg0 : f32
    return
  }
  func.func @sinhvec(%arg0: vector<3xf16>) {
    %0 = spirv.GL.Sinh %arg0 : vector<3xf16>
    return
  }
  func.func @cosh(%arg0: f32) {
    %0 = spirv.GL.Cosh %arg0 : f32
    return
  }
  func.func @coshvec(%arg0: vector<3xf16>) {
    %0 = spirv.GL.Cosh %arg0 : vector<3xf16>
    return
  }
  func.func @asinh(%arg0: f32) {
    %0 = spirv.GL.Asinh %arg0 : f32
    return
  }
  func.func @asinhvec(%arg0: vector<3xf16>) {
    %0 = spirv.GL.Asinh %arg0 : vector<3xf16>
    return
  }
  func.func @acosh(%arg0: f32) {
    %0 = spirv.GL.Acosh %arg0 : f32
    return
  }
  func.func @acoshvec(%arg0: vector<3xf16>) {
    %0 = spirv.GL.Acosh %arg0 : vector<3xf16>
    return
  }
  func.func @atanh(%arg0: f32) {
    %0 = spirv.GL.Atanh %arg0 : f32
    return
  }
  func.func @atanhvec(%arg0: vector<3xf16>) {
    %0 = spirv.GL.Atanh %arg0 : vector<3xf16>
    return
  }
  func.func @pow(%arg0: f32, %arg1: f32) {
    %0 = spirv.GL.Pow %arg0, %arg1 : f32
    return
  }
  func.func @powvec(%arg0: vector<3xf16>, %arg1: vector<3xf16>) {
    %0 = spirv.GL.Pow %arg0, %arg1 : vector<3xf16>
    return
  }
}

// -----
module {
  func.func @round(%arg0: f32) {
    %0 = spirv.GL.Round %arg0 : f32
    return
  }
  func.func @roundvec(%arg0: vector<3xf16>) {
    %0 = spirv.GL.Round %arg0 : vector<3xf16>
    return
  }
  func.func @round_even(%arg0: f32) {
    %0 = spirv.GL.RoundEven %arg0 : f32
    return
  }
  func.func @round_even_vec(%arg0: vector<3xf16>) {
    %0 = spirv.GL.RoundEven %arg0 : vector<3xf16>
    return
  }
}

// -----
module {
  func.func @fclamp(%arg0: f32, %arg1: f32, %arg2: f32) {
    %0 = spirv.GL.FClamp %arg0, %arg1, %arg2 : f32
    return
  }
}

// -----
module {
  func.func @fclamp(%arg0: vector<3xf32>, %arg1: vector<3xf32>, %arg2: vector<3xf32>) {
    %0 = spirv.GL.FClamp %arg0, %arg1, %arg2 : vector<3xf32>
    return
  }
}

// -----
module {
  func.func @uclamp(%arg0: ui32, %arg1: ui32, %arg2: ui32) {
    %0 = spirv.GL.UClamp %arg0, %arg1, %arg2 : ui32
    return
  }
}

// -----
module {
  func.func @uclamp(%arg0: vector<4xi32>, %arg1: vector<4xi32>, %arg2: vector<4xi32>) {
    %0 = spirv.GL.UClamp %arg0, %arg1, %arg2 : vector<4xi32>
    return
  }
}

// -----
module {
  func.func @uclamp(%arg0: si32, %arg1: si32, %arg2: si32) {
    %0 = spirv.GL.UClamp %arg0, %arg1, %arg2 : si32
    return
  }
}

// -----
module {
  func.func @sclamp(%arg0: si32, %arg1: si32, %arg2: si32) {
    %0 = spirv.GL.SClamp %arg0, %arg1, %arg2 : si32
    return
  }
}

// -----
module {
  func.func @sclamp(%arg0: vector<4xsi32>, %arg1: vector<4xsi32>, %arg2: vector<4xsi32>) {
    %0 = spirv.GL.SClamp %arg0, %arg1, %arg2 : vector<4xsi32>
    return
  }
}

// -----
module {
  func.func @sclamp(%arg0: i32, %arg1: i32, %arg2: i32) {
    %0 = spirv.GL.SClamp %arg0, %arg1, %arg2 : i32
    return
  }
}

// -----
module {
  func.func @fma(%arg0: f32, %arg1: f32, %arg2: f32) {
    %0 = spirv.GL.Fma %arg0, %arg1, %arg2 : f32
    return
  }
}

// -----
module {
  func.func @fma(%arg0: vector<3xf32>, %arg1: vector<3xf32>, %arg2: vector<3xf32>) {
    %0 = spirv.GL.Fma %arg0, %arg1, %arg2 : vector<3xf32>
    return
  }
}

// -----
module {
  func.func @frexp_struct(%arg0: f32) {
    %0 = spirv.GL.FrexpStruct %arg0 : f32 -> !spirv.struct<(f32, i32)>
    return
  }
  func.func @frexp_struct_64(%arg0: f64) {
    %0 = spirv.GL.FrexpStruct %arg0 : f64 -> !spirv.struct<(f64, i32)>
    return
  }
  func.func @frexp_struct_vec(%arg0: vector<3xf32>) {
    %0 = spirv.GL.FrexpStruct %arg0 : vector<3xf32> -> !spirv.struct<(vector<3xf32>, vector<3xi32>)>
    return
  }
}

// -----
// -----
// -----
// -----
// -----
module {
  func.func @ldexp(%arg0: f32, %arg1: i32) {
    %0 = spirv.GL.Ldexp %arg0 : f32, %arg1 : i32 -> f32
    return
  }
}

// -----
module {
  func.func @ldexp_vec(%arg0: vector<3xf32>, %arg1: vector<3xi32>) {
    %0 = spirv.GL.Ldexp %arg0 : vector<3xf32>, %arg1 : vector<3xi32> -> vector<3xf32>
    return
  }
}

// -----
// -----
// -----
// -----
module {
  func.func @fmix(%arg0: f32, %arg1: f32, %arg2: f32) {
    %0 = spirv.GL.FMix %arg0 : f32, %arg1 : f32, %arg2 : f32 -> f32
    return
  }
  func.func @fmix_vector(%arg0: vector<3xf32>, %arg1: vector<3xf32>, %arg2: vector<3xf32>) {
    %0 = spirv.GL.FMix %arg0 : vector<3xf32>, %arg1 : vector<3xf32>, %arg2 : vector<3xf32> -> vector<3xf32>
    return
  }
}

// -----
module {
  func.func @findimsb_scalar_i32(%arg0: i32) {
    %0 = spirv.GL.FindILsb %arg0 : i32
    return
  }
  func.func @findimsb_vector_i32(%arg0: vector<3xi32>) {
    %0 = spirv.GL.FindILsb %arg0 : vector<3xi32>
    return
  }
  func.func @findimsb_scalar_i16(%arg0: i16) {
    %0 = spirv.GL.FindILsb %arg0 : i16
    return
  }
  func.func @findimsb_vector_i64(%arg0: vector<3xi64>) {
    %0 = spirv.GL.FindILsb %arg0 : vector<3xi64>
    return
  }
}

// -----
// -----
module {
  func.func @findsmsb_scalar(%arg0: i32) {
    %0 = spirv.GL.FindSMsb %arg0 : i32
    return
  }
  func.func @findsmsb_vector(%arg0: vector<3xi32>) {
    %0 = spirv.GL.FindSMsb %arg0 : vector<3xi32>
    return
  }
}

// -----
// -----
module {
  func.func @findumsb(%arg0: i32) {
    %0 = spirv.GL.FindUMsb %arg0 : i32
    return
  }
  func.func @findumsb_vector(%arg0: vector<3xi32>) {
    %0 = spirv.GL.FindUMsb %arg0 : vector<3xi32>
    return
  }
}

// -----
// -----
module {
  func.func @distance_scalar(%arg0: f32, %arg1: f32) {
    %0 = spirv.GL.Distance %arg0, %arg1 : f32, f32 -> f32
    return
  }
  func.func @distance_vector(%arg0: vector<3xf32>, %arg1: vector<3xf32>) {
    %0 = spirv.GL.Distance %arg0, %arg1 : vector<3xf32>, vector<3xf32> -> f32
    return
  }
}

// -----
// -----
// -----
// -----
// -----
module {
  func.func @cross(%arg0: vector<3xf32>, %arg1: vector<3xf32>) {
    %0 = spirv.GL.Cross %arg0, %arg1 : vector<3xf32>
    return
  }
}

// -----
// -----
module {
  func.func @normalize_scalar(%arg0: f32) {
    %0 = spirv.GL.Normalize %arg0 : f32
    return
  }
  func.func @normalize_vector(%arg0: vector<3xf32>) {
    %0 = spirv.GL.Normalize %arg0 : vector<3xf32>
    return
  }
}

// -----
// -----
module {
  func.func @reflect_scalar(%arg0: f32, %arg1: f32) {
    %0 = spirv.GL.Reflect %arg0, %arg1 : f32
    return
  }
  func.func @reflect_vector(%arg0: vector<3xf32>, %arg1: vector<3xf32>) {
    %0 = spirv.GL.Reflect %arg0, %arg1 : vector<3xf32>
    return
  }
}

// -----
// -----
module {
  func.func @fract(%arg0: f32) {
    %0 = spirv.GL.Fract %arg0 : f32
    return
  }
  func.func @fractvec(%arg0: vector<3xf16>) {
    %0 = spirv.GL.Fract %arg0 : vector<3xf16>
    return
  }
}

// -----
// -----
module {
  func.func @log2(%arg0: f32) {
    %0 = spirv.GL.Log2 %arg0 : f32
    return
  }
  func.func @log2vec(%arg0: vector<3xf16>) {
    %0 = spirv.GL.Log2 %arg0 : vector<3xf16>
    return
  }
}

// -----
// -----
module {
  func.func @tanh(%arg0: f32) {
    %0 = spirv.GL.Tanh %arg0 : f32
    return
  }
  func.func @tanhvec(%arg0: vector<3xf16>) {
    %0 = spirv.GL.Tanh %arg0 : vector<3xf16>
    return
  }
}

// -----
// -----
module {
  func.func @exp2(%arg0: f32) {
    %0 = spirv.GL.Exp2 %arg0 : f32
    return
  }
  func.func @exp2vec(%arg0: vector<3xf16>) {
    %0 = spirv.GL.Exp2 %arg0 : vector<3xf16>
    return
  }
}

// -----
// -----
module {
  func.func @pack_half_2x16(%arg0: vector<2xf32>) {
    %0 = spirv.GL.PackHalf2x16 %arg0 : vector<2xf32> -> i32
    return
  }
}

// -----
// -----
// -----
// -----
// -----
// -----
module {
  func.func @unpack_half_2x16(%arg0: i32) {
    %0 = spirv.GL.UnpackHalf2x16 %arg0 : i32 -> vector<2xf32>
    return
  }
}

// -----
// -----
// -----
// -----
// -----
// -----
module {
  func.func @pack_snorm_4x8(%arg0: vector<4xf32>) {
    %0 = spirv.GL.PackSnorm4x8 %arg0 : vector<4xf32> -> i32
    return
  }
}

// -----
// -----
// -----
// -----
// -----
// -----
module {
  func.func @unpack_snorm_4x8(%arg0: i32) {
    %0 = spirv.GL.UnpackSnorm4x8 %arg0 : i32 -> vector<4xf32>
    return
  }
}

// -----
// -----
// -----
// -----
// -----
// -----
module {
  func.func @length(%arg0: f32) {
    %0 = spirv.GL.Length %arg0 : f32 -> f32
    return
  }
  func.func @lengthvec(%arg0: vector<3xf32>) {
    %0 = spirv.GL.Length %arg0 : vector<3xf32> -> f32
    return
  }
}

// -----
// -----
// -----
// -----
// -----
// -----
