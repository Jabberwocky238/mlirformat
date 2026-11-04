module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage], [SPV_KHR_storage_buffer_storage_class]> {
    spirv.func @foo() "None" {
      %0 = spirv.Undef : f32
      %1 = spirv.Undef : f32
      %2 = spirv.FAdd %0, %1 : f32
      %3 = spirv.Undef : vector<4xi32>
      %4 = spirv.CompositeExtract %3[1 : i32] : vector<4xi32>
      %5 = spirv.Undef : !spirv.array<4 x !spirv.array<4 x i32>>
      %6 = spirv.CompositeExtract %5[1 : i32, 2 : i32] : !spirv.array<4 x !spirv.array<4 x i32>>
      %7 = spirv.Undef : !spirv.ptr<!spirv.struct<(f32), Block>, StorageBuffer>
      %cst0_i32 = spirv.Constant 0 : i32
      %8 = spirv.AccessChain %7[%cst0_i32] : !spirv.ptr<!spirv.struct<(f32), Block>, StorageBuffer>, i32 -> !spirv.ptr<f32, StorageBuffer>
      spirv.Return
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage], []> {
    spirv.func @ignore_unused_undef() "None" {
      %0 = spirv.Undef : f32
      spirv.Return
    }
  }
}

