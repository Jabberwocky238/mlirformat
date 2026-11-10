module attributes {gpu.container_module} {
  gpu.module @kernel_module [#nvvm.target] {
    llvm.func @kernel(%arg0: i32, %arg1: !llvm.ptr, %arg2: !llvm.ptr, %arg3: i64, %arg4: i64, %arg5: i64) attributes {gpu.kernel} {
      llvm.return
    }
  }
  func.func @foo(%arg0: memref<?xf32>) {
    %c8 = arith.constant 8 : index
    %c32_i32 = arith.constant 32 : i32
    %c256_i32 = arith.constant 256 : i32
    gpu.launch_func  @kernel_module::@kernel blocks in (%c8, %c8, %c8) threads in (%c8, %c8, %c8)  dynamic_shared_memory_size %c256_i32 args(%c32_i32 : i32, %arg0 : memref<?xf32>)
    return
  }
}

// -----
module attributes {gpu.container_module} {
  gpu.module @kernel_module [#nvvm.target] {
    llvm.func @kernel(%arg0: i32, %arg1: !llvm.ptr, %arg2: !llvm.ptr, %arg3: i64, %arg4: i64, %arg5: i64) attributes {gpu.kernel} {
      llvm.return
    }
  }
  func.func @foo(%arg0: memref<?xf32>) {
    %c8 = arith.constant 8 : index
    %c32_i32 = arith.constant 32 : i32
    %c256_i32 = arith.constant 256 : i32
    %c2 = arith.constant 2 : index
    gpu.launch_func  @kernel_module::@kernel clusters in (%c2, %c2, %c2) blocks in (%c8, %c8, %c8) threads in (%c8, %c8, %c8)  dynamic_shared_memory_size %c256_i32 args(%c32_i32 : i32, %arg0 : memref<?xf32>)
    return
  }
}

// -----
module attributes {gpu.container_module} {
  gpu.binary @kernel_module  [#gpu.object<#rocdl.target, "blob">]
  func.func @foo(%arg0: memref<?xf32>) {
    %c8 = arith.constant 8 : index
    %c32_i32 = arith.constant 32 : i32
    %c256_i32 = arith.constant 256 : i32
    %c2 = arith.constant 2 : index
    gpu.launch_func  @kernel_module::@kernel clusters in (%c2, %c2, %c2) blocks in (%c8, %c8, %c8) threads in (%c8, %c8, %c8)  dynamic_shared_memory_size %c256_i32 args(%c32_i32 : i32, %arg0 : memref<?xf32>)
    return
  }
}

// -----
module attributes {gpu.container_module} {
  gpu.module @kernel_module [#nvvm.target] {
    llvm.func @kernel() attributes {gpu.kernel} {
      llvm.return
    }
  }
  func.func @multi_dep_launch() {
    %c1 = arith.constant 1 : index
    %0 = gpu.wait async
    %1 = gpu.wait async
    %2 = gpu.launch_func async [%0, %1] @kernel_module::@kernel blocks in (%c1, %c1, %c1) threads in (%c1, %c1, %c1)  
    gpu.wait [%2]
    return
  }
}

