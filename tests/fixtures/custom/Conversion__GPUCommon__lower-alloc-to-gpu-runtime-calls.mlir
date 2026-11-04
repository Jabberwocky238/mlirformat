module attributes {gpu.container_module} {
  func.func @main(%arg0: index) {
    %0 = gpu.wait async
    %memref, %asyncToken = gpu.alloc async [%0] (%arg0) : memref<?xf32>
    %1 = gpu.dealloc async [%asyncToken] %memref : memref<?xf32>
    gpu.wait [%1]
    return
  }
  func.func @alloc_sync(%arg0: index) {
    %memref = gpu.alloc  host_shared (%arg0) : memref<?xf32>
    %0 = gpu.wait async
    %1 = gpu.dealloc async [%0] %memref : memref<?xf32>
    gpu.wait [%1]
    return
  }
}

