module {
  func.func @memory_counter_wait_tensor() {
    amdgpu.memory_counter_wait tensor(3)
    return
  }
}

