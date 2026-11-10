module attributes {gpu.container_module} {
  gpu.binary @kernel_module  [#gpu.object<#nvvm.target, "BLOB">]
  llvm.func @foo() {
    %0 = llvm.mlir.constant(8 : index) : i64
    %1 = llvm.mlir.constant(32 : i32) : i32
    %2 = llvm.mlir.constant(256 : i32) : i32
    gpu.launch_func  @kernel_module::@kernel blocks in (%0, %0, %0) threads in (%0, %0, %0) : i64 dynamic_shared_memory_size %2 args(%1 : i32, %1 : i32)
    llvm.return
  }
}

// -----
module {
  gpu.binary @kernel_module <#gpu.select_object<1 : i64>> [#gpu.object<#nvvm.target, "0">, #gpu.object<#nvvm.target, "1">]
}

// -----
module {
  gpu.binary @kernel_module <#gpu.select_object<#rocdl.target>> [#gpu.object<#nvvm.target, "NVPTX">, #gpu.object<#rocdl.target, "AMDGPU">]
}

// -----
module {
  gpu.binary @kernel_module <#gpu.select_object<#spirv.target_env<#spirv.vce<v1.0, [Addresses, Int64, Kernel], []>, api=OpenCL, #spirv.resource_limits<>>>> [#gpu.object<#nvvm.target, "NVPTX">, #gpu.object<#spirv.target_env<#spirv.vce<v1.0, [Addresses, Int64, Kernel], []>, api=OpenCL, #spirv.resource_limits<>>, "BLOB">]
}

// -----
module attributes {gpu.container_module} {
  gpu.binary @kernel_module  [#gpu.object<#rocdl.target, "BLOB">]
  llvm.func @foo(%arg0: !llvm.ptr) {
    %0 = llvm.mlir.constant(8 : index) : i64
    gpu.launch_func <%arg0 : !llvm.ptr> @kernel_module::@kernel blocks in (%0, %0, %0) threads in (%0, %0, %0) : i64 
    llvm.return
  }
}

// -----
module attributes {gpu.container_module} {
  gpu.binary @kernel_module  [#gpu.object<#nvvm.target, "BLOB">]
  llvm.func @foo() {
    %0 = llvm.mlir.constant(1 : index) : i64
    %1 = llvm.mlir.constant(2 : index) : i64
    %2 = llvm.mlir.constant(3 : index) : i64
    gpu.launch_func  @kernel_module::@kernel clusters in (%0, %0, %0) blocks in (%1, %1, %1) threads in (%2, %2, %2) : i64 
    llvm.return
  }
}

// -----
module attributes {gpu.container_module} {
  gpu.binary @kernel_module  [#gpu.object<#nvvm.target, "BLOB">]
  llvm.func @cooperative_no_cluster() {
    %0 = llvm.mlir.constant(2 : index) : i64
    %1 = llvm.mlir.constant(3 : index) : i64
    gpu.launch_func  @kernel_module::@kernel blocks in (%0, %0, %0) threads in (%1, %1, %1) : i64 cooperative 
    llvm.return
  }
}

// -----
module attributes {gpu.container_module} {
  gpu.binary @kernel_module  [#gpu.object<#nvvm.target, "BLOB">]
  llvm.func @cooperative_with_cluster() {
    %0 = llvm.mlir.constant(1 : index) : i64
    %1 = llvm.mlir.constant(2 : index) : i64
    %2 = llvm.mlir.constant(3 : index) : i64
    gpu.launch_func  @kernel_module::@kernel clusters in (%0, %0, %0) blocks in (%1, %1, %1) threads in (%2, %2, %2) : i64 cooperative 
    llvm.return
  }
}

// -----
module attributes {gpu.container_module} {
  gpu.binary @cuda_device_mod  [#gpu.object<#nvvm.target, properties = {section = "__nv_rel_fatbin"}, "BLOB">]
}

