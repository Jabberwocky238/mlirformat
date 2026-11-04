module attributes {gpu.container_module} {
  func.func @foo(%arg0: memref<7xf32, 1>, %arg1: memref<7xf32>) {
    %0 = gpu.wait async
    %1 = gpu.memcpy async [%0] %arg0, %arg1 : memref<7xf32, 1>, memref<7xf32>
    gpu.wait [%1]
    return
  }
}

// -----
module attributes {gpu.container_module} {
  func.func @dynamic(%arg0: memref<?x?xf32, 1>, %arg1: memref<?x?xf32>) {
    %0 = gpu.wait async
    %1 = gpu.memcpy async [%0] %arg0, %arg1 : memref<?x?xf32, 1>, memref<?x?xf32>
    return
  }
}

