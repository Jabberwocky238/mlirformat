module {
  gpu.module @nvvm_module [#nvvm.target] {
    func.func @kernel_0() -> index {
      %thread_id_x = gpu.thread_id  x
      %0 = gpu.lane_id
      %1 = index.add %thread_id_x, %0
      return %1 : index
    }
    gpu.func @kernel_1(%arg0: memref<f32, #gpu.address_space<global>>) kernel attributes {known_block_size = array<i32: 128, 1, 1>} {
      gpu.return
    }
  }
  gpu.module @nvvm_module_2 {
    func.func @kernel_0() -> index {
      %thread_id_x = gpu.thread_id  x
      %0 = gpu.lane_id
      %1 = index.add %thread_id_x, %0
      return %1 : index
    }
    gpu.func @kernel_1(%arg0: memref<f32, #gpu.address_space<global>>) kernel attributes {known_block_size = array<i32: 128, 1, 1>} {
      gpu.return
    }
  }
}

