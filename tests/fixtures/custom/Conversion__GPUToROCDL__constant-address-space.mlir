module attributes {gpu.container_module} {
  gpu.module @kernel_module {
    gpu.func @constant_load(%arg0: memref<16xf32, #gpu.address_space<constant>>) kernel {
      %c0 = arith.constant 0 : index
      %0 = memref.load %arg0[%c0] : memref<16xf32, #gpu.address_space<constant>>
      gpu.return
    }
    gpu.func @constant_multidim(%arg0: memref<4x8xf32, #gpu.address_space<constant>>) kernel {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %0 = memref.load %arg0[%c0, %c1] : memref<4x8xf32, #gpu.address_space<constant>>
      gpu.return
    }
  }
}

