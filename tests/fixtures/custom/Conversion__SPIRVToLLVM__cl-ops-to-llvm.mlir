module {
  spirv.func @cl_unary_float(%arg0: f32, %arg1: vector<3xf32>) "None" {
    %0 = spirv.CL.ceil %arg0 : f32
    %1 = spirv.CL.cos %arg0 : f32
    %2 = spirv.CL.exp %arg0 : f32
    %3 = spirv.CL.exp2 %arg0 : f32
    %4 = spirv.CL.exp10 %arg0 : f32
    %5 = spirv.CL.fabs %arg0 : f32
    %6 = spirv.CL.floor %arg0 : f32
    %7 = spirv.CL.log %arg0 : f32
    %8 = spirv.CL.log2 %arg0 : f32
    %9 = spirv.CL.log10 %arg0 : f32
    %10 = spirv.CL.rint %arg0 : f32
    %11 = spirv.CL.round %arg0 : f32
    %12 = spirv.CL.sin %arg0 : f32
    %13 = spirv.CL.sinh %arg0 : f32
    %14 = spirv.CL.cosh %arg0 : f32
    %15 = spirv.CL.tan %arg0 : f32
    %16 = spirv.CL.tanh %arg0 : f32
    %17 = spirv.CL.asin %arg0 : f32
    %18 = spirv.CL.acos %arg0 : f32
    %19 = spirv.CL.atan %arg0 : f32
    %20 = spirv.CL.sqrt %arg0 : f32
    %21 = spirv.CL.trunc %arg0 : f32
    %22 = spirv.CL.sin %arg1 : vector<3xf32>
    spirv.Return
  }
  spirv.func @cl_binary_float(%arg0: f32, %arg1: f32) "None" {
    %0 = spirv.CL.pow %arg0, %arg1 : f32
    %1 = spirv.CL.atan2 %arg0, %arg1 : f32
    %2 = spirv.CL.fmax %arg0, %arg1 : f32
    %3 = spirv.CL.fmin %arg0, %arg1 : f32
    %4 = spirv.CL.copysign %arg0, %arg1 : f32
    %5 = spirv.CL.fmod %arg0, %arg1 : f32
    spirv.Return
  }
  spirv.func @cl_fma(%arg0: f32, %arg1: f32, %arg2: f32) "None" {
    %0 = spirv.CL.fma %arg0, %arg1, %arg2 : f32
    spirv.Return
  }
  spirv.func @cl_integer(%arg0: i32, %arg1: i32) "None" {
    %0 = spirv.CL.s_max %arg0, %arg1 : i32
    %1 = spirv.CL.s_min %arg0, %arg1 : i32
    %2 = spirv.CL.u_max %arg0, %arg1 : i32
    %3 = spirv.CL.u_min %arg0, %arg1 : i32
    spirv.Return
  }
  spirv.func @mix_scalar(%arg0: f32, %arg1: f32, %arg2: f32) "None" {
    %0 = spirv.CL.mix %arg0, %arg1, %arg2 : f32
    spirv.Return
  }
  spirv.func @mix_vector(%arg0: vector<4xf32>, %arg1: vector<4xf32>, %arg2: vector<4xf32>) "None" {
    %0 = spirv.CL.mix %arg0, %arg1, %arg2 : vector<4xf32>
    spirv.Return
  }
}

