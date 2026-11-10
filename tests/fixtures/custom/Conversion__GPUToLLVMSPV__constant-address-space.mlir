module {
  gpu.module @kernels {
    gpu.func @constant_load(%arg0: memref<16xf32, #gpu.address_space<constant>>) kernel {
      %c0 = arith.constant 0 : index
      %0 = memref.load %arg0[%c0] : memref<16xf32, #gpu.address_space<constant>>
      gpu.return
    }
    gpu.func @all_address_spaces(%arg0: memref<f32, #gpu.address_space<global>>, %arg1: memref<f32, #gpu.address_space<workgroup>>, %arg2: memref<f32, #gpu.address_space<private>>, %arg3: memref<f32, #gpu.address_space<constant>>) {
      gpu.return
    }
  }
}

