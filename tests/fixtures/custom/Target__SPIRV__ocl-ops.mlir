module {
  spirv.module Physical64 OpenCL requires #spirv.vce<v1.0, [Kernel, Addresses, Vector16, Linkage], []> {
    spirv.func @float_insts(%arg0: f32) "None" {
      %0 = spirv.CL.exp %arg0 : f32
      %1 = spirv.CL.fabs %arg0 : f32
      %2 = spirv.CL.sin %arg0 : f32
      %3 = spirv.CL.cos %arg0 : f32
      %4 = spirv.CL.log %arg0 : f32
      %5 = spirv.CL.sqrt %arg0 : f32
      %6 = spirv.CL.ceil %arg0 : f32
      %7 = spirv.CL.floor %arg0 : f32
      %8 = spirv.CL.pow %arg0, %arg0 : f32
      %9 = spirv.CL.rsqrt %arg0 : f32
      %10 = spirv.CL.erf %arg0 : f32
      spirv.Return
    }
    spirv.func @integer_insts(%arg0: i32) "None" {
      %0 = spirv.CL.s_abs %arg0 : i32
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

