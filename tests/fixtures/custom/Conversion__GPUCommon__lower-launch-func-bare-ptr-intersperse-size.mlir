module attributes {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} {
  llvm.func @malloc(i64) -> !llvm.ptr
  gpu.binary @kernels  [#gpu.object<#spirv.target_env<#spirv.vce<v1.0, [Shader], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>, "">]
  func.func @main() attributes {llvm.emit_c_interface} {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %1 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %c1 = arith.constant 1 : index
    %2 = builtin.unrealized_conversion_cast %0 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> to memref<8xf32>
    %3 = builtin.unrealized_conversion_cast %1 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<8x8xi32>
    %4 = builtin.unrealized_conversion_cast %1 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> to memref<4x12xi8>
    gpu.launch_func  @kernels::@kernel_add blocks in (%c1, %c1, %c1) threads in (%c1, %c1, %c1)  args(%2 : memref<8xf32>, %3 : memref<8x8xi32>, %4 : memref<4x12xi8>)
    return
  }
}

