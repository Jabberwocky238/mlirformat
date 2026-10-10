module {
  gpu.module @modules {
    llvm.mlir.global internal @__dynamic_shmem__0() {addr_space = 3 : i32, alignment = 4 : i64} : !llvm.array<0 x i8>
    llvm.mlir.global internal @__dynamic_shmem__1() {addr_space = 3 : i32, alignment = 4 : i64} : !llvm.array<0 x i8>
    llvm.mlir.global internal @__dynamic_shmem__2() {addr_space = 0 : i32, alignment = 16 : i64} : !llvm.array<0 x i8>
    gpu.func @dynamic_shared_memory_kernel(%arg0: index) kernel attributes {gpu.known_block_size = array<i32: 1, 1, 1>, gpu.known_grid_size = array<i32: 1, 1, 1>} {
      %c1 = arith.constant 1 : index
      %c8192 = arith.constant 8192 : index
      %c16384 = arith.constant 16384 : index
      %0 = gpu.dynamic_shared_memory : memref<?xi8, #gpu.address_space<workgroup>>
      %1 = gpu.dynamic_shared_memory : memref<?xi8, #gpu.address_space<workgroup>>
      %view = memref.view %0[%c8192][] : memref<?xi8, #gpu.address_space<workgroup>> to memref<32x64xf32, #gpu.address_space<workgroup>>
      "test.use.shared.memory"(%view) : (memref<32x64xf32, #gpu.address_space<workgroup>>) -> ()
      %view_0 = memref.view %0[%c16384][] : memref<?xi8, #gpu.address_space<workgroup>> to memref<32x64xf32, #gpu.address_space<workgroup>>
      "test.use.shared.memory"(%view_0) : (memref<32x64xf32, #gpu.address_space<workgroup>>) -> ()
      gpu.return
    }
    gpu.func @gpu_device_function() {
      %c8192 = arith.constant 8192 : index
      %0 = gpu.dynamic_shared_memory : memref<?xi8, #gpu.address_space<workgroup>>
      %view = memref.view %0[%c8192][] : memref<?xi8, #gpu.address_space<workgroup>> to memref<32x64xf32, #gpu.address_space<workgroup>>
      "test.use.shared.memory"(%view) : (memref<32x64xf32, #gpu.address_space<workgroup>>) -> ()
      gpu.return
    }
    func.func @func_device_function() {
      %c8192 = arith.constant 8192 : index
      %0 = gpu.dynamic_shared_memory : memref<?xi8, #gpu.address_space<workgroup>>
      %view = memref.view %0[%c8192][] : memref<?xi8, #gpu.address_space<workgroup>> to memref<32x64xf32, #gpu.address_space<workgroup>>
      "test.use.shared.memory"(%view) : (memref<32x64xf32, #gpu.address_space<workgroup>>) -> ()
      return
    }
  }
}

