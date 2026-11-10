module {
  gpu.module @test_module {
    func.func @named_barrier() {
      %c4_i32 = arith.constant 4 : i32
      %0 = gpu.initialize_named_barrier %c4_i32 : i32 -> !gpu.named_barrier
      gpu.barrier named(%0 : !gpu.named_barrier)
      return
    }
    func.func @two_named_barriers() {
      %c4_i32 = arith.constant 4 : i32
      %c8_i32 = arith.constant 8 : i32
      %0 = gpu.initialize_named_barrier %c4_i32 : i32 -> !gpu.named_barrier
      %1 = gpu.initialize_named_barrier %c8_i32 : i32 -> !gpu.named_barrier
      gpu.barrier named(%0 : !gpu.named_barrier)
      gpu.barrier named(%1 : !gpu.named_barrier)
      return
    }
    func.func @cluster_scope() {
      gpu.barrier scope <cluster>
      return
    }
  }
}

