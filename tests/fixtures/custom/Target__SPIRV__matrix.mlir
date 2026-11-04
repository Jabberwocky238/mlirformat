module {
  spirv.module Physical64 Vulkan requires #spirv.vce<v1.3, [Shader, Linkage, CooperativeMatrixKHR, VulkanMemoryModel, Float16, Addresses], [SPV_KHR_cooperative_matrix, SPV_KHR_vulkan_memory_model]> {
    spirv.func @matrix_access_chain(%arg0: !spirv.ptr<!spirv.matrix<3 x vector<3xf32>>, Function>, %arg1: i32) -> !spirv.ptr<vector<3xf32>, Function> "None" {
      %0 = spirv.AccessChain %arg0[%arg1] : !spirv.ptr<!spirv.matrix<3 x vector<3xf32>>, Function>, i32 -> !spirv.ptr<vector<3xf32>, Function>
      spirv.ReturnValue %0 : !spirv.ptr<vector<3xf32>, Function>
    }
    spirv.func @matrix_times_scalar_1(%arg0: !spirv.matrix<3 x vector<3xf32>>, %arg1: f32) -> !spirv.matrix<3 x vector<3xf32>> "None" {
      %0 = spirv.MatrixTimesScalar %arg0, %arg1 : !spirv.matrix<3 x vector<3xf32>>, f32
      spirv.ReturnValue %0 : !spirv.matrix<3 x vector<3xf32>>
    }
    spirv.func @matrix_times_scalar_2(%arg0: !spirv.matrix<3 x vector<3xf16>>, %arg1: f16) -> !spirv.matrix<3 x vector<3xf16>> "None" {
      %0 = spirv.MatrixTimesScalar %arg0, %arg1 : !spirv.matrix<3 x vector<3xf16>>, f16
      spirv.ReturnValue %0 : !spirv.matrix<3 x vector<3xf16>>
    }
    spirv.func @matrix_times_scalar_3(%arg0: !spirv.coopmatrix<16x16xf16, Subgroup, MatrixAcc>, %arg1: f16) -> !spirv.coopmatrix<16x16xf16, Subgroup, MatrixAcc> "None" {
      %0 = spirv.MatrixTimesScalar %arg0, %arg1 : !spirv.coopmatrix<16x16xf16, Subgroup, MatrixAcc>, f16
      spirv.ReturnValue %0 : !spirv.coopmatrix<16x16xf16, Subgroup, MatrixAcc>
    }
    spirv.func @matrix_transpose_1(%arg0: !spirv.matrix<3 x vector<2xf32>>) -> !spirv.matrix<2 x vector<3xf32>> "None" {
      %0 = spirv.Transpose %arg0 : !spirv.matrix<3 x vector<2xf32>> -> !spirv.matrix<2 x vector<3xf32>>
      spirv.ReturnValue %0 : !spirv.matrix<2 x vector<3xf32>>
    }
    spirv.func @matrix_times_vector_1(%arg0: !spirv.matrix<3 x vector<4xf32>>, %arg1: vector<3xf32>) -> vector<4xf32> "None" {
      %0 = spirv.MatrixTimesVector %arg0, %arg1 : !spirv.matrix<3 x vector<4xf32>>, vector<3xf32> -> vector<4xf32>
      spirv.ReturnValue %0 : vector<4xf32>
    }
    spirv.func @vector_times_matrix_1(%arg0: vector<3xf32>, %arg1: !spirv.matrix<4 x vector<3xf32>>) -> vector<4xf32> "None" {
      %0 = spirv.VectorTimesMatrix %arg0, %arg1 : vector<3xf32>, !spirv.matrix<4 x vector<3xf32>> -> vector<4xf32>
      spirv.ReturnValue %0 : vector<4xf32>
    }
    spirv.func @matrix_times_matrix_1(%arg0: !spirv.matrix<3 x vector<3xf32>>, %arg1: !spirv.matrix<3 x vector<3xf32>>) -> !spirv.matrix<3 x vector<3xf32>> "None" {
      %0 = spirv.MatrixTimesMatrix %arg0, %arg1 : !spirv.matrix<3 x vector<3xf32>>, !spirv.matrix<3 x vector<3xf32>> -> !spirv.matrix<3 x vector<3xf32>>
      spirv.ReturnValue %0 : !spirv.matrix<3 x vector<3xf32>>
    }
    spirv.func @matrix_times_matrix_2(%arg0: !spirv.matrix<3 x vector<2xf32>>, %arg1: !spirv.matrix<2 x vector<3xf32>>) -> !spirv.matrix<2 x vector<2xf32>> "None" {
      %0 = spirv.MatrixTimesMatrix %arg0, %arg1 : !spirv.matrix<3 x vector<2xf32>>, !spirv.matrix<2 x vector<3xf32>> -> !spirv.matrix<2 x vector<2xf32>>
      spirv.ReturnValue %0 : !spirv.matrix<2 x vector<2xf32>>
    }
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader, Linkage, Float16], [SPV_KHR_storage_buffer_storage_class]> {
    spirv.GlobalVariable @var0 : !spirv.ptr<!spirv.matrix<3 x vector<3xf32>>, StorageBuffer>
    spirv.GlobalVariable @var1 : !spirv.ptr<!spirv.matrix<2 x vector<3xf32>>, StorageBuffer>
    spirv.GlobalVariable @var2 : !spirv.ptr<!spirv.matrix<4 x vector<4xf16>>, StorageBuffer>
  }
}

