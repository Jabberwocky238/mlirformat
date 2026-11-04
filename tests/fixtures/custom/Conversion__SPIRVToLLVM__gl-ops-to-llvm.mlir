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
  spirv.func @inverse_sqrt(%arg0: f32) "None" {
    %0 = spirv.GL.InverseSqrt %arg0 : f32
    spirv.Return
  }
}

