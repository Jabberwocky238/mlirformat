module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage], []> {
    spirv.func @math(%arg0: f32, %arg1: f32, %arg2: i32) "None" {
      %0 = spirv.GL.Exp %arg0 : f32
      %1 = spirv.GL.Sqrt %arg0 : f32
      %2 = spirv.GL.Cos %arg0 : f32
      %3 = spirv.GL.Sin %arg0 : f32
      %4 = spirv.GL.Tan %arg0 : f32
      %5 = spirv.GL.Acos %arg0 : f32
      %6 = spirv.GL.Asin %arg0 : f32
      %7 = spirv.GL.Atan %arg0 : f32
      %8 = spirv.GL.Atan2 %arg0, %arg1 : f32
      %9 = spirv.GL.Sinh %arg0 : f32
      %10 = spirv.GL.Cosh %arg0 : f32
      %11 = spirv.GL.Pow %arg0, %arg1 : f32
      %12 = spirv.GL.Round %arg0 : f32
      %13 = spirv.GL.Trunc %arg0 : f32
      %14 = spirv.GL.FrexpStruct %arg0 : f32 -> !spirv.struct<(f32, i32)>
      %15 = spirv.GL.Ldexp %arg0 : f32, %arg2 : i32 -> f32
      %16 = spirv.GL.FMix %arg0 : f32, %arg1 : f32, %arg0 : f32 -> f32
      %17 = spirv.GL.Fract %arg0 : f32
      %18 = spirv.GL.Asinh %arg0 : f32
      %19 = spirv.GL.Acosh %arg0 : f32
      %20 = spirv.GL.Atanh %arg0 : f32
      %21 = spirv.GL.Log2 %arg0 : f32
      %22 = spirv.GL.Tanh %arg0 : f32
      %23 = spirv.GL.Exp2 %arg0 : f32
      %24 = spirv.GL.Radians %arg0 : f32
      %25 = spirv.GL.Degrees %arg0 : f32
      spirv.Return
    }
    spirv.func @maxmin(%arg0: f32, %arg1: f32, %arg2: i32, %arg3: i32) "None" {
      %0 = spirv.GL.FMax %arg0, %arg1 : f32
      %1 = spirv.GL.SMax %arg2, %arg3 : i32
      %2 = spirv.GL.UMax %arg2, %arg3 : i32
      %3 = spirv.GL.FMin %arg0, %arg1 : f32
      %4 = spirv.GL.SMin %arg2, %arg3 : i32
      %5 = spirv.GL.UMin %arg2, %arg3 : i32
      %6 = spirv.GL.NMax %arg0, %arg1 : f32
      %7 = spirv.GL.NMin %arg0, %arg1 : f32
      spirv.Return
    }
    spirv.func @fclamp(%arg0: f32, %arg1: f32, %arg2: f32) "None" {
      %0 = spirv.GL.FClamp %arg0, %arg1, %arg2 : f32
      spirv.Return
    }
    spirv.func @nclamp(%arg0: f32, %arg1: f32, %arg2: f32) "None" {
      %0 = spirv.GL.NClamp %arg0, %arg1, %arg2 : f32
      spirv.Return
    }
    spirv.func @uclamp(%arg0: ui32, %arg1: ui32, %arg2: ui32) "None" {
      %0 = spirv.GL.UClamp %arg0, %arg1, %arg2 : ui32
      spirv.Return
    }
    spirv.func @sclamp(%arg0: si32, %arg1: si32, %arg2: si32) "None" {
      %0 = spirv.GL.SClamp %arg0, %arg1, %arg2 : si32
      spirv.Return
    }
    spirv.func @fma(%arg0: f32, %arg1: f32, %arg2: f32) "None" {
      %0 = spirv.GL.Fma %arg0, %arg1, %arg2 : f32
      spirv.Return
    }
    spirv.func @findilsb(%arg0: i32) "None" {
      %0 = spirv.GL.FindILsb %arg0 : i32
      spirv.Return
    }
    spirv.func @findsmsb(%arg0: i32) "None" {
      %0 = spirv.GL.FindSMsb %arg0 : i32
      spirv.Return
    }
    spirv.func @findumsb(%arg0: i32) "None" {
      %0 = spirv.GL.FindUMsb %arg0 : i32
      spirv.Return
    }
    spirv.func @vector(%arg0: f32, %arg1: vector<3xf32>, %arg2: vector<3xf32>, %arg3: vector<3xi32>) "None" {
      %0 = spirv.GL.Cross %arg1, %arg2 : vector<3xf32>
      %1 = spirv.GL.Normalize %arg0 : f32
      %2 = spirv.GL.Normalize %arg1 : vector<3xf32>
      %3 = spirv.GL.Reflect %arg0, %arg0 : f32
      %4 = spirv.GL.Reflect %arg1, %arg2 : vector<3xf32>
      %5 = spirv.GL.Distance %arg0, %arg0 : f32, f32 -> f32
      %6 = spirv.GL.Distance %arg1, %arg2 : vector<3xf32>, vector<3xf32> -> f32
      %7 = spirv.GL.FindILsb %arg3 : vector<3xi32>
      %8 = spirv.GL.FindSMsb %arg3 : vector<3xi32>
      %9 = spirv.GL.FindUMsb %arg3 : vector<3xi32>
      %10 = spirv.GL.Length %arg0 : f32 -> f32
      %11 = spirv.GL.Length %arg1 : vector<3xf32> -> f32
      spirv.Return
    }
    spirv.func @pack_half_2x16(%arg0: i32) "None" {
      %0 = spirv.GL.UnpackHalf2x16 %arg0 : i32 -> vector<2xf32>
      %1 = spirv.GL.PackHalf2x16 %0 : vector<2xf32> -> i32
      spirv.Return
    }
    spirv.func @pack_snorm_4x8(%arg0: i32) "None" {
      %0 = spirv.GL.UnpackSnorm4x8 %arg0 : i32 -> vector<4xf32>
      %1 = spirv.GL.PackSnorm4x8 %0 : vector<4xf32> -> i32
      spirv.Return
    }
    spirv.func @step(%arg0: f32, %arg1: f32) "None" {
      %0 = spirv.GL.Step %arg0, %arg1 : f32
      spirv.Return
    }
    spirv.func @smoothstep(%arg0: f32, %arg1: f32, %arg2: f32) "None" {
      %0 = spirv.GL.SmoothStep %arg0, %arg1, %arg2 : f32
      spirv.Return
    }
  }
}

