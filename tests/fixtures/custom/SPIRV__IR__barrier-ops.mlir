module {
  func.func @control_barrier_0() {
    spirv.ControlBarrier <Workgroup>, <Device>, <Acquire|UniformMemory>
    return
  }
}

// -----
// -----
module {
  func.func @memory_barrier_0() {
    spirv.MemoryBarrier <Device>, <Acquire|UniformMemory>
    return
  }
}

// -----
module {
  func.func @memory_barrier_1() {
    spirv.MemoryBarrier <Workgroup>, <Acquire>
    return
  }
}

// -----
