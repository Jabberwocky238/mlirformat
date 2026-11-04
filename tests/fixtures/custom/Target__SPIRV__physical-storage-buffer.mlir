module {
  spirv.module PhysicalStorageBuffer64 GLSL450 requires #spirv.vce<v1.5, [Shader, Int64, PhysicalStorageBufferAddresses], [SPV_KHR_physical_storage_buffer]> {
    spirv.GlobalVariable @set_0 bind(3, 0) : !spirv.ptr<!spirv.struct<set_0_t, (!spirv.ptr<!spirv.struct<binding_f32_t, (!spirv.rtarray<f32, stride=4> [0])>, PhysicalStorageBuffer> [0], !spirv.ptr<!spirv.struct<binding_f32_t, (!spirv.rtarray<f32, stride=4> [0])>, PhysicalStorageBuffer> [8], !spirv.ptr<!spirv.struct<binding_f32_t, (!spirv.rtarray<f32, stride=4> [0])>, PhysicalStorageBuffer> [16])>, StorageBuffer>
    spirv.GlobalVariable @set_1 bind(3, 1) : !spirv.ptr<!spirv.struct<set_1_t, (!spirv.ptr<!spirv.struct<binding_f32_t, (!spirv.rtarray<f32, stride=4> [0])>, PhysicalStorageBuffer> [0], !spirv.ptr<!spirv.struct<binding_f32_t, (!spirv.rtarray<f32, stride=4> [0])>, PhysicalStorageBuffer> [8])>, StorageBuffer>
    spirv.func @main() "None" {
      %cst0_i64 = spirv.Constant 0 : i64
      %cst1_i64 = spirv.Constant 1 : i64
      %cst2_i64 = spirv.Constant 2 : i64
      %set_0_addr = spirv.mlir.addressof @set_0 : !spirv.ptr<!spirv.struct<set_0_t, (!spirv.ptr<!spirv.struct<binding_f32_t, (!spirv.rtarray<f32, stride=4> [0])>, PhysicalStorageBuffer> [0], !spirv.ptr<!spirv.struct<binding_f32_t, (!spirv.rtarray<f32, stride=4> [0])>, PhysicalStorageBuffer> [8], !spirv.ptr<!spirv.struct<binding_f32_t, (!spirv.rtarray<f32, stride=4> [0])>, PhysicalStorageBuffer> [16])>, StorageBuffer>
      %0 = spirv.AccessChain %set_0_addr[%cst2_i64] : !spirv.ptr<!spirv.struct<set_0_t, (!spirv.ptr<!spirv.struct<binding_f32_t, (!spirv.rtarray<f32, stride=4> [0])>, PhysicalStorageBuffer> [0], !spirv.ptr<!spirv.struct<binding_f32_t, (!spirv.rtarray<f32, stride=4> [0])>, PhysicalStorageBuffer> [8], !spirv.ptr<!spirv.struct<binding_f32_t, (!spirv.rtarray<f32, stride=4> [0])>, PhysicalStorageBuffer> [16])>, StorageBuffer>, i64 -> !spirv.ptr<!spirv.ptr<!spirv.struct<binding_f32_t, (!spirv.rtarray<f32, stride=4> [0])>, PhysicalStorageBuffer>, StorageBuffer>
      %1 = spirv.Load "StorageBuffer" %0 : !spirv.ptr<!spirv.struct<binding_f32_t, (!spirv.rtarray<f32, stride=4> [0])>, PhysicalStorageBuffer>
      %2 = spirv.AccessChain %1[%cst0_i64, %cst0_i64] : !spirv.ptr<!spirv.struct<binding_f32_t, (!spirv.rtarray<f32, stride=4> [0])>, PhysicalStorageBuffer>, i64, i64 -> !spirv.ptr<f32, PhysicalStorageBuffer>
      %3 = spirv.Load "PhysicalStorageBuffer" %2 ["Aligned", 4] : f32
      %set_1_addr = spirv.mlir.addressof @set_1 : !spirv.ptr<!spirv.struct<set_1_t, (!spirv.ptr<!spirv.struct<binding_f32_t, (!spirv.rtarray<f32, stride=4> [0])>, PhysicalStorageBuffer> [0], !spirv.ptr<!spirv.struct<binding_f32_t, (!spirv.rtarray<f32, stride=4> [0])>, PhysicalStorageBuffer> [8])>, StorageBuffer>
      %4 = spirv.AccessChain %set_1_addr[%cst1_i64] : !spirv.ptr<!spirv.struct<set_1_t, (!spirv.ptr<!spirv.struct<binding_f32_t, (!spirv.rtarray<f32, stride=4> [0])>, PhysicalStorageBuffer> [0], !spirv.ptr<!spirv.struct<binding_f32_t, (!spirv.rtarray<f32, stride=4> [0])>, PhysicalStorageBuffer> [8])>, StorageBuffer>, i64 -> !spirv.ptr<!spirv.ptr<!spirv.struct<binding_f32_t, (!spirv.rtarray<f32, stride=4> [0])>, PhysicalStorageBuffer>, StorageBuffer>
      %5 = spirv.Load "StorageBuffer" %4 : !spirv.ptr<!spirv.struct<binding_f32_t, (!spirv.rtarray<f32, stride=4> [0])>, PhysicalStorageBuffer>
      %6 = spirv.AccessChain %5[%cst0_i64, %cst0_i64] : !spirv.ptr<!spirv.struct<binding_f32_t, (!spirv.rtarray<f32, stride=4> [0])>, PhysicalStorageBuffer>, i64, i64 -> !spirv.ptr<f32, PhysicalStorageBuffer>
      spirv.Store "PhysicalStorageBuffer" %6, %3 ["Aligned", 4] : f32
      spirv.Return
    }
    spirv.EntryPoint "GLCompute" @main, @set_0, @set_1
  }
}

