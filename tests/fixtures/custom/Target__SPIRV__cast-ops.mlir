module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage], []> {
    spirv.func @bit_cast(%arg0: f32) "None" {
      %0 = spirv.Bitcast %arg0 : f32 to i32
      %1 = spirv.Bitcast %0 : i32 to si32
      %2 = spirv.Bitcast %1 : si32 to ui32
      spirv.Return
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage, BFloat16TypeKHR, Float64, Int64], [SPV_KHR_bfloat16]> {
    spirv.func @convert_f_to_s(%arg0: f32) -> i32 "None" {
      %0 = spirv.ConvertFToS %arg0 : f32 to i32
      spirv.ReturnValue %0 : i32
    }
    spirv.func @convert_f64_to_s32(%arg0: f64) -> i32 "None" {
      %0 = spirv.ConvertFToS %arg0 : f64 to i32
      spirv.ReturnValue %0 : i32
    }
    spirv.func @convert_bf16_to_s32(%arg0: bf16) -> i32 "None" {
      %0 = spirv.ConvertFToS %arg0 : bf16 to i32
      spirv.ReturnValue %0 : i32
    }
    spirv.func @convert_f_to_u(%arg0: f32) -> i32 "None" {
      %0 = spirv.ConvertFToU %arg0 : f32 to i32
      spirv.ReturnValue %0 : i32
    }
    spirv.func @convert_f64_to_u32(%arg0: f64) -> i32 "None" {
      %0 = spirv.ConvertFToU %arg0 : f64 to i32
      spirv.ReturnValue %0 : i32
    }
    spirv.func @convert_bf16_to_u32(%arg0: bf16) -> i32 "None" {
      %0 = spirv.ConvertFToU %arg0 : bf16 to i32
      spirv.ReturnValue %0 : i32
    }
    spirv.func @convert_s_to_f(%arg0: i32) -> f32 "None" {
      %0 = spirv.ConvertSToF %arg0 : i32 to f32
      spirv.ReturnValue %0 : f32
    }
    spirv.func @convert_s64_to_f32(%arg0: i64) -> f32 "None" {
      %0 = spirv.ConvertSToF %arg0 : i64 to f32
      spirv.ReturnValue %0 : f32
    }
    spirv.func @convert_s64_to_bf16(%arg0: i64) -> bf16 "None" {
      %0 = spirv.ConvertSToF %arg0 : i64 to bf16
      spirv.ReturnValue %0 : bf16
    }
    spirv.func @convert_u_to_f(%arg0: i32) -> f32 "None" {
      %0 = spirv.ConvertUToF %arg0 : i32 to f32
      spirv.ReturnValue %0 : f32
    }
    spirv.func @convert_u64_to_f32(%arg0: i64) -> f32 "None" {
      %0 = spirv.ConvertUToF %arg0 : i64 to f32
      spirv.ReturnValue %0 : f32
    }
    spirv.func @convert_u64_to_bf16(%arg0: i64) -> bf16 "None" {
      %0 = spirv.ConvertUToF %arg0 : i64 to bf16
      spirv.ReturnValue %0 : bf16
    }
    spirv.func @convert_f32_to_f64(%arg0: f32) -> f64 "None" {
      %0 = spirv.FConvert %arg0 : f32 to f64
      spirv.ReturnValue %0 : f64
    }
    spirv.func @convert_f32_to_bf16(%arg0: f32) -> bf16 "None" {
      %0 = spirv.FConvert %arg0 : f32 to bf16
      spirv.ReturnValue %0 : bf16
    }
    spirv.func @convert_bf16_to_f32(%arg0: bf16) -> f32 "None" {
      %0 = spirv.FConvert %arg0 : bf16 to f32
      spirv.ReturnValue %0 : f32
    }
    spirv.func @s_convert(%arg0: i32) -> i64 "None" {
      %0 = spirv.SConvert %arg0 : i32 to i64
      spirv.ReturnValue %0 : i64
    }
    spirv.func @u_convert(%arg0: i32) -> i64 "None" {
      %0 = spirv.UConvert %arg0 : i32 to i64
      spirv.ReturnValue %0 : i64
    }
  }
}

// -----
module {
  spirv.module Physical64 OpenCL requires #spirv.vce<v1.0, [Kernel, Linkage, GenericPointer], []> {
    spirv.func @ptr_cast_to_generic(%arg0: !spirv.ptr<f32, CrossWorkgroup>) "None" {
      %0 = spirv.PtrCastToGeneric %arg0 : !spirv.ptr<f32, CrossWorkgroup> to !spirv.ptr<f32, Generic>
      spirv.Return
    }
    spirv.func @generic_cast_to_ptr(%arg0: !spirv.ptr<vector<2xi32>, Generic>) "None" {
      %0 = spirv.GenericCastToPtr %arg0 : !spirv.ptr<vector<2xi32>, Generic> to !spirv.ptr<vector<2xi32>, CrossWorkgroup>
      spirv.Return
    }
    spirv.func @generic_cast_to_ptr_explicit(%arg0: !spirv.ptr<vector<2xi32>, Generic>) "None" {
      %0 = spirv.GenericCastToPtrExplicit %arg0 : !spirv.ptr<vector<2xi32>, Generic> to !spirv.ptr<vector<2xi32>, CrossWorkgroup>
      spirv.Return
    }
  }
}

// -----
module {
  spirv.module Physical64 OpenCL requires #spirv.vce<v1.0, [Kernel, Addresses, Linkage, GenericPointer, Int64], []> {
    spirv.func @covert_ptr_to_u(%arg0: !spirv.ptr<i32, Generic>) "None" {
      %0 = spirv.ConvertPtrToU %arg0 : !spirv.ptr<i32, Generic> to i32
      spirv.Return
    }
    spirv.func @covert_ptr_to_u_truncate(%arg0: !spirv.ptr<i64, Generic>) "None" {
      %0 = spirv.ConvertPtrToU %arg0 : !spirv.ptr<i64, Generic> to i32
      spirv.Return
    }
    spirv.func @covert_ptr_to_u_extend(%arg0: !spirv.ptr<i32, Generic>) "None" {
      %0 = spirv.ConvertPtrToU %arg0 : !spirv.ptr<i32, Generic> to i64
      spirv.Return
    }
  }
}

// -----
module {
  spirv.module PhysicalStorageBuffer64 OpenCL requires #spirv.vce<v1.0, [Kernel, Addresses, PhysicalStorageBufferAddresses, Linkage], [SPV_EXT_physical_storage_buffer]> {
    spirv.func @covert_ptr_to_u_PhysicalStorageBuffer(%arg0: !spirv.ptr<i32, PhysicalStorageBuffer> {spirv.decoration = #spirv.decoration<Aliased>}) "None" {
      %0 = spirv.ConvertPtrToU %arg0 : !spirv.ptr<i32, PhysicalStorageBuffer> to i32
      spirv.Return
    }
  }
}

// -----
module {
  spirv.module Physical64 OpenCL requires #spirv.vce<v1.0, [Kernel, Addresses, Linkage, GenericPointer, Int64], []> {
    spirv.func @covert_u_to_ptr(%arg0: i32) "None" {
      %0 = spirv.ConvertUToPtr %arg0 : i32 to !spirv.ptr<i32, Generic>
      spirv.Return
    }
    spirv.func @covert_u_to_ptr_truncate(%arg0: i64) "None" {
      %0 = spirv.ConvertUToPtr %arg0 : i64 to !spirv.ptr<i32, Generic>
      spirv.Return
    }
    spirv.func @covert_u_to_ptr_extend(%arg0: i32) "None" {
      %0 = spirv.ConvertUToPtr %arg0 : i32 to !spirv.ptr<i64, Generic>
      spirv.Return
    }
  }
}

// -----
module {
  spirv.module PhysicalStorageBuffer64 OpenCL requires #spirv.vce<v1.0, [Kernel, Addresses, PhysicalStorageBufferAddresses, Linkage], [SPV_EXT_physical_storage_buffer]> {
    spirv.func @covert_u_to_ptr_PhysicalStorageBuffer(%arg0: i32) "None" {
      %0 = spirv.ConvertUToPtr %arg0 : i32 to !spirv.ptr<i32, PhysicalStorageBuffer>
      spirv.Return
    }
  }
}

