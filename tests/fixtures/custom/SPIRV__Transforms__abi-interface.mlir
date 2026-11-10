module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} {
  spirv.module Logical GLSL450 {
    spirv.func @kernel(%arg0: f32 {spirv.interface_var_abi = #spirv.interface_var_abi<(0, 0), StorageBuffer>}, %arg1: !spirv.ptr<!spirv.struct<(!spirv.array<12 x f32>)>, StorageBuffer> {spirv.interface_var_abi = #spirv.interface_var_abi<(0, 1)>}) "None" attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [32, 1, 1], subgroup_size = 64>} {
      spirv.Return
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.4, [Shader], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} {
    spirv.func @kernel(%arg0: f32 {spirv.interface_var_abi = #spirv.interface_var_abi<(0, 0), StorageBuffer>}, %arg1: !spirv.ptr<!spirv.struct<(!spirv.array<12 x f32>)>, StorageBuffer> {spirv.interface_var_abi = #spirv.interface_var_abi<(0, 1)>}) "None" attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [32, 1, 1], subgroup_size = 64>} {
      spirv.Return
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.6, [Shader, Sampled1D], []>, #spirv.resource_limits<>>} {
    spirv.func @read_image(%arg0: !spirv.ptr<!spirv.sampled_image<!spirv.image<f32, Dim1D, DepthUnknown, NonArrayed, SingleSampled, NeedSampler, R32f>>, UniformConstant> {spirv.interface_var_abi = #spirv.interface_var_abi<(0, 0)>}, %arg1: !spirv.ptr<!spirv.struct<(!spirv.array<1 x f32, stride=4> [0])>, StorageBuffer> {spirv.interface_var_abi = #spirv.interface_var_abi<(0, 1)>}) "None" attributes {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [1, 1, 1]>} {
      %cst0_i32 = spirv.Constant 0 : i32
      %0 = spirv.Load "UniformConstant" %arg0 : !spirv.sampled_image<!spirv.image<f32, Dim1D, DepthUnknown, NonArrayed, SingleSampled, NeedSampler, R32f>>
      %1 = spirv.Image %0 : !spirv.sampled_image<!spirv.image<f32, Dim1D, DepthUnknown, NonArrayed, SingleSampled, NeedSampler, R32f>>
      %2 = spirv.ImageFetch %1, %cst0_i32  : !spirv.image<f32, Dim1D, DepthUnknown, NonArrayed, SingleSampled, NeedSampler, R32f>, i32 -> vector<4xf32>
      %3 = spirv.CompositeExtract %2[0 : i32] : vector<4xf32>
      %cst0_i32_0 = spirv.Constant 0 : i32
      %cst0_i32_1 = spirv.Constant 0 : i32
      %cst1_i32 = spirv.Constant 1 : i32
      %4 = spirv.AccessChain %arg1[%cst0_i32_0, %cst0_i32] : !spirv.ptr<!spirv.struct<(!spirv.array<1 x f32, stride=4> [0])>, StorageBuffer>, i32, i32 -> !spirv.ptr<f32, StorageBuffer>
      spirv.Store "StorageBuffer" %4, %3 : f32
      spirv.Return
    }
  }
}

