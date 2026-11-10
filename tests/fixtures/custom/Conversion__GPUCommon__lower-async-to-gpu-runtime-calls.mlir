module attributes {gpu.container_module} {
  func.func @yield_launch_token(%arg0: memref<?xi32>) {
    %c1 = arith.constant 1 : index
    %token, %bodyResults = async.execute -> !async.value<!gpu.async.token> {
      %0 = gpu.wait async
      %1 = gpu.launch_func async [%0] @kmod::@kernel blocks in (%c1, %c1, %c1) threads in (%c1, %c1, %c1)  args(%arg0 : memref<?xi32>)
      async.yield %1 : !gpu.async.token
    }
    return
  }
  gpu.module @kmod [#nvvm.target] {
    llvm.func @kernel(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: i64, %arg3: i64, %arg4: i64) attributes {gpu.kernel, nvvm.kernel} {
      llvm.return
    }
  }
}

