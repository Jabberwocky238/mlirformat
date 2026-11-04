module {
  func.func @cast1(%arg0: f32) {
    %0 = spirv.Bitcast %arg0 : f32 to i32
    return
  }
  func.func @cast2(%arg0: vector<2xf32>) {
    %0 = spirv.Bitcast %arg0 : vector<2xf32> to vector<2xi32>
    return
  }
  func.func @cast3(%arg0: vector<2xf32>) {
    %0 = spirv.Bitcast %arg0 : vector<2xf32> to i64
    return
  }
  func.func @cast4(%arg0: !spirv.ptr<f32, Function>) {
    %0 = spirv.Bitcast %arg0 : !spirv.ptr<f32, Function> to !spirv.ptr<i32, Function>
    return
  }
  func.func @cast5(%arg0: !spirv.ptr<f32, Function>) {
    %0 = spirv.Bitcast %arg0 : !spirv.ptr<f32, Function> to !spirv.ptr<vector<2xi32>, Function>
    return
  }
  func.func @cast6(%arg0: vector<4xf32>) {
    %0 = spirv.Bitcast %arg0 : vector<4xf32> to vector<2xi64>
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
  func.func @convert_f_to_s_scalar(%arg0: f32) -> i32 {
    %0 = spirv.ConvertFToS %arg0 : f32 to i32
    spirv.ReturnValue %0 : i32
  }
}

// -----
module {
  func.func @convert_f64_to_s32_scalar(%arg0: f64) -> i32 {
    %0 = spirv.ConvertFToS %arg0 : f64 to i32
    spirv.ReturnValue %0 : i32
  }
}

// -----
module {
  func.func @convert_f_to_s_vector(%arg0: vector<3xf32>) -> vector<3xi32> {
    %0 = spirv.ConvertFToS %arg0 : vector<3xf32> to vector<3xi32>
    spirv.ReturnValue %0 : vector<3xi32>
  }
}

// -----
module {
  func.func @convert_bf16_to_s32_scalar(%arg0: bf16) -> i32 {
    %0 = spirv.ConvertFToS %arg0 : bf16 to i32
    spirv.ReturnValue %0 : i32
  }
}

// -----
module {
  func.func @convert_f_to_u_scalar(%arg0: f32) -> i32 {
    %0 = spirv.ConvertFToU %arg0 : f32 to i32
    spirv.ReturnValue %0 : i32
  }
}

// -----
module {
  func.func @convert_f64_to_u32_scalar(%arg0: f64) -> i32 {
    %0 = spirv.ConvertFToU %arg0 : f64 to i32
    spirv.ReturnValue %0 : i32
  }
}

// -----
module {
  func.func @convert_f_to_u_vector(%arg0: vector<3xf32>) -> vector<3xi32> {
    %0 = spirv.ConvertFToU %arg0 : vector<3xf32> to vector<3xi32>
    spirv.ReturnValue %0 : vector<3xi32>
  }
}

// -----
module {
  func.func @convert_f_to_u.coopmatrix(%arg0: !spirv.coopmatrix<8x16xf32, Subgroup, MatrixB>) {
    %0 = spirv.ConvertFToU %arg0 : !spirv.coopmatrix<8x16xf32, Subgroup, MatrixB> to !spirv.coopmatrix<8x16xi32, Subgroup, MatrixB>
    spirv.Return
  }
}

// -----
module {
  func.func @convert_bf16_to_u32_scalar(%arg0: bf16) -> i32 {
    %0 = spirv.ConvertFToU %arg0 : bf16 to i32
    spirv.ReturnValue %0 : i32
  }
}

// -----
module {
  func.func @convert_s_to_f_scalar(%arg0: i32) -> f32 {
    %0 = spirv.ConvertSToF %arg0 : i32 to f32
    spirv.ReturnValue %0 : f32
  }
}

// -----
module {
  func.func @convert_s64_to_f32_scalar(%arg0: i64) -> f32 {
    %0 = spirv.ConvertSToF %arg0 : i64 to f32
    spirv.ReturnValue %0 : f32
  }
}

// -----
module {
  func.func @convert_s_to_f_vector(%arg0: vector<3xi32>) -> vector<3xf32> {
    %0 = spirv.ConvertSToF %arg0 : vector<3xi32> to vector<3xf32>
    spirv.ReturnValue %0 : vector<3xf32>
  }
}

// -----
module {
  func.func @convert_s32_to_bf16_scalar(%arg0: i32) -> bf16 {
    %0 = spirv.ConvertSToF %arg0 : i32 to bf16
    spirv.ReturnValue %0 : bf16
  }
}

// -----
module {
  func.func @convert_u_to_f_scalar(%arg0: i32) -> f32 {
    %0 = spirv.ConvertUToF %arg0 : i32 to f32
    spirv.ReturnValue %0 : f32
  }
}

// -----
module {
  func.func @convert_u64_to_f32_scalar(%arg0: i64) -> f32 {
    %0 = spirv.ConvertUToF %arg0 : i64 to f32
    spirv.ReturnValue %0 : f32
  }
}

// -----
module {
  func.func @convert_u_to_f_vector(%arg0: vector<3xi32>) -> vector<3xf32> {
    %0 = spirv.ConvertUToF %arg0 : vector<3xi32> to vector<3xf32>
    spirv.ReturnValue %0 : vector<3xf32>
  }
}

// -----
module {
  func.func @convert_u32_to_bf16_scalar(%arg0: i32) -> bf16 {
    %0 = spirv.ConvertUToF %arg0 : i32 to bf16
    spirv.ReturnValue %0 : bf16
  }
}

// -----
module {
  func.func @f_convert_scalar(%arg0: f32) -> f64 {
    %0 = spirv.FConvert %arg0 : f32 to f64
    spirv.ReturnValue %0 : f64
  }
}

// -----
module {
  func.func @f_convert_vector(%arg0: vector<3xf32>) -> vector<3xf64> {
    %0 = spirv.FConvert %arg0 : vector<3xf32> to vector<3xf64>
    spirv.ReturnValue %0 : vector<3xf64>
  }
}

// -----
module {
  func.func @f_convert_coop_matrix(%arg0: !spirv.coopmatrix<8x16xf32, Subgroup, MatrixA>) {
    %0 = spirv.FConvert %arg0 : !spirv.coopmatrix<8x16xf32, Subgroup, MatrixA> to !spirv.coopmatrix<8x16xf64, Subgroup, MatrixA>
    spirv.Return
  }
}

// -----
// -----
module {
  func.func @f_convert_bf16_to_f32_scalar(%arg0: bf16) -> f32 {
    %0 = spirv.FConvert %arg0 : bf16 to f32
    spirv.ReturnValue %0 : f32
  }
}

// -----
module {
  func.func @f_convert_f32_to_bf16_vector(%arg0: vector<3xf32>) -> vector<3xbf16> {
    %0 = spirv.FConvert %arg0 : vector<3xf32> to vector<3xbf16>
    spirv.ReturnValue %0 : vector<3xbf16>
  }
}

// -----
module {
  func.func @f_convert_f32_to_bf16_coop_matrix(%arg0: !spirv.coopmatrix<8x16xf32, Subgroup, MatrixA>) -> !spirv.coopmatrix<8x16xbf16, Subgroup, MatrixA> {
    %0 = spirv.FConvert %arg0 : !spirv.coopmatrix<8x16xf32, Subgroup, MatrixA> to !spirv.coopmatrix<8x16xbf16, Subgroup, MatrixA>
    spirv.ReturnValue %0 : !spirv.coopmatrix<8x16xbf16, Subgroup, MatrixA>
  }
}

// -----
module {
  func.func @s_convert_scalar(%arg0: i32) -> i64 {
    %0 = spirv.SConvert %arg0 : i32 to i64
    spirv.ReturnValue %0 : i64
  }
}

// -----
module {
  func.func @u_convert_scalar(%arg0: i32) -> i64 {
    %0 = spirv.UConvert %arg0 : i32 to i64
    spirv.ReturnValue %0 : i64
  }
}

// -----
module {
  func.func @ptrcasttogeneric1(%arg0: !spirv.ptr<f32, CrossWorkgroup>) {
    %0 = spirv.PtrCastToGeneric %arg0 : !spirv.ptr<f32, CrossWorkgroup> to !spirv.ptr<f32, Generic>
    return
  }
}

// -----
// -----
// -----
// -----
module {
  func.func @genericcasttoptr1(%arg0: !spirv.ptr<vector<2xi32>, Generic>) {
    %0 = spirv.GenericCastToPtr %arg0 : !spirv.ptr<vector<2xi32>, Generic> to !spirv.ptr<vector<2xi32>, CrossWorkgroup>
    return
  }
}

// -----
// -----
// -----
// -----
module {
  func.func @genericcasttoptrexplicit1(%arg0: !spirv.ptr<vector<2xi32>, Generic>) {
    %0 = spirv.GenericCastToPtrExplicit %arg0 : !spirv.ptr<vector<2xi32>, Generic> to !spirv.ptr<vector<2xi32>, CrossWorkgroup>
    return
  }
}

// -----
// -----
// -----
// -----
module {
  spirv.module Physical64 OpenCL requires #spirv.vce<v1.0, [Kernel, Addresses], []> {
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
  spirv.module PhysicalStorageBuffer64 OpenCL requires #spirv.vce<v1.0, [Kernel, Addresses, PhysicalStorageBufferAddresses], []> {
    spirv.func @covert_ptr_to_u_PhysicalStorageBuffer(%arg0: !spirv.ptr<i32, PhysicalStorageBuffer> {spirv.decoration = #spirv.decoration<Aliased>}) "None" {
      %0 = spirv.ConvertPtrToU %arg0 : !spirv.ptr<i32, PhysicalStorageBuffer> to i32
      spirv.Return
    }
  }
}

// -----
// -----
// -----
module {
  spirv.module Physical64 OpenCL requires #spirv.vce<v1.0, [Kernel, Addresses], []> {
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
  spirv.module PhysicalStorageBuffer64 OpenCL requires #spirv.vce<v1.0, [Kernel, Addresses, PhysicalStorageBufferAddresses], []> {
    spirv.func @covert_u_to_ptr_PhysicalStorageBuffer(%arg0: i32) "None" {
      %0 = spirv.ConvertUToPtr %arg0 : i32 to !spirv.ptr<i32, PhysicalStorageBuffer>
      spirv.Return
    }
  }
}

// -----
// -----
