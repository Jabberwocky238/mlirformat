module {
  func.func @memory_counter_wait() {
    amdgpu.memory_counter_wait
    amdgpu.memory_counter_wait load(0)
    amdgpu.memory_counter_wait store(0)
    amdgpu.memory_counter_wait exp(0)
    amdgpu.memory_counter_wait ds(0)
    return
  }
}

