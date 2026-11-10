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
// -----
module {
  func.func @named_barrier_initialize(%arg0: i32) {
    %0 = spirv.NamedBarrierInitialize %arg0 : i32 -> !spirv.named_barrier
    return
  }
}

// -----
module {
  func.func @memory_named_barrier(%arg0: i32) {
    %0 = spirv.NamedBarrierInitialize %arg0 : i32 -> !spirv.named_barrier
    spirv.MemoryNamedBarrier %0, <Workgroup>, <AcquireRelease|WorkgroupMemory> : !spirv.named_barrier
    return
  }
}

// -----
