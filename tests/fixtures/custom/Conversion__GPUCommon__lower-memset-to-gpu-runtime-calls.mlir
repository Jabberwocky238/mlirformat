module {
  module attributes {gpu.container_module} {
    func.func @foo(%arg0: memref<7xf32, 1>, %arg1: f32) {
      %0 = gpu.wait async
      %1 = gpu.memset async [%0] %arg0, %arg1 : memref<7xf32, 1>, f32
      gpu.wait [%1]
      return
    }
  }
  module attributes {gpu.container_module} {
    func.func @foo16(%arg0: memref<7xf16, 1>, %arg1: f16) {
      %0 = gpu.wait async
      %1 = gpu.memset async [%0] %arg0, %arg1 : memref<7xf16, 1>, f16
      gpu.wait [%1]
      return
    }
  }
}

