module {
  spirv.module Physical64 OpenCL requires #spirv.vce<v1.0, [Kernel, Addresses, Vector16, Linkage], []> {
    spirv.func @float_insts(%arg0: f32) "None" {
      %0 = spirv.CL.exp %arg0 : f32
      %1 = spirv.CL.fabs %arg0 : f32
      %2 = spirv.CL.sin %arg0 : f32
      %3 = spirv.CL.cos %arg0 : f32
      %4 = spirv.CL.log %arg0 : f32
      %5 = spirv.CL.exp2 %arg0 : f32
      %6 = spirv.CL.exp10 %arg0 : f32
      %7 = spirv.CL.log2 %arg0 : f32
      %8 = spirv.CL.log10 %arg0 : f32
      %9 = spirv.CL.sqrt %arg0 : f32
      %10 = spirv.CL.ceil %arg0 : f32
      %11 = spirv.CL.floor %arg0 : f32
      %12 = spirv.CL.pow %arg0, %arg0 : f32
      %13 = spirv.CL.rsqrt %arg0 : f32
      %14 = spirv.CL.erf %arg0 : f32
      %15 = spirv.CL.erfc %arg0 : f32
      %16 = spirv.CL.trunc %arg0 : f32
      %17 = spirv.CL.cbrt %arg0 : f32
      %18 = spirv.CL.copysign %arg0, %arg0 : f32
      %19 = spirv.CL.expm1 %arg0 : f32
      %20 = spirv.CL.fdim %arg0, %arg0 : f32
      %21 = spirv.CL.fmod %arg0, %arg0 : f32
      %22 = spirv.CL.hypot %arg0, %arg0 : f32
      %23 = spirv.CL.log1p %arg0 : f32
      spirv.Return
    }
    spirv.func @integer_insts(%arg0: i32) "None" {
      %0 = spirv.CL.s_abs %arg0 : i32
      %1 = spirv.CL.clz %arg0 : i32
      spirv.Return
    }
    spirv.func @vector_size16(%arg0: vector<16xf32>) "None" {
      %0 = spirv.CL.fabs %arg0 : vector<16xf32>
      spirv.Return
    }
    spirv.func @fma(%arg0: f32, %arg1: f32, %arg2: f32) "None" {
      %0 = spirv.CL.fma %arg0, %arg1, %arg2 : f32
      spirv.Return
    }
    spirv.func @float_int_insts(%arg0: f32, %arg1: i32) "None" {
      %0 = spirv.CL.ldexp %arg0, %arg1 : f32, i32 -> f32
      %1 = spirv.CL.pown %arg0, %arg1 : f32, i32 -> f32
      %2 = spirv.CL.rootn %arg0, %arg1 : f32, i32 -> f32
      spirv.Return
    }
    spirv.func @float_int_vec_insts(%arg0: vector<3xf32>, %arg1: vector<3xi32>) "None" {
      %0 = spirv.CL.ldexp %arg0, %arg1 : vector<3xf32>, vector<3xi32> -> vector<3xf32>
      %1 = spirv.CL.pown %arg0, %arg1 : vector<3xf32>, vector<3xi32> -> vector<3xf32>
      %2 = spirv.CL.rootn %arg0, %arg1 : vector<3xf32>, vector<3xi32> -> vector<3xf32>
      spirv.Return
    }
    spirv.func @maxmin(%arg0: f32, %arg1: f32, %arg2: i32, %arg3: i32) "None" {
      %0 = spirv.CL.fmax %arg0, %arg1 : f32
      %1 = spirv.CL.s_max %arg2, %arg3 : i32
      %2 = spirv.CL.u_max %arg2, %arg3 : i32
      %3 = spirv.CL.fmin %arg0, %arg1 : f32
      %4 = spirv.CL.s_min %arg2, %arg3 : i32
      %5 = spirv.CL.u_min %arg2, %arg3 : i32
      spirv.Return
    }
  }
}

