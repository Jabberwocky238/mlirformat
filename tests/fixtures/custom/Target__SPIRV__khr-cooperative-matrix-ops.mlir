module {
  spirv.module Logical Vulkan requires #spirv.vce<v1.5, [Shader, Int8, Int16, Int64, Linkage, CooperativeMatrixKHR, VulkanMemoryModel], [SPV_KHR_storage_buffer_storage_class, SPV_KHR_cooperative_matrix]> {
    spirv.func @cooperative_matrix_length() "None" {
      %0 = spirv.KHR.CooperativeMatrixLength : !spirv.coopmatrix<2x2xi32, Subgroup, MatrixB>
      spirv.Return
    }
    spirv.func @cooperative_matrix_load_1(%arg0: !spirv.ptr<i32, StorageBuffer>, %arg1: i32) "None" {
      %0 = spirv.KHR.CooperativeMatrixLoad %arg0, %arg1, <RowMajor> : !spirv.ptr<i32, StorageBuffer>, i32 -> !spirv.coopmatrix<16x8xi32, Workgroup, MatrixA>
      spirv.Return
    }
    spirv.func @cooperative_matrix_load_2(%arg0: !spirv.ptr<f32, StorageBuffer>, %arg1: i64) "None" {
      %0 = spirv.KHR.CooperativeMatrixLoad %arg0, %arg1, <ColumnMajor>, <Volatile> : !spirv.ptr<f32, StorageBuffer>, i64 -> !spirv.coopmatrix<8x16xf32, Subgroup, MatrixAcc>
      spirv.Return
    }
    spirv.func @cooperative_matrix_load_3(%arg0: !spirv.ptr<i32, StorageBuffer>, %arg1: i32) "None" {
      %0 = spirv.KHR.CooperativeMatrixLoad %arg0, %arg1, <RowMajor>, <Aligned>, 16 : !spirv.ptr<i32, StorageBuffer>, i32 -> !spirv.coopmatrix<16x8xi32, Workgroup, MatrixA>
      spirv.Return
    }
    spirv.func @cooperative_matrix_store_1(%arg0: !spirv.ptr<i32, StorageBuffer>, %arg1: i32, %arg2: !spirv.coopmatrix<16x8xi32, Workgroup, MatrixA>) "None" {
      spirv.KHR.CooperativeMatrixStore %arg0, %arg2, %arg1, <RowMajor> : !spirv.ptr<i32, StorageBuffer>, !spirv.coopmatrix<16x8xi32, Workgroup, MatrixA>, i32
      spirv.KHR.CooperativeMatrixStore %arg0, %arg2, %arg1, <RowMajor>, <Aligned>, 16 : !spirv.ptr<i32, StorageBuffer>, !spirv.coopmatrix<16x8xi32, Workgroup, MatrixA>, i32
      spirv.KHR.CooperativeMatrixStore %arg0, %arg2, %arg1, <RowMajor>, <Volatile|Nontemporal> : !spirv.ptr<i32, StorageBuffer>, !spirv.coopmatrix<16x8xi32, Workgroup, MatrixA>, i32
      spirv.Return
    }
    spirv.func @cooperative_matrix_store_2(%arg0: !spirv.ptr<f32, Workgroup>, %arg1: i64, %arg2: !spirv.coopmatrix<4x8xf32, Subgroup, MatrixB>) "None" {
      spirv.KHR.CooperativeMatrixStore %arg0, %arg2, %arg1, <ColumnMajor>, <Nontemporal> : !spirv.ptr<f32, Workgroup>, !spirv.coopmatrix<4x8xf32, Subgroup, MatrixB>, i64
      spirv.Return
    }
    spirv.func @cooperative_matrix_muladd_1(%arg0: !spirv.coopmatrix<8x16xi8, Subgroup, MatrixA>, %arg1: !spirv.coopmatrix<16x8xi16, Subgroup, MatrixB>, %arg2: !spirv.coopmatrix<8x8xi32, Subgroup, MatrixAcc>) "None" {
      %0 = spirv.KHR.CooperativeMatrixMulAdd %arg0, %arg1, %arg2 : !spirv.coopmatrix<8x16xi8, Subgroup, MatrixA>, !spirv.coopmatrix<16x8xi16, Subgroup, MatrixB> -> !spirv.coopmatrix<8x8xi32, Subgroup, MatrixAcc>
      %1 = spirv.KHR.CooperativeMatrixMulAdd %arg0, %arg1, %arg2, <ASigned> : !spirv.coopmatrix<8x16xi8, Subgroup, MatrixA>, !spirv.coopmatrix<16x8xi16, Subgroup, MatrixB> -> !spirv.coopmatrix<8x8xi32, Subgroup, MatrixAcc>
      %2 = spirv.KHR.CooperativeMatrixMulAdd %arg0, %arg1, %arg2, <BSigned> : !spirv.coopmatrix<8x16xi8, Subgroup, MatrixA>, !spirv.coopmatrix<16x8xi16, Subgroup, MatrixB> -> !spirv.coopmatrix<8x8xi32, Subgroup, MatrixAcc>
      %3 = spirv.KHR.CooperativeMatrixMulAdd %arg0, %arg1, %arg2, <ASigned|BSigned|ResultSigned|AccSat> : !spirv.coopmatrix<8x16xi8, Subgroup, MatrixA>, !spirv.coopmatrix<16x8xi16, Subgroup, MatrixB> -> !spirv.coopmatrix<8x8xi32, Subgroup, MatrixAcc>
      spirv.Return
    }
    spirv.func @cooperative_matrix_muladd_2(%arg0: !spirv.coopmatrix<8x8xf32, Workgroup, MatrixA>, %arg1: !spirv.coopmatrix<8x8xf32, Workgroup, MatrixB>, %arg2: !spirv.coopmatrix<8x8xf32, Workgroup, MatrixAcc>) "None" {
      %0 = spirv.KHR.CooperativeMatrixMulAdd %arg0, %arg1, %arg2 : !spirv.coopmatrix<8x8xf32, Workgroup, MatrixA>, !spirv.coopmatrix<8x8xf32, Workgroup, MatrixB> -> !spirv.coopmatrix<8x8xf32, Workgroup, MatrixAcc>
      spirv.Return
    }
  }
}

