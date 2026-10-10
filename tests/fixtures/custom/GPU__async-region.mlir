module attributes {gpu.container_module} {
  gpu.module @kernels {
    gpu.func @kernel() kernel {
      gpu.return
    }
  }
  func.func private @foo()
  func.func @async(%arg0: index) {
    gpu.launch_func  @kernels::@kernel blocks in (%arg0, %arg0, %arg0) threads in (%arg0, %arg0, %arg0)  
    gpu.launch_func  @kernels::@kernel blocks in (%arg0, %arg0, %arg0) threads in (%arg0, %arg0, %arg0)  
    %memref = gpu.alloc  () : memref<7xf32>
    gpu.dealloc  %memref : memref<7xf32>
    call @foo() : () -> ()
    return
  }
  func.func @defer_wait(%arg0: index) {
    %token = async.execute {
      gpu.launch_func  @kernels::@kernel blocks in (%arg0, %arg0, %arg0) threads in (%arg0, %arg0, %arg0)  
      async.yield
    }
    %token_0 = async.execute [%token] {
      gpu.launch_func  @kernels::@kernel blocks in (%arg0, %arg0, %arg0) threads in (%arg0, %arg0, %arg0)  
      async.yield
    }
    async.await %token_0 : !async.token
    return
  }
  func.func @defer_wait_blocked_by_side_effect(%arg0: index) {
    %token = async.execute {
      gpu.launch_func  @kernels::@kernel blocks in (%arg0, %arg0, %arg0) threads in (%arg0, %arg0, %arg0)  
      func.call @foo() : () -> ()
      async.yield
    }
    async.await %token : !async.token
    return
  }
  func.func @defer_wait_pass_through(%arg0: index) {
    %token = async.execute {
      gpu.launch_func  @kernels::@kernel blocks in (%arg0, %arg0, %arg0) threads in (%arg0, %arg0, %arg0)  
      async.yield
    }
    %token_0 = async.execute [%token] {
      async.yield
    }
    async.await %token_0 : !async.token
    return
  }
  func.func @async_execute_with_result(%arg0: index) -> index {
    %token, %bodyResults = async.execute -> !async.value<index> {
      gpu.launch_func  @kernels::@kernel blocks in (%arg0, %arg0, %arg0) threads in (%arg0, %arg0, %arg0)  
      async.yield %arg0 : index
    }
    async.await %token : !async.token
    %0 = async.await %bodyResults : !async.value<index>
    return %0 : index
  }
  func.func @async_execute_no_use(%arg0: index) {
    %token = async.execute {
      gpu.launch_func  @kernels::@kernel blocks in (%arg0, %arg0, %arg0) threads in (%arg0, %arg0, %arg0)  
      async.yield
    }
    return
  }
  func.func @async_execute_fork(%arg0: index) {
    %token = async.execute {
      gpu.launch_func  @kernels::@kernel blocks in (%arg0, %arg0, %arg0) threads in (%arg0, %arg0, %arg0)  
      async.yield
    }
    %token_0 = async.execute [%token] {
      gpu.launch_func  @kernels::@kernel blocks in (%arg0, %arg0, %arg0) threads in (%arg0, %arg0, %arg0)  
      async.yield
    }
    %token_1 = async.execute [%token] {
      gpu.launch_func  @kernels::@kernel blocks in (%arg0, %arg0, %arg0) threads in (%arg0, %arg0, %arg0)  
      async.yield
    }
    return
  }
  func.func @existing_tokens() {
    %0 = gpu.wait async
    %1 = gpu.wait async [%0]
    %memref = gpu.alloc [%0] () : memref<7xf32>
    %2 = gpu.dealloc async %memref : memref<7xf32>
    gpu.wait 
    gpu.wait 
    return
  }
}

