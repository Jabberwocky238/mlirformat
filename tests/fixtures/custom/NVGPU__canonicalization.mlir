module {
  gpu.module @main_kernel {
    gpu.func @main_kernel(%arg0: !nvgpu.tensormap.descriptor<tensor = memref<128x32xf32, 3>, swizzle = none, l2promo = none, oob = zero, interleave = none>) kernel attributes {gpu.known_block_size = array<i32: 128, 1, 1>, gpu.known_grid_size = array<i32: 1, 1, 1>} {
      %c0 = arith.constant 0 : index
      %thread_id_x = gpu.thread_id  x
      %0 = arith.cmpi eq, %thread_id_x, %c0 : index
      %1 = gpu.dynamic_shared_memory : memref<?xi8, #gpu.address_space<workgroup>>
      %view = memref.view %1[%c0][] : memref<?xi8, #gpu.address_space<workgroup>> to memref<128x32xf32, #gpu.address_space<workgroup>>
      nvgpu.tma.async.store %view to %arg0[%c0, %c0], predicate = %0 : memref<128x32xf32, #gpu.address_space<workgroup>> -> <tensor = memref<128x32xf32, 3>, swizzle = none, l2promo = none, oob = zero, interleave = none>
      nvvm.cp.async.bulk.commit.group
      nvvm.cp.async.bulk.wait_group 0
      gpu.return
    }
  }
}

